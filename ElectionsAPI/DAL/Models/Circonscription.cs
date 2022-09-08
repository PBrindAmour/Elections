using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Circonscription", Schema = "dbo")]
    public class Circonscription
    {
        [Column("CirconscriptionID")]
        [Key]
        public short CirconscriptionId { get; set; }
        public string Nom { get; set; }
        [Column("RegionID")]
        public short RegionId { get; set; }
    }
}
