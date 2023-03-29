using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("TestLisibilite", Schema = "dbo")]
    public class TestLisibilite
    {
        [Column("TestID")]
        [Key]
        public short TestId { get; set; }
        public string Nom { get; set; }
    }
}
