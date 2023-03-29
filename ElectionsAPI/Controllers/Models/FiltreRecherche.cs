using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.Controllers.Models
{
    //Ce modèle permet d'utiliser des listes lorsqu'on veut utiliser plusieurs partis ou plusieurs médias
    public class FiltreRecherche
    {
        public List<short>? PartiId { get; set; }
        public List<short>? MediaId { get; set; }
    }
}
