using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Tfidf", Schema = "dbo")]

    public class Tfidf
    {
        [Column("PartiID")]
        public short PartiId { get; set; }
        [Column("MediaID")]
        public short MediaId { get; set; }
        public string Mot { get; set; }
        public double? Valeur { get; set; }
    }
}
