using ElectionsAPI.Clients;
using ElectionsAPI.Constants;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.Engine.Interfaces;

namespace ElectionsAPI.Engine
{
    public class PublicationMediaEngine : IPublicationMediaEngine
    {
        private readonly IPublicationMediaStore _store;
        private readonly IMediaClient _client;
        public PublicationMediaEngine(IPublicationMediaStore store, IMediaClient client) // On définit le store et le client.
        {
            _store = store;
            _client = client;
        }
        public async Task GetPostsAsync() // On va chercher les posts de Twitter.
        {
            var personneMedia = await _store.GetPersonneMediasAsync();
            //Twitter
            var twitterId = (short)Medias.Media.Twitter;
            var twitterPersonneMedia = personneMedia.Where(p => p.MediaId == twitterId && p.MediaUserId != null);
            foreach (var user in twitterPersonneMedia)
            {


                // Méthode 1 on trouve la dernière publication sauvegardée et on trouve les publications à partir de cette date
                /*var startDate = await GetLatestPublicationAsync(twitterId, user.MediaUserId.Value);
                
                if(startDate == DateTime.MinValue)
                {
                    var startDate = new DateTime(2022, 2, 1, 0, 0, 0); // La date à partir duquel on veut débuter s'il n'y a pas de publication sauvegardée.
                }
                else
                {
                    startDate = startDate.Value.AddSeconds(1);
                }*/



                // Méthode 2, on va chercher de nouveau toutes les publications
                var startDate = new DateTime(2022, 10, 3, 0, 0, 0);

                //Peu importe la méthode on arrête au 4 octobre a minuit
                var endDate = new DateTime(2022, 12, 31, 0, 0, 0);
                var postsTwitter = await _client.GetPublicationsAsync(user.MediaUserId.Value, startDate, endDate);
                //await _store.InsertPublicationsAsync(postsTwitter); // Méthode 1, on enregistre toutes les nouvelles publication
                foreach (var post in postsTwitter) //Méthode 2, on trouve la publication initiale et on écrase le texte
                {
                    var publicationBase = await _store.GetPublication(post);
                    var texte = post.Texte;
                    if (publicationBase != null)
                    {
                        await _store.ResavePublicationAsync(texte, publicationBase);
                    }
                    else //Lorsqu'une publication n'est pas enregistrée dans la base de donnée, on l'ajoute
                    {
                        await _store.InsertPublicationAsync(post);
                    }
                }
            }

        }
        public async Task GetPostsPartisAsync() // On va chercher les posts de Twitter.
        {
            //var personneMedia = await _store.GetPersonneMediasAsync();
            var personneMedia = await _store.GetChefsMediasAsync();

            //Twitter
            var twitterId = (short)Medias.Media.Twitter;
            var twitterPersonneMedia = personneMedia.Where(p => p.MediaId == twitterId && p.MediaUserId != null);
            foreach (var user in twitterPersonneMedia)
            {


                // Méthode 1 on trouve la dernière publication sauvegardée et on trouve les publications à partir de cette date
                /*var startDate = await GetLatestPublicationAsync(twitterId, user.MediaUserId.Value);
                
                if(startDate == DateTime.MinValue)
                {
                    var startDate = new DateTime(2022, 2, 1, 0, 0, 0); // La date à partir duquel on veut débuter s'il n'y a pas de publication sauvegardée.
                }
                else
                {
                    startDate = startDate.Value.AddSeconds(1);
                }*/



                // Méthode 2, on va chercher de nouveau toutes les publications
                var startDate = new DateTime(2022, 10, 3, 0, 0, 0);

                //Peu importe la méthode on arrête au 4 octobre a minuit
                var endDate = new DateTime(2022, 12, 31, 0, 0, 0);
                var postsTwitter = await _client.GetPublicationsAsync(user.MediaUserId.Value, startDate, endDate);
                //await _store.InsertPublicationsAsync(postsTwitter); // Méthode 1, on enregistre toutes les nouvelles publication
                foreach (var post in postsTwitter) //Méthode 2, on trouve la publication initiale et on écrase le texte
                {
                    var publicationBase = await _store.GetPublication(post);
                    var texte = post.Texte;
                    if (publicationBase != null)
                    {
                        await _store.ResavePublicationAsync(texte, publicationBase);
                    }
                    else //Lorsqu'une publication n'est pas enregistrée dans la base de donnée, on l'ajoute
                    {
                        await _store.InsertPublicationAsync(post);
                    }
                }
            }
        }

            public async Task<DateTime?> GetLatestPublicationAsync(short mediaId, long mediaUserId) //Méthode qui recherche la dernière publication sauvegardée.
        {
            return await _store.GetLatestPublicationAsync(mediaId, mediaUserId);
        }

        public async Task NettoyerPosts()
        {
            var publications = await _store.GetPosts();
            foreach (var publication in publications)
            {
                if(publication.TexteNettoye != null)
                {
                    continue;
                }
                var texte = publication.Texte;
                if (texte == "") //Possibilité qu'aucun texte n'a été ajouté à une photo ou une vidéo
                {
                    continue;
                }
                texte = TextCleaner.RemoveTags(texte);
                texte = TextCleaner.RemoveCharacters(texte);
                await _store.SetPost(publication, texte);
            }
        }
    }
}
