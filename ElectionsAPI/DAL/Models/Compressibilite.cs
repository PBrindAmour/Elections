using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Compressibilite", Schema = "dbo")]
    public class Compressibilite
    {
        [Column("PublicationID")]
        public int PublicationId { get; set; }
        [Column("TextID")]
        public short TextId { get; set; }
        public double? Valeur { get; set; }
    }
}

