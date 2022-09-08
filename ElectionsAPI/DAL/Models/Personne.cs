using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ElectionsAPI.DAL.Models
{
    [Table("Personne", Schema = "dbo")]
    public class Personne
    {
        [Column("PersonneID")]
        [Key]
        public short PersonneId { get; set; }
        public string Prenom { get; set; }
        public string Nom { get; set; }
        public char? Genre { get; set; }
        public byte? Age { get; set; }
        [Column("PartiID")]
        public short? PartiId { get; set; }
        [Column("CirconscriptionID")]
        public short? CirconscriptionId { get; set; }
    }
}
