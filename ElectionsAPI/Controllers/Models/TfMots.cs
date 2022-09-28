namespace ElectionsAPI.Controllers.Models
{
    public class TfMots
    {
        public string mot { get; set; }
        public Dictionary<int, double> idf { get; set; }
    }
}
