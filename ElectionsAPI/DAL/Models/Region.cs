using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Region", Schema = "dbo")]
    public class Region
    {
        [Column("RegionID")]
        [Key]
        public short RegionId { get; set; }
        public string Nom { get; set; }
    }
}
