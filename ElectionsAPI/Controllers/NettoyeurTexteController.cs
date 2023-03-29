using ElectionsAPI.Engine.Interfaces;
using Microsoft.AspNetCore.Mvc;
namespace ElectionsAPI.Controllers
{
    [ApiController]
    [Route("api/recherche")]
    public class NettoyeurTexteController : Controller
    {
        private readonly INettoyeurTexteEngine _engine;
        public NettoyeurTexteController(INettoyeurTexteEngine engine) // Méthode qui définit l'engine que le controller reçoit en paramètre.
        {
            _engine = engine;
        }
        // Méthode qui permet de retirer les mots inutiles, les noms et de corriger les mots mal tronqués
        [HttpGet("Retirer charactères non lisible")]
        public async Task RetirerCharacteresNLisible(short mediaId)
        {           
            await _engine.NettoyerTextes(mediaId);
        }

        // Méthode qui va tronquer les mots du texte d'une publication et le sauvegarde dans TexteTronquer de la même publication
        [HttpGet("Tronquer publications")]
        public async Task TronquerPublications(short mediaId)
        {
            
            await _engine.TronquerPublication(mediaId);
        }

        [HttpGet("Nettoyer textes tronqués")]
        public async Task NettoyerTronque(short mediaId)
        {

            await _engine.NettoyeTronque(mediaId);
        }

    }
}
