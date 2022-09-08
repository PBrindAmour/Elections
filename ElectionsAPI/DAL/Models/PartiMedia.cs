using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ElectionsAPI.DAL.Models
{
    public class PartiMedia
    {
        [Column("PartiID")]
        public short PartiId { get; set; }
        [Column("MediaID")]
        public short MediaId { get; set; }
        public long? MediaUserId { get; set; }
        public string? Surnom { get; set; }


    }
}
