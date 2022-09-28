using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.Engine.Interfaces;

namespace ElectionsAPI.Engine
{
    public class TfIdfEngine : ITfIdfEngine
    {
        private readonly ITfIdfStore _store;

        public TfIdfEngine(ITfIdfStore store)
        {
            _store = store;
        }
        public async Task CompterFrequence(short id)
        {
            var texte = getTextAsync(id);
            Console.WriteLine(texte);

        }

        private async Task<string> getTextAsync(short id)
        {            
            var pub = await _store.GetTextAsync(id);
            return pub;           
        }
    }
}
