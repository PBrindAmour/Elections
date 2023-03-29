namespace ElectionsAPI.Controllers.Models
{
    //Le modèle candidat permet de retrouver les informations sur un candidat
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
