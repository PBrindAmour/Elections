using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Lisibilite", Schema = "dbo")]
    public class Lisibilite
    {
        [Column("PublicationID")]
        public int PublicationId { get; set; }
        [Column("TestID")]
        public short TestId { get; set; }
        public double? Valeur { get; set; }

    }
}

