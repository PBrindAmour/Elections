namespace ElectionsAPI.Controllers.Models
{
    //Modèle pour recevoir la liste des publications d'un candidat
    public class ListePublicationsCandidat
    {
        public string Prenom { get; set; }
        public string Nom { get; set; }
        public string Texte { get; set; }
        public string Url { get; set; }
    }
}
