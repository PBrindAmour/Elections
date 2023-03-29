namespace ElectionsAPI.Controllers.Models
{
    /* Modèle pour les Statistiques de genre par parti */
    public class InfoGenre
    {
        public string NomParti { get; set; }
        public int TotalFemmes { get; set; }
        public int PourcentageFemme { get; set; }
        public int TotalPublicationFemme { get; set; }
        public int PourcentagePublicationFemme { get; set; }
        public int TotalHommes { get; set; }
        public int PourcentageHomme { get; set; }
        public int TotalPublicationHomme { get; set; }
        public int PourcentagePublicationHomme { get; set; }



    }
}
