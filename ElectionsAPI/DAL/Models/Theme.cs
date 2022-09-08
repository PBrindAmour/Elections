using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ElectionsAPI.DAL.Models
{

    [Table("Theme", Schema = "dbo")]
    public class Theme
    {
        [Column("ThemeID")]
        [Key]
        public short ThemeId { get; set; }
        public string Nom { get; set; }
    }
}



