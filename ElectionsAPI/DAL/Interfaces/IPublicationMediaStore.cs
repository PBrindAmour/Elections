using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.DAL.Interfaces
{
    public interface IPublicationMediaStore
    {
        Task InsertPublicationsAsync(List<Publication> publications);
        Task<DateTime> GetLatestPublicationAsync(short mediaId, long mediaUserId);
        Task<List<PersonneMedia>> GetPersonneMediasAsync();
    }
}
