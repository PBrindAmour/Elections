using Newtonsoft.Json;
#nullable disable
namespace ElectionsAPI.Models
{
    public class TwitterPost // Les informations du tweet
    {
        [JsonProperty(PropertyName = "created_at")] // La date
        public DateTime Date { get; set; }

        [JsonProperty(PropertyName = "id")] // L'Id Twitter de la personne
        public long Id { get; set; }
        
        [JsonProperty(PropertyName = "author_id")] // L'Id de l'autheur
        public long UserId { get; set; }

        [JsonProperty(PropertyName = "text")] // Le message
        public string Texte { get; set; }
        
    }

    public class Meta // Les informations de la page
    {
        [JsonProperty(PropertyName = "next_token")] // Lorsqu'il y a plusieurs pages
        public string NextToken { get; set; }

    }

    public class RootObject // L'objet final qui est composé d'un objet de chaque énuméré ici-haut
    {
        [JsonProperty(PropertyName = "data")]
        public List<TwitterPost> posts { get; set; }

        [JsonProperty(PropertyName = "meta")]
        public Meta Meta { get; set; }
    }
}
