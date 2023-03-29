using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Models;


    
    namespace ElectionsAPI.DAL.Interfaces
{
        
        public interface IRechercheStore
    {
        Task<InfoGenre> GetInfoGenre(short id);
        Task<List<Parti>> GetPartis();
        Task<List<Media>> GetMedias();
        Task<InfoPublication> GetInfoPublications(short partiId, short mediaId, string mot);
        Task<InfoPublication> GetInfoPublicationsDeux(short partiId, short mediaId, string motUn, string motDeux);
        Task<List<ListePublicationsCandidat>> GetListePublicationCandidat(short personneId);  
        Task<List<Candidats>> GetCandidats(string? prenom, string? nom, string? parti, string? circonscription, string? region, char? genre);
        Task<List<Tfidf>> GetTfidfs();

    }
}
