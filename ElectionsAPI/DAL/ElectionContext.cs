using ElectionsAPI.DAL.Models;
using Microsoft.EntityFrameworkCore;

namespace ElectionsAPI.DAL
{
    public class ElectionContext : DbContext
    {
        public ElectionContext(DbContextOptions<ElectionContext> options) : base(options) {}

        public ElectionContext()
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) // Connection string
        {
        }

        // Méthode qui détermine les clés primaires double
        protected override void OnModelCreating(ModelBuilder modelBuilder) 
        {
            modelBuilder.Entity<PersonneMedia>().HasKey(c => new { c.PersonneId, c.MediaId });
            modelBuilder.Entity<PartiMedia>().HasKey(c => new { c.PartiId, c.MediaId });
            modelBuilder.Entity<ChefParti>().HasKey(c => new { c.PersonneId, c.PartiId });
            modelBuilder.Entity<DictionnaireTheme>().HasKey(c => new { c.ThemeId, c.Mot });
        }
        // Définition des éléments de la base de données
        public virtual DbSet<Media> Medias { get; set; }
        public virtual DbSet<Publication> Publications { get; set; }
        public virtual DbSet<Parti> Partis { get; set; }
        public virtual DbSet<PartiMedia> PartiMedia { get; set; }
        public virtual DbSet<Personne> Personnes { get; set; }
        public virtual DbSet<PersonneMedia> PersonneMedias { get; set; }
        public virtual DbSet<ChefParti> ChefPartis { get; set; }
        public virtual DbSet<Circonscription> Circonscriptions { get; set; }
        public virtual DbSet<Region> Regions { get; set; }
        public virtual DbSet<DictionnaireTheme> DictionnaireThemes { get; set; }
        public virtual DbSet<Theme> Themes { get; set; }

    }
}
