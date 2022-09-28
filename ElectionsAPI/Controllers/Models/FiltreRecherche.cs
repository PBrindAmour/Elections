using ElectionsAPI.DAL.Models;

namespace ElectionsAPI.Controllers.Models
{
    public class FiltreRecherche
    {
        public List<short>? PartiId { get; set; }
        public List<short>? MediaId { get; set; }
    }
}
