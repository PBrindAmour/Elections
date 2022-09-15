using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.DAL.Models;
using Microsoft.EntityFrameworkCore;


/* Le store reçoit des directives pour faire des demandes au context qui est la connexion à la base de données. */
namespace ElectionsAPI.DAL
{
    public class PublicationMediaStore : IPublicationMediaStore
    {
        private readonly ElectionContext _context; // Le context est une variable privée puisque c'est la connexion à la base de données.

        public PublicationMediaStore(ElectionContext context) // Le context est définit.
        {
            _context = context;
        }
        public async Task InsertPublicationsAsync(List<Publication> publications) // Méthode va insérer les publications dans la base de données
        {
            Console.WriteLine("Insertion des publications avec ID:" + publications.Select(p => p.PublicationId));
            await _context.Publications.AddRangeAsync(publications);
            await _context.SaveChangesAsync();
        }

        // Méthode qui va déterminer quel est la dernière publication sauvegardée
        public async Task<DateTime> GetLatestPublicationAsync(short mediaId, long mediaUserId) 
        {
            var datetime = await _context.Publications
                .Where(p => p.MediaId == mediaId && p.MediaUserId == mediaUserId)
                .OrderByDescending(p => p.PublicationDate)
                .Select(p => p.PublicationDate)
                .FirstOrDefaultAsync();  
            Console.WriteLine("Date trouvé pour mediaUserId " + mediaUserId + " pour le mediaId " + mediaId + "   : " + datetime);
            return datetime;

        }

        public async Task<List<PersonneMedia>> GetPersonneMediasAsync() // Méthode pour aller chercher les médias
        {
            var personneMediaList = await _context.PersonneMedias
                .ToListAsync();
            return personneMediaList; // Retourne la liste de publications pour chaque personne
        }
    }

}
