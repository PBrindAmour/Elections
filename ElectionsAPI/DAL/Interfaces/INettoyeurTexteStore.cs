using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.DAL.Interfaces
{
    public interface INettoyeurTexteStore
    {
        Task<List<Publication>> GetPublications(short mediaId, DateTime dateDebut, DateTime dateFin);
        Task SetPublicationNettoye(Publication publication, string texteNettoye);
        Task<List<InfoCandidat>> GetInfoCandidats();
        Task SetPublicationTronquer(Publication publication, string texteTronquer);

    }
}
