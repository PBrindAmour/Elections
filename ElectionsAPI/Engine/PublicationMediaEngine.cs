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
                var startDate = await GetLatestPublicationAsync(twitterId, user.MediaUserId.Value);
                if(startDate == DateTime.MinValue)
                {
                    startDate = new DateTime(2022, 7, 1, 0, 0, 0); // La date à partir duquel on veut débuter s'il n'y a pas de publication sauvegardée.
                }
                else
                {
                    startDate = startDate.Value.AddSeconds(1);
                    startDate = startDate.Value.AddHours(4);
                }
                var postsTwitter = await _client.GetPublicationsAsync(user.MediaUserId.Value, startDate.Value, DateTime.Now);
                await _store.InsertPublicationsAsync(postsTwitter);
            }
        }
        
        public async Task<DateTime?> GetLatestPublicationAsync(short mediaId, long mediaUserId) //Méthode qui recherche la dernière publication sauvegardée.
        {
            return await _store.GetLatestPublicationAsync(mediaId, mediaUserId);
        }

        
    }

}
