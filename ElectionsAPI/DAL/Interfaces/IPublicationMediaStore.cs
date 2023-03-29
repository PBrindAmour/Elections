using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.DAL.Interfaces
{
    public interface IPublicationMediaStore
    {
        /* L'interface demande une méthode d'insertion, une méthode qui va trouver les publications et une méthode qui va trouver une liste de personne */
        Task InsertPublicationsAsync(List<Publication> publications);
        Task InsertPublicationAsync(Publication publications);
        Task ResavePublicationAsync(string texte, Publication postBase);
        Task<Publication> GetPublication(Publication publication);
        Task<DateTime> GetLatestPublicationAsync(short mediaId, long mediaUserId);
        Task<List<PersonneMedia>> GetPersonneMediasAsync(); // Méthode pour aller chercher les médias
        Task<List<PartiMedia>> GetPartiMediasAsync(); // Méthode pour aller chercher les médias des partis
        Task<List<PersonneMedia>> GetChefsMediasAsync(); // Méthode pour aller chercher les médias des chefs

        Task<List<Publication>> GetPosts();
        Task SetPost(Publication publication, string texte);
    }
}
