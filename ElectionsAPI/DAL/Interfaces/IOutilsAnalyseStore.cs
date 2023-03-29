using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.DAL.Interfaces
{
    public interface IOutilsAnalyseStore
    {
        Task<List<string>> GetPublicationTexte(short partiId, List<short> mediaId, DateTime dateDebut, DateTime dateFin);
        Task<List<string>> GetPublicationTexteNettoye(short partiId, List<short> mediaId, DateTime dateDebut, DateTime dateFin);
        Task<List<string>> GetPublicationTexteTronque(short partiId, List<short> mediaId, DateTime dateDebut, DateTime dateFin);
        Task<List<Parti>> GetPartis(); // Méthode pour aller chercher la liste de partis.
        Task<List<Media>> GetMedias(); // Méthode pour aller chercher la liste de médias.

        Task<List<int>> GetPublicationsId(short partiId, short mediaId, DateTime dateDebut, DateTime dateFin);
        Task<List<Lisibilite>> GetResultatTest(List<int> publications);
        Task<List<Publication>> GetPublications(short mediaId, DateTime dateDebut, DateTime dateFin, bool chefOnly);
        Task<Publication> GetPublication(int publicationId);
        Task<List<Lisibilite>> GetListeTestLisibilite();
        Task<List<Compressibilite>> GetListeTestCompressibilite();
        Task<List<Compressibilite>> GetResultatTestCompressibilite(List<int> publications);
        Task SetResultatTest(int publicationId, double resultatFinalUn, double resultatFinalDeux, double resultatFinalTrois, bool nettoye, bool tronque);
        Task SetResultatTestCompress(int publicationId, double resultat, double resultatNet, double resultatTronq);

        Task InsertTfidf(List<Parti> partis, short mediaId, int valeurTop, Dictionary<string, Dictionary<short, double>> dictionnaire);
        Task<List<Tfidf>> GetTfidfs(short partiId, short mediaId);
        Task<List<Tfidf>> GetTfidfs(short mediaId);
        Task<List<Tfidf>> GetTfidfs();


        Task<short> GetMediaPublication(int publicationId);
        Task<short> GetPartiPublication(int publicationId);
        Task GetTfidf(short partiId, short mediaId, string mot, double nouvelleValeur);
        Task UpdateTfidf(Tfidf tfidf, double nouvelleValeur);
        Task AddTfidf(List<Tfidf> nouveauMots);

        Task SaveChanges();


    }
}
