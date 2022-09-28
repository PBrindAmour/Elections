using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.DAL.Models;
using ElectionsAPI.Engine.Interfaces;
using System.Collections.Generic;

/* L'engine de recherche fait la communication entre le controller de recherche et le store qui permet la connexion à la base de données.*/

namespace ElectionsAPI.Engine
{
    public class RechercheEngine : IRechercheEngine
    {
        private readonly IRechercheStore _store;
        public RechercheEngine(IRechercheStore store)
        {
            _store = store;
        }
        public async Task<List<InfoCandidat>> GetInfoCandidats() //L'engine appelle seulement le store sans rien ajouter pour cette méthode.
        {
            return await _store.GetInfoCandidats();
        }

        public async Task<List<InfoGenre>> GetInfoGenre()  //Méthode qui recherche les statistiques de genre des partis. On retourne sous forme de liste les informations.
        {
            var results = new List<InfoGenre>();
            var partis = await _store.GetPartis();
            var partiIds = partis.Select(p => p.PartiId);
            foreach (var id in partiIds)// Pour chaque parti
            {
                var partiResult = await _store.GetInfoGenre(id); //Informations du parti pour les calculs ici-bas.
                partiResult.PourcentageFemme = (int)GetPourcentage(partiResult.TotalFemmes, partiResult.TotalHommes);
                partiResult.PourcentageHomme = (int)GetPourcentage(partiResult.TotalHommes, partiResult.TotalFemmes);
                partiResult.PourcentagePublicationFemme = (int)GetPourcentage(partiResult.TotalPublicationFemme, partiResult.TotalPublicationHomme);
                partiResult.PourcentagePublicationHomme = (int)GetPourcentage(partiResult.TotalPublicationHomme, partiResult.TotalPublicationFemme);

                results.Add(partiResult); //Ajoute les résultats à la liste results.
            }

            return results; // Retourne une liste qui contient les informations et les statistiques de chaque parti.
        }

        public async Task<List<ListePublicationsCandidat>> GetListePublicationsCandidat(short personneId) //Méthode qui recherche les publications par le ID d'une personne.
        {
            return await _store.GetListePublicationCandidat(personneId);
        }

        public async Task<List<Candidats>> GetCandidats(string? prenom, string? nom, string? parti, string? circonscription, string? region, char? genre) //Méthode qui renvoi une liste de candidats
        {
            return await _store.GetCandidats(prenom, nom, parti, circonscription, region, genre);
        }
        public async Task<List<InfoPublication>> GetInfoPublications(string mot) //Méthode qui recherche l'occurence d'un mot dans la base de données.
        {
            var results = new List<InfoPublication>();
            var partis = await _store.GetPartis();
            var partiIds = partis.Select(x => x.PartiId);
            foreach(var id in partiIds) //Pour chaque parti.
            {
                
                var medias = await _store.GetMedias();
                var mediaIds = medias.Select(medias => medias.MediaId);
                foreach(var mediaId in mediaIds) //Pour chaque médias.
                {
                    var partiPublication = await _store.GetInfoPublications(id,mediaId,mot);
                    if(partiPublication.NombreTotal != 0) //Si le média ne contient aucune fois le mot on laisse faire.
                    {
                        results.Add(partiPublication);
                    }
                }
            }

            return results; //Retourne une liste de parti et pour chacun, une liste de média ou l'on décrit le nombre d'occurence d'un mot.
        }


        public async Task<Dictionary<string,Dictionary<short, double>>> GetTfIdf(List<short> partiId, List<short> mediaId)
        {
            var dictionnairesParti = new List<Tuple<short, Dictionary<string, int>>>();
            var dictionnaire = new Dictionary<string,int>();
            foreach(var parti in partiId)
            {          
                var texts = await GetTextes(parti, mediaId);
                dictionnaire = await GetDictionnaire(texts);
                var motsTotal = 0;
                foreach(var mot in dictionnaire)
                {
                    motsTotal = motsTotal + mot.Value;
                }
                dictionnaire.Add("MotsTotal", motsTotal);
                var dicparti = new Tuple<short, Dictionary<string, int>>(parti, dictionnaire);
                dictionnairesParti.Add(dicparti);
            }

            var result = CalculDictionnaire(dictionnairesParti, partiId);

            return result;

        }

        private async Task<List<string>> GetTextes(short partiId, List<short> mediaId)
        {
            var texts = await _store.GetPublicationTexte(partiId, mediaId);
            return texts;
        }

        private async Task<Dictionary<string,int>> GetDictionnaire(List<string> texts)
        {
            var dictionnaire = new Dictionary<string, int>();
            foreach (var text in texts)
            {
                var newtext = text.Trim().ToLower();
                var mots = newtext.Split(new char[] { ' ', '\n', '.' });
                foreach (var mot in mots)
                {
                    int value;
                    if (!dictionnaire.TryGetValue(mot, out value))
                        dictionnaire.Add(mot, 1);
                    else
                        dictionnaire[mot] = value + 1;
                }
            }
            return dictionnaire;
        }

        private decimal GetPourcentage(int a, int b) //Méthode simple pour le calcul d'un pourcentage de deux variables qui forment un tout.
        {
         
            if(a + b == 0)
            {
                return 0;
            }
            decimal pourcentage = ((decimal)a/(a+b)*100);
            return pourcentage;
        }

        private Dictionary<string, Dictionary<short, double>> CalculDictionnaire(List<Tuple<short, Dictionary<string, int>>> dictionnaires, List<short> partiId)
        {
            var resultat = new Dictionary<string,Dictionary<short, double>>();
            var motsTotal = new Dictionary<short, double>();
            motsTotal.Add(0, 0);
            resultat.Add("MotsTotal", motsTotal);
            foreach(var dictionnaire in dictionnaires)
            {
                foreach(KeyValuePair<string, int> mot in dictionnaire.Item2)
                {
                    if(!resultat.ContainsKey(mot.Key))
                    {
                        var valeurs = GetValeursDictionnaires(mot.Key,partiId, dictionnaires);
                        resultat.Add(mot.Key, valeurs);
                        
                    }
                }
            }
            return resultat;
        }

        private Dictionary<short,double> GetValeursDictionnaires(string mot, List<short> partiId, List<Tuple<short, Dictionary<string, int>>> dictionnaires)
        {
            var valeurDictionnaires = new Dictionary<short, double>();
            var results = new Dictionary<short, double>();
            for(int i = 0; i < dictionnaires.Count; i++)
            {
                if (dictionnaires[i].Item2.ContainsKey(mot))
                {
                    //C'est ici qu'on calcul directement le TF et on l'envoi à la méthode suivante pour le Tf-Idf
                    var test1 = (double)(dictionnaires[i].Item2[mot]);
                    var test2 = (double)(dictionnaires[i].Item2["MotsTotal"]);
                    var tf = (test1 / test2);
                    valeurDictionnaires.Add(dictionnaires[i].Item1, tf);
                }
                else
                {
                    //Si le mot ne se retrouve pas dans le dictionnaire on lui donne la valeur de 0
                    valeurDictionnaires.Add(dictionnaires[i].Item1, 0);
                }
            }
            results = CalculTfIdf(valeurDictionnaires);
            return results;
        }

       /* private Dictionary<short, double> CalculTF(Dictionary<short, int> valeurDictionnaire)
        {
            Dictionary<short, double> resultat = new Dictionary<short, double>();
            foreach (KeyValuePair<short, int> parti in valeurDictionnaire)
            {
                if (parti.Value > 0)
                {
                    compteurDocuments++;
                }
            }

        }*/

        private Dictionary<short, double> CalculTfIdf(Dictionary<short, double> valeurDictionnaire)
        {
            Dictionary<short, double> resultat = new Dictionary<short, double>();
            int compteurDocuments = 0;
            foreach(KeyValuePair<short, double> parti in valeurDictionnaire)
            {
                if (parti.Value > 0)
                {
                    compteurDocuments++;
                }
            }
            var IDF = Math.Log((double)(valeurDictionnaire.Count)/((double)compteurDocuments));

            foreach (KeyValuePair<short, double> parti in valeurDictionnaire)
            {
                var calcul = (double)IDF * parti.Value;
                resultat.Add(parti.Key, calcul);
            }
            return resultat;

        }
    }
}
