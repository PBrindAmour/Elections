using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("PersonneMedia", Schema = "dbo")]
    public class PersonneMedia
    {
        [Column("PersonneID")]
        public short PersonneId { get; set; }
        [Column("MediaID")]
        public short MediaId { get; set; }
        [Column("MediaUserID")]
        public long? MediaUserId { get; set; }
        public string? Surnom { get; set; }
    }
}
