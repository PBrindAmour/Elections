using ElectionsAPI.Controllers.Models;
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
        public async Task InsertPublicationAsync(Publication publication) // Méthode va insérer les publications dans la base de données
        {
            Console.WriteLine("Insertion des publications avec ID:" + publication.PublicationId);
            await _context.Publications.AddRangeAsync(publication);
            await _context.SaveChangesAsync();
        }
        public async Task ResavePublicationAsync(string texte, Publication postBase)
        {
            postBase.Texte = texte;
            await _context.SaveChangesAsync();
        }
        public async Task<Publication> GetPublication(Publication publication)
        {
            var publicationBase = await (from p in _context.Publications
                                         where p.UrlPublication == publication.UrlPublication
                                         select p).FirstOrDefaultAsync();
            return publicationBase;
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

        public async Task<List<PersonneMedia>> GetChefsMediasAsync() // Méthode pour aller chercher les médias
        {
            var chefsIds = GetChefsIds();
            var personneMediaList = await (from pm in _context.PersonneMedias
                                           where chefsIds.Contains(pm.PersonneId)
                                           select pm)
                .ToListAsync();
            return personneMediaList; // Retourne la liste de publications pour chaque personne
        }
        private List<short> GetChefsIds()
        { 
            var chefsIds = new List<short>();
            chefsIds.Add(1); //Francois Legault
            chefsIds.Add(151); //Dominique Anglade
            chefsIds.Add(301); //Paul St-Pierre-Plamondon
            chefsIds.Add(451); //Gabriel Nadeau-Dubois
            chefsIds.Add(452); //Manon Massé
            chefsIds.Add(601); //Eric Duhaime
            return chefsIds;
        }

        public async Task<List<PartiMedia>> GetPartiMediasAsync() // Méthode pour aller chercher les médias
        {
            var partiMediaList = await _context.PartiMedia
                .ToListAsync();
            return partiMediaList; // Retourne la liste de publications pour chaque personne
        }

        public async Task<List<Publication>> GetPosts()

        {
            var publications = await (from p in _context.Publications
                                      where p.MediaId == 2
                                      select p).ToListAsync();
            return publications;
        }
        public async Task SetPost(Publication publication, string texte)
        {
            publication.TexteNettoye = texte;
            await _context.SaveChangesAsync();
        }
    }

}
