CREATE TABLE Parti
(
	PartiID smallint not null PRIMARY KEY,
	Nom varchar(60) not null,
	Abreviation varchar(10) not null
);

CREATE TABLE Media
(
	MediaID smallint not null PRIMARY KEY,
	Nom varchar(40) not null,
	Officiel bit
);

CREATE TABLE Publication
(
	PublicationID int identity(1,1) not null PRIMARY KEY,
	MediaID smallint not null FOREIGN KEY REFERENCES Media(MediaID),
	PublicationMediaID bigint,
	MediaUserID bigint null ,
	Titre varchar(500),
	Texte text,
	PublicationDate datetime not null,
	UrlPublication text,
);

CREATE TABLE Region
(
	RegionID smallint not null PRIMARY KEY,
	Nom varchar(30) not null
)

CREATE TABLE Circonscription
(
	CirconscriptionID smallint not null PRIMARY KEY,
	Nom varchar(60) not null,
	RegionID smallint not null FOREIGN KEY REFERENCES Region(RegionID)
)

CREATE TABLE Personne 
(
	PersonneID smallint not null PRIMARY KEY,
	Prenom varchar(40) not null,
	Nom varchar(40) not null,
	Genre char,
	Age tinyint null,
	PartiID smallint FOREIGN KEY REFERENCES Parti(PartiID),
	CirconscriptionID smallint  FOREIGN KEY REFERENCES Circonscription(CirconscriptionID),
	Actif bit default 1
);

CREATE TABLE PersonneMedia
(
	PersonneID smallint not null FOREIGN KEY REFERENCES Personne(PersonneID),
	MediaID smallint not null FOREIGN KEY REFERENCES Media(MediaID),
	MediaUserID bigint,
	Surnom varchar(60),
	primary key (PersonneID, MediaID)
);

CREATE TABLE ChefParti
(
	PersonneID smallint not null FOREIGN KEY REFERENCES Personne(PersonneID),
	PartiID smallint not null FOREIGN KEY REFERENCES Parti(PartiID),
	Primary Key (PersonneID, PartiID)
)

CREATE TABLE PartiMedia
(
	PartiID smallint not null FOREIGN KEY REFERENCES Parti(PartiID),
	MediaID smallint not null FOREIGN KEY REFERENCES Media(MediaID),
	MediaUserID bigint,
	Surnom varchar(60),
)

CREATE TABLE Theme
(
	ThemeID smallint not null PRIMARY KEY,
	Nom varchar(50) not null
)

CREATE TABLE DictionnaireTheme
(
	ThemeID smallint not null FOREIGN KEY REFERENCES Theme(ThemeID),
	Mot varchar(50) not null
	PRIMARY KEY (ThemeID, Mot)
)
INSERT INTO Theme (ThemeID,Nom) VALUES (1,'Économie')
INSERT INTO DictionnaireTheme (ThemeID,Mot) VALUES (1,'dollar')
INSERT INTO DictionnaireTheme (ThemeID,Mot) VALUES (1,'millions$')
INSERT INTO DictionnaireTheme (ThemeID,Mot) VALUES (1,'fiscal')


--INSERTS
--REGION
INSERT INTO Region (RegionID,Nom) VALUES (1,'Bas-Saint-Laurent')
INSERT INTO Region (RegionID,Nom) VALUES (2,'Saguenay-Lac-Saint-Jean')
INSERT INTO Region (RegionID,Nom) VALUES (3,'Capitale-Nationale')
INSERT INTO Region (RegionID,Nom) VALUES (4,'Mauricie')
INSERT INTO Region (RegionID,Nom) VALUES (5,'Estrie')
INSERT INTO Region (RegionID,Nom) VALUES (6,'Montréal')
INSERT INTO Region (RegionID,Nom) VALUES (7,'Outaouais')
INSERT INTO Region (RegionID,Nom) VALUES (8,'Abitibi-Teminscamingue')
INSERT INTO Region (RegionID,Nom) VALUES (9,'Côte-Nord')
INSERT INTO Region (RegionID,Nom) VALUES (10,'Nord-du-Québec')
INSERT INTO Region (RegionID,Nom) VALUES (11,'Gaspésie-Îles-de-la-Madelaine')
INSERT INTO Region (RegionID,Nom) VALUES (12,'Chaudière-Appalaches')
INSERT INTO Region (RegionID,Nom) VALUES (13,'Laval')
INSERT INTO Region (RegionID,Nom) VALUES (14,'Lanaudière')
INSERT INTO Region (RegionID,Nom) VALUES (15,'Laurentides')
INSERT INTO Region (RegionID,Nom) VALUES (16,'Montérigie')
INSERT INTO Region (RegionID,Nom) VALUES (17,'Centre-du-Québec')

--CIRCONSCRIPTIONS
--ABITIBI-TEMISCAMINGUE
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (1,'Abitibi-Est',8)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (2,'Abitibi-Ouest',8)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (3,'Rouyn-Noranda–Témiscamingue',8)
--BAS-ST-LAURENT
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (4,'Côte-du-Sud',1)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (5,'Matane-Matapédia',1)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (6,'Rimouski',1)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (7,'Rivière-du-Loup–Témiscouata',1)
--Capitale-Nationale
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (8,'Charlesbourg',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (9,'Charlevoix–Côte-de-Beaupré',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (10,'Chauveau',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (11,'Jean-Lesage',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (12,'Jean-Talon',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (13,'La Peltrie',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (14,'Louis-Hébert',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (15,'Montmorency',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (16,'Portneuf',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (17,'Taschereau',3)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (18,'Vanier-Les Rivières',3)
--CENTRE-DU-QUEBEC
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (19,'Arthabaska',17)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (20,'Drummond–Bois-Francs',17)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (21,'Johnson',17)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (22,'Nicolet-Bécancour',17)
--CHAUDIERE-APPALACHE
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (23,'Beauce-Nord',12)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (24,'Beauce-Sud',12)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (25,'Bellechasse',12)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (26,'Chutes-de-la-Chaudière',12)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (27,'Lévis',12)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (28,'Lotbinière-Frontenac',12)
--COTE-NORD
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (29,'Duplessis ',9)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (30,'René-Lévesque',9)
--ESTRIE
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (31,'Brome-Missisquoi',5)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (32,'Granby',5)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (33,'Mégantic',5)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (34,'Orford',5)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (35,'Richmond',5)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (36,'Saint-François',5)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (37,'Sherbrooke',5)
--GASPESIE-ILES-DE-LA-MADELAINE
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (38,'Bonaventure',11)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (39,'Gaspé',11)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (40,'Îles-de-la-Madeleine',11)
--LANAUDIERE
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (41,'Berthier',14)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (42,'Bertrand ',14)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (43,'Joliette',14)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (44,'L''Assomption',14)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (45,'Masson',14)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (46,'Repentigny',14)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (47,'Rousseau',14)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (48,'Terrebonne',14)
--LAURENTIDES
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (49,'Argenteuil',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (50,'Blainville',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (51,'Deux-Montagnes',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (52,'Groulx',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (53,'Labelle',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (54,'Les Plaines ',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (55,'Mirabel',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (56,'Prévost',15)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (57,'Saint-Jérôme',15)
--LAVAL
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (58,'Chomedey',13)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (59,'Fabre',13)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (60,'Laval-des-Rapides',13)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (61,'Mille-Îles',13)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (62,'Sainte-Rose',13)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (63,'Vimont',13)
--MAURICIE
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (64,'Champlain',4)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (65,'Laviolette–Saint-Maurice',4)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (66,'Maskinongé',4)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (67,'Trois-Rivières',4)
--MONTEREGIE
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (68,'Beauharnois',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (69,'Borduas',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (70,'Chambly',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (71,'Châteauguay',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (72,'Huntingdon',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (73,'Iberville',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (74,'La Pinière',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (75,'Laporte',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (76,'La Prairie',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (77,'Marie-Victorin',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (78,'Montarville',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (79,'Richelieu',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (80,'Saint-Hyacinthe',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (81,'Saint-Jean',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (82,'Sanguinet',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (83,'Soulanges',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (84,'Taillon',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (85,'Vachon',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (86,'Vaudreuil',16)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (87,'Verchères',16)
--MONTREAL
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (88,'Acadie',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (89,'Anjou–Louis-Riel',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (90,'Bourassa-Sauvé',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (91,'Camille-Laurin',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (92,'D''Arcy-McGee',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (93,'Gouin',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (94,'Hochelaga-Maisonneuve',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (95,'Jacques-Cartier',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (96,'Jeanne-Mance—Viger',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (97,'LaFontaine',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (98,'Laurier-Dorion',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (99,'Marguerite-Bourgeoys',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (100,'Marquette',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (101,'Maurice-Richard',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (102,'Mercier',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (103,'Mont-Royal–Outremont',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (104,'Nelligan',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (105,'Notre-Dame-de-Grâce',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (106,'Pointe-aux-Trembles',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (107,'Robert-Baldwin',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (108,'Rosemont',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (109,'Saint-Henri—Sainte-Anne',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (110,'Saint-Laurent',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (111,'Sainte-Marie—Saint-Jacques',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (112,'Verdun',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (113,'Viau',6)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (114,'Westmount—Saint-Louis',6)
--NORD-DU-QUEBEC
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (115,'Ungava',10)
--OUTAOUAIS
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (116,'Chapleau',7)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (117,'Gatineau',7)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (118,'Hull',7)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (119,'Papineau',7)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (120,'Pontiac',7)
--SAGUENAY-LAC-ST-JEAN
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (121,'Chicoutimi',2)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (122,'Dubuc',2)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (123,'Jonquière',2)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (124,'Lac-Saint-Jean',2)
INSERT INTO Circonscription (CirconscriptionID,Nom,RegionID) VALUES (125,'Roberval',2)

--MEDIA
INSERT INTO Media (MediaID,Nom,Officiel) values (1,'SiteWeb',1)
INSERT INTO Media (MediaID,Nom,Officiel) values (2,'Twitter',0)
INSERT INTO Media (MediaID,Nom,Officiel) values (3,'Facebook',0)
INSERT INTO Media (MediaID,Nom,Officiel) values (4,'Instagram',0)
INSERT INTO Media (MediaID,Nom,Officiel) values (5,'Publicite',1)
INSERT INTO Media (MediaID,Nom,Officiel) values (6,'CinqChefsUneElection',1)
INSERT INTO Media (MediaID,Nom,Officiel) values (7,'DébatDesChefs',1)
INSERT INTO Media (MediaID,Nom,Officiel) values (8,'FaceAFaceTVA',1)
INSERT INTO Media (MediaId,Nom,Officiel) values (9,'TLMP',1)

--PARTI
INSERT INTO Parti (PartiID,Nom,Abreviation) values (1,'Coalition Avenir Québec','CAQ')
INSERT INTO Parti (PartiID,Nom,Abreviation) values (2,'Parti Libéral du Québec','PLQ')
INSERT INTO Parti (PartiID,Nom,Abreviation) values (3,'Parti Québécois','PQ')
INSERT INTO Parti (PartiID,Nom,Abreviation) values (4,'Québec Solidaire','QS')
INSERT INTO Parti (PartiID,Nom,Abreviation) values (5,'Parti Conservateur du Québec','PCQ')
INSERT INTO Parti (PartiID,Nom,Abreviation) values (6,'Climat Quebec','CQ')

INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,7,1,'François Legault')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,8,1,'François Legault')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,7,2,'Dominique Anglade')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,8,2,'Dominique Anglade')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,7,3,'Gabriel Nadeau-Dubois')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,8,3,'Gabriel Nadeau-Dubois')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,7,4,'Paul St-Pierre Plamondon')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,8,4,'Paul St-Pierre Plamondon')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,7,5,'Éric Duhaime')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,8,5,'Éric Duhaime')


--PERSONNE
--CAQ
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,1,1,'CAQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,2,253850443,'coalitionavenir')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,3,100044148743861,'coalitionavenir')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,4,202372541,'coalition_avenir_quebec')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,5,1,'CAQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (1,6,1,'François Legault')


INSERT INTO Personne (PersonneID,Prenom,Nom,genre,Age,PartiID,CirconscriptionID) values (1,'François','Legault','H',65,1,44)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (1,2,260846506,'francoislegault')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (1,3,1231447420245619,'FrancoisLegaultPageOfficielle')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (1,4,10870741666,'francoislegault.pm')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (2,'Rosmeri','Otoya Celis','F',1,88)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (2,2,1522601717451350016,'AcadieRosmeriOC')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (2,3,114102297946896,'RosmeriOtoyaCelisCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (2,4,53110726502,'acadierosmerioc')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (3,'Karine','Boivin-Roy','F',1,89)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (3,2,1536408648758575105,'KarineBoivinRoy')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (3,3,107834771948676,'KarineBoivinRoyCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (3,4,8094797843,'karineboivinroy')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (4,'France-Elaine','Duranceau','F',1,42)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (4,2,1560717226948411396,'FEDuranceauCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (4,3,105617218933441,'FranceElaineDuranceauCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (4,4,54691688884,'franceelainedcaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (5,'Catherine','Blouin','F',1,38)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (5,2,824353970890084355,'CatherineBloui5')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (5,3,100795649365017,'CatherineBlouinCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (6,'Absa','Diallo','F',1,90)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (6,2,1529116245840248833,'ADialloCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (6,3,104541192247790,'AbsaDialloCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (7,'Kariane','Bourassa','F',1,9)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (7,2,131962016,'karianebCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (7,3,970831819744590,'karianeBourassaCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (7,4,269276509,'karianebourassa')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (8,'Marie-Belle','Gendron','F',1,71)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (8,3,105330508911011,'MarieBelleGendronCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (8,4,1140694379,'marie_belle_gendron')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (9,'George','Platanitis','H',1,58)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (9,2,1526260095604207617,'CAQChomedey')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (9,3,105835085458102,'GeorgePlatanitisCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (9,4,54074343256,'georgeplatanitiscaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (10,'Martine','Biron','F',1,26)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (10,2,148070069,'M_Biron')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (10,3,100128469486822,'MartineBironCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (10,4,769428736,'m_biron')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (11,'Junlian','Leblanc','F',1,92)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (11,2,1524383634832211968,'JunlianLeblanc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (11,3,100842205957957,'JunlianLeblancCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (11,4,184397256,'junlian.leblanc')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (12,'Kateri','Champagne-Jourdain','F',1,29)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (12,2,1560994298283364353,'CJKateri')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (12,3,106578818822147,'KateriChampagneJourdainCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (12,4,1652202209,'katericj')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (13,'Alice','Abou-Khalil','F',1,59)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (13,2,1118170137046265856,'aaboukhalilcaq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (13,3,233352950573342,'AliceAbouKhalilCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (13,4,6898966029,'aliceaboukhalilcaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (14,'Catherine','Pelletier','F',1,93)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (15,'Rebecca','McCann','F',1,94)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (15,2,1519801528210669568,'CaqHochelaga')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (15,3,100523209323619,'RebeccaMcCannCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (16,'Suzanne','Tremblay','F',1,118)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (16,3,100854146049810,'SuzanneTremblayCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (17,'Carole ','Mallette','F',1,72)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (17,3,103333529113061,'CaroleMalletteCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (18,'Audrey','Bogemans','F',1,73)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (18,2,945859902,'AudreyBogemans')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (18,3,100083289133515,'AudreyBogemansCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (19,'Jonathan','Lapierre','H',1,40)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (19,2,287974379,'jonlapierre1806')


INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (20,'Rébecca ','Guénard-Chouinard','F',1,95)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (20,2,1059288290,'RebeccaGuenardC')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (20,3,106998745458418,'RGuenardChouinardCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (21,'Christiane','Gamache','F',1,11)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (21,2,1518940961669320704,'GamacheCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (21,3,107518295281886,'ChristianeGCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (21,4,53568464578,'christianegamachecaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (22,'Julie','De Martino','F',1,96)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (22,2,1529458995009830912,'DeMartinoJulie1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (22,3,116567781034278,'JulieDeMartinoCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (23,'François','St-Louis','H',1,43)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (23,2,1531772959676841984,'FStLouisCAQ2')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (23,3,112961244739567,'FrancoisStLouisCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (23,4,8435358247,'francoisstlouiscaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (24,'Yannick','Gagnon','H',1,123)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (24,2,1527256537399443457,'YGagnonCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (24,3,100081253434015,'YannickGagnonCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (24,4,54284051012,'ygagnoncaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (25,'Loredana','Bacchi','F',1,97)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (25,2,1522288759332651009,'bacchiCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (25,3,100787392633223,'BacchiLoredanaCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (25,4,51402799123,'bacchiloredana')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (26,'Samuel','Gatien','H',1,74)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (26,2,1545156259904634880,'sgatien_caq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (26,3,111985814876823,'SamuelGatienCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (26,4,53738404472,'dr.Samuel.gatien')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (27,'Isabelle','Poulet','F',1,75)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (27,2,1531036565543206912,'IPouletCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (27,3,5276929219078145,'IsabellePouletCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (27,4,53395325917,'isabelle_poulet_caq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (28,'Vicki','Marcoux','F',1,98)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (28,2,1493982842245857281,'VickiMarcouxCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (28,3,103126929061945,'VickiMarcouxCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (28,4,53245975491,'vickimarcoux_caq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (29,'Céline','Haytayan','F',1,60)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (30,'Bernard','Drainville','H',1,27)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (30,2,26262426,'BDrainvilleQc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (30,3,100044289586681,'bernard.drainville')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (30,4,7516774106,'bernard.drainville')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (31,'Vicky','Michaud','F',1,99)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (31,2,1525842084044865537,'michaud_vicky')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (31,3,104874135551713,'VMichaudCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (31,4,53011953783,'vicky_michaud_caq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (32,'Marc','Baaklini','H',1,100)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (32,2,1525871175326478341,'MBaaklini_CAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (32,3,100081134923905,'MBaakliniCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (33,'Jean-Sébastien','Barriault','H',1,5)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (33,3,111629871657982,'JSBarriaultCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (34,'Audrey','Murray','F',1,101)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (34,2,1238906167864299522,'murrayaudrey2')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (34,3,106615492122545,'AudreyMurrayCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (35,'Florence','Lavictoire','F',1,102)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (35,2,1521494511758807047,'FLavictoire_CAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (35,3,114787857878087,'FlorenceLavictoireCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (36,'Julie','Séide','F',1,61)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (36,3,657841081,'JulieSeideCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (36,4,54279468618,'julieseidecaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (37,'Sarah','Beaumier','F',1,103)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (37,2,125157130,'SarahBeaumier')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (37,3,100064196102820,'SarahBeaumierPresidenteCEN')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (37,4,54297354469,'sarahbeaumiercaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (38,'Cynthia','Lapierre','F',1,104)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (38,2,1081392583,'CynthiaLapi')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (38,3,106727772087012,'CynthiaLapierreCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (39,'Geneviève','Lemay','F',1,105)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (39,2,1531370098967158790,'GenlemayCaq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (39,3,103194149082119,'GenevieveLemayCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (39,4,7724631821,'lemay_genevieve')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (40,'Corinne','Canuel-Jolicoeur','F',1,120)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (40,3,104530622372281,'corinneCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (41,'Sonia','Bélanger','F',1,56)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (41,2,1559937731375030275,'SBelangerCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (41,3,108291798561712,'SoniaBelangerCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (42,'Yves','Montigny','H',1,30)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (42,2,1534701141849776129,'yves_montigny')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (42,3,100063628574169,'YvesMontignyBC')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (42,4,364346370,'yvesmontigny')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (43,'Pascale','Déry','F',1,46)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (43,2,140254129,'PascaleDery')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (43,3,105886178853645,'PascaleDeryCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (44,'Maïté','Blanchette','F',1,6)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (44,2,1517552268329070594,'MaiteBVCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (44,3,100080493356810,'MaiteBlanchetteVezinaCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (44,4,7269114287,'maite.blanchette.vezina')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (45,'Amélie','Dionne','F',1,7)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (45,2,110534543,'AmelieDionne')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (45,3,104222698941654,'AmelieDionneCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (46,'Maïté','Beaudoin','F',1,107)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (46,2,1535275803138826240,'MBeaudoinCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (46,3,100710062660104,'MaiteBeaudoinCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (46,4,53704478989,'mbeaudoincaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (47,'Sandra','O’Connor','F',1,108)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (47,2,23058267,'sandramtl')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (47,3,100082071905200,'SOConnorCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (47,4,294165288,'sandraoconnormtl')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (48,'Daniel','Bernard','H',1,3)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (48,2,100874012758520,'DBernardCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (49,'Nicolas','Huard-Isabelle','H',1,109)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (49,2,1541469030825041922,'NIsabelleCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (49,3,116688854351994,'NicolasHuardIsabelleCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (49,4,53898656828,'nisabellecaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (50,'Mélanie','Gauthier','F',1,110)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (50,3,100241089413869,'MelanieGauthierCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (50,4,10676812105,'melanie.gauthier')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (51,'Aurélie','Diep','F',1,111)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (51,2,1442681834073206785,'aurelie_diep')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (51,3,100080941103903,'AurelieDiepCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (51,4,53424662590,'aureliediepcaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (52,'Christine','Fréchette','F',1,82)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (53,'Caroline','St-Hilaire','F',1,37)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (53,2,199041858,'Sthilairec')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (53,3,106191722116692,'CarolineStHilaireCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (53,4,273463328,'sthilaire_caroline')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (54,'Pascale','St-Hilaire','F',1,17)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (54,2,1532757519826821120,'PStHilaireCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (54,3,102354732492306,'PascaleStHilaireCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (54,4,53570574593,'psthilairecaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (55,'Eve','Bélec','F',1,86)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (55,2,243018011,'evebelec')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (55,3,106894258725828,'EveBelecCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (56,'Suzanne','Roy','F',1,87)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (56,3,100080235523144,'SuzanneRoyCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (57,'Véronique','Tremblay','F',1,112)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (57,3,100063985001239,'VeroniqueTremblayCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (58,'Justine','Savard','F',1,113)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (58,2,1559664878650118145,'Justine_sviau')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (58,3,101748715930029,'JustineSavardCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (59,'Valérie','Schmaltz','F',1,63)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (59,2,1524181004080013312,'VSchmaltzCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (59,3,111008794934816,'ValerieSchmaltzCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (59,4,53532401219,'valerieschmaltzcaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (60,'Maria-Luisa','Torres-Piaggio','F',1,114)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (60,2,1529504576658972672,'CaqLouis')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (60,3,112899434735529,'MariaLuisaTorresPiaggioCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (60,4,4063564862,'marialuisatorres2002')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (61,'Joëlle','Boutin','F',1,12)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (61,2,143522123,'joelleboutin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (61,3,100058146666278,'joelleboutinjeantalon')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (61,4,2286353858,'joelleboutin_deputee')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (62,'Pierre','Dufour','H',1,1)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (62,2,1082670563997437952,'PDufourOfficiel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (62,3,100057849470574,'PierreDufourDeputeAbitibiEst')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (63,'Suzanne','Blais','F',1,2)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (63,2,1032634480459173893,'sblaiscaq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (63,3,100057990942544,'SuzanneBlaisCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (64,'Agnès','Grondin','F',1,49)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (64,3,100057775764029,'AgnesGrondinCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (65,'Éric','Lefebvre','H',1,19)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (65,2,783321962101768192,'EricLefebvreCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (65,3,100057827568346,'EricLefebvreArth')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (65,4,4936129225,'ericlefebvrearth')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (66,'Luc','Provençal','H',1,23)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (66,2,1330693457099296768,'luc_provencal')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (66,3,100057798529652,'LucProvencalCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (67,'Samuel','Poulin','H',1,24)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (67,2,2387024576,'Poulin_Samuel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (67,3,100058233752388,'SamuelPoulinBeauce')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (68,'Claude','Reid','H',1,68)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (68,2,2383509436,'creidcaq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (68,3,100058212513630,'ClaudeReidCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (68,4,10258478192,'claude.reid.beauharnois')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (69,'Stéphanie','Lachance','F',1,25)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (69,2,2395522572,'slachancecaq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (69,3,100058044311410,'StephanieLachanceBellechasse')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (70,'Caroline','Proulx','F',1,41)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (70,2,1462138874,'caroaubureau')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (70,3,100058246863632,'CarolineProulxMinistre')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (70,4,2707772693,'carolineaubureau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (71,'Nadine','Girault','F',1,42,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (71,2,849666388583227392,'NadineGirault')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (71,3,100058086068489,'NadineGiraultCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (71,4,8470197637,'nadine.girault')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (72,'Mario','Laframboise','H',1,50)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (72,2,2986505901,'LaframboiseMa')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (72,3,100058218153837,'Mario.Laframboise.blainville')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (73,'Simon','Jolin-Barrette','H',1,69)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (73,2,2453759612,'SJB_CAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (73,3,100044867234758,'SimonJolinBarrette.Borduas')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (73,4,3467218663,'simonjolinbarrette_borduas')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (74,'Richard','Campeau','H',1,91)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (74,2,1454163816816726016,'CampeauBourget')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (74,3,100000783856911,'richard.campeau.39')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (75,'Isabelle','Charest','F',1,31)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (75,2,269821489,'IsabelleCharest')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (75,3,100058208615077,'IsabelleCharestBRMI')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (75,4,2931777286,'charest_isabelle')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (76,'Jean-François','Roberge','H',1,70)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (76,2,701686616,'jfrobergeQc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (76,3,100050156754159,'roberge.chambly')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (76,4,3036923026,'jeanfrancoisroberge')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (77,'Sonia','LeBel','F',1,64)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (77,2,257671907,'slebel19')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (77,3,100058131606832,'SoniaLeBelCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (77,4,8420501114,'sonia_lebel')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (78,'Mathieu','Lévesque','H',1,116)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (78,2,1019274280255795200,'mlevesquecaq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (78,3,121510687,'mathieu.levesque.5')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (78,4,8235432170,'mathieulevesquecaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (79,'Jonatan','Julien','H',1,8)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (79,2,1076144373132378112,'JJulienCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (79,3,108947657680558,'JonatanJulienCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (80,'Émilie','Foster','F',1,9,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (80,2,1961385498,'Milie_Foster')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (80,3,100058060271659,'EmilieFosterCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (81,'MarieChantal','Chassé','F',1,71,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (81,2,951846877,'MarieChantalCha')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (81,3,100057845148313,'MarieChantalChasseCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (81,4,5469938572,'mariechantalchasse')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (82,'Sylvain','Lévesque','H',1,10)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (82,2,2502119838,'SLevesquedepute')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (82,3,100005107659897,'sylvain.levesque.7777')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (82,4,21908139492,'sylvainlevesquechauveau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (83,'Andrée','Laforest','F',1,121)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (83,2,1035203504321777670,'andreelaforest')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (83,3,100058218991850,'AndreeLaforestCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (83,4,41422434762,'andree_laforest')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (84,'Marc','Picard','H',1,26,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (84,2,281656237,'marcpicardqc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (84,3,1000881242,'marcpicard01')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (85,'Marie-Eve','Proulx','F',1,4,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (85,2,35878950,'marieeveproulx_')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (85,3,100057913574897,'MarieEveProulxCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (86,'Benoit','Charette','H',1,51)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (86,2,407061342,'CharetteB')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (86,3,100057996013247,'Charette.DeMo')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (86,4,41933751979,'benoit.charette.caq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (87,'Sébastien','Schneeberger','H',1,20)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (87,2,778229792999104513,'sebastien_dbf')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (87,3,100057865250581,'Schneeberger.coalition')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (87,4,4208002768,'sebastienschneeberger')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (88,'François','Tremblay','H',1,122)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (88,3,100057872839957,'FrancoisTremblayCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (89,'Robert','Bussière','H',1,117)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (89,3,100058012990457,'RobertBussiereGatineau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (90,'François','Bonnardel','H',1,32)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (90,2,198524266,'fbonnardelCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (90,3,100057895818698,'Francois.Bonnardel.Granby')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (91,'Eric','Girard','H',1,52)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (91,2,1054404904259895296,'ericgirardmfq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (91,3,100057992561837,'EricGirardGroulx')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (92,'Claire','IsaBelle','F',1,72,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (92,3,100058281992240,'Claire.IsaBelle.Huntingdon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (93,'André','Lamontagne','H',1,21)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (93,2,2560145641,'andrelamontagn2')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (93,3,100057788001164,'andrelamontagnecaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (94,'Chantale','Jeannotte','F',1,53)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (94,3,100057644966807,'ChantaleJeannotteCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (95,'Eric','Girard ','H',1,124)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (95,3,100057789230293,'EricGirardLacSaintJean')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (96,'Éric','Caire','H',1,13)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (96,2,45411228,'ericcaire')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (96,3,100057697703661,'caire.coalition')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (97,'Christian','Dubé','H',1,76)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (97,2,2806771192,'cdube_sante')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (97,3,100057967123686,'ChristianDubeLaPrairie')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (97,4,6799830485,'christian.dube.sante')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (98,'Marie-Louise','Tardif','F',1,65)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (98,3,100058021719820,'MarieLouiseTardifCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (99,'Lucie','Lecours','F',1,54)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (99,2,1295710649209806850,'LucieLecours')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (99,3,100057960164429,'LucieLecoursCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (100,'François','Paradis','H',1,27,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (100,2,2824132531,'fparadislevis')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (100,3,100057841249919,'francoisparadis.org')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (100,4,4159418674,'francoisparadislevis')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (101,'Isabelle','Lecours','F',1,28)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (101,2,897206796569464832,'ILecoursCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (101,3,100058256431303,'IsabelleLecoursCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (101,4,1906913286,'isabellelecours')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (102,'Geneviève','Guilbault','F',1,14)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (102,2,897201317223038976,'GGuilbaultCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (102,3,100050683170468,'GenevieveGuilbaultCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (102,4,11763930180,'genevieve.guilbault')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (103,'Shirley','Dorismond','F',1,77)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (103,2,1487850454771974147,'SDorismondCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (103,3,100069048135570,'ShirleyDorismondCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (103,4,18562309396,'sdorismondcaq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (104,'Simon','Allaire','H',1,66)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (104,2,978690144,'simonallaire')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (104,3,100057881147223,'SimonAllaireCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (105,'Mathieu','Lemay','H',1,45)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (105,2,2512892325,'mathieu_lemay')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (105,3,100058212695811,'Lemay.Masson')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (106,'Francois','Jacques','H',1,33)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (106,2,292036350,'criptor32')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (106,3,100057861828315,'FrancoisJacquesMEGA')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (107,'Sylvie','D''Amours','F',1,55)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (107,2,144133335,'sylviedamours')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (107,3,100057745254035,'sdamoursmira')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (107,4,5402911209,'sdamoursmira')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (108,'Nathalie','Roy','F',1,78)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (108,2,1739215765,'NathalieRoyCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (108,3,100057971354433,'nathalie.roy.montarville')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (109,'Jean-François','Simard','H',1,15)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (109,3,100058273622087,'JFSimardAssnat')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (110,'Donald','Martel','H',1,22)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (110,2,363958346,'domartell')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (110,3,100058120659318,'MartelD.coalition')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (111,'Gilles','Bélanger','H',1,34)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (111,2,1131233827697901569,'GillesB_langer')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (111,3,100058063629879,'GillesBelangerorford')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (111,4,13829714431,'g__belanger')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (112,'Mathieu','Lacombe','H',1,119)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (112,2,131552799,'lacombemathieu')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (112,3,100050198542273,'MathieuLacombeCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (112,4,5187960831,'lacombe.mathieu')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (113,'Chantal','Rouleau','F',1,106)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (113,2,135354841,'rouleauchantal')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (113,3,100058147475030,'Chantal.Rouleau.CAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (114,'Vincent','Caron','H',1,16)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (114,2,897202517427318786,'vincentcaroncaq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (114,3,100057834528324,'VincentCaronPortneuf')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (115,'Marguerite','Blais','F',1,56,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (115,2,731303736,'marguerite_caq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (115,3,100058140936501,'MBlaisCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (115,4,8494292091,'mblais.daisy')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (116,'Lise','Lavallée','F',1,46,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (116,2,500721559,'lavallelise')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (116,3,100057805701729,'lise.lavallee.repentigny')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (117,'Jean-Bernard','Emond','H',1,79)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (117,2,20733383,'JBEmond')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (117,3,100058012781241,'Jean.Bernard.Emond.Richelieu')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (118,'André','Bachand','H',1,35)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (118,3,100058278870564,'abachandCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (119,'Denis','Tardif','H',1,7,0)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (120,'Nancy','Guillemette','F',1,125)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (120,2,1060602755683889153,'Guillemette_CAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (120,3,100057746182373,'NancyGuillemetteRoberval')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (121,'Louis-Charles','Thouin','H',1,47)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (121,3,100058216983954,'LouisCharlesThouinCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (122,'Geneviève','Hébert','F',1,36)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (122,2,992859116765925376,'hebertgenevieve')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (122,3,100057657476426,'GenevieveHebertCoalitionAvenirQuebec')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (122,4,8190677434,'genevieve.hebert.caq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (123,'Chantal','Soucy','F',1,80)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (123,2,2557244252,'chantalsoucy2')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (123,3,100057925335554,'ChantalSoucyDeputee')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (123,4,3964322479,'soucy_chantalq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (124,'Louis','Lemieux','H',1,81)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (124,2,16369405,'louislemieux')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (124,3,100057889217309,'LouisLemieuxCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (125,'Youri','Chassin','H',1,57)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (125,2,384328203,'yourichassin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (125,3,100058264381118,'YouriChassin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (125,4,14351881345,'youri_chassin')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (126,'Christopher','Skeete','H',1,62)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (126,2,287459667,'cskeete')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (126,3,669605489,'christophercskeete')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (126,4,2052000386,'christopherskeete')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (127,'Danielle','McCann','F',1,82,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (127,2,1105569446729564160,'MinistreMcCann')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (127,3,100058201146015,'DanielleMcCannCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (128,'Marilyne','Picard','F',1,83)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (128,2,1023174291104387073,'picardmarilyne')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (128,3,100057993192602,'MarilynePicardCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (129,'Lionel','Carmant','H',1,84)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (129,2,924234705511346176,'CarmantLionel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (129,3,100057751553155,'LionelCarmantCAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (129,4,6162859899,'lionelcarmant')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (130,'Pierre','Fitzgibbon','H',1,48)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (130,2,1060222907698372609,'MinFitzgibbon')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (130,3,100057720355738,'PierreFitzgibbonCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (131,'Jean','Boulet','H',1,67)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (131,2,1075778321978482688,'jeanboulet10')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (131,3,100058234081402,'JeanBouletCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (132,'Denis','Lamothe','H',1,115)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (132,2,1455525064124866565,'DLamothe_CAQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (132,3,100058141626100,'DenisLamotheCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (133,'Ian','Lafrenière','H',1,85)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (133,2,2807339725,'IanLafreniere')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (133,3,100057875567440,'IanLafreniereVachon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (134,'Mario','Asselin','H',1,18)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (134,2,7173992,'marioasselin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (134,3,100057838459488,'asselin.coalition')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (135,'Suzanne','Dansereau','H',1,87,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (135,2,3092371594,'caq_vercheres')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (135,3,100058212303925,'SuzanneDansereauCAQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (136,'Mathieu','Rivest','H',1,4)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (137,'Stéphane','Sainte-Croix','H',1,39)


--PLQ
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,1,2,'PLQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,2,17814716,'LiberalQuebec')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,3,100044461598509,'LiberalQuebec')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,4,198084897,'liberalquebec')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,5,2,'PLQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (2,6,2,'Dominique Anglade')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (151,'Dominique','Anglade','F',2,109)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (151,2,472202033,'DomAnglade')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (151,3,100044303595571,'DomAnglade')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (152,'Alexandra','Veilleux','F',2,66)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (152,2,80753760,'alexmveilleux')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (152,3,100081839330091,'AlexandraMVeilleuxPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (153,'Alexandre','Mercho','H',2,50)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (153,2,1446794125592911874,'alexandremercho')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (153,3,100082035685416,'AlexandreMerchoPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (154,'Anabela','Monteiro','F',2,63)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (154,3,100081891258817,'anabelamonteiroplq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (155,'André','A. Morin','H',2,88)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (155,2,1530247954245865472,'AndreAMorinPLQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (155,3,100081811802976,'AndreAMorinPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (156,'André','Fortin','H',2,120)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (156,2,191861391,'AvecAndreFortin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (156,3,100058285411794,'AvecAndreFortin')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (157,'André','G. Nadeau','H',2,42)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (158,'Arnaud','Warolin','F',2,3)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (158,3,100000342574514,'arnaud.warolin.1')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (159,'Audrey','Medaino-Tardif','F',2,52)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (159,2,1281564150,'ODGErey')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (160,'Benjamin','Roy','H',2,81)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (161,'Byanca','Jeune','F',2,106)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (161,2,1549744453413371905,'ByancaJ00')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (161,3,614945708,'byanca.jeune')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (162,'Carlos','J. Leitão','H',2,107,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (162,2,3198693963,'carlosjleitao')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (162,3,100058153807838,'carlos.j.leitao.qc')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (163,'Caryl','Green','F',2,117)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (163,3,100075803000629,'CarylGreenPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (164,'Catherine','Boundjia','F',2,102)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (164,2,1271620283137495040,'CathBoundjia')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (164,3,100051507194103,'CatherineBoundjiaPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (165,'Catherine','St-Amour','F',2,83)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (165,2,317965596,'CathStAmour')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (165,3,100079852705617,'CatherineStAmourPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (166,'Chantal','Gagnon','F',2,89)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (166,2,239486713,'chantalgag')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (166,3,100072035892239,'ChantalGagnonPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (167,'Charles','Robert','H',2,11)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (167,2,16487543,'CharlesRobert')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (168,'Christina','Eyangos','F',2,91)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (168,2,1549860491429908480,'CEyangos')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (168,3,100005315897561,'ChristinaEyangos')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (169,'Christine','St-Pierre','F',2,88,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (169,2,589379390,'stpierre_ch')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (169,3,100057948255625,'Christine.StPierre.PLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (170,'Christopher','Baenninger','H',2,111)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (170,3,100084489410196,'ChristopherBaenningerPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (171,'Claude','Charron','H',2,36)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (171,3,567085692,'claude.charron')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (172,'Claude','Laroche','H',2,6)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (173,'Claude','Vadeboncoeur','H',2,31)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (173,2,1542227253664382985,'VadeboncoeurBM')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (173,3,100082284472851,'ClaudeVadeboncoeurPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (174,'Clermont','Rouleau','H',2,23)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (174,3,103318792467359,'ClermontRouleauPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (175,'David','Birnbaum','F',2,92,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (175,2,334864052,'DavidBirnbaum1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (175,3,100057802850939,'birnbaumdarcymcgee')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (176,'Deepak','Awasti','H',2,98)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (177,'Désirée','McGraw','F',2,105)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (177,2,458789217,'Desiree_McGraw')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (177,3,100045672713856,'DesireeMcGrawPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (178,'Dominic','Cardinal','H',2,14)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (178,2,1561029436690124806,'DomiCardinal')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (178,3,100084707892390,'DominicCardinalPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (179,'Elisabeth','Prass','F',2,92)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (179,2,1562191879164547074,'elisabeth_prass')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (180,'Elizabeth','Stavrakakis','F',2,54)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (181,'Enrico','Ciccone','H',2,100)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (181,2,154215401,'EnricoCiccone')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (181,3,100057676555973,'enrico.ciccone.plq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (182,'Filomena','Rotiroti','F',2,96)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (182,2,191929396,'filorotiroti')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (182,3,100058026131171,'FiloRotiroti')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (183,'Francine','Charbonneau','F',2,61,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (183,2,149150377,'mille_iles')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (183,3,100058210684582,'FCharbonneauMilleIles')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (184,'François','Beaulé','H',2,18)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (184,2,1952449040,'fbeauleplq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (184,3,100082549477980,'FrancoisBeaulePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (185,'François','Vaes','H',2,37)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (185,2,246444450,'francoisvaes')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (185,3,100063630708120,'francois.vaes.plq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (186,'Frantz','Benjamin','H',2,113)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (186,2,531390195,'franz_benjamin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (186,3,100002996051559,'frantz.benjamin.10')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (187,'Fred','Beauchemin','H',2,99)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (187,2,600168688,'FredBeauchemin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (187,3,100082048215710,'FredBeauchemin')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (188,'Frédéric','Doumalin','H',2,13)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (188,3,100084804962202,'FredericDoumalinPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (189,'Gabriel','Bourret','H',2,45)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (189,3,100069296760125,'GabrielBourretPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (190,'Gabriel','Lévesque','H',2,87)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (190,2,1326565881489596419,'GabLevsque')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (190,3,100082954745149,'GabrielLevesquePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (191,'Gaétan','Barrette','H',2,16)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (191,2,256071899,'drgbarrette')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (192,'Gil','Thériault','H',2,40)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (192,2,454207936,'GilTheriault')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (192,3,100083370639332,'GilTheriaultPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (193,'Gregory','Kelley','H',2,95)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (193,2,114283414,'gharperkelley')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (193,3,100057737933564,'AvecGregKelley')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (194,'Guy','Bourgeois','H',2,2)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (194,3,100083314782490,'GuyBourgeoisPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (195,'Hélène','David','F',2,99,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (195,2,2493093817,'David_Hlne')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (195,3,100058259130993,'plq.helenedavid')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (196,'Igor','Pivovar','H',2,10)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (196,2,93602180,'IgorPivovar')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (196,3,107346008750486,'IgorPivovarPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (197,'Isabella','Giosi','F',2,55)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (198,'Isabelle','Melançon','F',2,112)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (198,2,203750827,'Isamelancon')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (198,3,100058226761582,'MelanconIsabelle')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (199,'Jean','Rousselle','H',2,63,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (199,2,3115510509,'RousselleJean')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (199,3,100057983712967,'Jean.Rousselle.Vimont')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (200,'Jean-Claude','Poissant','H',2,72)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (200,2,2827020955,'PLCLaPrairieJCP')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (200,3,110266935112011,'JeanClaudePoissantPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (201,'Jean-François','Primeau','H',2,71)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (201,2,1478425350224949248,'Jean_FrancoisP')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (201,3,100080715019171,'JeanFrancoisPrimeauPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (202,'Jean-Maurice','Matte','H',2,1)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (202,3,100064137457652,'JeanMauriceMattePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (203,'Jennifer','Maccarone','F',2,114)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (203,2,129856086,'jmaccarone')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (203,3,100057894976779,'MaccaroneWSL')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (204,'Jérémy','Leblanc','H',2,64)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (204,2,1075178745047199744,'Leblancjeremy97')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (204,3,100084995791365,'JeremyLeblancPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (205,'Jonathan','Marleau','H',2,101)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (205,2,255280638,'JMrlt')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (205,3,100058111178428,'marleauj')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (206,'Julie','Guertin','F',2,76)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (206,3,100084880985989,'JulieGuertinPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (207,'Kathleen','Weil','F',2,105,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (207,2,600453895,'Kathleen_Weil')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (207,3,100057690295784,'KathleenWeilNDG')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (208,'Lindsay','Jean','F',2,48)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (208,2,1558568131706212353,'LindsayJn2')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (208,3,100084198746297)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (209,'Line','Flore Tchetmi','F',2,94)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (209,3,100084225635309,'LineFloreTchetmiPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (210,'Lise','Thériault','F',2,89,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (210,2,613754391,'LiseT_ALR')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (210,3,100057987792559,'LiseTheriaultplq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (211,'Luciana','Arantes','F',2,19)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (211,3,100084363445964,'LucianaArantesPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (212,'Lucie','Gagnon','F',2,78)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (212,3,100069121723695,'LucieGagnonPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (213,'Lyes','Chekal','H',2,77)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (213,2,1562813331315908608,'LyesChekalPLQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (213,3,100083321740028,'LyesChekalPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (214,'Mahamadou','Sissoko','H',2,8)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (214,2,332592971,'Sismah')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (215,'Marc','Allaire','H',2,51)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (216,'Marc','Blanchard','H',2,68)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (216,3,108146208673088,'MarcBlanchardPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (217,'Marc','Tanguay','H',2,97)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (217,2,68481292,'marc_tanguay')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (217,3,100058089040817,'m.tanguay.plq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (218,'Marie-Claude','Nichols','F',2,86)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (218,2,278844295,'nicholsmarieC')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (218,3,100057711863230,'marieclaudenicholsvaudreuil')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (219,'Marie-Josée','Jacques','F',2,22)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (219,2,1547273489241051136,'MarieJoseeJPLQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (219,3,100081869832483)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (220,'Martin','Plante','H',2,57)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (220,3,109423888468138,'MartinPlantePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (221,'Marwah','Rizqy','F',2,110)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (221,2,2613630720,'marwahrizqy')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (221,3,100057737932693,'marwahrizqymtl')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (222,'Maryse','Gaudreault','F',2,118)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (222,2,196278879,'MGaudreaultHull')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (222,3,1175252427,'maryse.gaudreault.14')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (223,'Mathieu','Gratton','H',2,75)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (223,2,599436244,'matgrat')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (223,3,100083102929028,'mathieugrattonplq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (224,'Maxim','Lavoie','F',2,125)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (224,2,1265782520,'LavoieMaxim')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (225,'Michel','Bureau','H',2,9)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (226,'Michel','Trottier','H',2,62)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (226,3,100057834740724,'MichelTrottierLaval')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (227,'Michelle','Setlakwe','F',2,103)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (227,2,1312041484175183872,'MichelleSetlak1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (227,3,100081513570195,'MichelleSetlakwePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (228,'Monique','Sauvé','F',2,59,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (228,3,100058148767649,'Monique.Sauve.fabre')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (229,'Monsef','Derraji','H',2,104)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (229,2,53666812,'monsefderraji')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (229,3,100044281037023,'derrajimonsef')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (230,'Mounirou','Younoussa','H',2,21)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (230,3,104147682419266,'MounirouYounoussaPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (231,'Mustapha','Berri','H',2,15)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (231,3,100856452764957,'MustaphaBerriPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (232,'Nicole','Ménard','F',2,75,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (232,2,179763363,'Nicole_Menard')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (232,3,638464695,'nicole.menard.90')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (233,'Normand','Côté','H',2,28)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (233,2,1519409005810135040,'NormandCotePLQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (233,3,100079525641211,'normandcoteplq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (234,'Omar','Cissé','H',2,84)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (234,3,100082499304046,'OmarCissePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (235,'Paule','Robitaille','F',2,90,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (235,2,384043171,'PauleRobitaille')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (235,3,100057898518625,'Paule.Robitaille.Deputee.Bourassa.Sauve.Assnat')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (236,'Penny','Lamarre','F',2,32)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (236,3,100001020716037,'penny.lamarre.3')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (237,'Philippe','LeBel','H',2,49)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (237,2,727878095202623489,'PhilLeBel20')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (237,3,100081610090711,'PhilippeLeBelPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (238,'Pierre','Arcand','H',2,103,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (238,2,83903008,'PierreArcand')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (238,3,100057940457567,'arcand.pierre')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (239,'Pierre','Poirier','H',2,20)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (239,3,100063998921353,'pierre.poirier.plq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (240,'Richard','Garon','H',2,27)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (240,3,100085013652221,'RichardGaronPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (241,'Rita','Ikhouane','F',2,93)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (241,2,1480890864,'RitaIkhouanePLQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (241,3,100054440651868,'RitaIkhouanePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (242,'Rodrigue','Asatsop','H',2,82)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (242,2,1550499333031837700,'AsatsopRodrigue')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (242,3,102758515861358,'RodrigueAsatsopPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (243,'Saul','Polo','H',2,60)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (243,2,131893469,'SaulJPolo')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (243,3,100058261501197,'SaulJPolo')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (244,'Sherlyne','Duverneau','F',2,108)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (244,2,1435729828259549192,'SherlyneDuvern1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (244,3,100083947907007,'SherlyneDuverneauPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (245,'Sona','Lakhoyan Olivier','F',2,58)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (245,3,100084635590644,'SonaLakhoyanOlivierPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (246,'Sonia','Baudelot','F',2,59)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (246,2,1138165699707396098,'BaudelotSonia')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (246,3,100063483095579,'SoniaBaudelotPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (247,'Steve','Trinque','H',2,73)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (247,2,18235103,'stevetrinque')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (247,3,100083604379320,'SteveTrinquePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (248,'Suzanne','Pomerleau','F',2,56)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (248,2,95198352,'fxsusan')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (248,3,100084758199865,'SuzannePomerleauPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (249,'Sylvain','Lemieux','H',2,4)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (250,'Tricia','Murray','F',2,124)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (250,2,1376593288187289605,'survi_vante')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (251,'Tunu','Napartuk','H',2,115)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (251,2,112634096,'tunu_napartuk')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (251,3,103260455830483,'TunuNapartukPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (252,'Vicki-May','Hamm','F',2,34)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (252,2,257159495,'VickiMayHamm')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (252,3,100080026514188,'VickiMayHammPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (253,'Virginie','Bouchard','F',2,46)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (253,2,745615291636420612,'VBouchard5252')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (253,3,100057827181438,'virginie.bouchard.plq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (254,'Virginie','Dufour','F',2,61)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (254,2,414916711,'virginie_dufour')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (254,3,100058099868449,'VirginieDufourOfficiel')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (255,'Wafa','Oueslati','F',2,26)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (255,3,100070506091125,'WafaOueslatiLevis')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (256,'Wittlyn','Kate Semervil','F',2,119)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (256,3,100182572814609,'WittlynKateSemervilPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (257,'Julie','White','F',2,12)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (257,2,575589608,'Julie__White_')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (258,'Ahmed','Ahmed','H',2,17)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (258,2,276548259,'LamineQuebec')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (258,3,103373715841608,'AhmedLamineTourePLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (260,'Estelle','Regina Lokrou','F',2,47)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (261,'Annie','Bélizaire','F',2,53)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (262,'Kevin','Nzoula-Mendome','H',2,65)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (263,'Adams','Tekougoum','H',2,67)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (263,2,1168090015,'adams.tekougoum')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (264,'Lina','Yunes','F',2,70)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (264,3,109851215183849,'LinaYunesPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (265,'Linda','Caron','F',2,74)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (265,2,1457704909,'Linda__Caron')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (265,3,102316805951163,'LindaCaronPLQ2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (266,'Yves','Mbattang','H',2,85)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (266,3,526737111,'yves.mbattang')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (267,'Madwa-Nika','Cadet','F',2,90)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (267,2,270108898,'madwanika')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (267,3,100083539895500,'madwanika.plq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (268,'Garceau','Brigitte','F',2,107)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (268,3,103014389211590,'BrigitteGarceauPLQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (269,'Assumpta','Ndengeyingoma','F',2,116)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (269,2,1560697203844431877,'Assumpta_nde')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (269,3,111094448385555,'AssumptaNdengeyingomaPLQ')



--PQ
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,1,3,'PQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,2,80925103,'partiquebecois')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,3,100050540197111,'lepartiquebecois')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,4,198060657,'partiquebecois')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,5,3,'PQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (3,6,3,'Paul St-Pierre Plamondon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (301,'Paul','St-Pierre Plamondon','H',3,91)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (301,2,28720732,'PaulPlamondon')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (301,3,100044216284794,'pspp.quebec')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (301,4,4115641054,'psppqc')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (302,'Adam','Wrzesien','H',3,85)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (302,2,1206256856190144513,'AdamWrzesien')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (302,3,100083713295432)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (303,'Aïcha','Van Dun','F',3,46)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (303,2,1467928468637859840,'AichaVanDun')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (303,3,100077261621399,'avandun.pq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (303,4,51396245427,'aichavandun')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (304,'Alexandre','Litalien','H',3,64)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (304,2,796475642611167233,'litalienAlex')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (304,3,100084491954542,'AlexandreLitalienPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (305,'Alexis','Deschênes','H',3,38)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (305,2,104911833,'AlexisDeschenes')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (305,3,100076069503638,'alexisdeschenes.pq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (305,4,48130260903,'alexis.deschenes.bonaventure')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (306,'Alexis','Gagné-LeBrun','H',3,80)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (306,2,2305376845,'aglebrun')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (306,3,100080207903534,'aglebrunPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (307,'Alice','Villeneuve','F',3,121)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (307,3,100003781786631,'Alice.Villeneuve16')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (308,'André','Duncan','H',3,33)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (308,2,1561862931125608449,'AndreDuncanPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (308,3,100084234397379)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (309,'Andrée-Anne','Bouvette-Turcot','F',3,84)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (309,2,1554518397077127171,'AABT_PQ_TAILLON')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (309,3,100084184987411,'aabt.pq.taillon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (310,'Camille','Pellerin-Forget','F',3,118)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (310,3,100079601390577)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (311,'Caroline','Dubé','F',3,123)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (311,2,750124412939231233,'CarolineDubePQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (311,3,100084562609183,'carolinedubejonquiere')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (312,'Catherine','Dansereau-Redhead','F',3,59)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (313,'Chantal','Beauregard','F',3,95)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (314,'Charles-Hubert','Riverin','H',3,10)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (315,'Daniel','Corbeil','H',3,53)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (315,2,474002765,'Daniel_Corbeil')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (316,'Daphnée','Paquin-Auger','F',3,82)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (316,3,100084847953898,'Daphnee.Paquin.Auger')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (317,'Émile','Simard','H',3,122)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (317,2,1241424329730068481,'emilesimardqc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (317,3,100083537102296)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (318,'Emrick','Couture-Picard','H',3,20)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (318,2,1559967630269861893,'EmrickPCouture')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (318,3,100082710704847,'EmrickCouturePicard')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (319,'Florence ','Racicot','F',3,114)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (320,'François-Noël','Brault','H',3,26)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (320,3,100063911950806,'francoisnoelbrault')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (321,'Frédéric','Labelle ','H',3,50)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (321,3,100080461549468)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (322,'Gabriel','Arpin','H',3,79)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (323,'Gabriel','Coulombe','H',3,12)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (323,2,1496560676227190784,'GaCoulombe')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (323,3,100082498913977,'GabrielCoulombePQJeanTalon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (324,'Geneviève','Couture','F',3,48)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (324,3,100084472245267,'genevievecouturcandidateterrebonnepq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (324,4,54653442231,'genevievecouture.pq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (325,'Guillaume','Freire','H',3,42)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (325,2,466854709,'FreireGuill')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (325,3,100082515953450,'GuillaumeMFreire')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (326,'Guillaume','Lalonde','H',3,51)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (326,2,391583621,'Lalonde_Gui')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (326,3,100082668945835,'LalondeGuiPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (327,'Guillaume','Paquet','H',3,31)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (328,'Jacline','Rouleau','F',3,1)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (328,3,100085087725447)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (329,'Jean-Alexandre','Côté','H',3,73)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (329,3,100076258997521)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (330,'Jean-Daniel','Fontaine','H',3,68)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (330,3,100084895476778,'JDF.PQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (331,'Jean-François','Major','H',3,24)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (332,'Jean-François','Vachon','H',3,3)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (332,2,258841519,'jf_vachon76')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (332,3,100063808905223,'jfvachon76')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (333,'Jeanne','Craig Larouche','F',3,52)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (333,3,100081234805062,'jeannecraiglarouchePQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (334,'Jeanne','Robin','F',3,17)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (334,2,1527289070447124480,'JeanneRobin_Qc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (334,3,100081479206322,'JeanneRobinPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (335,'Jeff','Dufour-Tremblay','H',3,30)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (335,2,80383181,'jeffdtremb')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (335,3,100084638797281,'JeffDufourTremblayPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (336,'Jocelyn','Desjardins','H',3,106)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (336,2,1541069984176246784,'JoDesjardinsPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (336,3,100083173188842,'JoDesjardinsPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (336,4,53884671437,'jocelyndesjardins_pq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (337,'Joël','Arseneau','H',3,40)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (337,2,196592806,'joel_arseneau')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (337,3,100058221485100,'joelarseneauDepute')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (337,4,6664487166,'joelarseneau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (338,'Jolaine','Paradis-Châteauneuf','F',3,120)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (338,3,100085006684373,'Jolaine.Paradis.ChateauneufPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (339,'Julie','Boucher','F',3,41)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (339,2,1563595310776983552,'JulieBoucherPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (339,3,100084519121521)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (340,'Julie','Daubois','F',3,109)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (341,'Laurence','Massey','F',3,96)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (341,2,1313908155399667712,'laurencemassey_')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (341,3,100072192754171,'laurencemassey.qc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (341,4,48918468291,'laurencemassey.qc')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (342,'Laurent','Vézina','H',3,67)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (343,'Louise',' Marchand ','F',3,28)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (343,3,100081996182786)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (344,'Lucien','Rodrigue','H',3,9)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (344,2,1539272785842905089,'lucienrodPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (344,3,100081788153922,'LucienRodriguePQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (345,'Lyne','Jubinville','F',3,62)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (345,3,102554339250463,'LJubinvillePQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (346,'Marianne','Lafleur','F',3,71)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (346,2,1531958721710014464,'MarianneLafleu7')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (346,3,100084724894382,'mlafleur2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (347,'Marie-Laurence','Desgagné','F',3,70)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (347,2,1344330303146487809,'ML_Desgagne')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (347,3,100079578382449,'MLDesgagnePQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (347,4,45373226989,'marie_desgagne')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (348,'Marilou','Vanier','F',3,29)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (348,2,1561875760855621634,'PQ_Duplessis')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (349,'Marisa','Gutierrez','F',3,116)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (349,3,100084858138126,'PQMarisa2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (350,'Martin','Trudel','H',3,13)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (351,'Maxime','Larochelle','H',3,98)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (351,2,206817824,'Maxlaro')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (351,3,100084515213986)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (352,'Méganne','Perry Mélançon','F',3,39)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (352,2,1658886546,'megannemelancon')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (352,3,100058221602738,'megannepm')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (352,4,12463870,'megannepm')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (353,'Michaël','Potvin','H',3,11)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (353,2,1510787568857755650,'MPotvinPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (353,3,100080127227523,'michaelpotvinpq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (353,4,52274559083,'micpotvinpq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (354,'Michel','Forget','H',3,4)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (355,'Michel','Lachance','H',3,61)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (356,'Monique','Allard','F',3,34)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (357,'Nathan','Leblanc','H',3,72)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (358,'Normand','Ouellette','H',3,54)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (358,3,100081488730395,'PQLesPlaines')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (359,'Ophélie','Bastien','F',3,103)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (360,'Paméla','Lavoie-Savard','F',3,23)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (361,'Pascal','Bastarache','H',3,65)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (361,3,100080974493158)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (362,'Pascal','Bérubé','H',3,5)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (362,2,23321628,'PascalBerube')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (362,3,100003368471357,'PascalBerubeDepute')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (362,4,4223476297,'depute_pascalberube')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (363,'Patrice','Bouchard','H',3,125)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (363,3,100081771883013,'pbouchardroberval')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (364,'Philippe','Dumas','H',3,22)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (364,2,1520936758950744064,'Philippe_Dumas_')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (364,3,100083150479607,'DumasPQNB')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (365,'Phoeby','Laplante','F',3,111)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (365,2,1492152711621533702,'PhoebyLaplante')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (365,3,100079152983631,'phoebylaplante')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (366,'Pierre','Nantel','H',3,77)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (366,2,275600932,'pierrenantel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (366,3,100057841069890,'nantelcitoyen')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (366,4,2198715345,'pierrenantel')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (367,'Pierre','Vanier','H',3,47)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (367,3,100082211996373)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (368,'Pierre-Gilles','Morel','H',3,27)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (368,2,885505507,'PierreGillesMor')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (369,'Pierre-Luc','Brillant','H',3,108)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (369,2,1544857425211170816,'PLuc_Brillant')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (369,3,100082897800656,'PLBrillantPQ2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (370,'Priscilla','Corbeil','F',3,8)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (370,2,1561711101800218627,'PCorbeil_PQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (370,3,100064301425150,'PriscillaCorbeilPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (371,'Rachid','Bandou','H',3,58)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (372,'Raphaël','Déry','H',3,117)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (372,2,134673333,'raphjedery')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (372,3,100082474047895,'RaphaelDeryGatineau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (373,'Renée-Claude','Lafontaine','F',3,92)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (374,'Sabrina','Mercier-Ullhorn','F',3,102)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (374,2,549703768,'SMU_PQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (374,3,100082354549624,'SMUPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (375,'Samuel','Doré','H',3,2)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (375,2,1227290964420636673,'EldoradoSamuel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (375,3,100084081225884,'SDorePQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (377,'Samuel','Ouellet','H',3,6)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (377,2,991199414,'samuelouelletpq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (377,3,100080320151011,'samuelouellet.pq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (377,4,494091073,'samuelouellet.pq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (378,'Sandrine','Michon','F',3,57)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (378,2,1540052297258082304,'SMichonPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (378,3,100080354401149,'SMichonPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (378,4,54503770166,'sandrinemichon_pq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (379,'Sarah','Joly-Simard','F',3,76)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (380,'Soledad','Orihuela-Bouchard','F',3,75)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (380,2,913574327588737024,'soledad_OB')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (380,3,100071864286391)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (381,'Stephan','Fogaing','H',3,94)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (381,2,1449423912970899461,'SFogaing')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (381,3,100084863501496,'SFogaingPQ2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (382,'Stéphane','Handfield','H',3,45)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (382,2,1446520453569421313,'HandfieldSteph')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (382,3,100075941423852)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (383,'Suzanne','Gagnon','F',3,74)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (383,2,531811522,'gagsue48')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (384,'Suzanne','Tremblay','F',3,99)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (385,'Sylvie','Tanguay','F',3,36)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (385,2,946181210107252736,'SylvieTanguay17')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (385,3,100069245018190,'Sylvie.PQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (385,4,2222541578,'sylvie.tanguay')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (386,'Véronique','Lecours','F',3,88)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (386,2,1560308637700079616,'VLecoursPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (386,3,100083128224882,'Veronique.Lecours.PQ.Acadie')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (387,'Véronique','Venne','F',3,43)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (387,2,1094977717643153408,'VenneVeronique')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (387,3,100084172045214,'vvcandidatejoliette.pq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (388,'Victor','Dubuc','H',3,14)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (388,2,1260343317570686976,'DubucVictor')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (388,3,100084468491223,'VictorDubucQC')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (389,'Vincent','Delorme','H',3,93)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (390,'William','Duquette','H',3,18)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (390,2,937882312439746560,'Willyham777')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (391,'William','Fradette','H',3,124)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (391,2,1016824704311623686,'WillFradetteLSJ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (391,3,100058033270301,'willfradetteLSJ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (392,'Yastene','Adda','H',3,89)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (392,2,100081761660641)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (393,'Yves','Bérubé-Lauzière','H',3,37)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (393,2,1549225597829799936,'YvesBerubeL')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (393,3,100081818170460,'YvesBerubeLauzierePQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (394,'Zacharie','Robitaille','H',3,90)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (394,2,1562194126049017867,'zac_robi')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (394,3,104854925686690)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (397,'Félix','Rioux','H',3,7)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (397,2,2266039281,'Felix_rioux89')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (397,3,100001111654979,'felix.rioux.37')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (399,'Mario','Beauchesne','H',3,19)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (400,'Jérémie','Poirier','H',3,21)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (401,'Guy','Bouthillier','F',3,32)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (401,3,100064256366755,'partiquebecois.granby')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (402,'Jacinthe','Caron','F',3,35)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (402,2,100067012730929,'pqrichmond')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (403,'Jean-François','Girard','H',3,49)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (403,2,397081374,'jofogirard')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (403,3,100085005132594)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (404,'Carole','Savoie','F',3,55)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (405,'Andréanne','Fiola','F',3,60)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (405,2,3523993155,'andreanne_fiola')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (405,3,100064087413468,'AFiolaPolitique')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (406,'Nathalie','Lavigne','F',3,63)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (407,'Dominique','Gélinas','H',3,66)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (407,2,1526245017106407426,'DomGelinasPQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (407,3,100081148574032)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (408,'Paule','Laprise','F',3,69)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (408,3,101118729404187,'plaprisePQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (409,'Daniel','Michelin','H',3,78)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (409,2,982726108666884097,'dmichelin2018')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (409,3,1381847401937446,'danielmichelin')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (410,'Alexandre','Girard-Duchaine','H',3,81)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (410,3,100084563636242,'alexandre.girard.duchaine')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (411,'Samuel','Patenaude','H',3,83)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (411,3,102401882611097)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (412,'Christopher','Massé','H',3,86)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (412,2,118839757,'CMasseQC')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (412,3,100064786236270,'PQVaudreuil')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (413,'Shawn',' Vermette Tassoni','H',3,97)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (414,'Cédric','Gagnon-Ducharme','H',3,87)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (414,3,890595720,'cedric.gducharme')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (415,'Chantal','Jorg','F',3,101)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (416,'Jocelyn','Caron','H',3,104)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (416,2,1668097033,'CaronJocelyn')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (417,'Cloé Rose','Jenneau','F',3,105)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (417,3,100071508921303)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (418,'Alix','Martel','H',3,107)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (418,3,110957071740855,'alixmartelPQRobertBaldwin')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (419,'Karl','Dugal','H',3,110)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (420,'Claudia','Valdivia','F',3,112)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (420,3,100084668996580,'PQClaudia')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (421,'Christine','Moore','F',3,115)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (421,2,620605132,'MooreC_Qc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (421,3,100058098040608,'ChristineMooreUngavaPQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (422,'Audrey-Ann','Chicoine','F',3,119)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (422,3,100085369771788)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (423,'Véronique','Hivon','F',3,43,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (423,2,149202097,'vhivon')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (423,3,100044543284759,'veroniquehivon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (424,'Lorraine','Richard','F',3,29,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (424,2,796793645961777152,'LrichardPq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (424,3,100058269871864,'LorraineRichardPQ')





--QUEBEC SOLIDAIRE
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,1,4,'QS')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,2,17029532,'QuebecSolidaire')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,3,100064895731084,'Quebecsolidaire')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,4,3907352542,'quebecsolidaire')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,5,4,'QS')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (4,6,4,'Gabriel Nadeau-Dubois')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (451,'Gabriel','Nadeau-Dubois','H',4,93)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (451,2,271909038,'GNadeauDubois')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (451,3,100044145863800,'GNadeauDubois')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (451,4,209575212,'gnadeaudubois')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (452,'Manon','Massé','F',4,111)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (452,2,404071871,'ManonMasse_Qs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (452,3,100044227399716,'QS.ManonMasse')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (452,4,28591373520,'manonmasseofficiel')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (453,'Benjamin','Gingras ','H',4,1)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (453,2,1338141620,'BenjGingras')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (453,3,100076626654462,'bgingrasQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (453,4,39563778101,'benjamin.gingras.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (454,'Alexis','Lapierre','H',4,2)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (454,3,100080938870991,null)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (455,'Elyse','Lévesque ','F',4,88)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (455,3,100081884105855,null)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (456,'Laurence','Pageau ','F',4,89)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (456,2,1445129530734268424,'laupagette')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (456,3,1446335703,'laupageau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (457,'Marcel','Lachaine ','H',4,49)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (457,3,100000440709224,'marcel.lachaine')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (458,'Pascale','Fortin ','F',4,19)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (458,3,100080083399562,'PascaleFortinQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (458,4,177096552,'pascalefortinqsarthabaska')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (459,'François','Jacques-côté ','H',4,23)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (459,3,100084706542665,null)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (460,'Olivier','Fecteau','H',4,24)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (460,2,1538905061992144896,'OlivierFecteau0')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (460,3,100067024896184,'qsBeauceSud')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (460,4,44378153486,'qsbeaucesud')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (461,'Émilie','Poirier','F',4,68)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (461,2,788109511,'poirier_milie')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (461,3,104341942265867,'EmiliePoirierQsBeauharnois')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (461,4,3238725985,'emiliepoirier_qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (462,'Jérôme','D''Auteuil Sirois','H',4,25)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (463,'Amélie','Drainville','F',4,41)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (463,3,100064312050310,'AmelieDrainvilleQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (463,4,53730276850,'ameliedrainville')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (464,'Julie','Francoeur','F',4,42)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (464,2,3237531604,'JuliFrancoeur')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (464,3,100081672776161,'qs.julie.francoeur')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (464,4,54304853493,'juliefrancoeur_candidate')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (465,'Éric','Michaud','H',4,50)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (465,3,100081932974851,'ericmichaudQSBlainville')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (465,4,53530710398,'ericmichaudqsblainville')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (466,'Catherine','Cyr Wright','F',4,38)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (466,2,491917284,'CatherineCw')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (466,3,10004272543412,'cathcyrwright')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (466,4,28325256455,'catherinecyrwright')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (467,'Benoit','Lamdry','H',4,69)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (467,3,100080069175996,null)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (468,'Ricardo','Gustave','H',4,90)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (468,2,1400078587,'Ricardo_Gustave')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (468,3,100002979235307,'ricardo.gustave')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (468,4,1308262296,'ricardo.gustave')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (469,'Alexandre','Legault','H',4,31)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (469,3,100080115156220,'alexandrelegaultQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (469,4,7363310863,'alexandre.legault_qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (470,'Marie-Eve','Rancourt','F',4,91)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (470,2,582300000,'rancourtmarie')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (470,3,100065548537268,'rancourtmarie')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (470,4,234236626,'rancourtmarie')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (471,'Vincent','Michaux-St-Louis','H',4,70)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (471,3,100080974521762,null)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (471,4,54286818166,'vincentmichauxstlouis')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (472,'Marjolaine','Trottier','F',4,64)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (472,3,100067198832968,'qschamplain')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (473,'Sabrina','Labrecque-Boivin','F',4,116)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (473,2,1558920608049684480,'sabrinalbQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (473,3,656915046,'Sabrina.Labrecque.Boivin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (473,4,632838772,'sabrinalabrecqueboivin')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (475,'Ève','Duhaime','F',4,8)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (475,2,1493246327005843456,'qscharlesbourg')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (475,3,100046353649175,'eveqsstj')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (475,4,53102679207,'eveduhaime.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (476,'Martin','Bécotte','H',4,71)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (476,2,17827448,'MartinBecotte')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (476,3,100080503210818,null)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (476,4,42901582,'mbecotte')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (477,'Jimena','Aragon','F',4,10)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (477,3,100064310064423,'qscapitalenationale')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (478,'Adrien','Guibert-Barthez','H',4,121)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (478,3,840785064,'adrien.guibertbarthez')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (478,4,51772785786,'adrien.guibertbarthezqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (479,'Zachary','Robert','H',4,58)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (479,3,100082630638210,'ZRobertcandidatQSpourChomedey')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (479,4,9875312032,'zacharyrobert8')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (480,'Caroline','Thibaul','F',4,26)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (480,3,100082735236908,null)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (481,'Guillaume','Dufour','H',4,4)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (481,3,10006393969821,'guillaumedufourQScotedusud')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (482,'Hilal','Pilavci','F',4,92)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (482,2,1934517236,'HilalPilavci1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (482,3,100081997127940,'HilalPilavciQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (482,4,53636548162,'hilalpilavciqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (483,'Olivier','Côté','H',4,51)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (483,2,1550480748062408704,'QsDeuxMontagnes')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (483,3,100082002259142,'qsdeuxmontagnes')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (483,4,54748320680,'qsdeuxmontagnes')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (484,'Tony','Martel','H',4,20)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (484,3,100080776606782,null)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (485,'Andrée-Anne','Brillant','F',4,122)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (485,3,100080342521767,null)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (485,4,48081496840,'andreeannebrillant.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (486,'Uapukun','Mestokosho','F',4,29)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (486,3,881125121,'uapukunm')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (486,4,6806180,'uapi.19')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (487,'Jessy','Léger','F',4,59)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (487,2,1170707124940345344,'JessyLger1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (487,3,100082016995274,'JLegercandidatedansFabrepourQS')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (488,'Yv','Bonnier Viger','H',4,39)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (488,2,409318650,'yvbonnierviger')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (488,3,100079200380776,'Gaspe.QS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (488,4,54345567798,'quebecsolidairegaspe')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (489,'Laura','Avalos','F',4,117)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (489,2,980875592,'Laura15avalos')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (489,3,100083376637218,'LauraAvalosGatineau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (490,'Anne-Sophie','Legault','F',4,32)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (490,3,100063699795081,'QsGranby')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (490,4,54506800748,'anne_sophie.legault_granby')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (491,'Marie-Noëlle','Aubertin','F',4,52)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (491,2,412517516,'MarieNoAubertin')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (491,3,100081268643935,'marienoelleaubertinQSGroulx')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (491,4,53900782030,'mnaubertin')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (492,'Alexandre','Leduc','H',4,94)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (492,2,401451204,'LeducAlexandre')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (492,3,100058160287357,'LeducAlexandreQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (492,4,8435724121,'alexandreleducqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (493,'Mathieu','Perron-Dufour','H',4,118)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (493,2,100079326372080,'MathieuPerronDufourQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (493,3,54222544885,'mperrondufour')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (494,'Emmanuelle','Perras','F',4,72)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (494,3,100064859375710,'QSHuntingdon')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (494,4,47576771012,'qshuntingdon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (495,'Philippe','Jetten-Vigeant','H',4,73)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (495,3,100064531822601,'IbervilleQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (495,4,9016197671,'philippe_qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (496,'Jean-Philippe','Déraspe','H',4,40)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (496,3,100000178272071,'jeanphilippe.deraspe')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (496,4,14255960728,'jp.deraspe')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (497,'Marie-Ève','Mathieu','F',4,95)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (498,'Sol','Zanetti','H',4,11)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (498,3,100044206220982,'solzanettiqs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (498,4,3245416456,'sol_zanettiqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (499,'Olivier','Bolduc','H',4,12)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (499,2,731226053205741568,'olivierbolducqs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (499,3,100063882093483,'olivierbolducqs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (499,4,11535988340,'olivier.bolduc.qs')


INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (500,'Nancy','Mongeau','F',4,21)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (500,3,100004717725834,'NancyMongeauPro')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (501,'Flavie','Trudel','F',4,43)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (501,2,488135524,'FlavieTrudel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (501,3,1143155618,'flavie.trudel')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (502,'Karla Cynthia','Garcia Martinez','F',4,123)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (502,3,100081192010885,'KarlaGarcia.QuebecSolidaire')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (502,4,52905910449,'Karla_cynthia_garcia_martinez')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (503,'Martin','Lefebvre','H',4,44)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (504,'Lucie','Villeneuve','F',4,13)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (504,2,1137607417,'LucieVilleneuv1')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (505,'Jean-Claude','Mugaba','H',4,74)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (505,2,1463413265720086528,'MugabaJC')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (505,3,115698181129118,'JCMugaba')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (505,4,555163248,'jcmugaba')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (507,'Pierre-Marc','Allaire-Daly','H',4,76)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (507,3,100079706961529,'qslaprairie')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (507,4,53805995643,'qslaprairie')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (508,'Anne','B-Godbout','F',4,97)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (508,3,100082140426112,'annebgodboutQS')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (509,'Claude','Lefrançois','F',4,75)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (509,2,1509551441458909190,'claude_qs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (509,3,100064004744648,'Claude.Lefrancois.2022')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (509,4,53855652433,'claude_lefrancois.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (510,'Andrés','Fontecilla','H',4,98)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (510,2,1254652568,'afontecillaqs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (510,3,100052380851294,'AFontecillaQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (510,4,8331069193,'andresfontecillaqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (511,'Josée','Chevalier','F',4,60)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (511,3,100083020307780,'JoseeQSldr')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (512,'France','Lavigne','F',4,65)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (512,3,100081541003551,'FranceLavigneQs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (513,'Richard Jr','Leblanc','H',4,54)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (513,2,1099820268,'juniorleblanc')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (513,3,601091490,'richard.j.leblanc.5')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (513,4,174954984,'juniorleb')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (514,'Valérie','Cayouette','F',4,27)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (514,3,100064644371192,'qs.levis')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (514,4,53886656636,'qslevis_valerie_c_guilloteau')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (515,'Christine','Gilbert','F',4,28)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (515,3,100082257545708,'ChristineGilbertQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (515,4,53408910845,'christine.gilbert.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (516,'Steven','Lachance','H',4,14)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (516,2,94334231,'lachances')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (516,3,354979927971890,'QSLouisHebert')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (516,4,53709324331,'lachanceqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (517,'Angélique Soleil','Lavoie','F',4,99)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (517,3,100082616237795,'angelique.soleil.lavoie.qs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (517,4,11535988340,'olivier.bolduc.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (518,'Shophika','Vaithyanathasarma','F',4,77)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (518,2,1302031249360531456,'shophikavsarma')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (518,3,100071292884916,'shophikaqs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (518,4,227579443,'shophikavsarma')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (519,'Jeremy','Côté','H',4,100)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (519,2,1550096399982907392,'JeremyCt09')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (520,'Simon','Piotte','H',4,66)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (520,2,123084509,'SimonPiotte')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (520,3,835085388,'piottesimon')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (521,'Émile','Bellerose-Simard','H',4,45)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (521,3,100022065549251,'emile.bellerosesimard')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (522,'Marie-Phare','Boucher','F',4,5)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (522,3,100064032942398,'MariePhareQS')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (523,'Haroun','Bouazzi','H',4,101)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (523,2,360378961,'harounbouazzi')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (523,3,100045274879121,'bouazziofficiel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (523,4,7183312498,'bouazziofficiel')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (524,'Marilyn','Ouellet','F',4,33)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (524,3,100078853960399,'MarilynouelletQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (524,4,53023605090,'marilynouelletqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (525,'Ruba','Ghazal','F',4,102)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (525,2,993454115509428224,'RubaGhazalQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (525,3,100044150933821,'RubaGhazalQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (525,4,8196871712,'rubaghazalqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (526,'Guillaume','Lajoie','H',4,61)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (526,2,2885369605,'GuiGui_Lajoie')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (526,3,100063941058432,'GuillaumeLajoieQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (526,4,51978369435,'guigui.lajoie')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (527,'Marjolaine','Goudreau','F',4,55)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (527,3,852852804903960,'MarjolaineGoudreauQSMirabel')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (528,'Isabelle','Leblanc','F',4,103)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (528,2,736939866,'leblanc_isa')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (528,3,100080054787221)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (528,4,54128690810,'isabelleleblanc.mro')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (529,'Marie-Christine','Veilleux','F',4,78)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (529,3,100064591969856,'SolidaireMontarville')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (530,'Annie-Pierre','Bélanger','F',4,15)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (530,2,1552783160013774848,'AnniePierreBla1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (530,3,100080975379243,'anniepierre.belanger.montmorency')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (530,4,54400210058,'anniepierrebelanger.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (531,'Maxime','Larue Bourdages','H',4,104)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (531,3,100063606506185)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (532,'Jacques','Thériault Watso','H',4,22)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (533,'Élisabeth','Labelle','F',4,105)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (533,2,1176156169662009344,'labellelisabeth')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (533,3,100081089296257,'elisabethlabelleQS')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (534,'Kenza','Sassi','F',4,34)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (534,3,100078976007914,'KenzaSassiQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (534,4,52328030977,'kenzasassiqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (535,'Marie-Claude','Latourelle','F',4,119)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (535,2,1561375883369320453,'MarieLatourelle')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (535,3,100079164232170)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (536,'Simon','Tremblay-Pepin','H',4,106)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (536,3,100081076803971)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (537,'Mike','Owen Sebagenzi','H',4,120)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (537,3,100081277177821,'MikeOwenQSPontiac')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (538,'Anne-Marie','Melançon','F',4,16)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (538,3,100079264291037)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (538,4,54681712150,'annemarie_qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (539,'Rose','Crevier-Dagenais','F',4,56)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (539,3,100080001814470)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (540,'Audrey','Givern-Héroux','F',4,30)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (540,3,100081731466493)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (540,4,54450171716,'audrey.givern.heroux.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (541,'Ednal','Marc','H',4,46)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (541,3,100080589483420,'EDNALMARC')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (542,'David','Dionne','H',4,79)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (542,3,100063740422662)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (543,'Philippe','Pagé','H',4,35)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (543,2,580941827,'Philippe_Page')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (543,3,100081659836423,'PhilippePageRichmond')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (544,'Carol-Ann','Kack','F',4,6)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (544,2,294753362,'CarolAnnKack')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (544,3,100045411622265,'Carol.Ann.Kack.QSRimouski')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (544,4,4153778566,'carolannkack')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (545,'Myriam','Lapointe-Gagnon','F',4,7)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (545,2,1553378349665423362,'myriamdecacouna')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (545,3,100077927748676,'myriamdecacouna')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (545,4,52098705393,'myriamdecacouna')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (546,'Marieve','Ruel','F',4,107)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (546,3,660435573,'marieveruel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (546,4,6226916474,'marieve.r')


INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (547,'Michaël','Ottereyes','H',4,125)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (547,3,100082004237624,'michaelottereyes.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (548,'Vincent','Marissal','H',4,108)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (548,2,273243059,'vmarissal')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (548,3,100058177024793,'vmarissal')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (548,4,7907945801,'vincent.marissal')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (549,'Ernesto','Castro Roch','H',4,47)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (549,3,100082151620161,'ernestoqs2')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (550,'Émilise','Lessard-Therrien','F',4,3)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (550,2,988826416123965440,'emiliselt')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (550,3,100046760479960,'Emiliselt')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (550,4,8189526437,'emiliselt')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (551,'Mélissa','Généreux','F',4,36)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (551,2,1497916548996022276,'DocGenereux')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (551,3,100079087914144,'docgenereux')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (551,4,4434615188,'docgenereux_estrie')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (552,'Guillaume','Cliche-Rivard','H',4,109)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (552,3,100083421305388,'GClicheRivard')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (552,4,53907750045,'GClicheRivard')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (553,'Philippe','Daigneault','H',4,80)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (553,3,100064636181471)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (554,'Pierre-Luc','Lavertu','H',4,81)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (554,3,100075504026645,'SaintJeanQS')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (555,'Marc-Olivier','Neveu','H',4,57)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (555,2,1105331402,'mo_neveu')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (555,3,100036004347231,'MO.Neveu')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (555,4,1339744833,'mo_neveu')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (556,'Gérard','Briand','H',4,110)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (556,3,100083699916103,'GBriandQS')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (557,'Karine','Cliche','F',4,62)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (557,3,100080889823242)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (557,4,54317694189,'karineclicheqssainterose')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (558,'Virginie','Bernier','F',4,82)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID) values (558,3,104774818869269)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (559,'Christine','Labrie','F',4,37)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (559,2,965966185610309633,'Christine_QS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (559,3,100044509683224,'ChristineLabrieQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (559,4,7137774474,'christinelabrieqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (560,'Sophie','Samson','F',4,83)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (560,2,19099940,'SophieSamson')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (560,3,100081006351651,'sophie.samson.QS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (560,4,31226281,'lasophiste')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (561,'Manon','Blanchard','F',4,84)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (561,4,8474320146,'manon_blanchard.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (562,'Etienne','Grandmont','H',4,17)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (562,2,493402482,'e_grandmont')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (562,3,100080257065231,'EtienneGrandmontQS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (562,4,1697342491,'etgrandmont')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (563,'Nadia','Poirier','F',4,48)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (563,2,287914757,'NadiaPoirier')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (563,3,100077758518235,'NadiaPoirierQSTerrebonne')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (563,4,5862361856,'nadia.poirier.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (564,'Steven','Roy Cullen','H',4,67)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (564,2,1496587835801014274,'s_roycullen')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (564,3,100078419036049,'StevenRoyCullen')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (564,4,4578024690,'s_roycullen')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (565,'Maïtée','Labrecque-Saganash','F',4,115)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (565,2,2425743364,'MaiteeSaganash')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (565,3,100083290727466,'maiteelabrecquesaganash')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (565,4,375943970,'msaganash')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (566,'Jean-Philippe','Samson','H',4,85)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (566,3,100081101895617,'jeanphilippesamson.qs')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (566,4,53297995547,'jeanphilippesamson.qs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (567,'Karoline','Boucher','F',4,18)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (567,3,100079309903625,'KarolineBoucher.QS')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (567,4,54567967919,'karolineboucherqs')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (568,'Cynthia','Bilodeau','F',4,86)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (568,3,100081862350336,'CynthiaQSVaudreuil')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (569,'Manon','Harvey','F',4,87)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (569,3,100069209709834,'QSvercheres')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (569,4,54652148894,'manon.qsvercheres')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (570,'Alejandra','Zaga Mendez','F',4,112)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (570,2,102278635,'alezaga')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (570,3,100063570347581,'alejandrazagamendez')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (570,4,387531394,'alezagam')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (571,'Renée-Chantal ','Belinga','F',4,113)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (571,2,1080555695307599872,'BelingaRenee')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (571,3,100063471954164,'BelingaRenee')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (571,4,6217752234,'reneechantalbelinga')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (572,'Josée','Bélanger','F',4,63)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (572,3,100083077231934,'joseebelangerlaval')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (573,'David','Touchette','H',4,114)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (573,3,563707260,'davidf.touchette')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (573,4,487732358,'david_touchette')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (574,'Marie-Josée','Forget','F',4,96)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (575,'Myriam','Fortin','F',4,9)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (575,2,289963063,'MyriamFortin1')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (575,3,100082557973727,'MyriamFortinQS')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (576,'Steve','Bouchard','H',4,53)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (577,'Elsa','Moulin','F',4,124)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (577,3,100029052212226,'elsa.moulin.965')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (578,'Catherine','Dorion','F',4,3,0)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (578,2,224712714,'cathdorion')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (578,3,100044544091559,'catherinedorionqs')




--PCQ
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,1,5,'PCQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,2,595874095,'PconservateurQc')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,3,100064147137259,'PartiConservateurDuQuebec')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,4,4128954256,'conservateur_quebec')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,5,5,'PQ')
INSERT INTO PartiMedia (PartiID,MediaID,MediaUserID,Surnom) values (5,6,5,'Éric Duhaime')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (601,'Éric','Duhaime','H',5,10)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (601,2,172395137,'E_Duhaime')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (601,3,100044413450265,'eduhaime')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (602,'Maxym','Perron Tellier','H',5,1)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (602,3,100076291367317,'maxymperrontellierpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (603,'Robert','Daigle','H',5,3)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (603,3,100083412384191,'robertdaiglepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (604,'François','Vigneault','H',5,2)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (605,'Alexandre','Leblanc','H',5,5)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (606,'Louise','Moreault','F',5,7)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (607,'Stéphanie','Du Mesnil','F',5,6)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (608,'Jean','Domingue','H',5,8)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (609,'Lacombe','Odré','H',5,9)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (609,2,1339179103874764802,'OdreLacombe')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (609,3,100061370072917,'odrelacombepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (610,'Denise','Peter','F',5,11)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (610,3,100080484036322,'denisepeterpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (611,'Stéphane','Lachance','H',5,13)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (611,3,100083196679179,'stephanelachancepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (612,'Mylène','Bouchard','F',5,15)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (613,'Jacinthe-Eve','Arel','F',5,16)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (613,2,305668785,'JacintheEveArel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (613,3,100076523735795,'jacintheevearelpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (614,'Marie-Josée','Hélie','F',5,17)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (614,2,1462045973551661060,'marie_helie')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (614,3,100077039036904,'mariejoseeheliepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (615,'Donald','Gagnon','H',5,18)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (615,2,71063473,'harveys2276')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (615,3,100079014252333,'donaldgagnonpcq2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (616,'Tarek','Henoud','H',5,19)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (616,3,100080595924249,'tarekhenoudpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (617,'Myriam','Cournoyer','F',5,20)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (617,2,1501023124078448640,'Cournoyerpcq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (617,3,100079323162192,'myriamcournoyerpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (618,'Luce','Daneau','H',5,21)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (618,2,1518701068775002112,'LuceDaneauPCQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (618,3,100079163601861,'lucedaneaupcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (619,'Mario','Lyonnais','H',5,22)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (619,3,100083852746435,'mariolyonnaispcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (620,'Olivier','Dumais','H',5,23)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (620,3,100076167918861,'olivierdumaispcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (621,'Jonathan','Poulin','H',5,24)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (621,2,1562156763545321472,'JonathanBceSud')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (621,3,100075454826052,'jonathanpoulinpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (622,'Michel','Tardif','H',5,25)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (622,2,196586649,'MichelTardif')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (622,3,100076365762395,'micheltardifpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (623,'Mario','Fortier','H',5,26)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (623,2,1561525626992984066,'FortierMarioPCQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (624,'Frédéric','Poulin','H',5,4)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (624,2,1551321941088370688,'FpoulinPCQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (625,'Karine','Laflamme','F',5,27)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (625,2,1547352506933673986,'Karine2Laflamme')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (625,3,100075741137457,'karinelaflammepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (626,'Christian','Gauthier','H',5,28)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (626,3,100075478496169,'christiangauthierpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (627,'Roberto','Stéa','H',5,29)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (627,3,100083628894679,'robertosteapcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (628,'Marie Renée','Raymond','F',5,30)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (628,3,100068499773530,'mariereneeraymondpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (629,'Stéphanie','Prévost','F',5,31)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (629,2,1559334179254554626,'StphaniePrvost3')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (629,3,100078229797008,'stephanieprevostpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (630,'Stéphane','Bernier','H',5,32)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (631,'Mathieu','Chenard','H',5,33)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (632,'Marylaine','Bélair','F',5,35)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (632,3,100076455514627,'marylainebelairpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (633,'Dany','Bernier','H',5,36)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (633,2,1553461404031754240,'BernierDany3')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (633,3,100076467870077,'danybernierpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (634,'Zoée','St Amand','F',5,37)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (634,3,100076231987370,'zoeestamandpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (635,'Francois','Therrien','H',5,38)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (636,'Pier-Luc','Bouchard','H',5,39)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (637,'Evan','Leblanc','H',5,40)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (638,'Benoit','Primeau','H',5,41)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (638,2,533468344,'benprimeauPCQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (638,3,100079521565422,'benoitprimeaupcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (639,'Pascal','Laurin','H',5,43)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (639,3,100083519075911,'pascallaurin2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (640,'Ernesto','Almeida','H',5,44)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (640,3,100084147661791,'ernestoalmeidapcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (641,'François','Truchon','H',5,45)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (641,3,100084216849140,'francoistruchonpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (642,'Serge','Cloutier','H',5,46)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (642,2,1514658939266289665,'Serge_Clou_PhD')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (642,3,100083835977167,'sergecloutierpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (643,'Gisèle','Desroches','F',5,47)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (643,3,100083018764928,'giseledesrochespcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (644,'Daniela','Andreeva','F',5,48)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (644,3,100083740699807,'danielaandreevapcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (645,'Karim','Elayoubi','H',5,49)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (645,2,1522066771809021952,'KarimElayoubi')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (645,3,100068968805113,'karimelayoubipcq2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (646,'Philippe','Meloni','H',5,42)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (646,3,100067362544415,'philippemeloni2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (647,'Grace','Daou','F',5,50)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (647,3,100077886815862,'gracedaoupcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (648,'Isabelle','Baril','F',5,51)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (648,3,100077047205735,'isabellebarilpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (649,'Valerie ','Messore','F',5,52)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (649,3,100084156792037,'valeriemessorepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (650,'Ian','Lavallée','H',5,54)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (650,3,100083713419384,'ianlavalleepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (651,'Gala','Durand','F',5,55)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (651,3,100077286106664,'galadurandpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (652,'Benoit','Cloutier','H',5,56)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (653,'Maxime','Clermont','H',5,57)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (653,3,100077166110278,'maximeclermontpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (654,'Konstantinos','Merakos','H',5,58)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (654,3,100083029727944,'konstantinosmerakospcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (655,'Stéphane','Turmel','H',5,59)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (655,2,1542682035160027136,'PCQ_ST')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (655,3,100075998884164,'stephaneturmelpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (657,'Nicolas','Lussier-Clément','H',5,60)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (657,3,100084169991521,'nicolaslussierclementpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (658,'Ange Claude','Bigilimana','H',5,61)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (658,3,100076327922539,'angeclaudebigilimanapcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (659,'Stefano','Piscitelli','H',5,63)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (659,3,100076466940177,'stefanopiscitellipcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (660,'Pierre-David','Tremblay','H',5,65)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (660,3,100076289625929,'pierredavidtremblaypcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (661,'Serge','Noël','H',5,66)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (661,3,100076628520194,'sergenoelpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (662,'Karine','Pépin','F',5,67)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (662,3,102413365821576,'karinepepinpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (663,'Steve','Massicotte','H',5,64)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (663,3,100076083621602,'stevemassicottepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (664,'Chantal','Dauphinais','F',5,68)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (664,3,100077359546059,'chantaldauphinaispcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (665,'Jean-Félix','Racicot','H',5,69)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (665,2,1485403875351879686,'JFelixRacicot')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (665,3,100069697243075,'jeanfelixracicotpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (666,'Daniel ','Desnoyers','H',5,70)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (666,3,100071284063579,'danieldesnoyerspcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (667,'Patric','Viau','H',5,71)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (667,3,100084748860182,'patricviaupcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (668,'François','Gagnon','H',5,72)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (668,3,100077676963861,'francoisgagnonpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (669,'Anne','Casabonne','F',5,73)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (669,2,1483147101739655170,'casabonne_anne')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (669,3,100077250247299,'annecasabonnepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (670,'Tzarevna','Bratkova','F',5,74)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (670,2,1556808633496834053,'TzarevnaBpcq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (670,3,100084305808627,'tzarevnabratkovapcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (671,'Marie','Pelletier','F',5,76)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (672,'Evelyne','Latreille','F',5,75)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (672,3,100061062032373,'evelynelatreillepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (673,'Lara','Stillo','F',5,77)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (674,'Evans','Henry','H',5,78)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (674,3,100071548689674,'evanshenrypcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (675,'Marie-Eve','Dionne','H',5,79)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (676,'Kim','Beaudoin','H',5,80)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (676,3,100075722336797,'kimbeaudoinpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (677,'Dominick','Melnitzky','H',5,81)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (677,2,1556509767471972352,'Melnitzky1')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (678,'François','Gibeault','H',5,82)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (678,3,100077439458979,'francoisgibeaultpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (679,'Éloïse','Coulombe','F',5,83)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (679,3,100077363292932,'eloisecoulombepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (680,'Pierre-Marc','Boyer','H',5,84)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (680,3,100076249268011,'pierremarcboyerpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (681,'Martine','Boucher','H',5,85)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (681,3,100068862054182,'martineboucherpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (682,'Ève','Théoret','F',5,86)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (682,2,1560439633523113989,'EveTheoretpcq')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (682,3,100077570493645,'evetheoretpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (683,'Pascal','Déry','H',5,87)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (683,3,100075961271547,'pascalderypcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (684,'Stéfanie','Gentile','F',5,88)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (684,3,112445528232706,'stefaniegentilepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (685,'Geneviève','Deneault','F',5,89)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (686,'Carmel-Antoine','Bessard','F',5,90)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (686,3,100082017642204,'carmelantoinebessardpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (687,'Christos','Karteris','H',5,91)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (687,3,100082764342751,'christoskarteris2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (688,'Bonnie','Feigenbaum','F',5,92)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (688,3,100084827864901,'bonniefeigenbaumpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (689,'Jayson','Paquette Gendron','H',5,93)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (689,3,100084111963768,'jaysonpaquettegendronpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (690,'Louise','Poudrier','F',5,94)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (690,3,100084032767294,'louisepoudrierpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (691,'Louis-Charles','Fortier','H',5,95)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (691,3,105772995492624,'louischarlesfortierpcq2022')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (692,'Chakib','Saad','H',5,96)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (692,3,100081813802594,'chakibsaadpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (693,'Yassir','Madih','H',5,97)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (693,3,110506511760948,'yassirmadihpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (694,'Guy','Diotte','H',5,98)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (694,3,100084258530968,'guydiottepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (695,'Aleksa','Drakul','F',5,99)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (695,3,100081906617978,'aleksadrakulpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (696,'Elli','Peruch','H',5,100)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (697,'Louise','Sexton','F',5,101)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (697,3,100083634594763,'louisesextonpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (698,'Emmanuel','Da Costa','H',5,102)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (698,3,100083731310359,'emmanueldacostapcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (699,'Sabrina','Ait Akil','F',5,103)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (699,2,1550509665880088576,'sabrina_aitakil')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (699,3,100083657325386,'sabrinaaitakilpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (700,'Gary','Charles','H',5,104)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (700,3,100548689439595,'garycharlespcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (701,'Roy','Eappen','H',5,105)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (701,3,100081518512390,'royeappenpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (702,'Yves','Beaulieu','H',5,106)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (702,3,100084171535268,'yvesbeaulieupcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (703,'Axel','Lellouche','H',5,107)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (703,2,1446089544370171907,'LelloucheAxel')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (703,3,100084176490441,'axellellouchepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (704,'Marie-France','Lemay','F',5,108)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (704,3,100082165804535,'mariefrancelemaypcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (705,'Mischa','White','H',5,109)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (705,3,100083682442523,'mischawhitepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (706,'Stefan','Marquis','H',5,111)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (706,3,100075908840661,'stefanmarquispcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (707,'Lucien','Koty','H',5,112)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (707,2,1560100734288515072,'lucienkotyPCQ')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (707,3,100084113253551,'lucienkotypcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (708,'Alex','Tembel','H',5,113)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (708,3,100084197394055,'alextembelpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (709,'Katya','Rossokhata','F',5,114)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (710,'Nancy','Lalancette','F',5,115)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (711,'Matthieu','Kadri','H',5,116)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (711,2,1487255738384797697,'MatthieuKadri')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (712,'Joëlle','Jammal','F',5,117)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (712,2,1555564958401921029,'PCQGatineau')
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (712,3,100060577531535,'joellejammalpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (713,'Lise','Couture','H',5,118)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (713,3,100076194152500,'lisecouturepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (714,'Marc','Carrière','H',5,119)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (714,3,101129695952591,'marccarrierepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (715,'Terrence','Watters','H',5,120)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (715,3,100061085618579,'terrencewatterspcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (716,'Éric','Girard','H',5,121)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (716,3,100068908672160,'ericgirardpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (717,'Tommy','Pageau','H',5,122)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (717,3,100084451031756,'tommypageaupcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (718,'Isabelle','Champagne','F',5,123)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (718,3,100071513365912,'isabellechampagnepcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (719,'Luc','Martel','H',5,124)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (719,3,100084187703212,'lucmartelpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (720,'Samuel','Gaudreault','H',5,125)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (720,3,100084380624816,'samuelgaudreaultpcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (721,'Stéphanie','Beauchamp','F',5,62)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (721,3,100084199780079,'stephaniebeauchamppcq')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (722,'Sébastien','Clavet','H',5,12)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (722,3,100076359511698,'clavetsebastien')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (723,'Marika','Robitaille','F',5,14)
INSERT INTO PersonneMedia (PersonneID,MediaID,MediaUserID,Surnom) values (723,2,1563880845194190848,'MRobitaillePCQ')

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (724,'Martin','Lacasse Lamontagne','H',5,34)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (725,'Éric','Blanchette','H',5,53)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID) values (726,'Catherine','Saint-Clair','F',5,110)

INSERT INTO Personne (PersonneID,Prenom,Nom,genre,PartiID,CirconscriptionID,Actif) values (727,'Claire','Samson','F',5,16,0)

--INSERT INTO Publication (MediaID,MediaUserID,Titre,Texte,PublicationDate,UrlPublication) values (1,1,'','','6/6/2022 1:00:00 PM','')

--Publication
--INSERT INTO Publication (PublicationID,MediaID,PublicationMediaID,PersonneID,Titre,Texte,PublicationDate)
--INSERT INTO Publication (MediaID,PublicationMediaID,PersonneID,Titre,Texte,PublicationDate);

select prenom, p.nom, parti.Nom, c.Nom from Personne p
join circonscription c on p.circonscriptionID = c.CirconscriptionID
join Parti parti on p.PartiID = parti.PartiID
where c.CirconscriptionID = 63

select CirconscriptionId, partiid, actif, count(*)
from personne
group by CirconscriptionId, partiid, actif having count(*) > 1




select * from personne where prenom = 'Priscilla'


--CHEFPARTI
--INSERT INTO ChefParti (PersonneID,PartiID) values (1,1) --F. Legault

select ps.Prenom, ps.Nom, c.Nom, pp.nom, p.Texte, p.UrlPublication from Publication p
join PersonneMedia pm on p.MediaUserID = pm.MediaUserID
join Personne ps on pm.PersonneID=ps.PersonneID
join Parti pp on ps.PartiID = pp.PartiID
join Circonscription c on ps.CirconscriptionID = c.CirconscriptionID

select * from publication p
join PartiMedia pm on p.MediauserID = pm.MediauserID and pm.MediaID = 8
join parti part on pm.PartiID = part.PartiID
where p.MediaID = 8 and part.PartiID = 1


select p.texte from Parti part
join partimedia pm on part.PartiID = pm.PartiID
join Publication p on pm.MediaID = p.MediaID
where pm.MediaID = 8 and pm.PartiID = 1


select * from parti part
join PartiMedia pm on part.PartiID = pm.PartiID
join Publication pub on pm.MediaUserID = pub.MediaUserID
where part.PartiID = 1 and pm.MediaID = 8 and pub.MediaID = 8