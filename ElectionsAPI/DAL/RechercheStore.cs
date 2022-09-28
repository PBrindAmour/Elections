using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.DAL.Models;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

/* Le store reçoit des directives pour faire des demandes au context qui est la connexion à la base de données. */

namespace ElectionsAPI.DAL
{
    public class RechercheStore : IRechercheStore 
    {
        private readonly ElectionContext _context; // Le context est une variable privée puisque c'est la connexion à la base de données.

        public RechercheStore(ElectionContext context) // Le contexte est définit.
        {
            _context = context;
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

        public async Task<InfoGenre> GetInfoGenre(short partiId) //Méthode qui détermine les statistiques de genre par partis.
        {
            // Variable qui sort une liste de genre par parti.
            var genres = await (from p in _context.Personnes
                                join pp in _context.Partis
                                on p.PartiId equals pp.PartiId
                                where pp.PartiId == partiId
                                select new
                                {
                                    genre = p.Genre,
                                    parti = pp.Nom

                                }).ToListAsync();

            // Variable qui sort une liste de genre par publication et on les sépare ensuite par parti.
            var publications = await (from p in _context.Publications
                                      join pm in _context.PersonneMedias
                                      on p.MediaUserId equals pm.MediaUserId
                                      join pers in _context.Personnes
                                      on pm.PersonneId equals pers.PersonneId
                                      join pp in _context.Partis
                                      on pers.PartiId equals pp.PartiId
                                      where pp.PartiId == partiId
                                      select pers.Genre).ToListAsync();

            // Comptage des genres et des publications par partis.
            var totalFemmes = genres.Where(g => g.genre.Equals('F')).Count();
            var totalHommes = genres.Where(g => g.genre.Equals('H')).Count();
            var totalPublicationFemmes = publications.Where(p => p.Equals('F')).Count();
            var totalPublicationHommes = publications.Where(p => p.Equals('H')).Count();
            var nomParti = await _context.Partis.Where(p => p.PartiId == partiId).SingleAsync();

            return new InfoGenre // Retourne le nom du parti avec le nombre de femmes et d'hommes et le nombre de publications qu'ils ont fait.
            {
                NomParti = nomParti.Nom,
                TotalFemmes = totalFemmes,
                TotalPublicationFemme = totalPublicationFemmes,
                TotalHommes = totalHommes,
                TotalPublicationHomme = totalPublicationHommes
            };
        }

        public async Task<List<Parti>> GetPartis() // Méthode pour aller chercher la liste de partis.
        {
            return await _context.Partis.ToListAsync();
        }

        public async Task<List<Media>> GetMedias() // Méthode pour aller chercher la liste de médias.
        {
            return await _context.Medias.ToListAsync();
        }


        // Méthode pour aller chercher la liste de publications par parti et par média.
        public async Task<InfoPublication> GetInfoPublications(short partiId, short mediaId, string mot) 
        {
            var publications = await (from p in _context.Publications
                                      join pm in _context.PartiMedia
                                      on p.MediaUserId equals pm.MediaUserId
                                      where p.Texte.Contains(mot)                                   
                                      join pp in _context.Partis
                                      on pm.PartiId equals pp.PartiId
                                      where pp.PartiId == partiId
                                      where p.MediaId == mediaId
                                      select p.Texte).ToListAsync();
            int total = 0;
            foreach(var publication in publications)
            {
                 total = total + Regex.Matches(publication, mot).Count; // Utilisation de la méthode Regex qui permet de compter l'occurence d'un mot dans un texte, ici on compte dans tous les textes.
            }

            // Compte le nombre de publications où le mot se retrouve
            var comptePublication = publications.Where(p => p.Contains(mot)).Count();
            var nomParti = await _context.Partis.Where(p => p.PartiId == partiId).SingleAsync();
            var nomMedia = await _context.Medias.Where(m => m.MediaId == mediaId).SingleAsync();

            // Retourne pour chaque média et chaque parti, le nombre de publications où le mot se retrouve et le nombre total d'occurence 
            return new InfoPublication
            {
                NomParti = nomParti.Nom,
                NomMedia = nomMedia.Nom,
                Mot = mot,
                NombrePublications = comptePublication,
                NombreTotal = total
            };
        }

        //Méthode pour aller chercher la liste de publications d'un candidat
        public async Task<List<ListePublicationsCandidat>> GetListePublicationCandidat(short personneId)
        {
            var publications = await (from p in _context.Publications
                                      join pm in _context.PersonneMedias
                                      on p.MediaUserId equals pm.MediaUserId
                                      join pers in _context.Personnes
                                      on pm.PersonneId equals pers.PersonneId
                                      where pers.PersonneId == personneId
                                      select new ListePublicationsCandidat
                                      {
                                          Prenom = pers.Prenom,
                                          Nom = pers.Nom,
                                          Texte = p.Texte,
                                          Url = p.UrlPublication
                                      }
                                      ).ToListAsync();
            
            return publications;        
        }       
        
        //Méthode pour aller chercher la liste de candidats
        public async Task<List<Candidats>> GetCandidats(string? prenom, string? nom, string? parti, string? circonscription, string? region, char? genre)
        {
            var candidats = await (from pers in _context.Personnes
                                   join part in _context.Partis
                                   on pers.PartiId equals part.PartiId
                                   join c in _context.Circonscriptions
                                   on pers.CirconscriptionId equals c.CirconscriptionId
                                   join r in _context.Regions
                                   on c.RegionId equals r.RegionId
                                   where (string.IsNullOrEmpty(prenom) || pers.Prenom.Contains(prenom))
                                   where (string.IsNullOrEmpty(nom) || pers.Nom.Contains(nom))
                                   where (string.IsNullOrEmpty(parti) || part.Nom.Contains(parti))
                                   where (string.IsNullOrEmpty(circonscription) || c.Nom.Contains(circonscription))
                                   where (string.IsNullOrEmpty(region) || r.Nom.Contains(region))
                                   where (genre == null || pers.Genre == genre)



                                   select new Candidats
                                   {
                                       PersonneId = pers.PersonneId,
                                       Prenom = pers.Prenom,
                                       Nom = pers.Nom,
                                       Parti = part.Nom,
                                       Circonscription = c.Nom,
                                       Region = r.Nom,
                                       Genre = pers.Genre.Value

                                   }
                                   ).ToListAsync();
            return candidats;
        }

        public async Task<List<string>> GetPublicationTexte(short partiId, List<short> mediaId)
        {

            var textes = await (from pub in _context.Publications
                                join pm in _context.PartiMedia
                                on pub.MediaUserId equals pm.MediaUserId
                                where mediaId.Contains(pm.MediaId)
                                join part in _context.Partis
                                on pm.PartiId equals part.PartiId
                                where pm.PartiId == partiId && mediaId.Contains(pm.MediaId) && mediaId.Contains(pub.MediaId)
                               select pub.Texte).ToListAsync();
            return textes;
        }
    }
}

/*
 * var textesFinal = new List<string>();
            foreach (var media in mediaId)
            {
                var textes = await (from pub in _context.Publications
                                    join pm in _context.PartiMedia
                                    on pub.MediaId equals pm.MediaId
                                    join part in _context.Partis
                                    on pm.PartiId equals part.PartiId
                                    where pm.PartiId == partiId
                                    where pm.MediaId == media
                                    select pub.Texte).ToListAsync();
                textesFinal.AddRange(textes);
            }
            
            return textesFinal;*/