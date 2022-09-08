using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("ChefParti", Schema = "dbo")]
    public class ChefParti
    {
        [Column("PartiID")]
        public short PartiId { get; set; }
        [Column("PersonneID")]
        public short PersonneId { get; set; }
    }
}
