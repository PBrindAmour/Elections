using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.Clients
{
    public interface IMediaClient
    {
        Task<List<Publication>> GetPublicationsAsync(long userId, DateTime dateDebut, DateTime dateFin);
    }
}
