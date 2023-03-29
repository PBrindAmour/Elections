namespace ElectionsAPI.Controllers.Models
{
    // Modèle pour les informations d'un candidat
    public class InfoCandidat
    {
        public string Prenom { get; set; }
        public string Nom { get; set; }
        public char? Genre { get; set; }
        public string NomParti { get; set; }
        public string NomCirconscription { get; set; }
        public string NomRegion { get; set; }
    }
}
