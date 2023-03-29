using ElectionsAPI.Controllers.Models;
using ElectionsAPI.Engine.Interfaces;
using Microsoft.AspNetCore.Mvc;
using NewRelic.Api.Agent;

namespace ElectionsAPI.Controllers
{
    [ApiController]
    [Route("api/TfIdf")]
    public class OutilsAnalyseController : Controller
    {
        private readonly IOutilsAnalyseEngine _engine;

        public OutilsAnalyseController(IOutilsAnalyseEngine engine) // Méthode qui définit l'engine que le controller reçoit en paramètre.
        {
            _engine = engine;
        }

        // Méthode pour obtenir le Tf-Idf afin de faire un wordcloud
        [HttpPost("Get Tf-Idf SCRIPT nettoyés")]
        public async Task GetTfIdfScriptNettoye(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            await _engine.GetTfIdfScriptNettoye(mediaId, dateDebut, dateFin);
        }
        [HttpPost("Get Tf-Idf SCRIPT tronqués")]
        public async Task GetTfIdfScriptTronque(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            await _engine.GetTfIdfScriptTronque(mediaId, dateDebut, dateFin);
        }

        [HttpPost("Enregistrer Tf-Idf dans la base de données")]
        public async Task SaveTfIdf(short mediaId)
        {
            await _engine.SaveTfIdf(mediaId);
        }
        [HttpPost("TF-IDF Equalizer")]
        public async Task Equalizer()
        {
            await _engine.TfidfEqualizer();
        }

        [HttpPost("Get Tf-Idf textes méthode C-sharp normalisé")]
        public async Task<Dictionary<string, Dictionary<short, double>>> GetTfIdfNormalise(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            return await _engine.GetTfIdfNormalise(mediaId, dateDebut, dateFin);
        }

        [HttpPost("Faire test de lisibilité")]
        public async Task TestLisibilite(short mediaId)
        {
            await _engine.TestLisibilite(mediaId);
        }

        [HttpPost("Faire test de compressibilité")]
        public async Task TestCompressibilite(short mediaId)
        {
            await _engine.TestCompressibilite(mediaId);
        }

        [HttpGet("Résultat compressibilité")]
        [Transaction]
        public async Task<ActionResult<List<InfoCompressibilite>>> GetInfoCompressibilite(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            return await _engine.GetInfoCompressibilite(mediaId, dateDebut, dateFin);

        }
        [HttpPost("Résultat compressibilité compilé")]
        public async Task<List<InfoCompressibilite>> GetInfoCompressibiliteTotal(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            return await _engine.GetInfoCompressibiliteTotal(mediaId, dateDebut, dateFin);
        }

        // Méthode qui va sortir les résultat du test de lisibilité
        [HttpGet("Résultat lisibilité")]
        [Transaction]
        public async Task<ActionResult<List<InfoLisibilite>>> GetInfoLisibilite(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            return await _engine.GetInfoLisibilite(mediaId, dateDebut, dateFin);

        }


        [HttpGet("Résultat lisibilité textes nettoyés")]
        [Transaction]
        public async Task<ActionResult<List<InfoLisibilite>>> GetInfoLisibiliteNettoye(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            return await _engine.GetInfoLisibiliteNettoye(mediaId, dateDebut, dateFin);

        }

        [HttpGet("Résultat lisibilité textes nettoyés et tronqués")]
        [Transaction]
        public async Task<ActionResult<List<InfoLisibilite>>> GetInfoLisibiliteTronque(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            return await _engine.GetInfoLisibiliteTronque(mediaId, dateDebut, dateFin);

        }


        // Méthode qui permet de mesurer la similarité entre les textes
        [HttpPost("Mesure similarité")]
        public async Task<string> MesureSimilarite([FromBody] FiltreRecherche filtreRecherche, DateTime? dateDebut, DateTime? dateFin)
        {
            if (!dateDebut.HasValue)
            {
                dateDebut = new DateTime(2022, 2, 1, 0, 0, 0);
            }
            if (!dateFin.HasValue)
            {
                dateFin = new DateTime(2022, 10, 4, 0, 0, 0);
            }
            return await _engine.MesureSimilarite(filtreRecherche.MediaId, dateDebut.Value, dateFin.Value);

        }

        // Méthode qui permet de mesurer la similarité entre les textes
        [HttpPost("Mesure similarité textes nettoyés")]
        public async Task<string> MesureSimilariteNettoye([FromBody] FiltreRecherche filtreRecherche, DateTime? dateDebut, DateTime? dateFin)
        {
            if (!dateDebut.HasValue)
            {
                dateDebut = new DateTime(2022, 2, 1, 0, 0, 0);
            }
            if (!dateFin.HasValue)
            {
                dateFin = new DateTime(2022, 10, 4, 0, 0, 0);
            }
            return await _engine.MesureSimilariteNettoye(filtreRecherche.MediaId, dateDebut.Value, dateFin.Value);
        }

        [HttpPost("Mesure similarité entre médias")]
        public async Task<string> MesureSimilariteMedias(short partiId, DateTime? dateDebut, DateTime? dateFin)
        {
            if (!dateDebut.HasValue)
            {
                dateDebut = new DateTime(2022, 2, 1, 0, 0, 0);
            }
            if (!dateFin.HasValue)
            {
                dateFin = new DateTime(2022, 10, 4, 0, 0, 0);
            }
            return await _engine.MesureSimilariteMedias(partiId, dateDebut.Value, dateFin.Value);
        }

        // Méthode qui permet de mesurer la similarité entre les textes
        [HttpPost("Mesure similarité textes nettoyés et tronqués")]
        public async Task<string> MesureSimilaritetronquer([FromBody] FiltreRecherche filtreRecherche, DateTime? dateDebut, DateTime? dateFin)
        {
            if (!dateDebut.HasValue)
            {
                dateDebut = new DateTime(2022, 2, 1, 0, 0, 0);
            }
            if (!dateFin.HasValue)
            {
                dateFin = new DateTime(2022, 10, 4, 0, 0, 0);
            }
            return await _engine.MesureSimilariteTronque(filtreRecherche.MediaId, dateDebut.Value, dateFin.Value);

        }
        [HttpPost("Prédicteur de texte")]
        public async Task<string> PredicteurTexte(int publicationId)
        {
            return await _engine.PredicteurTexte(publicationId);
        }
        [HttpPost("Vérificateur du prédicteur par média")]
        public async Task<string> verificateurPredMedia(short mediaId)
        {
            return await _engine.PredicteurTextesMedia( mediaId);
        }
        [HttpPost("Entrainer le prédicteur par média")]
        public async Task<string> Entraineur(short mediaId, int nmRep)
        {
            string resultat = "";
            for(int i = 0; i < nmRep; i++)
            {
                resultat = await _engine.EntraineurPredicteur(mediaId);
                if (resultat == "Ajout de mots")
                {
                    await _engine.SaveChanges();
                    return resultat;
                }
            }
            await _engine.SaveChanges();
            return resultat;
        }


        [HttpPost("Classificateur TF-IDFMedia1 predictionpublicationMedia2")]
        public async Task<string> verificateurPred(short mediaIdTfidf, short mediaIdPredire)
        {
            return await _engine.PredicteurTextes(mediaIdTfidf, mediaIdPredire);
        }

        [HttpPost("Classificateur Après élection")]
        public async Task<string> verificateurPredicteur(short mediaIdTfidf, short mediaIdPredire)
        {
            return await _engine.PredicteurTextesApres(mediaIdTfidf, mediaIdPredire);
        }

        [HttpPost("WordCloud par parti et média")]
        public async Task ShowWordCloud(short partiId, short mediaId)
        {
            await _engine.ShowTfidf(partiId, mediaId);
        }
        /*[HttpPost("Entraineur du prédicteur pour tous les médias")]
        public async Task<string> EntraineurPredicteurTous(short mediaId)
        {
            return await _engine.PredicteurMedias(mediaId);
        }*/
    }    
}
