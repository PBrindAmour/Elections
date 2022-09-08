using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("DictionnaireTheme", Schema = "dbo")]
    public class DictionnaireTheme
    {
        [Column("ThemeID")]
        public short ThemeId { get; set; }
        public string Mot { get; set; }
    }
}
