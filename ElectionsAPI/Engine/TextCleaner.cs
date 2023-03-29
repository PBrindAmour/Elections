using System.Text;

namespace ElectionsAPI.Engine
{
    public static class TextCleaner
    {
        public static string CleanNames(string texte, List<string> names, List<string> firstnames)
        {
           


            // On retire tous les autres noms et prénoms de candidat
            foreach (string name in names)
            {
                var lowname = name.ToLower();
                texte = texte.Replace(lowname + ",", ",");
                texte = texte.Replace(lowname + ".", ".");
                texte = texte.Replace(" " + lowname + " ", " ");
            }
            foreach (string firstname in firstnames)
            {
                var lowfirstname = firstname.ToLower();
                texte = texte.Replace(lowfirstname + ",", ",");
                texte = texte.Replace(lowfirstname + ".", ".");
                texte = texte.Replace(" " + lowfirstname + " ", " ");
                texte = texte.Replace("-" + lowfirstname + " ", " ");

            }

            // Liste de compte twitter des candidats les plus actifs
            texte = texte.Replace(" leitão ", " ");
            texte = texte.Replace(" héroux ", " ");
            texte = texte.Replace(" givern ", " ");
            texte = texte.Replace(" ottereye ", " ");
            texte = texte.Replace(" ianlafreniere ", " ");
            texte = texte.Replace(" slevesquedepute ", " ");
            texte = texte.Replace(" gillesb_langer ", " ");
            texte = texte.Replace(" sandramtl ", " ");
            texte = texte.Replace(" ericgirardmfq ", " ");
            texte = texte.Replace(" sgatien_caq ", " ");
            texte = texte.Replace(" suzanne ", " ");
            texte = texte.Replace(" poulin_samuel ", " ");
            texte = texte.Replace(" marcpicardqc ", " ");
            texte = texte.Replace(" murrayaudrey ", " ");
            texte = texte.Replace(" slachancecaq ", " ");
            texte = texte.Replace(" poulin_samuel ", " ");
            texte = texte.Replace(" ritagouin ", " ");
            texte = texte.Replace(" marc_tanguay ", " ");
            texte = texte.Replace(" andreamorinplq ", " ");
            texte = texte.Replace(" madwanika ", " ");
            texte = texte.Replace(" ritagouin ", " ");
            texte = texte.Replace(" samuelouelletpq ", " ");
            texte = texte.Replace(" pascalberube ", " ");
            texte = texte.Replace(" pluc_briller ", " ");
            texte = texte.Replace(" joel_arseneau ", " ");
            texte = texte.Replace(" yfblanchet ", " ");
            texte = texte.Replace(" venneveronique ", " ");
            texte = texte.Replace(" alexisdeschene ", " ");
            texte = texte.Replace(" willfradettelsj ", " ");
            texte = texte.Replace(" emilesimardqc ", " ");
            texte = texte.Replace(" docgenereux ", " ");
            texte = texte.Replace(" myriamdecacouna ", " ");
            texte = texte.Replace(" carolannkack ", " ");
            texte = texte.Replace(" alezaga ", " ");
            texte = texte.Replace(" leblanc_isa ", " ");
            texte = texte.Replace(" christine_qs ", " ");
            texte = texte.Replace(" rivard ", " ");
            texte = texte.Replace(" leducalexandre ", " ");
            texte = texte.Replace(" raymontlogistique ", " ");
            texte = texte.Replace(" jérômien ", " ");
            texte = texte.Replace(" berthier ", " ");
            texte = texte.Replace(" ernesto ", " ");
            texte = texte.Replace(" lunacy ", " ");
            texte = texte.Replace(" stephanieprevostconservateurquebec ", " ");
            texte = texte.Replace(" adèl ", " ");
            texte = texte.Replace(" yvon ", " ");
            texte = texte.Replace(" kateri ", " ");
            texte = texte.Replace(" gréber ", " ");
            texte = texte.Replace(" lacombemathieu ", " ");
            texte = texte.Replace(" labelletournee ", " ");
            texte = texte.Replace(" marioasselin ", " ");
            texte = texte.Replace(" hebertgenevieve ", " ");
            texte = texte.Replace(" guillemette_caq ", " ");
            texte = texte.Replace(" caqlouis ", " ");
            texte = texte.Replace(" nadine ", " ");
            texte = texte.Replace(" hatley ", " ");
            texte = texte.Replace(" pk ", " ");
            texte = texte.Replace(" giltheriault ", " ");
            texte = texte.Replace(" matgrat ", " ");
            texte = texte.Replace(" jmaccarone ", " ");
            texte = texte.Replace(" francoisvae ", " ");
            texte = texte.Replace(" sauljpolo ", " ");
            texte = texte.Replace(" falardeau ", " ");
            texte = texte.Replace(" jeannerobin_qc ", " ");
            texte = texte.Replace(" sylvaingaudrea ", " ");
            texte = texte.Replace(" ml_desgagne ", " ");
            texte = texte.Replace(" heunepremier ", " ");
            texte = texte.Replace(" hilalpilavci ", " ");
            texte = texte.Replace(" gclicherivard ", " ");
            texte = texte.Replace(" jjuliencaq ", " ");
            texte = texte.Replace(" mccquebec ", " ");
            texte = texte.Replace(" dlamothe_caq ", " ");
            texte = texte.Replace(" saule ", " ");
            texte = texte.Replace(" monsefderraji ", " ");
            texte = texte.Replace(" jean_francoisp ", " ");
            texte = texte.Replace(" rhealfortin ", " ");
            texte = texte.Replace(" marguerite  ", " ");
            texte = texte.Replace(" blais,  ", " ");

            
            texte = texte.Replace(" taillon  ", " ");
            texte = texte.Replace(" beauport  ", " ");
            texte = texte.Replace(" bonjour  ", " ");
            texte = texte.Replace(" papineau  ", " ");
            texte = texte.Replace(" briguer  ", " ");
            texte = texte.Replace(" première  ", " ");
            texte = texte.Replace(" cartier  ", " ");
            texte = texte.Replace(" brigitte  ", " ");
            texte = texte.Replace(" perron  ", " ");
            texte = texte.Replace(" jacques  ", " ");
            texte = texte.Replace(" verdun  ", " ");
            texte = texte.Replace(" gaspé  ", " ");
            texte = texte.Replace(" rébecca  ", " ");
            texte = texte.Replace(" karla  ", " ");
            texte = texte.Replace(" desprer  ", " ");
            texte = texte.Replace(" québécois  ", " ");
            texte = texte.Replace(" joliet  ", " ");
            texte = texte.Replace(" jonquière  ", " ");
            texte = texte.Replace(" premier  ", " ");
            texte = texte.Replace(" saguenaylac  ", " ");
            texte = texte.Replace(" victoria  ", " ");
            texte = texte.Replace(" avenir  ", " ");
            texte = texte.Replace(" cullen  ", " ");
            texte = texte.Replace(" opposition  ", " ");
            texte = texte.Replace(" version  ", " ");
            texte = texte.Replace(" parole  ", " ");
            texte = texte.Replace(" estérel  ", " ");
            texte = texte.Replace(" élaine  ", " ");
            texte = texte.Replace(" guilloteau  ", " ");
            texte = texte.Replace(" soulange  ", " ");
            texte = texte.Replace(" france  ", " ");
            texte = texte.Replace(" cayouette  ", " ");
            texte = texte.Replace(" gatineau  ", " ");
            texte = texte.Replace(" porte  ", " ");
            texte = texte.Replace(" montmorency  ", " ");
            texte = texte.Replace(" pontiac  ", " ");
            texte = texte.Replace(" vimont  ", " ");
            texte = texte.Replace(" perron  ", " ");
            texte = texte.Replace(" ministre  ", " ");
            texte = texte.Replace(" citoyen  ", " ");
            texte = texte.Replace(" estrie  ", " ");
            texte = texte.Replace(" québec  ", " ");
            texte = texte.Replace(" outremont  ", " ");
            texte = texte.Replace(" solidaire  ", " ");
            texte = texte.Replace(" coalition  ", " ");
            texte = texte.Replace(" courant  ", " ");
            texte = texte.Replace(" pierre  ", " ");
            texte = texte.Replace(" réélire  ", " ");

            texte = texte.Replace(" montcalm ", " ");
            texte = texte.Replace(" gouvernementlegault ", " ");
            texte = texte.Replace(" mitchell ", " ");
            texte = texte.Replace(" scrutin ", " ");
            texte = texte.Replace(" chacun ", " ");
            texte = texte.Replace(" jourdain ", " ");
            texte = texte.Replace(" maurice ", " ");
            texte = texte.Replace(" tourner ", " ");
            texte = texte.Replace(" région ", " ");
            texte = texte.Replace(" noranda ", " ");
            texte = texte.Replace(" originaire ", " ");
            texte = texte.Replace(" grand ", " ");
            texte = texte.Replace(" octobre ", " ");
            texte = texte.Replace(" depuis ", " ");
            texte = texte.Replace(" gouvernement ", " ");
            texte = texte.Replace(" begley ", " ");
            texte = texte.Replace(" suffrage ", " ");
            texte = texte.Replace(" candidat ", " ");
            texte = texte.Replace(" frontenac ", " ");
            texte = texte.Replace(" mettre ", " ");
            texte = texte.Replace(" anjoulouis ", " ");
            texte = texte.Replace(" argenteuil ", " ");
            texte = texte.Replace(" personne ", " ");
            texte = texte.Replace(" circonscription ", " ");
            texte = texte.Replace(" bécancour ", " ");
            texte = texte.Replace(" politique ", " ");
            texte = texte.Replace(" nicolet ", " ");
            texte = texte.Replace(" robert ", " ");
            texte = texte.Replace(" arthabaska ", " ");
            texte = texte.Replace(" lotbinière ", " ");
            texte = texte.Replace(" bienvenue ", " ");
            texte = texte.Replace(" devoir ", " ");
            texte = texte.Replace(" royaloutremont ", " ");
            texte = texte.Replace(" parti ", " ");
            texte = texte.Replace(" laurentide ", " ");
            texte = texte.Replace(" année ", " ");
            texte = texte.Replace(" québec ", " ");
            texte = texte.Replace(" depuis ", " ");
            texte = texte.Replace(" officiel ", " ");
            texte = texte.Replace(" libéral ", " ");
            texte = texte.Replace(" chefferie ", " ");
            texte = texte.Replace(" james ", " ");
            texte = texte.Replace(" baldwin ", " ");
            texte = texte.Replace(" maskinongé ", " ");
            texte = texte.Replace(" prevost ", " ");
            texte = texte.Replace(" cheffe ", " ");
            texte = texte.Replace(" cartier ", " ");
            texte = texte.Replace(" novembre ", " ");
            texte = texte.Replace(" premièrement ", " ");
            texte = texte.Replace(" jacques ", " ");
            texte = texte.Replace(" lesage ", " ");
            texte = texte.Replace(" mauricie ", " ");
            texte = texte.Replace(" chicoutimi ", " ");
            texte = texte.Replace(" conservateur ", " ");
            texte = texte.Replace(" nelligan ", " ");
            texte = texte.Replace(" chouinard ", " ");
            texte = texte.Replace(" matière ", " ");
            texte = texte.Replace(" thuly ", " ");
            texte = texte.Replace(" parole ", " ");
            texte = texte.Replace(" leroux ", " ");
            texte = texte.Replace(" acadie ", " ");
            texte = texte.Replace(" voire ", " ");
            texte = texte.Replace(" quatre ", " ");
            texte = texte.Replace(" envers ", " ");
            texte = texte.Replace(" assurer ", " ");
            texte = texte.Replace(" lavallois ", " ");
            texte = texte.Replace(" sophia ", " ");
            texte = texte.Replace(" notamment ", " ");
            texte = texte.Replace(" rassemblementanglade ", " ");
            texte = texte.Replace(" pouvoir ", " ");
            texte = texte.Replace(" westmountsaint ", " ");
            texte = texte.Replace(" permettre ", " ");
            texte = texte.Replace(" député ", " ");
            texte = texte.Replace(" senneterre ", " ");
            texte = texte.Replace(" mesure ", " ");
            texte = texte.Replace(" vimont ", " ");
            texte = texte.Replace(" verdun ", " ");
            texte = texte.Replace(" enjeu ", " ");
            texte = texte.Replace(" drummondbois ", " ");




            // Noms de circonscriptions
            texte = texte.Replace(" louisriel ", " ");
            texte = texte.Replace(" lapiniere ", " ");
            texte = texte.Replace(" sorel ", " ");
            texte = texte.Replace(" jonquière ", " ");
            texte = texte.Replace(" tracy ", " ");
            texte = texte.Replace(" lotbinièrefrontenac ", " ");
            texte = texte.Replace(" chapleau ", " ");
            texte = texte.Replace(" beaucenord ", " ");
            texte = texte.Replace(" agathe ", " ");
            texte = texte.Replace(" laprairie ", " ");
            texte = texte.Replace(" prairie ", " ");
            texte = texte.Replace(" brossard ", " ");
            texte = texte.Replace(" riel ", " ");
            texte = texte.Replace(" louisriel ", " ");
            texte = texte.Replace(" plateaumontroyal ", " ");
            texte = texte.Replace(" dorval ", " ");
            texte = texte.Replace(" louisriel ", " ");
            texte = texte.Replace(" bourassasauvé ", " ");
            texte = texte.Replace(" lachine ", " ");
            texte = texte.Replace(" lotbinierefrontenac ", " ");
            texte = texte.Replace(" argenteuil ", " ");
            texte = texte.Replace(" équipecôtenord ", " ");
            texte = texte.Replace(" dubuc ", " ");
            texte = texte.Replace(" extension ", " ");
            texte = texte.Replace(" handfield ", " ");
            texte = texte.Replace(" ndg ", " ");
            texte = texte.Replace(" saintjérôme ", " ");
            texte = texte.Replace(" brome ", " ");
            texte = texte.Replace(" berthier ", " ");
            texte = texte.Replace(" bromemissisquoi ", " ");
            texte = texte.Replace(" saintfrancoi ", " ");
            texte = texte.Replace(" cotenord ", " ");
            texte = texte.Replace(" rawdon ", " ");
            texte = texte.Replace(" boucherville ", " ");
            texte = texte.Replace(" ville_stbruno ", " ");
            texte = texte.Replace(" vanierlesrivière ", " ");
            texte = texte.Replace(" anjou ", " ");
            texte = texte.Replace(" côtenord ", " ");
            texte = texte.Replace(" kuujjuaq ", " ");
            texte = texte.Replace(" rosemont ", " ");
            texte = texte.Replace(" mascouche ", " ");
            texte = texte.Replace(" carleton ", " ");
            texte = texte.Replace(" temiscamingue ", " ");
            texte = texte.Replace(" tétrauville ", " ");
            texte = texte.Replace(" bromont ", " ");
            texte = texte.Replace(" taschereau ", " ");
            texte = texte.Replace(" lanaudiere ", " ");
            texte = texte.Replace(" rimouski ", " ");
            texte = texte.Replace(" greenfield ", " ");
            texte = texte.Replace(" mercier ", " ");
            texte = texte.Replace(" moulinoi ", " ");
            texte = texte.Replace(" rimouski ", " ");
            texte = texte.Replace(" missisquoi ", " ");
            texte = texte.Replace(" 000 ", " ");
            texte = texte.Replace(" missisquoi ", " ");
            texte = texte.Replace(" missisquoi ", " ");
            texte = texte.Replace(" missisquoi ", " ");






            

            return texte;
        }
        public static string RemoveCharacters(string texte)
        {
            texte = texte.Replace("’", "\'");
            StringBuilder sb = new StringBuilder();
            foreach (char c in texte)
            {
                if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9' || c == '.' || c == '-' || c == ':' || c == ' ' || c == '&' || c == '!' || c == ',' || c == '\'') || c == '’' || c == 'À' || (c >= 'Ç' && c <= 'Ê') || (c >= 'à' && c <= 'ï') || c == 'û' || c == 'ù' || c == 'ô' || c=='î' || c == 'œ')  
                {
                    sb.Append(c);
                }
            }
            var resultat = sb.ToString();
            texte = resultat.Replace("’", "\'");
            texte = texte.Replace("’", "'");
            texte = texte.Replace("œ", "oe"); 
            texte = texte.Replace("! .", "!");
            texte = texte.Replace(". .", ".");
            texte = texte.Replace(" .", ".");
            texte = texte.Replace(" ,", ",");
            texte = texte.Replace("   ", " ");
            texte = texte.Replace("  ", " ");

            texte = texte.Replace(" legault ", " F.Legault ");
            texte = texte.Replace(" anglade ", " D.Anglade ");
            texte = texte.Replace(" nadeau ", " G.Nadeau-Dubois ");
            texte = texte.Replace(" massé ", " M.Massé ");
            texte = texte.Replace(" plamondon ", " P.St-Pierre-Plamondon ");
            texte = texte.Replace(" duhaime ", " E.Duhaime ");

            return texte;
                      
            /*// Suppression des numéros
            for (var x = 0; x < 10; x++)
            {
                texte = texte.Replace(x.ToString(), "");
            }

            return texte;*/
        }
        public static string CleanWords(string texte)
        {
            // Liste de mots modifié involontairement par le script python
            texte = texte.Replace(" manqu ", " manque ");
            texte = texte.Replace(" ensembl ", " ensemble ");
            texte = texte.Replace(" assuron ", " assurer ");
            texte = texte.Replace(" visàvis ", " vis vis ");
            texte = texte.Replace(" embauch ", " embaucher ");
            texte = texte.Replace(" annoncerai ", " annoncer ");
            texte = texte.Replace(" privilégi ", " privilégier ");
            texte = texte.Replace(" caquist ", " caquiste ");
            texte = texte.Replace(" dépendantist ", " dépendantiste ");
            texte = texte.Replace(" texa ", " texas ");
            texte = texte.Replace(" merveill ", " merveille ");
            texte = texte.Replace(" ge ", " ges ");
            texte = texte.Replace(" duhaim ", " duhaime ");
            texte = texte.Replace(" nonobster ", " nonobstant ");
            texte = texte.Replace(" lévi ", " lévis ");
            texte = texte.Replace(" portefeuill ", " portefeuille ");
            texte = texte.Replace(" mss ", " ministère santé service social ");
            texte = texte.Replace(" banq ", " banque ");
            texte = texte.Replace(" pev ", " plan économie verte ");
            texte = texte.Replace(" amm ", " aide médicale mourrir ");
            texte = texte.Replace(" sqri ", " stratégie québécoise recherche investissement ");
            texte = texte.Replace(" verte ", " vert ");
            texte = texte.Replace(" dec ", " diplôme étude collégial");
            texte = texte.Replace(" partiquebecoi ", " partiquebecois ");
            texte = texte.Replace(" indépender ", " indépendance ");
            texte = texte.Replace(" quebecsolidair ", " québecsolidaire ");
            texte = texte.Replace(" quebecsolidaire ", " québecsolidaire ");
            texte = texte.Replace(" québecsolidair ", " québecsolidaire ");
            texte = texte.Replace(" prioritétc ", " priorité ");
            texte = texte.Replace(" librecheznou ", " librecheznous ");
            texte = texte.Replace(" librescheznou ", " librecheznous ");
            texte = texte.Replace(" partiquebecoi ", " partiquebecois ");
            texte = texte.Replace(" visit ", " visite ");
            texte = texte.Replace(" partiquebecois ", " partiquebecois ");
            texte = texte.Replace(" cot ", " coté ");
            texte = texte.Replace(" parcour ", " parcours ");
            texte = texte.Replace(" permettra ", " permettre ");
            texte = texte.Replace(" maltraitanc ", " maltraitance ");
            texte = texte.Replace(" ,", ",");
            texte = texte.Replace(" , ", " ");
            texte = texte.Replace(" uvre ", " oeuvre ");
            texte = texte.Replace(" main-de ", " main de ");
            texte = texte.Replace(" legaultchef ", " legault chef ");
            texte = texte.Replace(" chang ", " changer ");
            texte = texte.Replace(" chmage ", " chômage ");
            texte = texte.Replace(" ouai ", " ouais ");
            texte = texte.Replace(" terre-neuf ", " terre-neuve ");
            texte = texte.Replace(" main-de ", " main-d'oeuvre ");
            texte = texte.Replace(" universitelaval ", " université laval ");
            texte = texte.Replace(" citoyensnne ", " citoyen ");
            texte = texte.Replace(" café-rencontre ", " café rencontre ");
            texte = texte.Replace(" citoyen-ne-s ", " citoyen ");
            texte = texte.Replace(" cégeps ", " cégep ");
            texte = texte.Replace(" cot ", " coté ");




            
            // Noms de circonscriptions
            texte = texte.Replace(" louisriel ", " ");
            texte = texte.Replace(" lapiniere ", " ");
            texte = texte.Replace(" sorel ", " ");
            texte = texte.Replace(" jonquière ", " ");
            texte = texte.Replace(" tracy ", " ");
            texte = texte.Replace(" lotbinièrefrontenac ", " ");
            texte = texte.Replace(" chapleau ", " ");
            texte = texte.Replace(" beaucenord ", " ");
            texte = texte.Replace(" agathe ", " ");
            texte = texte.Replace(" laprairie ", " ");
            texte = texte.Replace(" prairie ", " ");
            texte = texte.Replace(" brossard ", " ");
            texte = texte.Replace(" riel ", " ");
            texte = texte.Replace(" louisriel ", " ");
            texte = texte.Replace(" plateaumontroyal ", " ");
            texte = texte.Replace(" dorval ", " ");
            texte = texte.Replace(" louisriel ", " ");
            texte = texte.Replace(" bourassasauvé ", " ");
            texte = texte.Replace(" lachine ", " ");
            texte = texte.Replace(" lotbinierefrontenac ", " ");
            texte = texte.Replace(" argenteuil ", " ");
            texte = texte.Replace(" équipecôtenord ", " ");
            texte = texte.Replace(" dubuc ", " ");
            texte = texte.Replace(" extension ", " ");
            texte = texte.Replace(" handfield ", " ");
            texte = texte.Replace(" ndg ", " ");
            texte = texte.Replace(" saintjérôme ", " ");
            texte = texte.Replace(" brome ", " ");
            texte = texte.Replace(" berthier ", " ");
            texte = texte.Replace(" bromemissisquoi ", " ");
            texte = texte.Replace(" saintfrancoi ", " ");
            texte = texte.Replace(" cotenord ", " ");
            texte = texte.Replace(" rawdon ", " ");
            texte = texte.Replace(" boucherville ", " ");
            texte = texte.Replace(" ville_stbruno ", " ");
            texte = texte.Replace(" vanierlesrivière ", " ");
            texte = texte.Replace(" anjou ", " ");
            texte = texte.Replace(" côtenord ", " ");
            texte = texte.Replace(" kuujjuaq ", " ");
            texte = texte.Replace(" rosemont ", " ");
            texte = texte.Replace(" mascouche ", " ");
            texte = texte.Replace(" carleton ", " ");
            texte = texte.Replace(" temiscamingue ", " ");
            texte = texte.Replace(" tétrauville ", " ");
            texte = texte.Replace(" bromont ", " ");
            texte = texte.Replace(" taschereau ", " ");
            texte = texte.Replace(" lanaudiere ", " ");
            texte = texte.Replace(" rimouski ", " ");
            texte = texte.Replace(" greenfield ", " ");
            texte = texte.Replace(" mercier ", " ");
            texte = texte.Replace(" moulinoi ", " ");
            texte = texte.Replace(" rimouski ", " ");
            texte = texte.Replace(" missisquoi ", " ");
            texte = texte.Replace(" 000 ", " ");
            texte = texte.Replace(" missisquoi ", " ");
            texte = texte.Replace(" missisquoi ", " ");
            texte = texte.Replace(" missisquoi ", " ");
            texte = texte.Replace(" missisquoi ", " ");


            texte = texte.Replace(" taillon ", " ");
            texte = texte.Replace(" beauport ", " ");
            texte = texte.Replace(" bonjour ", " ");
            texte = texte.Replace(" papineau ", " ");
            texte = texte.Replace(" briguer ", " ");
            texte = texte.Replace(" première ", " ");
            texte = texte.Replace(" cartier ", " ");
            texte = texte.Replace(" brigitte ", " ");
            texte = texte.Replace(" perron ", " ");
            texte = texte.Replace(" jacques ", " ");
            texte = texte.Replace(" verdun ", " ");
            texte = texte.Replace(" gaspé ", " ");
            texte = texte.Replace(" rébecca ", " ");
            texte = texte.Replace(" karla ", " ");
            texte = texte.Replace(" desprer ", " ");
            texte = texte.Replace(" québécois ", " ");
            texte = texte.Replace(" joliet ", " ");
            texte = texte.Replace(" jonquière ", " ");
            texte = texte.Replace(" premier ", " ");
            texte = texte.Replace(" saguenaylac ", " ");
            texte = texte.Replace(" victoria ", " ");
            texte = texte.Replace(" avenir ", " ");
            texte = texte.Replace(" cullen ", " ");
            texte = texte.Replace(" opposition ", " ");
            texte = texte.Replace(" version ", " ");
            texte = texte.Replace(" parole ", " ");
            texte = texte.Replace(" estérel ", " ");
            texte = texte.Replace(" élaine ", " ");
            texte = texte.Replace(" guilloteau  ", " ");
            texte = texte.Replace(" soulange ", " ");
            texte = texte.Replace(" france ", " ");
            texte = texte.Replace(" cayouette ", " ");
            texte = texte.Replace(" gatineau ", " ");
            texte = texte.Replace(" porte ", " ");
            texte = texte.Replace(" montmorency ", " ");
            texte = texte.Replace(" pontiac ", " ");
            texte = texte.Replace(" vimont ", " ");
            texte = texte.Replace(" perron ", " ");
            texte = texte.Replace(" ministre ", " ");
            texte = texte.Replace(" citoyen ", " ");
            texte = texte.Replace(" estrie ", " ");
            texte = texte.Replace(" québec ", " ");
            texte = texte.Replace(" outremont ", " ");
            texte = texte.Replace(" solidaire ", " ");
            texte = texte.Replace(" coalition ", " ");
            texte = texte.Replace(" courant ", " ");
            texte = texte.Replace(" pierre ", " ");
            texte = texte.Replace(" réélire ", " ");

            texte = texte.Replace(" montcalm ", " ");
            texte = texte.Replace(" gouvernementlegault ", " ");
            texte = texte.Replace(" mitchell ", " ");
            texte = texte.Replace(" scrutin ", " ");
            texte = texte.Replace(" chacun ", " ");
            texte = texte.Replace(" jourdain ", " ");
            texte = texte.Replace(" maurice ", " ");
            texte = texte.Replace(" tourner ", " ");
            texte = texte.Replace(" région ", " ");
            texte = texte.Replace(" noranda ", " ");
            texte = texte.Replace(" originaire ", " ");
            texte = texte.Replace(" grand ", " ");
            texte = texte.Replace(" octobre ", " ");
            texte = texte.Replace(" depuis ", " ");
            texte = texte.Replace(" gouvernement ", " ");
            texte = texte.Replace(" begley ", " ");
            texte = texte.Replace(" suffrage ", " ");
            texte = texte.Replace(" candidat ", " ");
            texte = texte.Replace(" frontenac ", " ");
            texte = texte.Replace(" mettre ", " ");
            texte = texte.Replace(" anjoulouis ", " ");
            texte = texte.Replace(" argenteuil ", " ");
            texte = texte.Replace(" personne ", " ");
            texte = texte.Replace(" circonscription ", " ");
            texte = texte.Replace(" bécancour ", " ");
            texte = texte.Replace(" politique ", " ");
            texte = texte.Replace(" nicolet ", " ");
            texte = texte.Replace(" robert ", " ");
            texte = texte.Replace(" arthabaska ", " ");
            texte = texte.Replace(" lotbinière ", " ");
            texte = texte.Replace(" bienvenue ", " ");
            texte = texte.Replace(" devoir ", " ");
            texte = texte.Replace(" royaloutremont ", " ");
            texte = texte.Replace(" parti ", " ");
            texte = texte.Replace(" laurentide ", " ");
            texte = texte.Replace(" année ", " ");
            texte = texte.Replace(" québec ", " ");
            texte = texte.Replace(" depuis ", " ");
            texte = texte.Replace(" officiel ", " ");
            texte = texte.Replace(" libéral ", " ");
            texte = texte.Replace(" chefferie ", " ");
            texte = texte.Replace(" james ", " ");
            texte = texte.Replace(" baldwin ", " ");
            texte = texte.Replace(" maskinongé ", " ");
            texte = texte.Replace(" prevost ", " ");
            texte = texte.Replace(" cheffe ", " ");
            texte = texte.Replace(" cartier ", " ");
            texte = texte.Replace(" novembre ", " ");
            texte = texte.Replace(" premièrement ", " ");
            texte = texte.Replace(" jacques ", " ");
            texte = texte.Replace(" lesage ", " ");
            texte = texte.Replace(" mauricie ", " ");
            texte = texte.Replace(" chicoutimi ", " ");
            texte = texte.Replace(" conservateur ", " ");
            texte = texte.Replace(" nelligan ", " ");
            texte = texte.Replace(" chouinard ", " ");
            texte = texte.Replace(" matière ", " ");
            texte = texte.Replace(" thuly ", " ");
            texte = texte.Replace(" parole ", " ");
            texte = texte.Replace(" leroux ", " ");
            texte = texte.Replace(" acadie ", " ");
            texte = texte.Replace(" voire ", " ");
            texte = texte.Replace(" quatre ", " ");
            texte = texte.Replace(" envers ", " ");
            texte = texte.Replace(" assurer ", " ");
            texte = texte.Replace(" lavallois ", " ");
            texte = texte.Replace(" sophia ", " ");
            texte = texte.Replace(" notamment ", " ");
            texte = texte.Replace(" rassemblementanglade ", " ");
            texte = texte.Replace(" pouvoir ", " ");
            texte = texte.Replace(" westmountsaint ", " ");
            texte = texte.Replace(" permettre ", " ");
            texte = texte.Replace(" député ", " ");
            texte = texte.Replace(" senneterre ", " ");
            texte = texte.Replace(" mesure ", " ");
            texte = texte.Replace("vimont", " ");
            texte = texte.Replace("verdun", " ");
            texte = texte.Replace("enjeu", " ");
            texte = texte.Replace("drummondbois", " ");
            texte = texte.Replace("qu'il", " ");
            texte = texte.Replace("aujourd'hui", " ");
            texte = texte.Replace("grand", " ");
            texte = texte.Replace("collégialen", " ");
            texte = texte.Replace("devoir", " ");
            texte = texte.Replace("borromée", " ");
            texte = texte.Replace("charles", " ");
            texte = texte.Replace("wright", " ");
            texte = texte.Replace("beauport", " ");
            texte = texte.Replace("brigitte", " ");
            texte = texte.Replace("investiture", " ");
            texte = texte.Replace("d'achat", " ");
            texte = texte.Replace("marois", " ");
            texte = texte.Replace("pauline", " ");
            texte = texte.Replace("gaspé", " ");
            texte = texte.Replace("michael", " ");
            texte = texte.Replace("solidairemassé", " ");
            texte = texte.Replace("mercredi", " ");
            texte = texte.Replace("montmorency", " ");
            texte = texte.Replace("borromée", " ");
            texte = texte.Replace("charles", "");
            texte = texte.Replace("brigitte", "");
            texte = texte.Replace("l'", "");
            texte = texte.Replace("région", "");
            texte = texte.Replace("sophie", "");
            texte = texte.Replace("solidairemassé", "");
            texte = texte.Replace("guilloteau", "");
            texte = texte.Replace("cayouette", "");
            texte = texte.Replace("cullen", "");
            texte = texte.Replace("montréal", "");
            texte = texte.Replace("leroux", "");
            texte = texte.Replace("desprer", "");
            texte = texte.Replace("québécois", "");
            texte = texte.Replace("thuly", "");
            texte = texte.Replace("chouinard", "");
            texte = texte.Replace("dubeau", "");
            texte = texte.Replace("pietà", "");
            texte = texte.Replace("leitao", "");
            texte = texte.Replace("thetford", "");
            texte = texte.Replace("chelsea", "");
            texte = texte.Replace("outremont", "");
            texte = texte.Replace("sophia", "");
            texte = texte.Replace("westmountsaint", "");
            texte = texte.Replace("royaloutremont", "");
            texte = texte.Replace("rassemblementanglade", "");
            texte = texte.Replace("cheffe", " ");
            texte = texte.Replace("beaupré", "");
            texte = texte.Replace("boivin", "");
            texte = texte.Replace("vézina", "");
            texte = texte.Replace("blanchette", "");
            texte = texte.Replace("frederick", "");
            texte = texte.Replace("rassemblementanglade", "");
            texte = texte.Replace("clicplqorgplateforme", "");
            texte = texte.Replace("québec", "");
            texte = texte.Replace("conservateur", "");
            texte = texte.Replace("réélire", "");
            texte = texte.Replace("élaine", "");
            texte = texte.Replace("solidairemassé", "");
            texte = texte.Replace("karla", "");
            texte = texte.Replace("perron", "");
            texte = texte.Replace("pierre", "");
            texte = texte.Replace("karla", "");
            texte = texte.Replace(" porte ", " ");
            texte = texte.Replace("rassemblementanglade", "");
            texte = texte.Replace("libéral", "");
            texte = texte.Replace("acadie", "");
            texte = texte.Replace("abitibi", "");
            texte = texte.Replace("frontenac", ""); 
            texte = texte.Replace("bécancour", "");
            texte = texte.Replace("nicolet", "");
            texte = texte.Replace("lotbinière", "");
            texte = texte.Replace("candidature", "");
            texte = texte.Replace("dubois", "");
            texte = texte.Replace(" candidature ", " ");
            texte = texte.Replace(" assemblée ", " ");
            texte = texte.Replace("officiel", " ");
            texte = texte.Replace("rassemblementanglade", " ");
            texte = texte.Replace(" concitoyen ", " ");
            texte = texte.Replace(" communauté ", " ");
            texte = texte.Replace(" équipe ", " ");
            texte = texte.Replace(" bourassa ", " ");
            texte = texte.Replace(" chaudièr ", " ");
            texte = texte.Replace(" septembre ", " ");
            texte = texte.Replace(" mardi ", " ");
            texte = texte.Replace(" élection ", " ");
            texte = texte.Replace(" montmagny ", " ");
            texte = texte.Replace(" fillion ", " ");
            texte = texte.Replace(" charlesbourg ", " ");
            texte = texte.Replace(" saganash ", " ");
            texte = texte.Replace(" témiscamingu ", " ");
            texte = texte.Replace(" chibougamau ", " ");
            texte = texte.Replace(" verdun ", " ");
            texte = texte.Replace(" ouest ", " ");
            texte = texte.Replace(" sfogaing ", " ");
            texte = texte.Replace(" tétreaultvill ", " ");
            texte = texte.Replace(" pascal ", " ");
            texte = texte.Replace(" n'", " ");
            texte = texte.Replace(" james ", " ");
            texte = texte.Replace(" mettre ", " ");
            texte = texte.Replace(" noranda ", " ");
            texte = texte.Replace(" raymond ", " ");
            texte = texte.Replace("léconomie", "économie");
            texte = texte.Replace(" kateri ", " ");
            texte = texte.Replace(" dautre ", " ");
            texte = texte.Replace("sadresse", "adresse");
            texte = texte.Replace(" rouyn ", " ");
            texte = texte.Replace(" diane ", " ");
            texte = texte.Replace(" élaine ", " ");
            texte = texte.Replace(" jourdain ", " ");
            texte = texte.Replace(" coalition ", " ");
            texte = texte.Replace(" libéral ", " ");
            texte = texte.Replace(" ministre ", " ");
            texte = texte.Replace(" avril ", " ");
            texte = texte.Replace(" citoyen ", " ");
            texte = texte.Replace(" lotbinière ", " ");
            texte = texte.Replace(" mauricie ", " ");
            texte = texte.Replace(" vaudreuil ", " ");
            texte = texte.Replace(" victoria ", " ");
            texte = texte.Replace(" verdun ", " ");
            texte = texte.Replace(" gendron ", " ");
            texte = texte.Replace(" maraîcher ", " ");
            texte = texte.Replace(" camille ", " ");
            texte = texte.Replace(" laurin ", " ");
            texte = texte.Replace(" belleriv ", " ");
            texte = texte.Replace(" andrée ", " ");
            texte = texte.Replace(" taillon ", " ");
            texte = texte.Replace(" kénogami ", " ");
            texte = texte.Replace(" wellington ", " ");
            texte = texte.Replace(" saguenay ", " ");
            texte = texte.Replace(" sondage ", " ");
            texte = texte.Replace(" patrick ", " ");
            texte = texte.Replace(" saguenay ", " ");
            texte = texte.Replace(" ement ", " ");
            texte = texte.Replace("militant", "");
            texte = texte.Replace("candidat", "");
            texte = texte.Replace("kateri", " ");
            texte = texte.Replace("jourdain", " ");
            texte = texte.Replace("dapprentissage", "apprentissage");
            texte = texte.Replace("dautonomie", "autonomie");
            texte = texte.Replace("raymond", "");
            texte = texte.Replace("cartier", " ");
            texte = texte.Replace("hudson", "");
            texte = texte.Replace("liberalquebec", "");
            texte = texte.Replace("canot", "");
            texte = texte.Replace("rather", "");
            texte = texte.Replace("octobre", "");
            texte = texte.Replace("james", "");
            texte = texte.Replace("camille", "");
            texte = texte.Replace("parizeau", "");
            texte = texte.Replace("compt ", "compte ");
            texte = texte.Replace("sfogaing", "");
            texte = texte.Replace("galipeau", "");
            texte = texte.Replace("dussault", "");
            texte = texte.Replace("limoilou", "");
            texte = texte.Replace("réélection", "");
            texte = texte.Replace("saganash", ""); 
            texte = texte.Replace(" solidaire ", " ");
            texte = texte.Replace("patrick", "");
            texte = texte.Replace(" bourg ", " ");
            texte = texte.Replace("anne-.desprezassnat.qc.ca", "");
            texte = texte.Replace("30 source : anne- desprez", "");
            texte = texte.Replace("deepak", "");
            texte = texte.Replace("awasti", "");
            texte = texte.Replace("stéphane", "");
            texte = texte.Replace("carole", "");
            texte = texte.Replace("suzanne", "");
            texte = texte.Replace("anabela", "");
            texte = texte.Replace("derraji", "");
            texte = texte.Replace("mcgraw", "");
            texte = texte.Replace("maryse", "");
            texte = texte.Replace("christina", "");
            texte = texte.Replace("jennifer", "");
            texte = texte.Replace("monteiro", "");
            texte = texte.Replace("younoussa", "");
            texte = texte.Replace("andrénadeau", "");
            texte = texte.Replace("nichol", "");
            texte = texte.Replace("beaudelot", "");
            texte = texte.Replace("ménard", "");
            texte = texte.Replace("setlakwe", "");
            texte = texte.Replace("cisser", "");
            texte = texte.Replace("green", "");
            texte = texte.Replace("nicole", "");
            texte = texte.Replace("caryl", "");
            texte = texte.Replace("carlos", "");
            texte = texte.Replace("melançon", "");
            texte = texte.Replace("filomener", "");
            texte = texte.Replace("chekal", "");
            texte = texte.Replace("mounirou", "");
            texte = texte.Replace("mégann", "");
            texte = texte.Replace("hivon", "");
            texte = texte.Replace("perry", "");
            texte = texte.Replace("laura", "");
            texte = texte.Replace("nantel", "");
            texte = texte.Replace("alexis", "");
            texte = texte.Replace("bouazzi", "");
            texte = texte.Replace("adrien", "");
            texte = texte.Replace("annie", "");
            texte = texte.Replace("flavi", "");
            texte = texte.Replace("maïté", "");
            texte = texte.Replace("alejandra", "");
            texte = texte.Replace("garcia", "");
            texte = texte.Replace("labrecqu", "");
            texte = texte.Replace("fontecilla", "");
            texte = texte.Replace("lapoint", "");
            texte = texte.Replace("etienne", "");
            texte = texte.Replace("bolduc", "");
            texte = texte.Replace("lajoie", "");
            texte = texte.Replace("saguenaylac", "");
            texte = texte.Replace("saint - flavien", "");
            





            texte = texte.Replace(" partiquebecois ", " parti quebecois ");
            texte = texte.Replace(" bioalimentair ", " bioalimentaire ");
            texte = texte.Replace(" cégeps ", " cégep ");
            texte = texte.Replace("clicplqorgplateforme", "");

            texte = texte.Replace(" .", ".");
            texte = texte.Replace(". .", ".");
            texte = texte.Replace("! .", "!");
            texte = texte.Replace(" - ", "-");
            texte = texte.Replace("\' ", "\'");


            // On modifie le nom des chefs afin de ne pas modifier le texte
            texte = texte.Replace("F.Legault", "legault");
            texte = texte.Replace("D.Anglade", "anglade");
            texte = texte.Replace("G.Nadeau-Dubois", "nadeau");
            texte = texte.Replace("M.Massé", "massé");
            texte = texte.Replace("P.St-Pierre-Plamondon", "plamondon");
            texte = texte.Replace("E.Duhaime", "duhaime");

            texte = texte.Trim().ToLower();


            // On modifie les compte twitter des chefs pour les remplacer par leur nom
            texte = texte.Replace(" domanglade ", " anglade ");
            texte = texte.Replace(" paulplamondon ", " st-pierre-plamondon ");
            texte = texte.Replace(" plamondon ", " st-pierre-plamondon ");
            texte = texte.Replace(" nadeau ", " nadeau-dubois ");
            texte = texte.Replace(" manonmasse_qs ", " massé ");
            texte = texte.Replace(" ericduhaim ", " duhaime ");
            texte = texte.Replace(" duhaim ", " duhaime ");


            // On modifie le nom des chefs afin de ne pas les retirer
            texte = texte.Replace(" legault ", " F.Legault ");
            texte = texte.Replace(" anglade ", " D.Anglade ");
            texte = texte.Replace(" nadeau ", " G.Nadeau-Dubois ");
            texte = texte.Replace(" massé ", " M.Massé ");
            texte = texte.Replace(" plamondon ", " P.St-Pierre-Plamondon ");
            texte = texte.Replace(" duhaime ", " E.Duhaime ");


            texte = texte.Replace("    ", " ");
            texte = texte.Replace("   ", " ");
            texte = texte.Replace("  ", " ");
            

            return texte;
        }

        //Liste de mots qui n'ont aucune signification
        public static string RemoveUnusefulWords(string texte)
        {
            texte = " " + texte;
            texte = texte.Replace(".", " . ");
            texte = texte.Replace(",", " , ");
            texte = texte.Replace(" jusqu ", " ");
            texte = texte.Replace(" qu ", " ");
            texte = texte.Replace(" de ", " ");
            texte = texte.Replace(" le ", " ");
            texte = texte.Replace(" un ", " ");
            texte = texte.Replace(" en ", " ");
            texte = texte.Replace(" à ", " ");
            texte = texte.Replace(" que ", " ");
            texte = texte.Replace(" il ", " ");
            texte = texte.Replace(" on ", " ");
            texte = texte.Replace(" ce ", " ");
            texte = texte.Replace(" et ", " ");
            texte = texte.Replace(" qui ", " ");
            texte = texte.Replace(" je ", " ");
            texte = texte.Replace(" se ", " ");
            texte = texte.Replace(" au ", " ");
            texte = texte.Replace(" si ", " ");
            texte = texte.Replace(" y ", " ");
            texte = texte.Replace(" me ", " ");
            texte = texte.Replace(" qu ", " ");
            texte = texte.Replace(" là ", " ");
            texte = texte.Replace(" ça ", " ");
            texte = texte.Replace(" ou ", " ");
            texte = texte.Replace(" où ", " ");
            texte = texte.Replace(" son ", " ");
            texte = texte.Replace(" ben ", " ");
            texte = texte.Replace(" mes ", " ");
            texte = texte.Replace(" ses ", " ");
            texte = texte.Replace(" dr ", " ");
            texte = texte.Replace(" ok ", " ");
            texte = texte.Replace(" oh ", " ");
            texte = texte.Replace(" bin ", " ");
            texte = texte.Replace(" ni ", " ");
            texte = texte.Replace(" er ", " ");
            texte = texte.Replace(" ah ", " ");
            texte = texte.Replace(" tu ", " ");
            texte = texte.Replace(" te ", " ");
            texte = texte.Replace(" vos ", " ");
            texte = texte.Replace(" com ", " ");
            texte = texte.Replace(" lé ", " ");
            texte = texte.Replace(" yer ", " ");
            texte = texte.Replace(" ci ", " ");
            texte = texte.Replace(" vs ", " ");
            texte = texte.Replace(" ya ", " ");
            texte = texte.Replace(" sa ", " ");
            texte = texte.Replace(" èm ", " ");
            texte = texte.Replace(" re ", " ");
            texte = texte.Replace(" avoir ", " ");
            texte = texte.Replace(" être ", " ");
            texte = texte.Replace(" aller ", " ");
            texte = texte.Replace(" faire ", " ");
            texte = texte.Replace(" vous ", " ");
            texte = texte.Replace(" fur ", " ");
            texte = texte.Replace(" pas ", " ");
            texte = texte.Replace(" cela ", " ");
            texte = texte.Replace(" tel ", " ");
            texte = texte.Replace(" avec ", " ");
            texte = texte.Replace(" nous ", " ");
            texte = texte.Replace(" pour ", " ");
            texte = texte.Replace(" notre ", " ");
            texte = texte.Replace(" par ", " ");
            texte = texte.Replace(" sur ", " ");
            texte = texte.Replace(" lui ", " ");
            texte = texte.Replace(" leur ", " ");
            texte = texte.Replace(" dans ", " ");
            texte = texte.Replace(" lors ", " ");
            texte = texte.Replace(" non ", " ");
            texte = texte.Replace(" oui ", " ");
            texte = texte.Replace(" mme ", " ");
            texte = texte.Replace(" pop ", " ");
            texte = texte.Replace(" up ", " ");
            texte = texte.Replace(" dont ", " ");
            texte = texte.Replace(" prendre ", " ");
            texte = texte.Replace(" part ", " ");
            texte = texte.Replace(" comme ", " ");
            texte = texte.Replace(" fois ", " ");
            texte = texte.Replace(" deux ", " ");
            texte = texte.Replace(" an ", " ");
            texte = texte.Replace(" chez ", " ");
            texte = texte.Replace(" alors ", " ");
            texte = texte.Replace(" quel ", " ");
            texte = texte.Replace(" auxquels ", " ");
            texte = texte.Replace(" sous ", " ");
            texte = texte.Replace(" sans ", " ");
            texte = texte.Replace(" pourquoi ", " ");
            texte = texte.Replace(" très ", " ");
            texte = texte.Replace(" amo ", " ");
            texte = texte.Replace(" celui ", " ");
            texte = texte.Replace(" etc ", " ");
            texte = texte.Replace(" entre ", " ");
            texte = texte.Replace(" selon ", " ");
            texte = texte.Replace(" dire ", " ");
            texte = texte.Replace(" bon ", " ");
            texte = texte.Replace(" donc ", " ");
            texte = texte.Replace(" parce ", " ");
            texte = texte.Replace(" car ", " ");
            texte = texte.Replace(" chacun ", " ");
            texte = texte.Replace(" six ", " ");
            texte = texte.Replace(" aux ", " ");
            texte = texte.Replace(" quand ", " ");
            texte = texte.Replace(" mais ", " ");
            texte = texte.Replace(" aussi ", " ");
            texte = texte.Replace(" dès ", " ");
            texte = texte.Replace(" cinq ", " ");
            texte = texte.Replace(" ark ", " ");
            texte = texte.Replace(" moi ", " ");
            texte = texte.Replace(" puis ", " ");
            texte = texte.Replace(" dre ", " ");
            texte = texte.Replace(" ton ", " ");
            texte = texte.Replace(" monsieur ", " ");
            texte = texte.Replace(" no ", " ");
            texte = texte.Replace(" col ", " ");
            texte = texte.Replace(" autre ", " ");
            texte = texte.Replace(" tout ", " ");
            texte = texte.Replace(" ainsi ", " ");
            texte = texte.Replace(" tout ", " ");
            texte = texte.Replace(" ne ", " ");
            texte = texte.Replace(" tout ", " ");
            texte = texte.Replace(" id ", " ");
            texte = texte.Replace(" certainteed ", " ");
            texte = texte.Replace(" plus ", " ");
            texte = texte.Replace(" srb ", " ");
            texte = texte.Replace(" pdf ", " ");
            texte = texte.Replace(" vtt ", " ");
            texte = texte.Replace(" afin ", " ");
            texte = texte.Replace(" www ", " ");
            texte = texte.Replace(" vingtaine ", " ");
            texte = texte.Replace(" mon ", " ");
            texte = texte.Replace(" même ", " ");
            texte = texte.Replace(" samedi ", " ");

            //Nettoyage Twitter
            texte = texte.Replace(" http ", " ");
            texte = texte.Replace(" https ", " ");
            texte = texte.Replace(" pollvl ", " ");
            texte = texte.Replace(" wstl ", " ");
            texte = texte.Replace(" bel ", " ");
            texte = texte.Replace(" to ", " ");
            texte = texte.Replace(" the ", " ");
            texte = texte.Replace(" is ", " ");
            texte = texte.Replace(" of ", " ");
            texte = texte.Replace(" bel ", " ");
            texte = texte.Replace(" votezlyeschekal ", " ");
            texte = texte.Replace(" utquj ", " ");
            texte = texte.Replace(" qlp ", " ");
            texte = texte.Replace(" utotwj ", " ");
            texte = texte.Replace(" ndg ", " ");
            texte = texte.Replace(" utifb ", " ");
            texte = texte.Replace(" cnjpq ", " ");
            texte = texte.Replace(" tco ", " ");
            texte = texte.Replace(" polqc ", " ");
            texte = texte.Replace(" and ", " ");
            texte = texte.Replace(" shsa ", " ");
            texte = texte.Replace(" pk ", " ");
            texte = texte.Replace(" en ", " ");
            texte = texte.Replace(" » ", " ");
            texte = texte.Replace(" « ", " ");
            texte = texte.Replace(" qu'on ", " ");
            texte = texte.Replace(" -là ", " ");
            texte = texte.Replace(" pour ", " ");
            texte = texte.Replace(" prevostconservateur ", " ");
            texte = texte.Replace(" direct-le ", " ");
            texte = texte.Replace(" sutton ", " ");
            texte = texte.Replace(" pcq-berthier ", " ");
            texte = texte.Replace(" collègue-candidat ", " ");
            texte = texte.Replace(" bromont ", " ");
            texte = texte.Replace(" your ", " ");
            texte = texte.Replace(" votre ", " ");
            texte = texte.Replace(" drummondville ", " ");
            texte = texte.Replace(" n'avoir ", " ");
            texte = texte.Replace(" beauc ", " ");
            texte = texte.Replace(" réjean ", " ");
            texte = texte.Replace(" presse-candidat ", " ");
            texte = texte.Replace(" presse-annoncer ", " ");
            texte = texte.Replace(" portneuf ", " ");
            texte = texte.Replace(" beauceron ", " ");
            texte = texte.Replace(" provost ", " ");
            texte = texte.Replace(" beauc-sud ", " ");
            texte = texte.Replace(" direct-le ", " ");
            texte = texte.Replace(" n'être ", " ");
            texte = texte.Replace(" saint-hubert ", " ");
            texte = texte.Replace(" compte ", " ");
            texte = texte.Replace(" charlevoi ", " ");
            texte = texte.Replace(" jean-talon ", " ");
            texte = texte.Replace(" ple ", " ");
            texte = texte.Replace(" laurie ", " ");
            texte = texte.Replace(" cet ", " ");
            texte = texte.Replace(" marie-philip ", " ");
            texte = texte.Replace(" bécancour ", " ");
            texte = texte.Replace(" sorel-tracy ", " ");
            texte = texte.Replace(" outaouai ", " ");
            texte = texte.Replace(" chapleau ", " ");
            texte = texte.Replace(" drummondville ", " ");
            texte = texte.Replace(" 20h ", " ");
            texte = texte.Replace(" 6-4 ", " ");
            texte = texte.Replace(" lebourgneuf ", " ");
            texte = texte.Replace(" jean-yves ", " ");
            texte = texte.Replace(" île-de-le-madeleine ", " ");
            texte = texte.Replace(" sorel-tracy ", " ");
            texte = texte.Replace(" louis-riel ", " ");
            texte = texte.Replace(" 22h30 ", " ");
            texte = texte.Replace(" sainte-adèle ", " ");
            texte = texte.Replace(" bas-saint-laurent ", " ");
            texte = texte.Replace(" anjou-louis-riel ", " ");
            texte = texte.Replace(" vallée-du-richelieu ", " ");
            texte = texte.Replace(" rimouski-neigette ", " ");
            texte = texte.Replace(" cest ", " ");
            texte = texte.Replace(" sept-le ", " ");
            texte = texte.Replace(" dir ", " ");
            texte = texte.Replace(" gréber ", " ");
            texte = texte.Replace(" montérégie ", " ");
            texte = texte.Replace(" lebel-sur-quévillon ", " ");
            texte = texte.Replace(" arthabaska-le ", " ");
            texte = texte.Replace(" témiscouata ", " ");
            texte = texte.Replace(" lotbinière ", " ");
            texte = texte.Replace(" marie-victorin ", " ");
            texte = texte.Replace(" gap ", " ");
            texte = texte.Replace(" neufchâtel ", " ");
            texte = texte.Replace(" wendake ", " ");
            texte = texte.Replace(" cte-de-beaupré ", " ");
            texte = texte.Replace(" very ", " ");
            texte = texte.Replace(" thi ", " ");
            texte = texte.Replace(" wordl ", " ");
            texte = texte.Replace(" gré ", " ");
            texte = texte.Replace(" riley ", " ");
            texte = texte.Replace(" montréal-nord ", " ");
            texte = texte.Replace(" patrick's ", " ");
            texte = texte.Replace(" for ", " ");
            texte = texte.Replace(" will ", " ");
            texte = texte.Replace(" valcin ", " ");
            texte = texte.Replace(" this ", " ");
            texte = texte.Replace(" all ", " ");
            texte = texte.Replace(" not ", " ");
            texte = texte.Replace(" help ", " ");
            texte = texte.Replace(" next ", " ");
            texte = texte.Replace(" jolin-barrette ", " ");
            texte = texte.Replace(" end ", " ");
            texte = texte.Replace(" take ", " ");
            texte = texte.Replace(" happy ", " ");
            texte = texte.Replace(" with ", " ");
            texte = texte.Replace(" will ", " ");
            texte = texte.Replace(" who ", " ");
            texte = texte.Replace(" pleasure ", " ");
            texte = texte.Replace(" lachine ", " ");
            texte = texte.Replace(" plateau-mont-royal ", " ");
            texte = texte.Replace(" family ", " ");
            texte = texte.Replace(" oct ", " ");
            texte = texte.Replace(" news ", " ");
            texte = texte.Replace(" doctor ", " ");
            texte = texte.Replace(" always ", " ");
            texte = texte.Replace(" quebecer ", " ");
            texte = texte.Replace(" liberal ", " ");
            texte = texte.Replace(" francoislegault ", " ");
            texte = texte.Replace(" kuujjuaq ", " ");
            texte = texte.Replace(" gov ", " ");
            texte = texte.Replace(" what ", " ");
            texte = texte.Replace(" are ", " ");
            texte = texte.Replace(" 14h00 ", " ");
            texte = texte.Replace(" voted ", " ");
            texte = texte.Replace(" learn ", " ");
            texte = texte.Replace(" domanglade ", " ");
            texte = texte.Replace(" build ", " ");
            texte = texte.Replace(" until ", " ");
            texte = texte.Replace(" 17h00 ", " ");
            texte = texte.Replace(":--", "");
            texte = texte.Replace(" north ", " ");
            texte = texte.Replace(" liberalquebec ", " ");
            texte = texte.Replace(" wordl ", " ");
            texte = texte.Replace(" riding ", " ");
            texte = texte.Replace(" notre-dame-de-grâce ", " ");
            texte = texte.Replace(" magog ", " ");
            texte = texte.Replace(" wonderful ", " ");
            texte = texte.Replace(" le-des-soeurs ", " ");
            texte = texte.Replace(" attended ", " ");
            texte = texte.Replace(" wowww ", " ");
            texte = texte.Replace(" marie-victorin ", " ");
            texte = texte.Replace(" chambly ", " ");
            texte = texte.Replace(" mathi ", " ");
            texte = texte.Replace(" mat ", " ");
            texte = texte.Replace(" chevrett ", " ");
            texte = texte.Replace(" repentigny ", " ");
            texte = texte.Replace(" masson ", " ");
            texte = texte.Replace(" mascouche ", " ");
            texte = texte.Replace(" est-du-québec ", " ");
            texte = texte.Replace(" -&gt ", " ");
            texte = texte.Replace(" ngm ", " ");
            texte = texte.Replace(" matane ", " ");
            texte = texte.Replace(" rousseau ", " ");
            texte = texte.Replace(" miti ", " ");
            texte = texte.Replace(" joliette ", " ");
            texte = texte.Replace(" marie-victorin ", " ");
            texte = texte.Replace(" saint-jérm ", " ");
            texte = texte.Replace(" paulplamondon ", " ");
            texte = texte.Replace(" extension ", " ");
            texte = texte.Replace(" carleton-sur-mer ", " ");
            texte = texte.Replace(" moulinoi ", " ");
            texte = texte.Replace(" villemascouche ", " ");
            texte = texte.Replace(" chevrett ", " ");
            texte = texte.Replace(" sylvaingaudrea ", " ");
            texte = texte.Replace(" log ", " ");
            texte = texte.Replace(" pope ", " ");
            texte = texte.Replace(" falloir ", " ");
            texte = texte.Replace(" longueuil ", " ");
            texte = texte.Replace(" richmond ", " ");
            texte = texte.Replace(" laurier-dorion ", " ");
            texte = texte.Replace(" housing ", " ");
            texte = texte.Replace(" rer ", " ");
            texte = texte.Replace(" roger ", " ");
            texte = texte.Replace(" émilise ", " ");
            texte = texte.Replace(" inr ", " ");
            texte = texte.Replace(" jérmienne ", " ");
            texte = texte.Replace(" jérmien ", " ");
            texte = texte.Replace(" manon-mobile ", " ");
            texte = texte.Replace(" renaître-chantal ", " ");
            texte = texte.Replace(" por ", " ");
            texte = texte.Replace(" with ", " ");
            texte = texte.Replace(" saint-henri-sainte-anne ", " ");
            texte = texte.Replace(" sorel-tracy ", " ");
            texte = texte.Replace(" sainte-adèle ", " ");
            texte = texte.Replace(" universitelaval ", " ");
            texte = texte.Replace(" paulplamondon ", " ");
            texte = texte.Replace(" compte ", " ");
            texte = texte.Replace(" lévesqu ", " ");
            texte = texte.Replace(" -&gt ", " ");
            texte = texte.Replace("-parce ",  "");
            texte = texte.Replace("-gnd", "");
            texte = texte.Replace(" mascouche ", " ");
            texte = texte.Replace(" candidat-être ", " ");
            texte = texte.Replace(" prevostconservateur ", " ");
            texte = texte.Replace(" iberville ", " ");
            texte = texte.Replace(" natashquan ", " ");
            texte = texte.Replace(" laval-des-rapide ", " ");
            texte = texte.Replace(" seek ", " ");
            texte = texte.Replace(" liberalquebec  ", " ");
            texte = texte.Replace(" speak ", " ");
            texte = texte.Replace(" school ", " ");
            texte = texte.Replace(" everyone ", " ");
            texte = texte.Replace(" news ", " ");
            texte = texte.Replace(" congrès-jeune ", " ");
            texte = texte.Replace(" zoom  ", " ");
            texte = texte.Replace("-&gt", "");
            texte = texte.Replace(" châteauguay ", " ");
            texte = texte.Replace(" lagune ", " ");
            texte = texte.Replace(" freedom ", " ");
            texte = texte.Replace(" mainstreet ", " ");
            texte = texte.Replace(" éliot ", " ");
            texte = texte.Replace(" tribune-sherbrooke ", " ");
            texte = texte.Replace(" maïté ", " ");
            texte = texte.Replace(" charlevoix ", " ");
            texte = texte.Replace("maritimeE-", "");
            texte = texte.Replace(" liberalquebec ", " ");
            texte = texte.Replace(" that ", " ");
            texte = texte.Replace(" more ", " ");
            texte = texte.Replace(" was ", " ");
            texte = texte.Replace(" stanstead ", " ");
            texte = texte.Replace(" out ", " ");
            texte = texte.Replace(" their ", " ");
            texte = texte.Replace(" official ", " ");
            texte = texte.Replace(" her ", " ");
            texte = texte.Replace(" saint-henrisainte- ", " ");
            texte = texte.Replace(" campaign ", " ");
            texte = texte.Replace(" congrès-jeune ", " ");
            texte = texte.Replace(" remembered ", " ");
            texte = texte.Replace(" opening ", " ");
            texte = texte.Replace(" omerta ", " ");
            texte = texte.Replace(" sentence ", " ");
            texte = texte.Replace("-paulplamondon", "");
            texte = texte.Replace(" sylvaingaudrea ", " ");
            texte = texte.Replace(" rosemont ", " ");
            texte = texte.Replace(" gaspésie ", " ");
            texte = texte.Replace(" paulin ", " ");
            texte = texte.Replace(" camille- ", " ");
            texte = texte.Replace(" matane-matapédia ", " ");
            texte = texte.Replace(" tadoussac ", " ");
            texte = texte.Replace(" tessier ", " ");
            texte = texte.Replace(" laurette ", " ");
            texte = texte.Replace("-gnd", "");
            texte = texte.Replace(" châteauguay ", " ");
            texte = texte.Replace("-gnadeaudubois", "");
            texte = texte.Replace(" lagune ", " ");
            texte = texte.Replace(" militant-être ", " ");
            texte = texte.Replace(" prêt-être ", " ");
            texte = texte.Replace("ste-anne-de-plaine", "");
            texte = texte.Replace(" sasktel ", " ");
            texte = texte.Replace(" half ", " ");
            texte = texte.Replace(" wage ", " ");
            texte = texte.Replace(" mainstreet ", " ");
            texte = texte.Replace(" stephanie ", " ");
            texte = texte.Replace(" that ", " ");
            texte = texte.Replace(" berthierville ", " ");
            texte = texte.Replace(" mia ", " ");
            texte = texte.Replace(" marcott ", " ");
            texte = texte.Replace(" dooly's ", " ");
            texte = texte.Replace(" farnham ", " ");
            texte = texte.Replace(" knowlton ", " ");
            texte = texte.Replace(" hello ", " ");
            texte = texte.Replace(" numbers ", " ");
            texte = texte.Replace(" waterloo ", " ");
            texte = texte.Replace(" beauc-sud ", " ");
            texte = texte.Replace(" à ", " ");
            texte = texte.Replace(" portneuf ", " ");
            texte = texte.Replace(" bordeaux ", " ");
            texte = texte.Replace(" mocador ", " ");
            texte = texte.Replace("-duhaime", "");
            texte = texte.Replace(" bordua ", " ");
            texte = texte.Replace(" eric ", " ");
            texte = texte.Replace(" chauveau ", " ");
            texte = texte.Replace(" mckinsey ", " ");
            texte = texte.Replace(" pointe-clair ", " ");
            texte = texte.Replace(" beauceville ", " ");
            texte = texte.Replace(" éliot ", " ");
            texte = texte.Replace(" capitale-national ", " ");
            texte = texte.Replace(" laval ", " ");
            texte = texte.Replace(" had ", " ");
            texte = texte.Replace(" about ", " ");
            texte = texte.Replace(" how ", " ");
            texte = texte.Replace(" joey ", " ");
            texte = texte.Replace(" jasmin ", " ");
            texte = texte.Replace(" samuel ", " ");
            texte = texte.Replace(" perron ", " ");
            texte = texte.Replace(" emeric ", " ");
            texte = texte.Replace(" thomas ", " ");
            texte = texte.Replace(" startup ", " ");
            texte = texte.Replace(" renaître-lévesqu ", " ");
            texte = texte.Replace(" other ", " ");
            texte = texte.Replace(" defender ", " ");
            texte = texte.Replace(" sstonge ", " ");
            texte = texte.Replace(" taschereau ", " ");
            texte = texte.Replace(" jdemontreal ", " ");
            texte = texte.Replace(" ouep ", " ");
            texte = texte.Replace(" jefffillion ", " ");
            texte = texte.Replace(" choiradiox ", " ");
            texte = texte.Replace(" other ", " ");
            texte = texte.Replace(" enough ", " ");
            texte = texte.Replace(" richelieu ", " ");
            texte = texte.Replace(" you ", " ");
            texte = texte.Replace(" bennedict ", " ");
            texte = texte.Replace(" was ", " ");
            texte = texte.Replace(" jdq ", " ");
            texte = texte.Replace(" mont-royal ", " ");
            texte = texte.Replace(" great ", " ");
            texte = texte.Replace(" rénald ", " ");
            texte = texte.Replace(" children ", " ");
            texte = texte.Replace(" merezhko ", " ");
            texte = texte.Replace(" name ", " ");
            texte = texte.Replace(" cliff ", " ");
            texte = texte.Replace(" stanstead ", " ");
            texte = texte.Replace(" mansonvill ", " ");
            texte = texte.Replace(" jdm ", " ");
            texte = texte.Replace(" newport ", " ");
            texte = texte.Replace(" moé ", " ");
            texte = texte.Replace(" patro ", " ");
            texte = texte.Replace(" mont-royal-outremont ", " ");
            texte = texte.Replace(" khmarou ", " ");
            texte = texte.Replace(" sanguinet ", " ");
            texte = texte.Replace(" josett ", " ");
            texte = texte.Replace(" arcy-mcgee ", " ");
            texte = texte.Replace(" live ", " ");
            texte = texte.Replace(" verchère ", " ");
            texte = texte.Replace(" montarvill ", " ");
            texte = texte.Replace(" donnacona-candidat ", " ");
            texte = texte.Replace(" samson ", " ");
            texte = texte.Replace(" presse-annonce ", " ");
            texte = texte.Replace(" châteauguay ", " ");
            texte = texte.Replace(" hull ", " ");
            texte = texte.Replace(" laval-des-rapide ", " ");
            texte = texte.Replace(" carmer ", " ");
            texte = texte.Replace(" boucherville ", " ");
            texte = texte.Replace(" chaudière-appalaches ", " ");
            texte = texte.Replace(" school ", " ");
            texte = texte.Replace(" everyone ", " ");
            texte = texte.Replace(" news ", " ");
            texte = texte.Replace(" goldbloom ", " ");
            texte = texte.Replace(" waiting ", " ");
            texte = texte.Replace(" going ", " ");
            texte = texte.Replace(" meeting ", " ");
            texte = texte.Replace(" youth ", " ");
            texte = texte.Replace(" west ", " ");
            texte = texte.Replace(" joachim ", " ");
            texte = texte.Replace(" bonaventure ", " ");
            texte = texte.Replace(" paulin ", " ");
            texte = texte.Replace(" sol ", " ");
            texte = texte.Replace(" baie-saint-paul ", " ");
            texte = texte.Replace(" marceau ", " ");
            texte = texte.Replace(" charlevoixcte-de-beaupré ", " ");
            texte = texte.Replace(" saint-eustache ", " ");
            texte = texte.Replace(" ready ", " ");
            texte = texte.Replace(" registry ", " ");
            texte = texte.Replace(" outag ", " ");
            texte = texte.Replace(" unit ", " ");
            texte = texte.Replace(" solve ", " ");
            texte = texte.Replace(" back ", " ");
            texte = texte.Replace(" marceau ", " ");
            texte = texte.Replace(" granby ", " ");
            texte = texte.Replace(" saint-roch-des-aulnaies ", " ");
            texte = texte.Replace(" giacomo ", " ");
            texte = texte.Replace(" gascon-nadon ", " ");
            texte = texte.Replace(" ex-conseiller ", " ");
            texte = texte.Replace(" lemay-thivierge ", " ");
            texte = texte.Replace(" he's ", " ");
            texte = texte.Replace("'s", "");
            texte = texte.Replace(" anjou ", " ");
            texte = texte.Replace(" bertrand ", " ");
            texte = texte.Replace(" rimouski ", " ");
            texte = texte.Replace(" richelieu ", " ");
            texte = texte.Replace(" chertsey ", " ");
            texte = texte.Replace(" pointelier ", " ");
            texte = texte.Replace(" montréalestoi ", " ");
            texte = texte.Replace(" sanguinet ", " ");
            texte = texte.Replace(" jai ", " ");
            texte = texte.Replace(" diplmé ", " diplômé ");
            texte = texte.Replace(" more ", " ");
            texte = texte.Replace(" time ", " ");
            texte = texte.Replace(" thank ", " ");
            texte = texte.Replace(" saint-sauveur ", " ");
            texte = texte.Replace(" today ", " ");
            texte = texte.Replace(" our ", " ");
            texte = texte.Replace(" student ", " ");
            texte = texte.Replace(" 8:00 ", " ");
            texte = texte.Replace(" 10h00 ", " ");
            texte = texte.Replace(" during ", " ");
            texte = texte.Replace(" strong ", " ");
            texte = texte.Replace(" game ", " ");
            texte = texte.Replace(" benny ", " ");
            texte = texte.Replace(" federalist ", " ");
            texte = texte.Replace(" anyone ", " ");
            texte = texte.Replace(" cop-québec ", " ");
            texte = texte.Replace("-domanglade", "");
            texte = texte.Replace(" nord-ctier ", " ");
            texte = texte.Replace(" terrebonne ", " ");
            texte = texte.Replace(" cte-nord ", " ");
            texte = texte.Replace(" matane-matapédia ", " ");
            texte = texte.Replace(" daniel ", " ");
            texte = texte.Replace(" lévis-québec-lebourgneuf ", " ");
            texte = texte.Replace(" rimouski ", " ");
            texte = texte.Replace(" hochelaga-maisonneuve ", " ");
            texte = texte.Replace(" ère ", " ");
            texte = texte.Replace("-gnd", "");
            texte = texte.Replace(" also ", " ");
            texte = texte.Replace(" rouyn-noranda ", " ");
            texte = texte.Replace(" crisis ", " ");
            texte = texte.Replace(" reduce ", " ");
            texte = texte.Replace(" berthierville ", " ");
            texte = texte.Replace(" pointe-clair ", " ");
            texte = texte.Replace(" thanks ", " ");
            texte = texte.Replace(" come ", " ");
            texte = texte.Replace(" crisis ", " ");
           /* List<string> mots = new List<string>();
            mots.Add("pompe");
            mots.Add("pertinence");
            mots.Add("laisse");
            mots.Add("brûle");
            mots.Add("porte - parole ");
            mots.Add("no11");
            mots.Add("essayer");
            mots.Add("désordonné");
            mots.Add("provoquer");
            mots.Add("charrue");
            mots.Add("buf");
            mots.Add("amont");
            mots.Add("immédiatement");
            mots.Add("interprofessionnel");
            mots.Add("réglementer");
            mots.Add("rassembler");
            mots.Add("investiture");
            mots.Add("plq");
            mots.Add("charleboi");
            mots.Add("attitrer");
            mots.Add("soulage");
            mots.Add("dédication");
            mots.Add("accru");
            mots.Add("désire");
            mots.Add("soulanges");
            mots.Add("dignement");
            mots.Add("ardemment");
            mots.Add("st - amourcomptabilise ");
            mots.Add("milite");
            mots.Add("organisateur");
            mots.Add("congrès - jeune ");
            mots.Add("robert - bourassa ");
            mots.Add("comptabiliser");
            mots.Add("nez");
            mots.Add("rouge");
            mots.Add("fortement");
            mots.Add("postpandémi");
            mots.Add("orgcatherine - st - amour ");
            mots.Add("laporte");
            mots.Add("marguerite - bourgeoys ");
            mots.Add("émotion");
            mots.Add("accompliau");
            mots.Add("2008 - 2012 ");
            mots.Add("2014 - 2017 ");*/

            for (var lettre = 'a'; lettre <= 'z'; lettre++) // Retire toutes les lettres seules
            {
                texte = texte.Replace(" " + lettre + " ", " ");
            }
            texte = texte.Replace(" . ", ".");
            texte = texte.Replace(" , ", ",");


            return texte.Trim();
        }
        public static string RemoveTags(string texte)
        {
            var newText = "";
            var tags = texte.Split(new char[] { ' ', '\n' });
            foreach (var tag in tags)
            {
                if (tag == "")
                {
                    continue;
                }               
                if (tag[0] == '#' || tag.Contains("http") || tag[0] == '@') //Les # et les liens vers des sites sont très utilisé sur Twitter mais rendent le texte moins lisible alors on les retire
                {
                    if (tag[tag.Length - 1] == '.') //Variante lorsqu'on termine une phrase
                    {
                        newText += ". ";
                        continue;
                    }
                    if (tag[tag.Length - 1] == ',') //Variante lorsqu'on a une virgule
                    {
                        newText += ", ";
                        continue;
                    }
                    continue;
                }
                newText += tag + " "; //Lorsque c'est un mot régulier on l'ajoute au nouveau texte
            }
            
            newText = newText.Replace(" .", "."); //Pour retirer l'espace avant le point
            newText = newText.Replace(" ,", ","); //Pour retirer l'espace avant la virgule
            newText = newText.Replace(" .", "."); //Pour retirer l'espace avant le point
            newText = newText.Replace(" ,", ","); //Pour retirer l'espace avant la virgule
            newText = newText.Replace(",,", ","); //Pour retirer deux virgules qui se suivent
            newText = newText.Replace("..", "."); //Pour retirer deux points qui se suivent
            newText = newText.Replace("  ", " "); //Pour redirer les espacement double
            newText = newText.Trim(); //Pour retirer l'espacement à la fin et au début du texte
            return newText;
            
        }

        public static string RemoveTagsTweet(string texte)
        {
            var newText = "";
            var tags = texte.Split(new char[] { ' ', '\n' });
            foreach (var tag in tags)
            {
                if (tag == "")
                {
                    continue;
                }
                if (tag[0] == '@') //Lorsqu'un mot commence par @ c'est un tag d'un autre compte alors on le remplace par le mot compte
                {
                    if (tag[tag.Length - 1] == '.') //Variante lorsqu'on termine une phrase
                    {
                        newText += "compte. ";
                        continue;
                    }
                    if (tag[tag.Length - 1] == ',') //Variante lorsqu'on a une virgule
                    {
                        newText += "compte, ";
                        continue;
                    }
                    newText += "compte ";
                }
                newText += tag + " "; //Lorsque c'est un mot régulier on l'ajoute au nouveau texte

            }
            return newText;
        }


        public static string AddPoint(string texte)
        {
            texte = texte.Trim();
            //Lorsque le texte ne termine pas par . ou !
            if (texte.EndsWith(".") || texte.EndsWith("!"))
            {
                return texte;
            }
            texte += ".";
            return texte;
        }
    }
}
