using ElectionsAPI.Controllers.Models;
using ElectionsAPI.Engine.Interfaces;
using Microsoft.AspNetCore.Mvc;
using NewRelic.Api.Agent;

/*Le controller de Recherche peut être appeler pour des informations sous différente méthodes  */
namespace ElectionsAPI.Controllers
{
    [ApiController]
    [Route("api/recherche")]
    public class RechercheController : Controller
    {
        private readonly IRechercheEngine _engine;

        public RechercheController(IRechercheEngine engine) // Méthode qui définit l'engine que le controller reçoit en paramètre.
        {
            _engine = engine;
        }

        [HttpGet("GetNombrePublicationTwitterParGenres")]
        public async Task<ActionResult<List<InfoGenre>>> GetInfoGenre() // Méthode qui apelle l'engine pour les infos genré des partis.
        {
            return await _engine.GetInfoGenre();
        }

        // Méthode pour recevoir les publication d'un candidat.
        [HttpGet("GetPublicationsParCandidatId")]
        public async Task<ActionResult<List<ListePublicationsCandidat>>> GetListePublicationCandidat(short personneId)
        {
            return await _engine.GetListePublicationsCandidat(personneId);
        }

        [HttpGet("GetNombrePublicationsParTerme")]
        [Transaction]
        // Méthode qui apelle l'engine pour la recherche du nombre d'occurence d'un mot par parti et par médias.
        public async Task<ActionResult<List<InfoPublication>>> GetInfoPublication(string mot="environnement")
        {
            return await _engine.GetInfoPublications(mot);

        }

        [HttpGet("GetNombrePublicationsDeuxTermes")]
        [Transaction]
        // Méthode qui apelle l'engine pour la recherche du nombre d'occurence de deux mots par parti et par médias.
        public async Task<ActionResult<List<InfoPublication>>> GetInfoPublicationDeux(string motUn = "logement", string motDeux = "social")
        {
            return await _engine.GetInfoPublicationsDeux(motUn,motDeux);

        }

        // Méthode pour recevoir une liste de candidats
        [HttpGet("GetCandidatsFiltre")]
        public async Task<List<Candidats>> GetListeCandidats(string? prenom, string? nom, string? parti, string? circonscription, string? region, char? genre)
        {
            return await _engine.GetCandidats(prenom, nom, parti, circonscription, region, genre);
        }

        [HttpGet("GetValeurTf-IdfMoyen")]
        public async Task<String> GetValeurTfIdf()
        {
            return await _engine.GetValeurTfIdf();
        }
    }


}
