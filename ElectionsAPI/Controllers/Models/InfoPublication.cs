namespace ElectionsAPI.Controllers.Models
{
    //Modèle pour obtenir les informations de publication
    public class InfoPublication
    {
        public string NomParti { get; set; }
        public string NomMedia { get; set; }
        public string Mot { get; set; }
        public int NombrePublications { get; set; }
        public int NombreTotal { get; set; }
    }
}
