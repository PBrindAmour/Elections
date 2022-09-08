using ElectionsAPI.Models;
using System.Text;

namespace ElectionsAPI.DAL
{
    public class TranscriptionFichier
    {
        public void Sauvegarde(List<TwitterPost> posts)
        {/*
            string filePlace = @"C:\Users\philb\OneDrive\Projet Final\PLQ\Twitter\";
            foreach (var post in posts)
            {
                post.Nom = Helper.getTwitterUserById(Int32.Parse(post.Auteur));
                try
                {
                    using (FileStream fs = File.Create(filePlace+post.Auteur+".txt"))
                    {
                        var date = post.Date.ToString("yyMMdd"+"\n"+"\n");
                        var dateHeure = post.Date.ToString("hh:mm:ss tt . dd MMMM yyyy" + "\n" + "\n");
                        Byte[] title = new UTF8Encoding(true).GetBytes(date);
                        byte[] auteur = new UTF8Encoding(true).GetBytes(post.Nom + "\n\n");
                        byte[] message = new UTF8Encoding(true).GetBytes(post.Message + "\n\n");
                        byte[] dateHeures = new UTF8Encoding(true).GetBytes(dateHeure);
                        fs.Write(title, 0, title.Length);
                        fs.Write(auteur, 0, auteur.Length);
                        
                        fs.Write(message, 0, message.Length);
                        
                        fs.Write(dateHeures, 0,dateHeure.Length);
                    }
                                        
                }
                catch (Exception Ex)
                {
                    Console.WriteLine(Ex.ToString());
                }
            }*/
        }
    }
}
