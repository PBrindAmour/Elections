using ElectionsAPI.Controllers.Models;
using ElectionsAPI.Engine.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace ElectionsAPI.Controllers
{ 
        [ApiController]
        [Route("api/TfIdf")]
        public class TfIdfController : Controller
        {
            private readonly ITfIdfEngine _engine;

            public TfIdfController(ITfIdfEngine engine) // Méthode qui définit l'engine que le controller reçoit en paramètre.
            {
                _engine = engine;
            }

            [HttpGet("fréquences")]
            public async Task getFrequence() // Méthode qui apelle l'engine pour les infos d'un candidat.
            {
                await _engine.CompterFrequence(1);
            }
        }    
}
