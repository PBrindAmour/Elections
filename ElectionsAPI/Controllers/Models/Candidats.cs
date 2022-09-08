namespace ElectionsAPI.Controllers.Models
{
    public class Candidats
    {
        public short PersonneId { get; set; }
        public string Prenom { get; set; }
        public string Nom { get; set; }
        public string Parti { get; set; }
        public string Circonscription { get; set; }
        public string Region { get;set; }
        public char Genre { get; set; }
    }
}
