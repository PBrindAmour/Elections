using Catalyst;
using ElectionsAPI.DAL.Models;
using System.Diagnostics;
using System.IO.Compression;
using System.Text;

namespace ElectionsAPI
{
    public static class Helper
    {
        public static long RunProcessCompress(string texte)
        {
            // Create Process Info
            var psi = new ProcessStartInfo();
            string fileName = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\";
            

            if (File.Exists(fileName + "texteCompress.txt" ))
            {
                File.Delete(fileName + "texteCompress.txt");
            }

            if (File.Exists(fileName + "compressibilite.zip"))
            {
                File.Delete(fileName + "compressibilite.zip");
            }


            using (FileStream fileStr = File.Create(fileName + "texteCompress.txt"))
            {
                // Ajouter du texte au fichier  
                Byte[] text = new UTF8Encoding(true).GetBytes(texte);
                fileStr.Write(text, 0, text.Length);
            }
            using (ZipArchive zip = ZipFile.Open(fileName + "compressibilite.zip", ZipArchiveMode.Create))
            {
                zip.CreateEntryFromFile(fileName + "texteCompress.txt", "texteCompress.txt");
            }

            FileInfo fi = new FileInfo(fileName + "compressibilite.zip");
            var poids = fi.Length;
  

            if (File.Exists(fileName + "texteCompress.txt"))
            {
                File.Delete(fileName + "texteCompress.txt");
            }
            if (File.Exists(fileName + "compressibilite.zip"))
            {
                File.Delete(fileName + "compressibilite.zip");
            }

            return poids;
        }

            public static string RunProcessTronquer(string texte)
        {
            // Create Process Info
            var psi = new ProcessStartInfo();
            psi.FileName = @"C:\Users\philb\AppData\Local\Microsoft\WindowsApps\python.exe";

            string fileName = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\";

            
                if (File.Exists(fileName + "texteatronquer" + ".txt"))
                {
                    File.Delete(fileName + "texteatronquer" + ".txt");
                }
                using (FileStream fileStr = File.Create(fileName + "texteatronquer" + ".txt"))
                {
                    // Ajouter du texte au fichier  
                    Byte[] text = new UTF8Encoding(true).GetBytes(texte);
                    fileStr.Write(text, 0, text.Length);
                }
            

            // Provide script and argument
            var script = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\tronqueur.py";

            //Process Configuration
            psi.UseShellExecute = false;
            psi.CreateNoWindow = false;
            psi.StandardOutputEncoding = System.Text.Encoding.Latin1;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;
            psi.Arguments = $"\"{script}\" ";            //Execute process and get output

            var errors = "";
            var results = "";

            using (var process = Process.Start(psi))
            {
                //errors = process.StandardError.ReadToEnd();
                results = process.StandardOutput.ReadToEnd();
            }
            if (File.Exists(fileName + "texteatronquer" + ".txt"))
            {
                File.Delete(fileName + "texteatronquer" + ".txt");
            }
            return results;
        }

        
public static void RunProcessWordCloud(string dictionnaire)
        {
            // Create Process Info
            var psi = new ProcessStartInfo();
            psi.FileName = @"C:\Users\philb\AppData\Local\Microsoft\WindowsApps\python.exe";
            string fileName = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\";

            // Provide script and argument
            var script = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\tester.py";

            if (File.Exists(fileName + "wordcloud" + ".txt"))
            {
                File.Delete(fileName + "wordcloud" + ".txt");
            }
            using (FileStream fileStr = File.Create(fileName + "wordcloud" + ".txt"))
            {
                // Ajouter du texte au fichier  
                Byte[] text = new UTF8Encoding(true).GetBytes(dictionnaire);
                fileStr.Write(text, 0, text.Length);
            }

            //Process Configuration
            psi.UseShellExecute = false;
            psi.CreateNoWindow = false;
            psi.StandardOutputEncoding = System.Text.Encoding.Latin1;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;
            psi.Arguments = $"\"{script}\" ";            //Execute process and get output

            var errors = "";
            var results = "";

            using (var process = Process.Start(psi))
            {
                errors = process.StandardError.ReadToEnd();

                results = process.StandardOutput.ReadToEnd();
            }
            using (var process = Process.Start(psi))
            {
                //errors = process.StandardError.ReadToEnd();
                results = process.StandardOutput.ReadToEnd();
            }
            if (File.Exists(fileName + "wordcloud" + ".txt"))
            {
                File.Delete(fileName + "wordcloud" + ".txt");
            }

        }
        public static string RunProcessLisibilite(string arg)
        {
            // Create Process Info
            var psi = new ProcessStartInfo();
            psi.FileName = @"C:\Users\philb\AppData\Local\Microsoft\WindowsApps\python.exe";

            // Provide script and argument
            var script = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\lisibilite.py";

            //Process Configuration
            psi.UseShellExecute = false;
            psi.CreateNoWindow = false;
            psi.StandardOutputEncoding = System.Text.Encoding.Latin1;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;
            psi.Arguments = $"\"{script}\" " + arg;            //Execute process and get output

            var errors = "";
            var results = "";

            using (var process = Process.Start(psi))
            {
                errors = process.StandardError.ReadToEnd();
                results = process.StandardOutput.ReadToEnd();
            }

            return results;
        }
        public static string RunProcessSimilarite(List<string> args)
        {
            // Create Process Info
            var psi = new ProcessStartInfo();
            psi.FileName = @"C:\Users\philb\AppData\Local\Microsoft\WindowsApps\python.exe";

            string fileName = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\";
            for( var x = 0; x < args.Count; x++)
            {
                if (File.Exists(fileName + x + ".txt"))
                {
                    File.Delete(fileName + x + ".txt");
                }
                using (FileStream fileStr = File.Create(fileName + x + ".txt"))
                {
                    // Ajouter du texte au fichier  
                    Byte[] text = new UTF8Encoding(true).GetBytes(args[x]);
                    fileStr.Write(text, 0, text.Length);
                }              
            }
        



        // Provide script and argument
        var script = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\similarite.py";

            //Process Configuration
            psi.UseShellExecute = false;
            psi.CreateNoWindow = false;
            psi.StandardOutputEncoding = System.Text.Encoding.Latin1;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;
            psi.Arguments = $"\"{script}\" "+ args.Count;
            

            psi.Arguments = psi.Arguments.RemoveControlCharacters();
            var errors = "";
            var results = "";

            using (var process = Process.Start(psi))
            {
                errors = process.StandardError.ReadToEnd();
                results = process.StandardOutput.ReadToEnd();
            }

            for (var x = 0; x < args.Count; x++)
            {
                if (File.Exists(fileName + x + ".txt"))
                {
                    File.Delete(fileName + x + ".txt");
                }
            }
                return results;
        }

        public static string RunProcessSimilariteMedias(List<string> args)
        {
            // Create Process Info
            var psi = new ProcessStartInfo();
            psi.FileName = @"C:\Users\philb\AppData\Local\Microsoft\WindowsApps\python.exe";

            string fileName = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\";
            for (var x = 0; x < args.Count; x++)
            {
                if (File.Exists(fileName + x + ".txt"))
                {
                    File.Delete(fileName + x + ".txt");
                }
                using (FileStream fileStr = File.Create(fileName + x + ".txt"))
                {
                    // Ajouter du texte au fichier  
                    Byte[] text = new UTF8Encoding(true).GetBytes(args[x]);
                    fileStr.Write(text, 0, text.Length);
                }
            }




            // Provide script and argument
            var script = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\similariteMedias.py";

            //Process Configuration
            psi.UseShellExecute = false;
            psi.CreateNoWindow = false;
            psi.StandardOutputEncoding = System.Text.Encoding.Latin1;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;
            psi.Arguments = $"\"{script}\" " + args.Count;


            psi.Arguments = psi.Arguments.RemoveControlCharacters();
            var errors = "";
            var results = "";

            using (var process = Process.Start(psi))
            {
                errors = process.StandardError.ReadToEnd();
                results = process.StandardOutput.ReadToEnd();
            }

            for (var x = 0; x < args.Count; x++)
            {
                if (File.Exists(fileName + x + ".txt"))
                {
                    File.Delete(fileName + x + ".txt");
                }
            }
            return results;
        }

        public static string RunProcessWCPython(List<string> textes)
        {
            // Create Process Info
            var psi = new ProcessStartInfo();
            psi.FileName = @"C:\Users\philb\AppData\Local\Microsoft\WindowsApps\python.exe";

            string fileName = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\";
            for (var x = 0; x < textes.Count; x++)
            {
                if (File.Exists(fileName + x + ".txt"))
                {
                    File.Delete(fileName + x + ".txt");
                }
                using (FileStream fileStr = File.Create(fileName + x + ".txt"))
                {
                    // Ajouter du texte au fichier  
                    Byte[] text = new UTF8Encoding(true).GetBytes(textes[x]);
                    fileStr.Write(text, 0, text.Length);
                }
            }




            // Provide script and argument
            var script = @"C:\Users\philb\OneDrive\Projet Final\Repository\Elections\WCPython.py";

            //Process Configuration
            psi.UseShellExecute = false;
            psi.CreateNoWindow = false;
            psi.StandardOutputEncoding = System.Text.Encoding.Latin1;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;
            psi.Arguments = $"\"{script}\" ";


            psi.Arguments = psi.Arguments.RemoveControlCharacters();
            var errors = "";
            var results = "";

            using (var process = Process.Start(psi))
            {
                errors = process.StandardError.ReadToEnd();
                results = process.StandardOutput.ReadToEnd();
            }

            for (var x = 0; x < textes.Count; x++)
            {
                if (File.Exists(fileName + x + ".txt"))
                {
                    File.Delete(fileName + x + ".txt");
                }
            }
            return results;
        }
    }
}
