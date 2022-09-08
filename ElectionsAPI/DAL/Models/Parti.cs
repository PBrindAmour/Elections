using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Parti", Schema = "dbo")]
    public class Parti
    {
        [Column("PartiID")]
        [Key]
        public short PartiId { get; set; }
        public string Nom { get; set; }
        public string Abreviation { get; set; }
        }
}
