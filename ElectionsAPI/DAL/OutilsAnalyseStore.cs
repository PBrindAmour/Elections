using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.DAL.Models;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.EntityFrameworkCore;

namespace ElectionsAPI.DAL
{
    public class OutilsAnalyseStore : IOutilsAnalyseStore
    {
        private readonly ElectionContext _context; // Le context est une variable privée puisque c'est la connexion à la base de données.
        public OutilsAnalyseStore(ElectionContext context) // Le contexte est définit.
        {
            _context = context;
        }

        public async Task<List<string>> GetPublicationTexte(short partiId, List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
     

            var textes = await (from pub in _context.Publications
                                join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                into join_pm
                                from jp in join_pm.DefaultIfEmpty()
                                join ppm in _context.PersonneMedias on pub.MediaUserId equals ppm.MediaUserId
                                into join_personnemedia
                                from jpm in join_personnemedia.DefaultIfEmpty()
                                join p in _context.Personnes on jpm.PersonneId equals p.PersonneId
                                into join_personnes
                                from jpp in join_personnes.DefaultIfEmpty()
                                where mediaId.Contains(pub.MediaId)
                                where (partiId == jp.PartiId && mediaId.Contains(jp.MediaId)) || (pub.MediaId == jpm.MediaId && partiId == jpp.PartiId)
                                where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                select pub.Texte).ToListAsync();
            return textes;
        }

        public async Task<List<string>> GetPublicationTexteNettoye(short partiId, List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {

            var textes = await (from pub in _context.Publications
                                join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                into join_pm
                                from jp in join_pm.DefaultIfEmpty()
                                join ppm in _context.PersonneMedias on pub.MediaUserId equals ppm.MediaUserId
                                into join_personnemedia
                                from jpm in join_personnemedia.DefaultIfEmpty()
                                join p in _context.Personnes on jpm.PersonneId equals p.PersonneId
                                into join_personnes
                                from jpp in join_personnes.DefaultIfEmpty()
                                where mediaId.Contains(pub.MediaId)
                                where (partiId == jp.PartiId && mediaId.Contains(jp.MediaId)) || (pub.MediaId == jpm.MediaId && partiId == jpp.PartiId)
                                where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                select pub.TexteNettoye).ToListAsync();



            return textes;
        }


        public async Task<List<string>> GetPublicationTexteTronque(short partiId, List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var textes = new List<string>();
            if (mediaId.Contains(2))
            {
                var chefsIds = GetChefsIds();
                 textes = await (from pub in _context.Publications
                                    join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                    into join_pm
                                    from jp in join_pm.DefaultIfEmpty()
                                    join ppm in _context.PersonneMedias on pub.MediaUserId equals ppm.MediaUserId
                                    into join_personnemedia
                                    from jpm in join_personnemedia.DefaultIfEmpty()
                                    join p in _context.Personnes on jpm.PersonneId equals p.PersonneId
                                    into join_personnes
                                    from jpp in join_personnes.DefaultIfEmpty()
                                    where mediaId.Contains(pub.MediaId)
                                    where (partiId == jp.PartiId && mediaId.Contains(jp.MediaId) && jp.MediaId == pub.MediaId || (mediaId.Contains(pub.MediaId) && partiId == jpp.PartiId) && chefsIds.Contains(jpm.PersonneId))
                                    where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                    select pub.TexteTronquer).ToListAsync();

            }
            else
            {
                 textes = await (from pub in _context.Publications
                                    join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                    into join_pm
                                    from jp in join_pm.DefaultIfEmpty()
                                    join ppm in _context.PersonneMedias on pub.MediaUserId equals ppm.MediaUserId
                                    into join_personnemedia
                                    from jpm in join_personnemedia.DefaultIfEmpty()
                                    join p in _context.Personnes on jpm.PersonneId equals p.PersonneId
                                    into join_personnes
                                    from jpp in join_personnes.DefaultIfEmpty()
                                    where mediaId.Contains(pub.MediaId)
                                    where (partiId == jp.PartiId && mediaId.Contains(jp.MediaId) && jp.MediaId == pub.MediaId || (mediaId.Contains(pub.MediaId) && partiId == jpp.PartiId))
                                    where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                    select pub.TexteTronquer).ToListAsync();

            }

            return textes;
        }
        public async Task<List<Parti>> GetPartis() // Méthode pour aller chercher la liste de partis.
        {
            return await _context.Partis.ToListAsync();
        }

        public async Task<List<Media>> GetMedias() // Méthode pour aller chercher la liste de partis.
        {
            return await _context.Medias.ToListAsync();
        }

        public async Task<List<int>> GetPublicationsId(short partiId, short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var publicationsId = new List<int>();
            if (mediaId == 2)
            {
                var chefsIds = GetChefsIds();
                publicationsId = await (from pub in _context.Publications
                                        join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                        into join_partimedia
                                        from jp in join_partimedia.DefaultIfEmpty()
                                        join ppm in _context.PersonneMedias on pub.MediaUserId equals ppm.MediaUserId
                                        into join_personnemedia
                                        from jpm in join_personnemedia.DefaultIfEmpty()
                                        join p in _context.Personnes on jpm.PersonneId equals p.PersonneId
                                        into join_personnes
                                        from jpp in join_personnes.DefaultIfEmpty()
                                        where mediaId == pub.MediaId
                                        where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                        where (pub.MediaId == jp.MediaId && partiId == jp.PartiId) || (pub.MediaId == jpm.MediaId && partiId == jpp.PartiId && chefsIds.Contains(jpm.PersonneId))
                                        select pub.PublicationId).ToListAsync();
            }
            else
            {
                publicationsId = await (from pub in _context.Publications
                                            join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                            into join_partimedia
                                            from jp in join_partimedia.DefaultIfEmpty()
                                            join ppm in _context.PersonneMedias on pub.MediaUserId equals ppm.MediaUserId
                                            into join_personnemedia
                                            from jpm in join_personnemedia.DefaultIfEmpty()
                                            join p in _context.Personnes on jpm.PersonneId equals p.PersonneId
                                            into join_personnes
                                            from jpp in join_personnes.DefaultIfEmpty()
                                            where mediaId == pub.MediaId
                                            where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                            where (pub.MediaId == jp.MediaId && partiId == jp.PartiId) || (pub.MediaId == jpm.MediaId && partiId == jpp.PartiId)
                                            select pub.PublicationId).ToListAsync();
            }
            return publicationsId;
        }
        public async Task<List<Lisibilite>> GetResultatTest(List<int> publications)
        {
            var resultats = await (from liz in _context.Lisibilites
                                   where publications.Contains(liz.PublicationId)
                                   select liz).ToListAsync();
            return resultats;
        }
        public async Task<List<Compressibilite>> GetResultatTestCompressibilite(List<int> publications)
        {
            var resultats = await (from comp in _context.Compressibilites
                                   where publications.Contains(comp.PublicationId)
                                   select comp).ToListAsync();
            return resultats;
        }

        public async Task<List<Publication>> GetPublications(short mediaId, DateTime dateDebut, DateTime dateFin, bool chefOnly)
        {
            var publications = new List<Publication>();
            if (mediaId == 2)
            {
                var chefsIds = GetChefsIds();
                
                publications = await (from pub in _context.Publications 
                                      join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                      into join_partimedia
                                      from jp in join_partimedia.DefaultIfEmpty()
                                      join ppm in _context.PersonneMedias on pub.MediaUserId equals ppm.MediaUserId
                                      into join_personnemedia
                                      from jpm in join_personnemedia.DefaultIfEmpty()
                                      join p in _context.Personnes on jpm.PersonneId equals p.PersonneId
                                      into join_personnes
                                      from jpp in join_personnes.DefaultIfEmpty()
                                      where mediaId == pub.MediaId
                                      where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                      where (pub.MediaId == jp.MediaId) || (pub.MediaId == jpm.MediaId && chefsIds.Contains(jpm.PersonneId))
                                      select pub).ToListAsync();
                                     
            }
            else
            {
                publications = await (from pub in _context.Publications
                                      where pub.MediaId == mediaId
                                      where pub.PublicationDate > dateDebut && pub.PublicationDate < dateFin
                                      select pub).ToListAsync();
            }
            return publications;
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

        public async Task<Publication> GetPublication(int publicationId)
        {
            var publication = await (from pub in _context.Publications
                                      where pub.PublicationId == publicationId
                                      select pub).SingleAsync();
            return publication;
        }


        public async Task<List<Lisibilite>> GetListeTestLisibilite()
        {
            var tests = await (from Lisibilite in _context.Lisibilites
                               select Lisibilite).ToListAsync();
            return tests;
        }

        public async Task<List<Compressibilite>> GetListeTestCompressibilite()
        {
            var tests = await (from Compressibilite in _context.Compressibilites
                               select Compressibilite).ToListAsync();
            return tests;
        }

        public async Task SetResultatTest(int publicationId, double resultatFinalUn, double resultatFinalDeux, double resultatFinalTrois, bool nettoye, bool tronque)
        {
            var resultatTestUn = new Lisibilite();
            var resultatTestDeux = new Lisibilite();
            var resultatTestTrois = new Lisibilite();
            if (nettoye == false && tronque == false)
            {
                resultatTestUn.PublicationId = publicationId;
                resultatTestUn.TestId = 1;
                resultatTestUn.Valeur = resultatFinalUn;
                resultatTestDeux.PublicationId = publicationId;
                resultatTestDeux.TestId = 2;
                resultatTestDeux.Valeur = resultatFinalDeux;
                resultatTestTrois.PublicationId = publicationId;
                resultatTestTrois.TestId = 3;
                resultatTestTrois.Valeur = resultatFinalTrois;
            }
            else if (nettoye == true && tronque == false)
            {
                resultatTestUn.PublicationId = publicationId;
                resultatTestUn.TestId = 4;
                resultatTestUn.Valeur = resultatFinalUn;
                resultatTestDeux.PublicationId = publicationId;
                resultatTestDeux.TestId = 5;
                resultatTestDeux.Valeur = resultatFinalDeux;
                resultatTestTrois.PublicationId = publicationId;
                resultatTestTrois.TestId = 6;
                resultatTestTrois.Valeur = resultatFinalTrois;
            }
            else
            {
                resultatTestUn.PublicationId = publicationId;
                resultatTestUn.TestId = 7;
                resultatTestUn.Valeur = resultatFinalUn;
                resultatTestDeux.PublicationId = publicationId;
                resultatTestDeux.TestId = 8;
                resultatTestDeux.Valeur = resultatFinalDeux;
                resultatTestTrois.PublicationId = publicationId;
                resultatTestTrois.TestId = 9;
                resultatTestTrois.Valeur = resultatFinalTrois;
            }
            await _context.Lisibilites.AddRangeAsync(resultatTestUn);
            await _context.Lisibilites.AddRangeAsync(resultatTestDeux);
            await _context.Lisibilites.AddRangeAsync(resultatTestTrois);
            await _context.SaveChangesAsync();
        }
        public async Task SetResultatTestCompress(int publicationId, double resultat, double resultatNet, double resultatTronq)
        {
            var result = new Compressibilite();
            var resultNet = new Compressibilite();
            var resultTronq = new Compressibilite();
            result.TextId = 1;
            resultNet.TextId = 2;
            resultTronq.TextId = 3;
            result.PublicationId = publicationId;
            resultNet.PublicationId = publicationId;
            resultTronq.PublicationId = publicationId;
            result.Valeur = resultat;
            resultNet.Valeur = resultatNet;
            resultTronq.Valeur = resultatTronq;
            await _context.Compressibilites.AddRangeAsync(result);
            await _context.Compressibilites.AddRangeAsync(resultNet);
            await _context.Compressibilites.AddRangeAsync(resultTronq);
            await _context.SaveChangesAsync();
        }

        public async Task InsertTfidf(List<Parti> partis, short mediaId, int valeurTop, Dictionary<string, Dictionary<short, double>> dictionnaire)
        {
            foreach(var parti in partis)
            {
                var reponse = new Dictionary<string, double>();
                foreach (var dic in dictionnaire)
                {
                    reponse.Add(dic.Key, dic.Value[parti.PartiId]);
                }
                var sortedDict = from entry in reponse orderby entry.Value descending select entry;
                var compteur = 0;
                var resultat = new Dictionary<string, double>();
                foreach (var valeur in sortedDict)
                {
                    if (compteur == valeurTop)
                    { break; }
                    compteur++;
                    var tfidf = new Tfidf { PartiId = parti.PartiId, MediaId = mediaId, Mot = valeur.Key, Valeur = valeur.Value };
                    var tfidfBase = _context.Tfidfs.Where( x => x.PartiId == parti.PartiId && x.MediaId == mediaId && x.Mot == valeur.Key).SingleOrDefault();
                    if(tfidfBase == null)
                    {
                        await _context.Tfidfs.AddAsync(tfidf);
                    }
                    else
                    {
                        tfidfBase.Valeur = valeur.Value;
                    }
                    await _context.SaveChangesAsync();
                }
            }
            
        }

        /*public async Task<Dictionary<string, double>> GetTfidfs(short partiId, short mediaId)
        {
            var tfidfs = await (from tf in _context.Tfidfs
                                where tf.PartiId == partiId && tf.MediaId == mediaId
                                select tf).ToListAsync(); 
            var resultat = new Dictionary<string, double>();
            foreach(var tfidf in tfidfs)
            {
                resultat.Add(tfidf.Mot, tfidf.Valeur.Value);
            }
            return resultat;
        }*/

        public async Task<List<Tfidf>> GetTfidfs(short mediaId)
        {
            var tfidfs = await (from tf in _context.Tfidfs
                                where tf.MediaId == mediaId
                                select tf).ToListAsync();           
            return tfidfs;
        }
        public async Task<List<Tfidf>> GetTfidfs(short partiId, short mediaId)
        {
            var tfidfs = await (from tf in _context.Tfidfs
                                where tf.MediaId == mediaId && tf.PartiId == partiId
                                select tf).ToListAsync();
            return tfidfs;
        }
        public async Task<List<Tfidf>> GetTfidfs()
        {
            var tfidfs = await (from tf in _context.Tfidfs
                                select tf).ToListAsync();
            return tfidfs;
        }

        public async Task<short> GetMediaPublication(int publicationId)
        {
            var partiId = await (from pub in _context.Publications
                                 where publicationId == pub.PublicationId
                                 select pub.MediaId).SingleAsync();
            return partiId;
        }

        public async Task<short> GetPartiPublication(int publicationId)
        {
            var partiId = await (from pub in _context.Publications
                                 join pm in _context.PartiMedia on pub.MediaUserId equals pm.MediaUserId
                                 where publicationId == pub.PublicationId && pm.MediaUserId == pub.MediaUserId && pm.MediaId == pub.MediaId
                                 select pm.PartiId).SingleOrDefaultAsync();
            var partiIds = await (from pub in _context.Publications
                             join pm in _context.PersonneMedias on pub.MediaUserId equals pm.MediaUserId
                             join pers in _context.Personnes on pm.PersonneId equals pers.PersonneId
                             where publicationId == pub.PublicationId && pm.MediaId == pub.MediaId
                             select pers.PartiId).SingleOrDefaultAsync();
            
            if (partiId < partiIds)
            {
                return partiIds.Value;
            }

            return partiId;
        }

        public async Task GetTfidf(short partiId, short mediaId, string mot, double nouvelleValeur)
        {
            var tfidf = await (from tf in _context.Tfidfs
                           where tf.PartiId == partiId && tf.MediaId == mediaId && tf.Mot == mot
                           select tf).SingleOrDefaultAsync();
            tfidf.Valeur = nouvelleValeur;
            await _context.SaveChangesAsync();

        }

        public async Task UpdateTfidf(Tfidf tfidf, double nouvelleValeur)
        {           
            tfidf.Valeur = nouvelleValeur;
        }


        public async Task AddTfidf(List<Tfidf> nouveauMots)
        {
            foreach (var nouveauMot in nouveauMots)
            {               
                var mot = _context.Tfidfs.Where(x => x.PartiId == nouveauMot.PartiId && x.MediaId == nouveauMot.MediaId && x.Mot == nouveauMot.Mot).Any();
                if (!mot)
                {
                    await _context.Tfidfs.AddRangeAsync(nouveauMot);
                }

            }
        }

        public async Task SaveChanges()
        {
            await _context.SaveChangesAsync();
        }

    }
}
