using ElectionsAPI.Controllers.Models;

namespace ElectionsAPI.Engine.Interfaces
{
    public interface IRechercheEngine
    {
        Task<List<InfoGenre>> GetInfoGenre();
        Task<List<InfoPublication>> GetInfoPublications(string mot);
        Task<List<InfoPublication>> GetInfoPublicationsDeux(string motUn, string motDeux);
        Task<List<ListePublicationsCandidat>> GetListePublicationsCandidat(short personneId);
        Task<List<Candidats>> GetCandidats(string? prenom, string? nom, string? parti, string? circonscription, string? region, char? genre);
        Task<String> GetValeurTfIdf();
    }
}
