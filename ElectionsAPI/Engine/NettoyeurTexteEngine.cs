using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.Engine.Interfaces;

namespace ElectionsAPI.Engine
{
    public class NettoyeurTexteEngine : INettoyeurTexteEngine
    {
        private readonly INettoyeurTexteStore _store;

        public NettoyeurTexteEngine(INettoyeurTexteStore store)
        {
            _store = store;
        }
        async public Task NettoyerTextes(short mediaId)
        {
            var dateDebut = new DateTime(2022, 2, 1, 0, 0, 0);
            var dateFin = new DateTime(2023, 10, 4, 0, 0, 0);


            var publications = await _store.GetPublications(mediaId, dateDebut, dateFin);

            foreach (var publication in publications)
            {            
                if (publication.Texte== "" || publication.TexteNettoye != null) //Possibilité qu'aucun texte n'a été ajouté à une photo ou une vidéo
                {
                    continue;
                }
                var texte = publication.Texte;

                if (mediaId == 2)
                {
                    texte = TextCleaner.RemoveTagsTweet(texte); // On modifie les @ pour le mot compte (afin de ne pas modifier la lisibilité)
                }
                texte = TextCleaner.RemoveTags(texte); // On retire les @ et les # et les http
                texte = TextCleaner.RemoveCharacters(texte);
                await _store.SetPublicationNettoye(publication, texte);
            }
        }

        public async Task TronquerPublication(short mediaId)
        {
            var dateDebut = new DateTime(2022, 2, 1, 0, 0, 0);
            var dateFin = new DateTime(2023, 1, 4, 0, 0, 0);
            var publications = await _store.GetPublications(mediaId, dateDebut, dateFin);
            var candidats = await _store.GetInfoCandidats();
            var prenoms = candidats.Select(x => x.Prenom).ToList();
            var noms = candidats.Select(x => x.Nom).ToList();
            foreach (var publication in publications)
            {
                if (publication.TexteTronquer != null || publication.TexteNettoye == null)
                {
                    continue;
                }
                var texte = publication.TexteNettoye.ToLower();
                texte = texte.Replace("\n", " ");
                texte = texte.Replace("\r", " ");
                texte = TextCleaner.RemoveCharacters(texte);
                texte = TextCleaner.CleanNames(texte, noms, prenoms);
                texte = TextCleaner.RemoveTags(texte);               
                texte = Helper.RunProcessTronquer(texte);
                texte = TextCleaner.CleanWords(texte);
                texte = TextCleaner.RemoveUnusefulWords(texte);


                await _store.SetPublicationTronquer(publication, texte);
            }
        }

        public async Task NettoyeTronque(short mediaId)
        {
            var dateDebut = new DateTime(2022, 2, 1, 0, 0, 0);
            var dateFin = new DateTime(2023, 1, 4, 0, 0, 0);
            var publications = await _store.GetPublications(mediaId, dateDebut, dateFin);
            foreach (var publication in publications)
            {
                var texte = publication.TexteTronquer;
                if (texte == null)
                {
                    continue;
                }
                texte = texte.Replace("\n", " ");
                texte = texte.Replace("\r", " ");
                if (texte.Contains("desprez"))
                { }
                if (texte.Contains("stéphane"))
                { }
                if (texte.Contains("carole"))
                { }
                if (texte.Contains("suzanne"))
                { }
                if (texte.Contains("anabela"))
                { }
                if (texte.Contains("derraji"))
                { }
                if (texte.Contains("mcgraw"))
                { }
                if (texte.Contains("maryse"))
                { }
                if (texte.Contains("christina"))
                { }
                if (texte.Contains("jennifer"))
                { }
                if (texte.Contains("monteiro"))
                { }
                if (texte.Contains("younoussa"))
                { }
                if (texte.Contains("andrénadeau"))
                { }
                if (texte.Contains("nichol"))
                { }
                if (texte.Contains("deepak"))
                { }
                if (texte.Contains("beaudelot"))
                { }
                if (texte.Contains("hélène"))
                { }
                if (texte.Contains("ménard"))
                { }
                if (texte.Contains("setlakwe"))
                { }
                if (texte.Contains("cisser"))
                { }
                if (texte.Contains("green"))
                { }
                if (texte.Contains("nicole"))
                { }
                if (texte.Contains("caryl"))
                { }
                if (texte.Contains("carlos"))
                { }
                if (texte.Contains("melançon"))
                { }
                if (texte.Contains("awasti"))
                { }
                if (texte.Contains("chekal"))
                { }
                if (texte.Contains("filomener"))
                { }
                if (texte.Contains("mounirou"))
                { }
                if (texte.Contains("mégann"))
                { }
                if (texte.Contains("hivon"))
                { }
                if (texte.Contains("perry"))
                { }
                if (texte.Contains("laura"))
                { }
                if (texte.Contains("nantel"))
                { }
                if (texte.Contains("alexis"))
                { }
                if (texte.Contains("bouazzi"))
                { }
                if (texte.Contains("adrien"))
                { }
                if (texte.Contains("annie"))
                { }
                if (texte.Contains("flavi"))
                { }
                if (texte.Contains("maïté"))
                { }
                if (texte.Contains("alejandra"))
                { }
                if (texte.Contains("garcia"))
                { }
                if (texte.Contains("labrecqu"))
                { }
                if (texte.Contains("fontecilla"))
                { }
                if (texte.Contains("lapoint"))
                { }
                if (texte.Contains("etienne"))
                { }
                if (texte.Contains("bolduc"))
                { }
                if (texte.Contains("lajoie"))
                { }
                if (texte.Contains("saguenaylac"))
                { }

                texte = TextCleaner.RemoveCharacters(texte);
                texte = TextCleaner.CleanWords(texte);
                texte = TextCleaner.RemoveUnusefulWords(texte);
               



                await _store.SetPublicationTronquer(publication, texte);
            }
        }
    }
}
