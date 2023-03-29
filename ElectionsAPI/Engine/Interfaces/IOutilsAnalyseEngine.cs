using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.Engine.Interfaces
{
    public interface IOutilsAnalyseEngine
    {
        Task GetTfIdfScriptNettoye(List<short> mediaId, DateTime dateDebut, DateTime dateFin);
        Task GetTfIdfScriptTronque(List<short> mediaId, DateTime dateDebut, DateTime dateFin);
      
        Task SaveTfIdf(short mediaId);
        Task TfidfEqualizer();
        Task<Dictionary<string, Dictionary<short, double>>> GetTfIdfNormalise(List<short> mediaId, DateTime dateDebut, DateTime dateFin);

        Task TestLisibilite(short mediaId);
        Task TestCompressibilite(short mediaId);
        Task<List<InfoCompressibilite>> GetInfoCompressibilite(short mediaId, DateTime dateDebut, DateTime dateFin);
        Task<List<InfoCompressibilite>> GetInfoCompressibiliteTotal(List<short> mediaId, DateTime dateDebut, DateTime dateFin);



        Task<List<InfoLisibilite>> GetInfoLisibilite(short mediaId, DateTime dateDebut, DateTime dateFin);
        Task<List<InfoLisibilite>> GetInfoLisibiliteNettoye(short mediaId, DateTime dateDebut, DateTime dateFin);
        Task<List<InfoLisibilite>> GetInfoLisibiliteTronque(short mediaId, DateTime dateDebut, DateTime dateFin);

        Task<string> MesureSimilarite(List<short> mediaId, DateTime dateDebut, DateTime dateFin);
        Task<string> MesureSimilariteNettoye(List<short> mediaId, DateTime dateDebut, DateTime dateFin);
        Task<string> MesureSimilariteTronque(List<short> mediaId, DateTime dateDebut, DateTime dateFin);
        Task<string> MesureSimilariteMedias(short partiId, DateTime dateDebut, DateTime dateFin);


        Task<string> PredicteurTexte(int publicationId);
        Task<string> PredicteurTextesMedia(short mediaId);
        Task<string> PredicteurTextes(short mediaIdTfidf, short mediaIdPrediction);
        Task<string> PredicteurTextesApres(short mediaIdTfidf, short mediaIdPredire);

        Task<string> EntraineurPredicteur(short mediaId);
        Task ShowTfidf(short partiId, short mediaId);
        //Task<string> PredicteurMedias(short mediaId);
        Task SaveChanges();


    }
}
