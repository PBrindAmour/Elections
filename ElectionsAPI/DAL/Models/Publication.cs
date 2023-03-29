using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Publication", Schema = "dbo")]
    public class Publication
    {
        [Column("PublicationID")]
        [Key]
        public int PublicationId { get; set; }
        [Column("MediaID")]
        public short MediaId { get; set; }
        [Column("PublicationMediaID")]
        public long? PublicationMediaId { get; set; }
        [Column("MediaUserID")]
        public long? MediaUserId { get; set; }
        public string? Titre { get; set; }
        public string? Texte { get; set; }
        public DateTime PublicationDate { get; set; }
        public string? UrlPublication { get; set; }
        public string? TexteTronquer { get; set; }
        public string? TexteNettoye { get; set; }

    }
}
