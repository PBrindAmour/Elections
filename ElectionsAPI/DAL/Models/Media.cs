using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#nullable enable
namespace ElectionsAPI.DAL.Models
{
    [Table("Media", Schema = "dbo")]
    public class Media
    {
        [Column("MediaID")]
        [Key]
        public short MediaId { get; set; }
        public string Nom { get; set; }
        public bool? Officiel { get; set; }
    }
}
