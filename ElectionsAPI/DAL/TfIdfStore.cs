using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.DAL.Models;
using Microsoft.EntityFrameworkCore;
using System.IO;

namespace ElectionsAPI.DAL
{
    public class TfIdfStore : ITfIdfStore
    {
        private readonly ElectionContext _context; // Le context est une variable privée puisque c'est la connexion à la base de données.
        public TfIdfStore(ElectionContext context) // Le contexte est définit.
            {
                _context = context;
            }

        public async Task<string> GetTextAsync(short id)
        {
            var partis = await _context.Partis.ToListAsync();
            
            return "allo";
        }
        }
}
