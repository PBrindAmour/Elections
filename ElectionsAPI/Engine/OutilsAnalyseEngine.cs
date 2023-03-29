using ElectionsAPI.Controllers.Models;
using ElectionsAPI.DAL.Interfaces;
using ElectionsAPI.DAL.Models;
using ElectionsAPI.Engine.Interfaces;

namespace ElectionsAPI.Engine
{
    public class OutilsAnalyseEngine : IOutilsAnalyseEngine
    {
        public class ClassificationModele
        {
            public short PartiId { get; set; }
            public int BonnePrediction { get; set; }
            public int NbPublication { get; set; }
        }
        private readonly IOutilsAnalyseStore _store;

        public OutilsAnalyseEngine(IOutilsAnalyseStore store)
        {
            _store = store;
        }
        public async Task GetTfIdfScriptNettoye(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var textesparti = new List<string>();
            var partiId = partis.Select(x => x.PartiId).ToList();
            foreach (var parti in partiId)
            {
                var textsAdd = "";
                foreach (var media in mediaId)
                {
                    var texts = await _store.GetPublicationTexteNettoye(parti, mediaId, dateDebut, dateFin);

                    foreach (var text in texts)
                    {
                        textsAdd += text + " ";
                    }
                }
                textesparti.Add(textsAdd);
            }
            var resultat = Helper.RunProcessWCPython(textesparti);
        }

        public async Task GetTfIdfScriptTronque(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var dictionnairesParti = new List<Tuple<short, Dictionary<string, int>>>();
            var partis = await _store.GetPartis();
            var textesparti = new List<string>();
            var partiId = partis.Select(x => x.PartiId).ToList();
            foreach (var parti in partiId)
            {
                var textsAdd = "";
                foreach (var media in mediaId)
                {
                    var texts = await _store.GetPublicationTexteTronque(parti, mediaId, dateDebut, dateFin);


                    foreach (var text in texts)
                    {
                        textsAdd += text + " ";
                    }
                }
                textesparti.Add(textsAdd);
            }
            var resultat = Helper.RunProcessWCPython(textesparti);
        }

        public async Task SaveTfIdf(short mediaId)
        {
            var dictionnairesParti = new List<Tuple<short, Dictionary<string, int>>>();
            var partis = await _store.GetPartis();
            var medias = new List<short>();
            var datedebut = new DateTime(2022, 4, 1);
            var datefin = new DateTime(2022, 10, 3);
            if (mediaId == 6 || mediaId == 7 || mediaId == 8)
            {
                medias.Add(6);
                medias.Add(7);
                medias.Add(8);
                mediaId = 4; // Ici on utilise le 4 comme canal pour analyser les trois émissions comme un seul média
            }
            else
            {
                medias.Add(mediaId);
            }
            foreach (var parti in partis)
            {
                var texts = await _store.GetPublicationTexteTronque(parti.PartiId, medias, datedebut, datefin);
                var dictionnaire = await GetDictionnaire(texts);
                var motsTotal = 0;
                foreach (var mot in dictionnaire)
                {
                    motsTotal += mot.Value;
                }
                dictionnaire.Add("MotsTotal", motsTotal);
                var dicparti = new Tuple<short, Dictionary<string, int>>(parti.PartiId, dictionnaire);
                dictionnairesParti.Add(dicparti);
            }
            var result = CalculDictionnaireNormalise(dictionnairesParti);
            var sortedDict = from entry in result orderby entry.Value.First() ascending select entry;

            var nbMots = 0;
            if (mediaId == 1)
            {
                nbMots = 750;
            }
            if (mediaId == 2)
            {
                nbMots = 1500;
            }
            if (mediaId == 6 || mediaId == 7 || mediaId == 8 || mediaId == 4)
            {
                nbMots = 350;
            }

            await _store.InsertTfidf(partis, mediaId, nbMots, result);

            return;

        }
        public async Task TfidfEqualizer()
        {
            var TfIdfs = await _store.GetTfidfs();
            var partis = await _store.GetPartis();
            var medias = new List<short>() { 1, 2, 4 };
            foreach (var parti in partis)
            {
                var TfidfsParti = TfIdfs.Where(x => x.PartiId == parti.PartiId).ToList();
                foreach (var media in medias)
                {
                    var tfidfMediaParti = TfidfsParti.Where(y => y.MediaId == media);
                    var total = 0.0;
                    foreach (var tfidf in tfidfMediaParti)
                    {
                        total += tfidf.Valeur.Value;
                    }
                    var multiplicateur = (0.1/(total / tfidfMediaParti.Count()));
                    foreach (var tfidf in tfidfMediaParti)
                    {
                        tfidf.Valeur *=  multiplicateur;
                    }
                }
            }
            await SaveChanges();
        }

        public async Task TfidfEqualizerMedia()
        {
            var TfIdfs = await _store.GetTfidfs();
            var medias = new List<short>() { 1, 2, 4 };



                foreach (var media in medias)
                {
                    var TfidfsParti = TfIdfs.Where(x => x.MediaId == media).ToList();
                    var total = 0.0;
                    foreach (var tfidf in TfidfsParti)
                    {
                        total += tfidf.Valeur.Value;
                    }
                    var multiplicateur = (0.1 / (total / TfidfsParti.Count()));
                    foreach (var tfidf in TfidfsParti)
                    {
                        tfidf.Valeur *= multiplicateur;
                    }
                }
            await SaveChanges();
        }

        public async Task<Dictionary<string, Dictionary<short, double>>> GetTfIdfNormalise(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var dictionnairesParti = new List<Tuple<short, Dictionary<string, int>>>();
            var partis = await _store.GetPartis();

            foreach (var parti in partis)
            {
                var texts = await _store.GetPublicationTexteTronque(parti.PartiId, mediaId, dateDebut, dateFin);
                var dictionnaire = await GetDictionnaire(texts);
                var motsTotal = 0;
                foreach (var mot in dictionnaire)
                {
                    motsTotal += mot.Value;
                }
                dictionnaire.Add("MotsTotal", motsTotal);
                var dicparti = new Tuple<short, Dictionary<string, int>>(parti.PartiId, dictionnaire);
                dictionnairesParti.Add(dicparti);
            }
            var result = CalculDictionnaireNormalise(dictionnairesParti);
            foreach (var parti in partis)
            {
                PrintTop(parti.PartiId, 100, result);
            }
            return result;
        }

        private async Task<Dictionary<string, int>> GetDictionnaire(List<string> texts)
        {
            var dictionnaire = new Dictionary<string, int>();
            foreach (var text in texts)
            {
                if (text == null || text.Length < 5)
                {
                    continue;
                }
                var texte = text.Trim().ToLower();
                texte = texte.Replace(".", ""); // On retire les . et les , à la fin des mots
                texte = texte.Replace(",", "");
                texte = texte.Replace("!", "");
                texte = texte.Replace("?", "");
                texte = texte.Replace("-", " ");

                var mots = texte.Split(new char[] { ' ', '\n' });
                foreach (var mot in mots)
                {

                    if (mot.Length < 5) // Aucun mot de moins de 3 lettres n'est révélateur
                    {
                        continue;
                    }

                    // On retire les mots qui ne contiennent pas que des lettres ou que des chiffres
                    if (mot.Contains("-") || mot.Contains("'"))
                    {
                        var sousMots = mot.Split(new char[] { '-', '\'' });
                        foreach (var sousMot in sousMots)
                        {
                            if (!sousMot.All(char.IsDigit))
                            {
                                continue;
                            }
                        }
                    }
                    else
                    {
                        if (!mot.All(char.IsLetter))
                        { continue; }

                    }

                    if (!dictionnaire.TryGetValue(mot, out int value))
                    {
                        dictionnaire.Add(mot, 1);
                    }
                    else
                    {
                        dictionnaire[mot] = value + 1;
                    }
                }
            }
            return dictionnaire;
        }

        private Dictionary<string, Dictionary<short, double>> CalculDictionnaire(List<Tuple<short, Dictionary<string, int>>> dictionnaires)
        {
            var resultat = new Dictionary<string, Dictionary<short, double>>();
            var motsTotal = new Dictionary<short, double> { { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 }, { 5, 0 } };
            resultat.Add("MotsTotal", motsTotal); // On ajoute le mot MotsTotal avec un dictionnaire nul afin de ne pas l'inclure dans notre analyse
            foreach (var dictionnaire in dictionnaires)
            {
                foreach (KeyValuePair<string, int> mot in dictionnaire.Item2)
                {
                    if (!resultat.ContainsKey(mot.Key))
                    {
                        var valeurs = GetValeursDictionnaires(mot.Key, dictionnaires);
                        resultat.Add(mot.Key, valeurs);

                    }
                }
            }
            return resultat;
        }

        private Dictionary<string, Dictionary<short, double>> CalculDictionnaireNormalise(List<Tuple<short, Dictionary<string, int>>> dictionnaires)
        {
            var resultat = new Dictionary<string, Dictionary<short, double>>();
            var motsTotal = new Dictionary<short, double> { { 1, 0 }, { 2, 0 }, { 3, 0 }, { 4, 0 }, { 5, 0 } };
            resultat.Add("MotsTotal", motsTotal); // On ajoute le mot MotsTotal avec un dictionnaire nul afin de ne pas l'inclure dans notre analyse
            foreach (var dictionnaire in dictionnaires)
            {
                foreach (KeyValuePair<string, int> mot in dictionnaire.Item2)
                {
                    if (!resultat.ContainsKey(mot.Key))
                    {
                        var valeurs = GetValeursDictionnairesNormalise(mot.Key, dictionnaires);
                        resultat.Add(mot.Key, valeurs);

                    }
                }
            }
            return resultat;
        }

        private Dictionary<short, double> GetValeursDictionnaires(string mot, List<Tuple<short, Dictionary<string, int>>> dictionnaires)
        {
            var valeurDictionnaires = new Dictionary<short, double>();
            for (int i = 0; i < dictionnaires.Count; i++)
            {
                if (dictionnaires[i].Item2.ContainsKey(mot))
                {
                    /* MÉTODHE 1 */
                    //C'est ici qu'on calcul directement le TF et on l'envoi à la méthode suivante pour le Tf-Idf
                    var nombreOccurenceMot = (double)(dictionnaires[i].Item2[mot]);
                    var motsTotal = (double)(dictionnaires[i].Item2["MotsTotal"]);
                    var tf = Math.Log2(nombreOccurenceMot + 1) / Math.Log2(motsTotal);
                    valeurDictionnaires.Add(dictionnaires[i].Item1, tf);
                }
                else
                {
                    //Si le mot ne se retrouve pas dans le dictionnaire on lui donne la valeur de 0
                    valeurDictionnaires.Add(dictionnaires[i].Item1, 0);
                }
            }
            var results = CalculTfIdf(valeurDictionnaires);
            var resultss = from entry in results orderby entry.Value descending select entry;
            return results;
        }
        private Dictionary<short, double> GetValeursDictionnairesNormalise(string mot, List<Tuple<short, Dictionary<string, int>>> dictionnaires)
        {
            var valeurDictionnaires = new Dictionary<short, double>();
            for (int i = 0; i < dictionnaires.Count; i++)
            {
                if (dictionnaires[i].Item2.ContainsKey(mot))
                {
                    /* MÉTHODE 2 */
                    var nombreOccurenceMot = (double)(dictionnaires[i].Item2[mot]);
                    var motsTotal = (double)(dictionnaires[i].Item2["MotsTotal"]);
                    var tf = Math.Log2(nombreOccurenceMot + 1) / Math.Log2(motsTotal);
                    valeurDictionnaires.Add(dictionnaires[i].Item1, tf);
                }
                else
                {
                    //Si le mot ne se retrouve pas dans le dictionnaire on lui donne la valeur de 0
                    valeurDictionnaires.Add(dictionnaires[i].Item1, 0);
                }
            }
            var results = CalculTfIdfNormalise(valeurDictionnaires);
            var resultss = from entry in results orderby entry.Value descending select entry;
            return results;
        }

        private Dictionary<short, double> CalculTfIdf(Dictionary<short, double> valeurDictionnaire)
        {
            Dictionary<short, double> resultat = new Dictionary<short, double>();
            int compteurDocuments = 0;
            foreach (KeyValuePair<short, double> parti in valeurDictionnaire)
            {
                if (parti.Value > 0) // Si on a une fois le mot dans le dictionnaire du parti
                {
                    compteurDocuments++;
                }
            }
            var IDF = Math.Log10((double)(valeurDictionnaire.Count) / ((double)compteurDocuments)); //Méthode 1

            foreach (KeyValuePair<short, double> parti in valeurDictionnaire)
            {
                var calcul = (double)IDF * parti.Value;
                resultat.Add(parti.Key, calcul);
            }
            return resultat;

        }

        private Dictionary<short, double> CalculTfIdfNormalise(Dictionary<short, double> valeurDictionnaire)
        {
            Dictionary<short, double> resultat = new Dictionary<short, double>();
            int compteurDocuments = 0;
            foreach (KeyValuePair<short, double> parti in valeurDictionnaire)
            {
                if (parti.Value > 0) // Si on a une fois le mot dans le dictionnaire du parti
                {
                    compteurDocuments++;
                }
            }
            var IDF = Math.Log10(((double)(valeurDictionnaire.Count) / ((double)compteurDocuments)) + 1); //Méthode 2

            foreach (KeyValuePair<short, double> parti in valeurDictionnaire)
            {
                var calcul = (double)IDF * parti.Value;
                resultat.Add(parti.Key, calcul);
            }
            return resultat;

        }

        private void PrintTop(short partiid, int valeurTop, Dictionary<string, Dictionary<short, double>> dictionnaire)
        {
            var reponse = new Dictionary<string, double>();
            foreach (var dic in dictionnaire)
            {
                reponse.Add(dic.Key, dic.Value[partiid]);
            }
            var sortedDict = from entry in reponse orderby entry.Value descending select entry;
            var compteur = 0;
            var resultat = new Dictionary<string, double>();
            var valeurs = "[";
            var mots = "[";
            Console.WriteLine("Parti # " + partiid);
            foreach (var valeur in sortedDict)
            {
                if (compteur == valeurTop)
                { break; }
                Console.WriteLine(valeur.Key + " : " + valeur.Value);
                compteur++;
                resultat.Add(valeur.Key, valeur.Value);
                if (compteur == valeurTop)
                {
                    valeurs += valeur.Value + "]";
                    mots += "'" + valeur.Key + "']";
                }
                else
                {
                    valeurs += valeur.Value + ",";
                    mots += "'" + valeur.Key + "',";
                }

            }
            Console.WriteLine(" ");
            //ShowTagCloud(resultat);
            //Helper.RunProcessWordcloud(valeurs, mots);
        }
        async public Task TestLisibilite(short mediaId)
        {
            bool chefOnly = mediaId == 2;
            var publications = await _store.GetPublications(mediaId, DateTime.MinValue, DateTime.Now, chefOnly);
            var listeTest = await _store.GetListeTestLisibilite();
            var existingPublicationId = listeTest.Select(x => x.PublicationId).ToList();
            bool nettoye = false;
            bool tronque = false;

            foreach (var publication in publications)
            {
                if (existingPublicationId.Contains(publication.PublicationId)) //On ne fait le test que pour les publications qui n'ont pas de résultat
                {
                    continue;
                }
                var text = publication.Texte; tronque = false; nettoye = false; //Texte régulier
                if (text == "")
                {
                    await _store.SetResultatTest(publication.PublicationId, 0, 0, 0, nettoye, tronque);
                }
                var resultat = Helper.RunProcessLisibilite(text);
                resultat = resultat.Replace("\r\n", " ");
                var valeurs = resultat.Split(new[] { ' ' });
                var resultatFinalUn = double.Parse(valeurs[0]);
                var resultatFinalDeux = double.Parse(valeurs[1]);
                var resultatFinalTrois = double.Parse(valeurs[2]);
                await _store.SetResultatTest(publication.PublicationId, resultatFinalUn, resultatFinalDeux, resultatFinalTrois, nettoye, tronque);

                text = publication.TexteNettoye; nettoye = true; tronque = false; //TexteNettoye
                if (text == "")
                {
                    await _store.SetResultatTest(publication.PublicationId, 0, 0, 0, true, false);
                    await _store.SetResultatTest(publication.PublicationId, 0, 0, 0, true, true);
                    continue;
                }
                resultat = Helper.RunProcessLisibilite(text);
                resultat = resultat.Replace("\r\n", " ");
                valeurs = resultat.Split(new[] { ' ' });
                resultatFinalUn = double.Parse(valeurs[0]);
                resultatFinalDeux = double.Parse(valeurs[1]);
                resultatFinalTrois = double.Parse(valeurs[2]);
                await _store.SetResultatTest(publication.PublicationId, resultatFinalUn, resultatFinalDeux, resultatFinalTrois, nettoye, tronque);

                text = publication.TexteTronquer; tronque = true; //TexteTronque
                if (text == "")
                {
                    await _store.SetResultatTest(publication.PublicationId, 0, 0, 0, true, tronque);
                }
                resultat = Helper.RunProcessLisibilite(text);
                resultat = resultat.Replace("\r\n", " ");
                valeurs = resultat.Split(new[] { ' ' });
                resultatFinalUn = double.Parse(valeurs[0]);
                resultatFinalDeux = double.Parse(valeurs[1]);
                resultatFinalTrois = double.Parse(valeurs[2]);
                await _store.SetResultatTest(publication.PublicationId, resultatFinalUn, resultatFinalDeux, resultatFinalTrois, nettoye, tronque);
            }
        }

        public async Task<List<InfoLisibilite>> GetInfoLisibilite(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var reponse = new List<InfoLisibilite>();
            foreach (var parti in partis)
            {
                var publications = await _store.GetPublicationsId(parti.PartiId, mediaId, dateDebut, dateFin);
                var resultatstests = await _store.GetResultatTest(publications);
                for (short i = 1; i <= 3; i++)
                {
                    var lisibilite = new InfoLisibilite { PartiId = parti.PartiId, TestId = 1, Valeur = 0 };
                    var resultat = resultatstests.Where(y => y.TestId == i && y.Valeur > 0).Select(x => x.Valeur).ToList();
                    double? moyenne = resultat.Average() ?? 0;
                    lisibilite.TestId = i;
                    lisibilite.Valeur = moyenne.Value;
                    reponse.Add(lisibilite);
                }
            }
            return reponse;

        }
        public async Task<List<InfoCompressibilite>> GetInfoCompressibilite(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var reponse = new List<InfoCompressibilite>();
            foreach (var parti in partis)
            {
                var publications = await _store.GetPublicationsId(parti.PartiId, mediaId, dateDebut, dateFin);
                var resultatsTest = await _store.GetResultatTestCompressibilite(publications);
                var resultat = resultatsTest.Where(y => y.TextId == 2 && y.Valeur > 0).Select(x => x.Valeur).ToList();
                var compressibilite = new InfoCompressibilite { PartiId = parti.PartiId };
                double? moyenne = resultat.Average() ?? 0;
                compressibilite.Valeur = moyenne.Value;
                reponse.Add(compressibilite);
            }
            return reponse;

        }

        public async Task<List<InfoCompressibilite>> GetInfoCompressibiliteTotal(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var reponse = new List<InfoCompressibilite>();
            foreach (var parti in partis)
            {
                var textes = await _store.GetPublicationTexteNettoye(parti.PartiId, mediaId, dateDebut, dateFin);
                var textesTotal = "";
                foreach (var texte in textes)
                {
                    textesTotal += texte + " ";
                }
                var poids = Helper.RunProcessCompress(textesTotal);
                var dictionnaire = new List<string>();
                textesTotal.Replace(".", "");
                textesTotal.Replace(",", "");
                var motsComplet = textesTotal.Split(' ');
                foreach (var mot in motsComplet)
                {
                    if (!dictionnaire.Contains(mot))
                    {
                        dictionnaire.Add(mot);
                    }
                }

                if (poids < 500)
                {
                    continue;
                }
                var nbChar = textesTotal.Length;
                double resultat = ((double)(poids) / (double)nbChar);
                var compressibilite = new InfoCompressibilite { PartiId = parti.PartiId, Valeur = resultat, nbMotsDifferent = dictionnaire.Count, nbMotsTotal = motsComplet.Length };
                reponse.Add(compressibilite);
            }
            return reponse;

        }


        public async Task<List<InfoLisibilite>> GetInfoLisibiliteNettoye(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var reponse = new List<InfoLisibilite>();
            foreach (var parti in partis)
            {
                var publications = await _store.GetPublicationsId(parti.PartiId, mediaId, dateDebut, dateFin);
                var resultatstests = await _store.GetResultatTest(publications);
                for (int i = 4; i <= 6; i++)
                {
                    var lisibilite = new InfoLisibilite { PartiId = parti.PartiId, TestId = 1, Valeur = 0 };
                    var resultat = resultatstests.Where(y => y.TestId == i && y.Valeur > 0).Select(x => x.Valeur).ToList();
                    double? moyenne = resultat.Average() ?? 0;
                    lisibilite.TestId = i;
                    lisibilite.Valeur = moyenne.Value;
                    reponse.Add(lisibilite);
                }

            }
            return reponse;

        }

        public async Task<List<InfoLisibilite>> GetInfoLisibiliteTronque(short mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var reponse = new List<InfoLisibilite>();

            foreach (var parti in partis)
            {
                var publications = await _store.GetPublicationsId(parti.PartiId, mediaId, dateDebut, dateFin);
                var resultatstests = await _store.GetResultatTest(publications);
                for (int i = 7; i <= 9; i++)
                {
                    var lisibilite = new InfoLisibilite { PartiId = parti.PartiId, TestId = 1, Valeur = 0 };
                    var resultat = resultatstests.Where(y => y.TestId == i && y.Valeur > 0).Select(x => x.Valeur).ToList();
                    double? moyenne = resultat.Average() ?? 0;
                    lisibilite.TestId = i;
                    lisibilite.Valeur = moyenne.Value;
                    reponse.Add(lisibilite);
                }

            }
            return reponse;

        }

        async public Task TestCompressibilite(short mediaId)
        {
            bool chefOnly = mediaId == 2;
            var publications = await _store.GetPublications(mediaId, DateTime.MinValue, DateTime.Now, chefOnly);
            var listeTest = await _store.GetListeTestCompressibilite();
            var existingPublicationId = listeTest.Select(x => x.PublicationId).ToList();

            foreach (var publication in publications)
            {
                if (existingPublicationId.Contains(publication.PublicationId) || publication.Texte == null || publication.Texte == "") //On ne fait le test que pour les publications qui n'ont pas de résultat
                {
                    continue;
                }
                var text = publication.Texte;
                var poids = Helper.RunProcessCompress(text);
                if (poids < 500)
                {
                    continue;
                }
                var nbChar = text.Length;
                double resultat = ((double)nbChar / (double)(poids));
                text = publication.TexteNettoye;
                poids = Helper.RunProcessCompress(text);
                if (poids < 500)
                {
                    continue;
                }
                nbChar = text.Length;
                double resultatNet = ((double)nbChar / (double)(poids));
                text = publication.TexteTronquer;
                poids = Helper.RunProcessCompress(text);
                if (poids < 500)
                {
                    continue;
                }
                nbChar = text.Length;
                double resultatTronq = ((double)nbChar / (double)(poids));
                await _store.SetResultatTestCompress(publication.PublicationId, resultat, resultatNet, resultatTronq);

            }
        }

        public async Task<string> MesureSimilarite(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var textesparti = new List<string>();
            foreach (var parti in partis)
            {
                var partiId = parti.PartiId;
                var texts = await _store.GetPublicationTexte(partiId, mediaId, dateDebut, dateFin);
                var textsadd = "";

                foreach (var text in texts)
                {
                    textsadd += text + " ";

                }
                textesparti.Add(textsadd);
            }
            var resultat = Helper.RunProcessSimilarite(textesparti);
            Console.WriteLine(resultat);
            return resultat;

        }

        public async Task<string> MesureSimilariteNettoye(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var textesparti = new List<string>();
            foreach (var parti in partis)
            {
                var partiId = parti.PartiId;
                var texts = await _store.GetPublicationTexteNettoye(partiId, mediaId, dateDebut, dateFin);
                var textsadd = "";

                foreach (var text in texts)
                {
                    textsadd += text + " ";

                }
                textesparti.Add(textsadd);
            }
            var resultat = Helper.RunProcessSimilarite(textesparti);
            Console.WriteLine(resultat);
            return resultat;


        }

        public async Task<string> MesureSimilariteTronque(List<short> mediaId, DateTime dateDebut, DateTime dateFin)
        {
            var partis = await _store.GetPartis();
            var textesparti = new List<string>();
            foreach (var parti in partis)
            {
                var partiId = parti.PartiId;
                var texts = await _store.GetPublicationTexteTronque(partiId, mediaId, dateDebut, dateFin);
                var textsadd = "";

                foreach (var text in texts)
                {
                    textsadd += text + " ";

                }
                textesparti.Add(textsadd);
                if (!texts.Any())
                {
                    texts.Add(" ");
                }
            }
            var resultat = Helper.RunProcessSimilarite(textesparti);
            Console.WriteLine(resultat);
            return resultat;

        }

        public async Task<string> MesureSimilariteMedias(short partiId, DateTime dateDebut, DateTime dateFin)
        {
            var medias = await _store.GetMedias();
            var textesMedia = new List<string>();
            foreach (var media in medias)
            {
                if(media.MediaId != 1 && media.MediaId != 2 && media.MediaId != 4)
                {
                    continue;
                }
                var mediaId = new List<short>();
                mediaId.Add(media.MediaId);
                var texts = await _store.GetPublicationTexteTronque(partiId, mediaId, dateDebut, dateFin);
                var textsadd = "";

                foreach (var text in texts)
                {
                    textsadd += text + " ";

                }
                textesMedia.Add(textsadd);
                if (!texts.Any())
                {
                    texts.Add(" ");
                }
            }
            var resultat = Helper.RunProcessSimilariteMedias(textesMedia);
            Console.WriteLine(resultat);
            return resultat;

        }

        public async Task<string> PredicteurTexte(int publicationId)
        {
            var publication = await _store.GetPublication(publicationId);
            var tfidfs = await _store.GetTfidfs(publication.MediaId);
            var partis = await _store.GetPartis();
            var dicPartis = new Dictionary<short, Dictionary<string, double>>();
            var dicResultat = new Dictionary<short, double>();
            foreach (var parti in partis)
            {
                var tfidfsParti = tfidfs.Where(x => x.PartiId == parti.PartiId && x.MediaId == publication.MediaId);
                var tf = new Dictionary<string, double>();
                foreach (var tfidf in tfidfsParti)
                {
                    tf.Add(tfidf.Mot, tfidf.Valeur.Value);
                }
                dicPartis.Add(parti.PartiId, tf);
                dicResultat.Add(parti.PartiId, 0);
            }
            var texte = publication.TexteTronquer;
            texte = texte.Replace(".", "");
            texte = texte.Replace(",", "");
            texte = texte.Replace("!", "");
            texte = texte.Replace("?", "");
            texte = texte.Replace("-", " ");
            var mots = texte.Split(new char[] { ' ', '\n' });

            foreach (var mot in mots)
            {
                if (mot.Length < 5) { continue; }
                foreach (var parti in partis)
                {
                    if (dicPartis[parti.PartiId].TryGetValue(mot, out double valeure))
                    {
                        dicResultat[parti.PartiId] = dicResultat[parti.PartiId] + valeure;
                    }
                }

            }
            double bigger = 0;
            var partiWin = 0;
            foreach (var dic in dicResultat)
            {
                if (dic.Value > bigger)
                {
                    bigger = dic.Value;
                    partiWin = dic.Key;
                }
            }
            var dicRezTotal = dicResultat[1] + dicResultat[2] + dicResultat[3] + dicResultat[4] + dicResultat[5];
            var nomParti = partis.Where(x => x.PartiId == partiWin).Select(x => x.Nom).Single();
            var resultat = "Le parti le plus probable est : " + nomParti + " à " + Math.Round(((dicResultat[(short)partiWin] / dicRezTotal) * 100), 1) + " %.";
            return resultat;
        }

        public async Task<string> PredicteurTextesMedia(short mediaId)
        {
            bool chefOnly = mediaId == 2;
            var publications = await _store.GetPublications(mediaId, DateTime.MinValue, DateTime.Now, chefOnly);
            var partis = await _store.GetPartis();
            var dicPartis = new Dictionary<short, Dictionary<string, double>>();
            var nbPublications = 0;
            var bonResultat = 0;
            var ResultatZero = 0;
            var mauvaisResultats = new List<int>();
            var resultatPartis = new List<ClassificationModele>();
            if (mediaId == 6 || mediaId == 7 || mediaId == 8)
            {
                mediaId = 4;
            }


            var tfidfsPartis = await _store.GetTfidfs(mediaId);
            //var nouveauMots = new List<Tfidf>(); //Variable pour ajouter les mots lorsqu'aucun n'a été trouvé

            foreach (var parti in partis) // On va chercher les tf-idfs dans la base de données en dictionnaire on on l'insère sous le numéro du parti
            {
                var tfidfs = tfidfsPartis.Where(x => x.PartiId == parti.PartiId);
                var resultats = new Dictionary<string, double>();
                foreach (var tfidf in tfidfs)
                {
                    resultats.Add(tfidf.Mot, tfidf.Valeur.Value);
                }
                dicPartis.Add(parti.PartiId, resultats);
                var resultatClassificationParti = new ClassificationModele();
                resultatClassificationParti.PartiId = parti.PartiId;
                resultatPartis.Add(resultatClassificationParti);
            }

            foreach (var publication in publications) // On vérifie la totalité des publications
            {
                var texte = publication.TexteTronquer; // On prend le texte tronqué pour tenter de retrouver les mêmes mots (si le texte n'a pas été tronqué on doit le tronquer)
                if (texte == null || texte.Length < 50) //Si le texte est moins de 50 caractères on ne peut catégoriser correctement
                {
                    continue;
                }
                var dicResultat = new Dictionary<short, double>(); //On crée un dictionnaire de résultat avec la valeur 0 pour chaque parti
                foreach (var parti in partis)
                {
                    dicResultat.Add(parti.PartiId, 0);
                }

                nbPublications++; // On compte les publications qu'on vérifie et non les publications total

                texte = texte.ToLower();
                texte = texte.Replace(".", "");
                texte = texte.Replace(",", "");
                texte = texte.Replace("!", "");
                texte = texte.Replace("?", "");
                texte = texte.Replace("-", " ");

                var mots = texte.Split(new char[] { ' ', '\n' }); //On sépare le texte en mots par les retour de ligne et les espaces              
                foreach (var mot in mots)
                {
                    if (mot.Length < 5) { continue; } // On oublie les mots de 4 lettres et moins

                    {
                        if (!mot.All(char.IsLetter)) { continue; } // On oublie les mots qui ne sont pas constitué uniquement de lettres
                    }

                    foreach (var parti in partis)
                    {
                        // Si le mot se retrouve dans le dictionnaire du parti on ajoute sa valeur tf-idf au résultat du parti
                        if (dicPartis[parti.PartiId].TryGetValue(mot, out double valeur))
                        {
                            dicResultat[parti.PartiId] = dicResultat[parti.PartiId] + (valeur);
                        }
                    }
                }

                // Variables et méthode pour retrouver trouver le parti gagnant
                double bigger = 0;
                short partiWin = 0;
                foreach (var dic in dicResultat)
                {
                    if (dic.Value > bigger)
                    {
                        bigger = dic.Value;
                        partiWin = dic.Key;
                    }
                }
                // On vérifie si le gagnant est le bon
                var partiPublication = await _store.GetPartiPublication(publication.PublicationId);
                if (bigger < .75)
                {
                    Console.WriteLine("Publication hors sujet");
                    nbPublications--;
                }
                else if (partiWin == partiPublication)
                {
                    bonResultat++;
                    var classificationModele = resultatPartis.Where(x => x.PartiId == partiPublication).Single();
                    classificationModele.BonnePrediction++;
                    classificationModele.NbPublication++;
                }
                else
                {
                    mauvaisResultats.Add(publication.PublicationId);
                    Console.WriteLine("Mauvaise prédiction: publication # " + publication.PublicationId);
                    var classificationModele = resultatPartis.Where(x => x.PartiId == partiPublication).Single();
                    classificationModele.NbPublication++;
                }
            }
            var resultat = "";
            foreach (var modele in resultatPartis)
            {
                resultat += "Parti # " + modele.PartiId.ToString() + "   Bonne classification --> " + modele.BonnePrediction.ToString() + "/" + modele.NbPublication.ToString() + " = " + Math.Round((((double)(modele.BonnePrediction / (double)modele.NbPublication)) * 100), 1) + " % \n";
            }

            resultat += "\n Nombre de bonne prédiction : " + Math.Round((((double)(bonResultat / (double)nbPublications)) * 100), 1) + " %. \nNombre de publications avec aucun mot trouvé pour tous les partis: " + ResultatZero;

            //On ajoute tous les nouveaux mots d'un seul coup et on sauvegarde
            //_store.AddTfidf(nouveauMots);

            return resultat;
        }

        public async Task<string> PredicteurTextes(short mediaIdTfidf, short mediaIdPredire)
        {
            bool chefOnly = mediaIdPredire == 2;
            var publications = new List<Publication>();
            var datedebut = new DateTime(2022, 4, 1);
            var datefin = new DateTime(2022, 10, 3);
            if (mediaIdPredire == 6 || mediaIdPredire == 7 || mediaIdPredire == 8)
            {
                publications.AddRange(await _store.GetPublications(6, datedebut, datefin, chefOnly));
                publications.AddRange(await _store.GetPublications(7, datedebut, datefin, chefOnly));
                publications.AddRange(await _store.GetPublications(8, datedebut, datefin, chefOnly));

            }
            else
            {
                publications.AddRange(await _store.GetPublications(mediaIdPredire, datedebut, datefin, chefOnly));
            }
            var partis = await _store.GetPartis();
            if (mediaIdTfidf == 6 || mediaIdTfidf == 7 || mediaIdTfidf == 8)
            {
                mediaIdTfidf = 4;
            }
            var tfidfs = await _store.GetTfidfs(mediaIdTfidf);
            var dicPartis = new Dictionary<short, Dictionary<string, double>>();
            var dicResultatPartis = new Dictionary<short, double>();
            var resultatPartis = new List<ClassificationModele>();
           

            foreach (var parti in partis)
            {
                var tfidfsParti = tfidfs.Where(x => x.PartiId == parti.PartiId).ToList();
                var dictionnaireTfidf = new Dictionary<string, double>();
                foreach (var tfidfParti in tfidfsParti)
                {
                    dictionnaireTfidf.Add(tfidfParti.Mot, tfidfParti.Valeur.Value);
                }
                dicPartis.Add(parti.PartiId, dictionnaireTfidf);
                var resultatClassificationParti = new ClassificationModele();
                resultatClassificationParti.PartiId = parti.PartiId;
                resultatPartis.Add(resultatClassificationParti);
                dicResultatPartis.Add(parti.PartiId, 0);


            }
            var nbPublications = 0;
            var bonResultat = 0;
            var ResultatZero = 0;
            var horsSujet = 0;

            foreach (var publication in publications)
            {
                foreach(var parti in partis)
                {
                    dicResultatPartis[parti.PartiId] = 0;
                }
                var texte = publication.TexteTronquer;
                if (texte == null || texte.Length < 50) { continue; }  //Si le texte est moins de 20 caractères on ne peut catégoriser correctement
                texte = texte.ToLower();
                texte = texte.Replace(".", "");
                texte = texte.Replace(",", "");
                texte = texte.Replace("!", "");
                texte = texte.Replace("?", "");
                texte = texte.Replace("-", " ");
                nbPublications++; // On ajoute seulement les publications vérifiés pour le % de bonnes réponses

                var mots = texte.Split(new char[] { ' ', '\n' });


                foreach (var mot in mots)
                {
                    if (mot.Length < 5) { continue; }
                    foreach (var parti in partis)
                    {
                        if (dicPartis[parti.PartiId].TryGetValue(mot, out double valeur))
                        {
                            dicResultatPartis[parti.PartiId] = dicResultatPartis[parti.PartiId] + valeur;
                        }
                    }
                }


                double bigger = 0;
                var partiWin = 0;
                foreach (var parti in partis)
                {
                    if (dicResultatPartis[parti.PartiId] > bigger)
                    {
                        bigger = dicResultatPartis[parti.PartiId];
                        partiWin = parti.PartiId;
                    }
                }

                


                var partiPublication = await _store.GetPartiPublication(publication.PublicationId);

                if (bigger < 1.5)
                {
                    Console.WriteLine("Publication hors sujet");
                    nbPublications--;
                    horsSujet++;
                }
                else if (partiWin == partiPublication)
                {
                    bonResultat++;
                    var classificationModele = resultatPartis.Where(x => x.PartiId == partiPublication).Single();
                    classificationModele.BonnePrediction++;
                    classificationModele.NbPublication++;
                }             
                else
                {
                    Console.WriteLine("Mauvaise réponse");
                    var classificationModele = resultatPartis.Where(x => x.PartiId == partiPublication).Single();
                    classificationModele.NbPublication++;
                }
            }

            

                var resultat = "";
            foreach (var modele in resultatPartis)
            {
                resultat += "Parti # " + modele.PartiId.ToString() + "   Bonne classification --> " + modele.BonnePrediction.ToString() + "/" + modele.NbPublication.ToString() + " = " + Math.Round((((double)(modele.BonnePrediction / (double)modele.NbPublication)) * 100), 1) + " % \n";
            }

            resultat += "\n Nombre de bonne prédiction : " + Math.Round((((double)(bonResultat / (double)nbPublications)) * 100), 1) + " %. \nNombre de publications avec aucun mot trouvé pour tous les partis: " + ResultatZero;
            resultat += "\n\n Nombre de publications classés hors sujet = " + horsSujet;
            return resultat;
        }

        public async Task<string> PredicteurTextesApres(short mediaIdTfidf, short mediaIdPredire)
        {
            bool chefOnly = mediaIdPredire == 2;
            var publications = new List<Publication>();
            var datedebut = new DateTime(2022, 10, 4);
            var datefin = new DateTime(2022, 12, 31);
            if (mediaIdPredire == 6 || mediaIdPredire == 7 || mediaIdPredire == 8)
            {
                publications.AddRange(await _store.GetPublications(6, datedebut, datefin, chefOnly));
                publications.AddRange(await _store.GetPublications(7, datedebut, datefin, chefOnly));
                publications.AddRange(await _store.GetPublications(8, datedebut, datefin, chefOnly));

            }
            else
            {
                publications.AddRange(await _store.GetPublications(mediaIdPredire, datedebut, datefin, chefOnly));
            }
            var partis = await _store.GetPartis();
            if (mediaIdTfidf == 6 || mediaIdTfidf == 7 || mediaIdTfidf == 8)
            {
                mediaIdTfidf = 4;
            }
            var tfidfs = await _store.GetTfidfs(mediaIdTfidf);
            var dicPartis = new Dictionary<short, Dictionary<string, double>>();
            var dicResultatPartis = new Dictionary<short, double>();
            var resultatPartis = new List<ClassificationModele>();


            foreach (var parti in partis)
            {
                var tfidfsParti = tfidfs.Where(x => x.PartiId == parti.PartiId).ToList();
                var dictionnaireTfidf = new Dictionary<string, double>();
                foreach (var tfidfParti in tfidfsParti)
                {
                    dictionnaireTfidf.Add(tfidfParti.Mot, tfidfParti.Valeur.Value);
                }
                dicPartis.Add(parti.PartiId, dictionnaireTfidf);
                var resultatClassificationParti = new ClassificationModele();
                resultatClassificationParti.PartiId = parti.PartiId;
                resultatPartis.Add(resultatClassificationParti);
                dicResultatPartis.Add(parti.PartiId, 0);


            }
            var nbPublications = 0;
            var bonResultat = 0;
            var ResultatZero = 0;
            var horsSujet = 0;

            foreach (var publication in publications)
            {
                foreach (var parti in partis)
                {
                    dicResultatPartis[parti.PartiId] = 0;
                }
                var texte = publication.TexteTronquer;
                if (texte == null || texte.Length < 50) { continue; }  //Si le texte est moins de 20 caractères on ne peut catégoriser correctement
                texte = texte.ToLower();
                texte = texte.Replace(".", "");
                texte = texte.Replace(",", "");
                texte = texte.Replace("!", "");
                texte = texte.Replace("?", "");
                texte = texte.Replace("-", " ");
                nbPublications++; // On ajoute seulement les publications vérifiés pour le % de bonnes réponses

                var mots = texte.Split(new char[] { ' ', '\n' });


                foreach (var mot in mots)
                {
                    if (mot.Length < 5) { continue; }
                    foreach (var parti in partis)
                    {
                        if (dicPartis[parti.PartiId].TryGetValue(mot, out double valeur))
                        {
                            dicResultatPartis[parti.PartiId] = dicResultatPartis[parti.PartiId] + valeur;
                        }
                    }
                }


                double bigger = 0;
                var partiWin = 0;
                foreach (var parti in partis)
                {
                    if (dicResultatPartis[parti.PartiId] > bigger)
                    {
                        bigger = dicResultatPartis[parti.PartiId];
                        partiWin = parti.PartiId;
                    }
                }


                var partiPublication = await _store.GetPartiPublication(publication.PublicationId);

                if (bigger < 1.5)
                {
                    Console.WriteLine("Publication hors sujet");
                    nbPublications--;
                    horsSujet++;
                }
                else if (partiWin == partiPublication)
                {
                    bonResultat++;
                    var classificationModele = resultatPartis.Where(x => x.PartiId == partiPublication).Single();
                    classificationModele.BonnePrediction++;
                    classificationModele.NbPublication++;
                }
                else
                {
                    Console.WriteLine("Mauvaise réponse");
                    var classificationModele = resultatPartis.Where(x => x.PartiId == partiPublication).Single();
                    classificationModele.NbPublication++;
                }
            }

            var resultat = "";
            foreach (var modele in resultatPartis)
            {
                resultat += "Parti # " + modele.PartiId.ToString() + "   Bonne classification --> " + modele.BonnePrediction.ToString() + "/" + modele.NbPublication.ToString() + " = " + Math.Round((((double)(modele.BonnePrediction / (double)modele.NbPublication)) * 100), 1) + " % \n";
            }

            resultat += "\n Nombre de bonne prédiction : " + Math.Round((((double)(bonResultat / (double)nbPublications)) * 100), 1) + " %. \nNombre de publications avec aucun mot trouvé pour tous les partis: " + ResultatZero;
            resultat += "\n\n Nombre de publications classés hors sujet = " + horsSujet;
            return resultat;
        }

        public async Task<string> EntraineurPredicteur(short mediaId)
        {
            bool chefOnly = mediaId == 2;
            var publications = await _store.GetPublications(mediaId, DateTime.MinValue, DateTime.Now, chefOnly);
            var dicPartis = new Dictionary<short, Dictionary<string, double>>();
            var partis = await _store.GetPartis();
            var nbPublications = 0;
            var bonResultat = 0;
            var tfidfsPartis = await _store.GetTfidfs(mediaId);
            var nouveauMots = new List<Tfidf>();

            foreach (var parti in partis) // On va chercher les tf-idfs dans la base de données en dictionnaire on on l'insère sous le numéro du parti
            {
                var tfidfs = tfidfsPartis.Where(x => x.PartiId == parti.PartiId);
                var resultats = new Dictionary<string, double>();
                foreach (var tfidf in tfidfs)
                {
                    resultats.Add(tfidf.Mot, tfidf.Valeur.Value);
                }
                dicPartis.Add(parti.PartiId, resultats);
            }

            foreach (var publication in publications)
            {
                var texte = publication.TexteTronquer; // On prend le texte tronqué pour tenter de retrouver les mêmes mots (si le texte n'a pas été tronqué on doit le tronquer)
                if (texte == null || texte.Length < 20) //Si le texte est moins de 20 caractères on ne peut catégoriser correctement
                {
                    continue;
                }

                var dicResultat = new Dictionary<short, double>(); //On crée un dictionnaire de résultat avec la valeur 0 pour chaque parti
                foreach (var parti in partis)
                {
                    dicResultat.Add(parti.PartiId, 0);
                }
                nbPublications++; // On compte les publications qu'on vérifie et non les publications total

                texte = texte.ToLower().Trim();
                texte = texte.Replace(".", "");
                texte = texte.Replace(",", "");
                texte = texte.Replace("!", "");
                texte = texte.Replace("?", "");
                texte = texte.Replace("-", " ");
                var mots = texte.Split(new char[] { ' ', '\n' });


                foreach (var mot in mots)
                {
                    if (mot.Length < 5) { continue; }
                    foreach (var parti in partis)
                        // Si le mot se retrouve dans le dictionnaire du parti on ajoute sa valeur tf-idf au résultat du parti
                        if (dicPartis[parti.PartiId].TryGetValue(mot, out double valeur))
                        {
                            dicResultat[parti.PartiId] = dicResultat[parti.PartiId] + (valeur);
                        }
                }

                double bigger = 0;
                var partiWin = 0;
                var nombreZero = 0;
                foreach (var dic in dicResultat)
                {
                    if (dic.Value > bigger)
                    {
                        bigger = dic.Value;
                        partiWin = dic.Key;
                    }
                    if (dic.Value == 0)
                    {
                        nombreZero++;
                    }
                }

                var partiPublication = await _store.GetPartiPublication(publication.PublicationId);


                if (partiWin != partiPublication)
                {
                    Console.WriteLine("Mauvaise prédiction détecté. Modification des valeurs Tf-Idf et ajout de mots.");
                    nouveauMots = await Entraineur(dicPartis, texte, mediaId, partiPublication, (short)partiWin, tfidfsPartis, nouveauMots);
                }
                else { bonResultat++; }
            }


            var resultat = "Nombre de bonne prédiction : " + Math.Round((((double)(bonResultat / (double)nbPublications)) * 100), 1) + " %.";
            _store.AddTfidf(nouveauMots); // Ajout des nouveaux mots à la base de données
            if (nouveauMots != null)
            {
                return "Ajout de mots";
            }
            return resultat;
        }
        public async Task<List<Tfidf>> Entraineur(Dictionary<short, Dictionary<string, double>> dicPartis, string texte, short mediaId, short partiIdPerdant, short partiIdGagnant, List<Tfidf> tfidfsPartis, List<Tfidf> nouveauMots)
        {
            var nouveauTfidf = new Tfidf();
            var dicPerdant = dicPartis[partiIdPerdant];
            var mots = texte.Split(new char[] { ' ', '\n' });
            if (partiIdGagnant == 0) // Lorsque aucun parti n'a aucun mot retrouvé
            {
                foreach (var mot in mots) // On ajoute les mot avec une valeur minime
                {
                    var nouveauMot = new Tfidf();
                    nouveauMot.PartiId = partiIdPerdant;
                    nouveauMot.MediaId = mediaId;
                    nouveauMot.Mot = mot;
                    nouveauMot.Valeur = 0.000001;
                    nouveauTfidf = nouveauMots.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaId && x.Mot == mot).SingleOrDefault();
                    if (nouveauTfidf == null)
                    {
                        nouveauMots.Add(nouveauMot);
                    }
                }
                return nouveauMots;
            }
            var nbMotsPlus = 0;
            var dicGagnant = dicPartis[partiIdGagnant];
            foreach (var mot in mots)
            {

                if (dicGagnant.TryGetValue(mot, out double valeurGagnant))
                {
                    if (dicPerdant.TryGetValue(mot, out double valeurPerdant))
                    {
                        if (valeurGagnant > valeurPerdant)
                        {
                            double nouvelleValeur = valeurPerdant + ((valeurGagnant - valeurPerdant) / 10); // On réduit l'écart entre le mot perdant et le mot gagnant de 10%
                            nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaId && x.Mot == mot).Single();
                            nouveauTfidf.Valeur = (nouvelleValeur);
                            nouveauTfidf = null;

                        }

                        if (valeurGagnant <= valeurPerdant)
                        {
                            nbMotsPlus++;
                            double nouvelleValeur = valeurPerdant + ((valeurPerdant - valeurGagnant) / 100); // On augmente l'écart entre le mot perdant et le mot gagnant de 1%
                            nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaId && x.Mot == mot).Single();
                            nouveauTfidf.Valeur = nouvelleValeur;
                            nouveauTfidf = null;

                        }
                    }
                    else // Lorsque le mot se trouve dans le dictionnaire gagnant mais pas dans le perdant, on l'ajoute
                    {
                        var nouveauMot = new Tfidf();
                        nouveauMot.PartiId = partiIdPerdant;
                        nouveauMot.MediaId = mediaId;
                        nouveauMot.Mot = mot;
                        nouveauMot.Valeur = 0.001;
                        nouveauTfidf = nouveauMots.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaId && x.Mot == mot).SingleOrDefault();
                        if (nouveauTfidf == null)
                        {
                            nouveauMots.Add(nouveauMot);
                        }
                    }

                }
                else // Cas où le perdant trouve un mot que le gagnant n'a pas 
                {
                    if (dicPerdant.TryGetValue(mot, out double valeurPerdant)) // Lorsque le mot n'est pas présent dans le dictionnaire gagnant on augmente sa valeur de 1%
                    {
                        double nouvelleValeur = (valeurPerdant * 1.01);
                        nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaId && x.Mot == mot).Single();
                        nouveauTfidf.Valeur = nouvelleValeur;
                        nouveauTfidf = null;
                    }
                }

            }
            if (nbMotsPlus == 0) // Lorsqu'aucun mot n'est gagnant, on augmente la valeur de tous les mots trouvés de 1%
            {
                foreach (var mot in mots)
                {
                    if (dicPerdant.TryGetValue(mot, out double valeurPerdant))
                    {
                        double nouvelleValeur = (valeurPerdant * 1.01);
                        nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaId && x.Mot == mot).Single();
                        nouveauTfidf.Valeur = nouvelleValeur;
                        nouveauTfidf = null;
                    }
                }
            }
            return nouveauMots;

        }

        public async Task<string> PredicteurMedias(short mediaId)
        {
            bool chefOnly = mediaId == 2;
            var publications = await _store.GetPublications(mediaId, DateTime.MinValue, DateTime.Now, chefOnly);
            var partis = await _store.GetPartis();
            var medias = await _store.GetMedias();
            var tfidfs = await _store.GetTfidfs();

            var dicMediasPartis = new Dictionary<short, Dictionary<short, Dictionary<string, double>>>();
            var dicResultatMediasPartis = new Dictionary<short, Dictionary<short, double>>();
            var nouveauMots = new List<Tfidf>();
            foreach (var media in medias)
            {
                if (media.MediaId != 1 || media.MediaId != 2 || media.MediaId != 6 || media.MediaId != 7 || media.MediaId != 8)
                {
                    continue;
                }

                var dicPartis = new Dictionary<short, Dictionary<string, double>>();
                var dicResultatPartis = new Dictionary<short, double>();
                foreach (var parti in partis)
                {
                    var tfidfsParti = tfidfs.Where(x => x.PartiId == parti.PartiId && x.MediaId == media.MediaId).ToList();
                    var dictionnaireTfidf = new Dictionary<string, double>();
                    foreach (var tfidfParti in tfidfsParti)
                    {
                        dictionnaireTfidf.Add(tfidfParti.Mot, tfidfParti.Valeur.Value);
                    }
                    dicPartis.Add(parti.PartiId, dictionnaireTfidf);
                    dicResultatPartis.Add(parti.PartiId, 0);

                }
                dicMediasPartis.Add(media.MediaId, dicPartis);
                dicResultatMediasPartis.Add(media.MediaId, dicResultatPartis);
            }



            var nbPublications = 0;
            var bonResultat = 0;
            var bonResultatParti = 0;
            var bonResultatMedia = 0;
            var ResultatZero = 0;

            foreach (var publication in publications)
            {
                var texte = publication.TexteTronquer;
                texte = texte.ToLower();
                texte = texte.Replace(".", "");
                texte = texte.Replace(",", "");
                texte = texte.Replace("!", "");
                texte = texte.Replace("?", "");
                texte = texte.Replace("-", " ");
                if (texte == null || texte.Length < 20) //Si le texte est moins de 20 caractères on ne peut catégoriser correctement
                {
                    continue;
                }
                nbPublications++; // On ajoute seulement les publications vérifiés pour le % de bonnes réponses

                var mots = texte.Split(new char[] { ' ', '\n' });


                foreach (var mot in mots)
                {
                    foreach (var media in medias)
                    {
                        var dicPartisTfidf = dicMediasPartis[media.MediaId];
                        foreach (var parti in partis)
                        {
                            if (dicPartisTfidf[parti.PartiId].TryGetValue(mot, out double valeur))
                            {
                                dicResultatMediasPartis[media.MediaId][parti.PartiId] = dicResultatMediasPartis[media.MediaId][parti.PartiId] + valeur;
                            }
                        }
                    }
                }

                double bigger = 0;
                var partiWin = 0;
                var mediaWin = 0;
                foreach (var media in medias)
                {
                    var dicResultat = dicResultatMediasPartis[media.MediaId];
                    foreach (var parti in partis)
                    {
                        if (dicResultat[parti.PartiId] > bigger)
                        {
                            bigger = dicResultat[parti.PartiId];
                            partiWin = parti.PartiId;
                            mediaWin = media.MediaId;
                        }
                    }
                }

                var partiPublication = await _store.GetPartiPublication(publication.PublicationId);
                var mediaPublication = await _store.GetMediaPublication(publication.PublicationId);

                if (partiWin == partiPublication)
                {
                    bonResultatParti++;
                    nouveauMots = await EntraineurMedias(dicMediasPartis, texte, (short)mediaWin, mediaPublication, partiPublication, (short)partiWin, tfidfs, nouveauMots);

                }
                if (mediaWin == mediaPublication)
                {
                    bonResultatMedia++;
                    var dicPartis = dicMediasPartis[mediaPublication];
                    var tfidfsPartis = tfidfs.Where(x => x.MediaId == mediaPublication).ToList();
                    nouveauMots = await Entraineur(dicPartis, texte, mediaId, partiPublication, (short)partiWin, tfidfsPartis, nouveauMots);

                }
                if (partiWin == partiPublication && mediaWin == mediaPublication)
                {
                    bonResultat++;
                }
                else
                {
                    Console.WriteLine("Mauvaise réponse");
                }
            }


            var resultat = "Nombre de bonne prédiction : " + Math.Round((((double)(bonResultat / (double)nbPublications)) * 100), 1) + " %. \nBonne prédiction du parti : " + Math.Round((((double)(bonResultatParti / (double)nbPublications)) * 100), 1) + " %. \nNombre de bonne prédiction de média : " + Math.Round((((double)(bonResultatMedia / (double)nbPublications)) * 100), 1) + " %. \nNombre de publications avec aucun mot trouvé pour tous les partis et tous les médias: " + ResultatZero;
            return resultat;

        }

        public async Task<List<Tfidf>> EntraineurMedias(Dictionary<short, Dictionary<short, Dictionary<string, double>>> dicMediasPartis, string texte, short mediaGagnant, short mediaPerdant, short partiIdPerdant, short partiIdGagnant, List<Tfidf> tfidfsPartis, List<Tfidf> nouveauMots)
        {
            var nouveauTfidf = new Tfidf();
            var mots = texte.Split(new char[] { ' ', '\n' });
            if (partiIdGagnant == 0) // Lorsque aucun parti n'a aucun mot retrouvé
            {
                foreach (var mot in mots) // On ajoute les mot avec une valeur minime
                {
                    var nouveauMot = new Tfidf();
                    nouveauMot.PartiId = partiIdPerdant;
                    nouveauMot.MediaId = mediaPerdant;
                    nouveauMot.Mot = mot;
                    nouveauMot.Valeur = 0.000001;
                    nouveauTfidf = nouveauMots.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaPerdant && x.Mot == mot).SingleOrDefault();
                    if (nouveauTfidf == null)
                    {
                        nouveauMots.Add(nouveauMot);
                    }
                }
                return nouveauMots;
            }
            var nbMotsPlus = 0;
            var dicPerdant = dicMediasPartis[mediaPerdant][partiIdPerdant];
            var dicGagnant = dicMediasPartis[mediaGagnant][partiIdGagnant];
            foreach (var mot in mots)
            {

                if (dicGagnant.TryGetValue(mot, out double valeurGagnant))
                {
                    if (dicPerdant.TryGetValue(mot, out double valeurPerdant))
                    {
                        if (valeurGagnant > valeurPerdant)
                        {
                            double nouvelleValeur = valeurPerdant + ((valeurGagnant - valeurPerdant) / 10); // On réduit l'écart entre le mot perdant et le mot gagnant de 10%
                            nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaPerdant && x.Mot == mot).Single();
                            nouveauTfidf.Valeur = (nouvelleValeur);
                            nouveauTfidf = null;

                        }

                        if (valeurGagnant <= valeurPerdant)
                        {
                            nbMotsPlus++;
                            double nouvelleValeur = valeurPerdant + ((valeurPerdant - valeurGagnant) / 100); // On augmente l'écart entre le mot perdant et le mot gagnant de 1%
                            nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaPerdant && x.Mot == mot).Single();
                            nouveauTfidf.Valeur = nouvelleValeur;
                            nouveauTfidf = null;

                        }
                    }
                    else // Lorsque le mot se trouve dans le dictionnaire gagnant mais pas dans le perdant, on l'ajoute
                    {
                        var nouveauMot = new Tfidf();
                        nouveauMot.PartiId = partiIdPerdant;
                        nouveauMot.MediaId = mediaPerdant;
                        nouveauMot.Mot = mot;
                        nouveauMot.Valeur = 0.001;
                        nouveauTfidf = nouveauMots.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaPerdant && x.Mot == mot).SingleOrDefault();
                        if (nouveauTfidf == null)
                        {
                            nouveauMots.Add(nouveauMot);
                        }
                    }

                }
                else // Cas où le perdant trouve un mot que le gagnant n'a pas 
                {
                    if (dicPerdant.TryGetValue(mot, out double valeurPerdant)) // Lorsque le mot n'est pas présent dans le dictionnaire gagnant on augmente sa valeur de 1%
                    {
                        double nouvelleValeur = (valeurPerdant * 1.01);
                        nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaPerdant && x.Mot == mot).Single();
                        nouveauTfidf.Valeur = nouvelleValeur;
                        nouveauTfidf = null;
                    }
                }

            }
            if (nbMotsPlus == 0) // Lorsqu'aucun mot n'est gagnant, on augmente la valeur de tous les mots trouvés de 1%
            {
                foreach (var mot in mots)
                {
                    if (mot.Length < 5) { continue; }
                    if (mot.Contains("-") || mot.Contains("'"))
                    {
                        var sousMots = mot.Split(new char[] { '-', '\'' });
                        foreach (var sousMot in sousMots)
                        {
                            if (!sousMot.All(char.IsDigit) || !sousMot.All(char.IsLetter))
                            {
                                continue;
                            }
                        }
                    }
                    else
                    {
                        if (!mot.All(char.IsDigit) || !mot.All(char.IsLetter)) { continue; }
                    }
                    if (dicPerdant.TryGetValue(mot, out double valeurPerdant))
                    {
                        double nouvelleValeur = (valeurPerdant * 1.01);
                        nouveauTfidf = tfidfsPartis.Where(x => x.PartiId == partiIdPerdant && x.MediaId == mediaPerdant && x.Mot == mot).Single();
                        nouveauTfidf.Valeur = nouvelleValeur;
                        nouveauTfidf = null;
                    }
                }
            }
            return nouveauMots;

        }

        public async Task ShowTfidf(short partiId, short mediaId)
        {
            var tfidfss = await _store.GetTfidfs(partiId, mediaId);
            tfidfss = tfidfss.OrderByDescending(x => x.Valeur).ToList();
            var tfidfs = tfidfss.Take(50);
            var dictionnaire = "{";
            foreach (var tfidf in tfidfs)
            {
                dictionnaire += "'" + tfidf.Mot + "': [" + tfidf.Valeur + "],";
            }
            dictionnaire = dictionnaire.Remove(dictionnaire.Length - 1, 1) + "}";
            Helper.RunProcessWordCloud(dictionnaire);
        }

        public async Task SaveChanges()
        {
            await _store.SaveChanges();
        }


    }
}
