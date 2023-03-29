using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.DAL.Models;
using Microsoft.EntityFrameworkCore;

namespace ElectionsAPI.DAL
{
    public class NettoyeurTexteStore : INettoyeurTexteStore
    {
        private readonly ElectionContext _context; // Le context est une variable privée puisque c'est la connexion à la base de données.

        public NettoyeurTexteStore(ElectionContext context) // Le contexte est définit.
        {
            _context = context;
        }

        public async Task<List<Publication>> GetPublications(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var publications = await (from pub in _context.Publications
                                      where pub.MediaId == mediaId
                                      where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                      select pub).ToListAsync();
            return publications;
        }
        public async Task SetPublicationNettoye(Publication publication, string texteNettoye)
        {
            publication.TexteNettoye = texteNettoye;
            await _context.SaveChangesAsync();
        }

        public async Task<List<InfoCandidat>> GetInfoCandidats() //Méthode pour la recherche d'informations d'une liste de cadidats.
        {
            var infoCandidats = await (from p in _context.Personnes
                                       join c in _context.Circonscriptions
                                       on p.CirconscriptionId equals c.CirconscriptionId
                                       join pp in _context.Partis
                                       on p.PartiId equals pp.PartiId
                                       join r in _context.Regions
                                       on c.RegionId equals r.RegionId
                                       select new InfoCandidat
                                       {
                                           Prenom = p.Prenom,
                                           Nom = p.Nom,
                                           Genre = p.Genre,
                                           NomParti = pp.Nom,
                                           NomCirconscription = c.Nom,
                                           NomRegion = r.Nom
                                       }).ToListAsync();
            return infoCandidats;
        }

        public async Task SetPublicationTronquer(Publication publication, string texteTronquer)
        {
            publication.TexteTronquer = texteTronquer;
            await _context.SaveChangesAsync();
        }
    }
}
