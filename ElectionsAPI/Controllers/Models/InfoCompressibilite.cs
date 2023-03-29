namespace ElectionsAPI.Controllers.Models
{
    public class InfoCompressibilite
    {
        public int PartiId { get; set; }
        public double Valeur { get; set; } 
        public int? nbMotsDifferent { get; set; }
        public int? nbMotsTotal { get; set; }
    }
}
