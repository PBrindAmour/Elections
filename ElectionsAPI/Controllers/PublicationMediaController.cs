using ElectionsAPI.Engine.Interfaces;
using Microsoft.AspNetCore.Mvc;

/* Le controller apelle l'engine pour débuter le programme. Ce controller permet d'aller chercher les publications des candidats sur twitter */
namespace ElectionsAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PublicationMediaController : Controller
    {
        private readonly IPublicationMediaEngine _engine; // La variable est privée pour sécurité
        public PublicationMediaController(IPublicationMediaEngine engine) // L'engine est définit
        {
            _engine = engine;
        }

        [HttpPost(Name = "GetTwitter")]
        public async Task GetTwitter() //Pour aller chercher les posts twitter
        {
            await _engine.GetPostsPartisAsync();
        }

        [HttpGet(Name = "NettoyerPosts")]
        public async Task NettoyerPosts() //Pour aller chercher les posts twitter
        {
            await _engine.NettoyerPosts();
        }

        /*[HttpPost(Name = "GetTwitterPartis")]
        public async Task GetTwitterPartis() //Pour aller chercher les posts twitter
        {
            await _engine.GetPostsPartisAsync();
        }*/
    }
}
