using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.Engine.Interfaces;



/* L'engine de recherche fait la communication entre le controller de recherche et le store qui permet la connexion à la base de données.*/

namespace ElectionsAPI.Engine
{
    public class RechercheEngine : IRechercheEngine
    {
        private readonly IRechercheStore _store;
        public RechercheEngine(IRechercheStore store)
        {
            _store = store;
        }

        public async Task<List<InfoGenre>> GetInfoGenre()  //Méthode qui recherche les statistiques de genre des partis. On retourne sous forme de liste les informations.
        {
            var results = new List<InfoGenre>();
            var partis = await _store.GetPartis();
            var partiIds = partis.Select(p => p.PartiId);
            foreach (var id in partiIds)// Pour chaque parti
            {
                var partiResult = await _store.GetInfoGenre(id); //Informations du parti pour les calculs ici-bas.
                partiResult.PourcentageFemme = (int)GetPourcentage(partiResult.TotalFemmes, partiResult.TotalHommes);
                partiResult.PourcentageHomme = (int)GetPourcentage(partiResult.TotalHommes, partiResult.TotalFemmes);
                partiResult.PourcentagePublicationFemme = (int)GetPourcentage(partiResult.TotalPublicationFemme, partiResult.TotalPublicationHomme);
                partiResult.PourcentagePublicationHomme = (int)GetPourcentage(partiResult.TotalPublicationHomme, partiResult.TotalPublicationFemme);

                results.Add(partiResult); //Ajoute les résultats à la liste results.
            }

            return results; // Retourne une liste qui contient les informations et les statistiques de chaque parti.
        }

        public async Task<List<ListePublicationsCandidat>> GetListePublicationsCandidat(short personneId) //Méthode qui recherche les publications par le ID d'une personne.
        {
            return await _store.GetListePublicationCandidat(personneId);
        }

        public async Task<List<Candidats>> GetCandidats(string? prenom, string? nom, string? parti, string? circonscription, string? region, char? genre) //Méthode qui renvoi une liste de candidats
        {
            return await _store.GetCandidats(prenom, nom, parti, circonscription, region, genre);
        }
        public async Task<List<InfoPublication>> GetInfoPublications(string mot) //Méthode qui recherche l'occurence d'un mot dans la base de données.
        {
            var infoPublications = new List<InfoPublication>();
            var partis = await _store.GetPartis();
            var partiIds = partis.Select(x => x.PartiId);
            foreach (var id in partiIds) //Pour chaque parti.
            {
                var medias = await _store.GetMedias();
                var mediaIds = medias.Select(medias => medias.MediaId);
                foreach (var mediaId in mediaIds) //Pour chaque médias.
                {
                    var partiPublication = await _store.GetInfoPublications(id, mediaId, mot);
                    if (partiPublication.NombreTotal != 0) //Si le média ne contient aucune fois le mot on laisse faire.
                    {
                        infoPublications.Add(partiPublication);
                    }
                }
            }

            return infoPublications; //Retourne une liste de parti et pour chacun, une liste de média ou l'on décrit le nombre d'occurence d'un mot.
        }

        public async Task<List<InfoPublication>> GetInfoPublicationsDeux(string motUn, string motDeux) //Méthode qui recherche l'occurence de deux mots dans la même publication.
        {
            var infoPublications = new List<InfoPublication>();
            var partis = await _store.GetPartis();
            var partiIds = partis.Select(x => x.PartiId);
            foreach (var id in partiIds) //Pour chaque parti.
            {
                var medias = await _store.GetMedias();
                var mediaIds = medias.Select(medias => medias.MediaId);
                foreach (var mediaId in mediaIds) //Pour chaque médias.
                {
                    var partiPublication = await _store.GetInfoPublicationsDeux(id, mediaId, motUn, motDeux);                  
                    if (partiPublication.NombreTotal != 0) //Si le média ne contient aucune fois le mot on laisse faire.
                    {
                        infoPublications.Add(partiPublication);
                    }
                }
            }

            return infoPublications; //Retourne une liste de parti et pour chacun, une liste de média ou l'on décrit le nombre d'occurence d'un mot.
        }

        static private double GetPourcentage(int a, int b) //Méthode simple pour le calcul d'un pourcentage de deux variables qui forment un tout.
        {

            if (a + b == 0)
            {
                return 0;
            }
            var pourcentage = ((double)a / (a + b) * 100);
            return pourcentage;
        }

        public async Task<String> GetValeurTfIdf()
        {
            var TfIdfs = await _store.GetTfidfs();
            var partis = await _store.GetPartis();
            var medias = new List<short>(){ 1, 2, 4};
            var resultat = "";
            foreach(var parti in partis)
            {
                var resultatTemp = "";
                var TfidfsParti = TfIdfs.Where(x => x .PartiId== parti.PartiId).ToList();
                foreach(var media in medias)
                {
                    var tfidfMediaParti = TfidfsParti.Where(y => y.MediaId == media);
                    var total = 0.0;
                    foreach (var tfidf in tfidfMediaParti)
                    {
                        total += tfidf.Valeur.Value;
                    }
                    resultatTemp += "MediaId = " + media + " Nombre de mots = " + tfidfMediaParti.Count() + " Valeur totale = " + total + "   Moyenne --> " + (total/tfidfMediaParti.Count()) + "\n";
                }
                resultat+= "Parti : " + parti.Nom + "\n" + resultatTemp + "\n";
            }
            return resultat;
        }

    }
}
