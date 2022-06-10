USE [tempdb];
GO
DECLARE @SQL nvarchar(max);
DECLARE @DB nvarchar(max);
set @DB = 'UrunSatis'
IF EXISTS (SELECT 1 FROM sys.databases WHERE [name] = @DB)
	BEGIN
		SET @SQL = ' USE '+@DB+';
					 ALTER DATABASE '+@DB+' SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
			         USE [tempdb];
					 DROP DATABASE '+@DB+';
					 CREATE DATABASE '+@DB+';
					 ';
		EXEC (@SQL);
	END
	ELSE
	BEGIN
		SET @SQL = '
					 CREATE DATABASE '+@DB+';
					 ';
		EXEC (@SQL);
END;
--DB Kontrolü Bitti.
GO
USE [UrunSatis]
GO


--Tanýmlar Tablolarý
Create Table PersonelTip(
Tip_ID int Primary Key identity(1,1),
Ad nvarchar(100) NOT NULL,
Maas money not null
)

Create Table Bolge(
Bolge_ID int Primary Key identity(1,1),
Ad nvarchar(100) NOT NULL,
)

Create Table Sirket(
Sirket_ID int Primary Key identity(1,1),
Ad nvarchar(100) NOT NULL,
)

Create Table Il(
Il_ID int Primary Key identity(1,1),
Ad nvarchar(50),
PlakaKod tinyint
)

Create Table Ilce(
Ilce_ID int Primary Key identity(1,1),
Ad nvarchar(50) NOT NULL,
IlID int Not Null,
FOREIGN KEY (IlID) REFERENCES Il(Il_ID)
)


GO

Create Table Personel(
Per_ID int identity(1,1),
SicilNo int Primary Key NOT NULL,
Tc char(11) unique,
Ad nvarchar(100) NOT NULL,
Soyad nvarchar(100) NOT NULL,
PersonelTipi int not null,
Telefon nvarchar(max),
Prim decimal DEFAULT 1,
FOREIGN KEY (PersonelTipi) REFERENCES PersonelTip(Tip_ID));
GO

Create Table Adres(
Adres_ID int identity(1,1),
SicilNo int Not NULL,
IlceID int NOT NULL,
FOREIGN KEY (IlceID) REFERENCES Ilce(Ilce_ID),
FOREIGN KEY (SicilNo) REFERENCES Personel(SicilNo));


Create Table Danisman(
Per_ID int identity(1,1),
SicilNo int NOT NULL,
SirketID int NOT NULL
FOREIGN KEY (SirketID) REFERENCES Sirket(Sirket_ID),
FOREIGN KEY (SicilNo) REFERENCES Personel(SicilNo)
);
GO

Create Table SatisTemsilcisi(
Temsilci_ID int identity(1,1),
SicilNo int NOT NULL,
BolgeID int NOT NULL
FOREIGN KEY (SicilNo) REFERENCES Personel(SicilNo),
FOREIGN KEY (BolgeID) REFERENCES Bolge(Bolge_ID),
);

GO
--Veri Giriþi baþladý.

--Ýl Ekleme.
INSERT INTO Il
(Ad,PlakaKod)
VALUES
('ADANA',01),
('ADIYAMAN',02),
('AFYON',3),
('AÐRI',4),
('AMASYA',5),
('ANKARA',6),
('ANTALYA',7),
('ARTVÝN',8),
('AYDIN',9),
('BALIKESÝR',10),
('BÝLECÝK',11),
('BÝNGÖL',12),
('BÝTLÝS',13),
('BOLU',14),
('BURDUR',15),
('BURSA',16),
('ÇANAKKALE',17),
('ÇANKIRI',18),
('ÇORUM',19),
('DENÝZLÝ',20),
('DÝYARBAKIR',21),
('EDÝRNE',22),
('ELAZIÐ',23),
('ERZÝNCAN',24),
('ERZURUM',25),
('ESKÝÞEHÝR',26),
('GAZÝANTEP',27),
('GÝRESUN',28),
('GÜMÜÞHANE',29),
('HAKKARÝ',30),
('HATAY',31),
('ISPARTA',32),
('MERSÝN',33),
('ÝSTANBUL',34),
('ÝZMÝR',35),
('KARS',36),
('KASTAMONU',37),
('KAYSERÝ',38),
('KIRKLARELÝ',39),
('KIRÞEHÝR',40),
('KOCAELÝ',41),
('KONYA',42),
('KÜTAHYA',43),
('MALATYA',44),
('MANÝSA',45),
('KAHRAMANMARAÞ',46),
('MARDÝN',47),
('MUÐLA',48),
('MUÞ',49),
('NEVÞEHÝR',50),
('NÝÐDE',51),
('ORDU',52),
('RÝZE',53),
('SAKARYA',54),
('SAMSUN',55),
('SÝÝRT',56),
('SÝNOP',57),
('SÝVAS',58),
('TEKÝRDAÐ',59),
('TOKAT',60),
('TRABZON',61),
('TUNCELÝ',62),
('ÞANLIURFA',63),
('UÞAK',64),
('VAN',65),
('YOZGAT',66),
('ZONGULDAK',67),
('AKSARAY',68),
('BAYBURT',69),
('KARAMAN',70),
('KIRIKKALE',71),
('BATMAN',72),
('ÞIRNAK',73),
('BARTIN',74),
('ARDAHAN',75),
('IÐDIR',76),
('YALOVA',77),
('KARABÜK',78),
('KÝLÝS',79),
('OSMANÝYE',80),
('DÜZCE',81);

---Ýlçeler
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALADAÐ',1),
('CEYHAN',1),
('ÇUKUROVA',1),
('FEKE',1),
('ÝMAMOÐLU',1),
('KARAÝSALI',1),
('KARATAÞ',1),
('KOZAN',1),
('POZANTI',1),
('SAÝMBEYLÝ',1),
('SARIÇAM',1),
('SEYHAN',1),
('TUFANBEYLÝ',1),
('YUMURTALIK',1),
('YÜREÐÝR',1);

INSERT INTO Ilce(Ad, IlID) VALUES 
('BESNÝ',2),
('ÇELÝKHAN',2),
('GERGER',2),
('GÖLBAÞI',2),
('KAHTA',2),
('MERKEZ',2),
('SAMSAT',2),
('SÝNCÝK',2),
('TUT',2);

INSERT INTO Ilce(Ad, IlID) VALUES 
('BAÞMAKÇI',3),
('BAYAT',3),
('BOLVADÝN',3),
('ÇAY',3),
('ÇOBANLAR',3),
('DAZKIRI',3),
('DÝNAR',3),
('EMÝRDAÐ',3),
('EVCÝLER',3),
('HOCALAR',3),
('ÝHSANÝYE',3),
('ÝSCEHÝSAR',3),
('KIZILÖREN',3),
('MERKEZ',3),
('SANDIKLI',3),
('SÝNANPAÞA',3),
('SULTANDAÐI',3),
('ÞUHUT',3);

INSERT INTO Ilce(Ad, IlID) VALUES 
('DÝYADÝN',4),
('DOÐUBAYAZIT',4),
('ELEÞKÝRT',4),
('HAMUR',4),
('MERKEZ',4),
('PATNOS',4),
('TAÞLIÇAY',4),
('TUTAK',4);

INSERT INTO Ilce(Ad, IlID) VALUES 
('AÐAÇÖREN',68),
('ESKÝL',68),
('GÜLAÐAÇ',68),
('GÜZELYURT',68),
('MERKEZ',68),
('ORTAKÖY',68),
('SARIYAHÞÝ',68),
('SULTANHANI',68);

INSERT INTO Ilce(Ad, IlID) VALUES 
('GÖYNÜCEK',5),
('GÜMÜÞHACIKÖY',5),
('HAMAMÖZÜ',5),
('MERKEZ',5),
('MERZÝFON',5),
('SULUOVA',5),
('TAÞOVA',5);

INSERT INTO Ilce(Ad, IlID) VALUES 
('AKYURT',6),
('ALTINDAÐ',6),
('AYAÞ',6),
('BALA',6),
('BEYPAZARI',6),
('ÇAMLIDERE',6),
('ÇANKAYA',6),
('ÇUBUK',6),
('ELMADAÐ',6),
('ETÝMESGUT',6),
('EVREN',6),
('GÖLBAÞI',6),
('GÜDÜL',6),
('HAYMANA',6),
('KAHRAMANKAZAN',6),
('KALECÝK',6),
('KEÇÝÖREN',6),
('KIZILCAHAMAM',6),
('MAMAK',6),
('NALLIHAN',6),
('POLATLI',6),
('PURSAKLAR',6),
('SÝNCAN',6),
('ÞEREFLÝKOÇHÝSAR',6),
('YENÝMAHALLE',6);

INSERT INTO Ilce(Ad, IlID) VALUES 
('AKSEKÝ',7),
('AKSU',7),
('ALANYA',7),
('DEMRE',7),
('DÖÞEMEALTI',7),
('ELMALI',7),
('FÝNÝKE',7),
('GAZÝPAÞA',7),
('GÜNDOÐMUÞ',7),
('ÝBRADI',7),
('KAÞ',7),
('KEMER',7),
('KEPEZ',7),
('KONYAALTI',7),
('KORKUTELÝ',7),
('KUMLUCA',7),
('MANAVGAT',7),
('MURATPAÞA',7),
('SERÝK',7);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ÇILDIR',75),
('DAMAL',75),
('GÖLE',75),
('HANAK',75),
('MERKEZ',75),
('POSOF',75);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ARDANUÇ',8),
('ARHAVÝ',8),
('BORÇKA',8),
('HOPA',8),
('KEMALPAÞA',8),
('MERKEZ',8),
('MURGUL',8),
('ÞAVÞAT',8),
('YUSUFELÝ',8);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BOZDOÐAN',9),
('BUHARKENT',9),
('ÇÝNE',9),
('DÝDÝM',9),
('EFELER',9),
('GERMENCÝK',9),
('ÝNCÝRLÝOVA',9),
('KARACASU',9),
('KARPUZLU',9),
('KOÇARLI',9),
('KÖÞK',9),
('KUÞADASI',9),
('KUYUCAK',9),
('NAZÝLLÝ',9),
('SÖKE',9),
('SULTANHÝSAR',9),
('YENÝPAZAR',9);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALTIEYLÜL',10),
('AYVALIK',10),
('BALYA',10),
('BANDIRMA',10),
('BÝGADÝÇ',10),
('BURHANÝYE',10),
('DURSUNBEY',10),
('EDREMÝT',10),
('ERDEK',10),
('GÖMEÇ',10),
('GÖNEN',10),
('HAVRAN',10),
('ÝVRÝNDÝ',10),
('KARESÝ',10),
('KEPSUT',10),
('MANYAS',10),
('MARMARA',10),
('SAVAÞTEPE',10),
('SINDIRGI',10),
('SUSURLUK',10);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AMASRA',74),
('KURUCAÞÝLE',74),
('MERKEZ',74),
('ULUS',74);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BEÞÝRÝ',72),
('GERCÜÞ',72),
('HASANKEYF',72),
('KOZLUK',72),
('MERKEZ',72),
('SASON',72);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AYDINTEPE',69),
('DEMÝRÖZÜ',69),
('MERKEZ',69);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BOZÜYÜK',11),
('GÖLPAZARI',11),
('ÝNHÝSAR',11),
('MERKEZ',11),
('OSMANELÝ',11),
('PAZARYERÝ',11),
('SÖÐÜT',11),
('YENÝPAZAR',11);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ADAKLI',12),
('GENÇ',12),
('KARLIOVA',12),
('KÝÐI',12),
('MERKEZ',12),
('SOLHAN',12),
('YAYLADERE',12),
('YEDÝSU',12);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ADÝLCEVAZ',13),
('AHLAT',13),
('GÜROYMAK',13),
('HÝZAN',13),
('MERKEZ',13),
('MUTKÝ',13),
('TATVAN',13);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('DÖRTDÝVAN',14),
('GEREDE',14),
('GÖYNÜK',14),
('KIBRISCIK',14),
('MENGEN',14),
('MERKEZ',14),
('MUDURNU',14),
('SEBEN',14),
('YENÝÇAÐA',14);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AÐLASUN',15),
('ALTINYAYLA',15),
('BUCAK',15),
('ÇAVDIR',15),
('ÇELTÝKÇÝ',15),
('GÖLHÝSAR',15),
('KARAMANLI',15),
('KEMER',15),
('MERKEZ',15),
('TEFENNÝ',15),
('YEÞÝLOVA',15);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BÜYÜKORHAN',16),
('GEMLÝK',16),
('GÜRSU',16),
('HARMANCIK',16),
('ÝNEGÖL',16),
('ÝZNÝK',16),
('KARACABEY',16),
('KELES',16),
('KESTEL',16),
('MUDANYA',16),
('MUSTAFAKEMALPAÞA',16),
('NÝLÜFER',16),
('ORHANELÝ',16),
('ORHANGAZÝ',16),
('OSMANGAZÝ',16),
('YENÝÞEHÝR',16),
('YILDIRIM',16);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AYVACIK',17),
('BAYRAMÝÇ',17),
('BÝGA',17),
('BOZCAADA',17),
('ÇAN',17),
('ECEABAT',17),
('EZÝNE',17),
('GELÝBOLU',17),
('GÖKÇEADA',17),
('LAPSEKÝ',17),
('MERKEZ',17),
('YENÝCE',17);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ATKARACALAR',18),
('BAYRAMÖREN',18),
('ÇERKEÞ',18),
('ELDÝVAN',18),
('ILGAZ',18),
('KIZILIRMAK',18),
('KORGUN',18),
('KURÞUNLU',18),
('MERKEZ',18),
('ORTA',18),
('ÞABANÖZÜ',18),
('YAPRAKLI',18);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALACA',19),
('BAYAT',19),
('BOÐAZKALE',19),
('DODURGA',19),
('ÝSKÝLÝP',19),
('KARGI',19),
('LAÇÝN',19),
('MECÝTÖZÜ',19),
('MERKEZ',19),
('OÐUZLAR',19),
('ORTAKÖY',19),
('OSMANCIK',19),
('SUNGURLU',19),
('UÐURLUDAÐ',19);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ACIPAYAM',20),
('BABADAÐ',20),
('BAKLAN',20),
('BEKÝLLÝ',20),
('BEYAÐAÇ',20),
('BOZKURT',20),
('BULDAN',20),
('ÇAL',20),
('ÇAMELÝ',20),
('ÇARDAK',20),
('ÇÝVRÝL',20),
('GÜNEY',20),
('HONAZ',20),
('KALE',20),
('MERKEZEFENDÝ',20),
('PAMUKKALE',20),
('SARAYKÖY',20),
('SERÝNHÝSAR',20),
('TAVAS',20);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BAÐLAR',21),
('BÝSMÝL',21),
('ÇERMÝK',21),
('ÇINAR',21),
('ÇÜNGÜÞ',21),
('DÝCLE',21),
('EÐÝL',21),
('ERGANÝ',21),
('HANÝ',21),
('HAZRO',21),
('KAYAPINAR',21),
('KOCAKÖY',21),
('KULP',21),
('LÝCE',21),
('SÝLVAN',21),
('SUR',21),
('YENÝÞEHÝR',21);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKÇAKOCA',81),
('CUMAYERÝ',81),
('ÇÝLÝMLÝ',81),
('GÖLYAKA',81),
('GÜMÜÞOVA',81),
('KAYNAÞLI',81),
('MERKEZ',81),
('YIÐILCA',81);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ENEZ',22),
('HAVSA',22),
('ÝPSALA',22),
('KEÞAN',22),
('LALAPAÞA',22),
('MERÝÇ',22),
('MERKEZ',22),
('SÜLOÐLU',22),
('UZUNKÖPRÜ',22);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AÐIN',23),
('ALACAKAYA',23),
('ARICAK',23),
('BASKÝL',23),
('KARAKOÇAN',23),
('KEBAN',23),
('KOVANCILAR',23),
('MADEN',23),
('MERKEZ',23),
('PALU',23),
('SÝVRÝCE',23);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ÇAYIRLI',24),
('ÝLÝÇ',24),
('KEMAH',24),
('KEMALÝYE',24),
('MERKEZ',24),
('OTLUKBELÝ',24),
('REFAHÝYE',24),
('TERCAN',24),
('ÜZÜMLÜ',24);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AÞKALE',25),
('AZÝZÝYE',25),
('ÇAT',25),
('HINIS',25),
('HORASAN',25),
('ÝSPÝR',25),
('KARAÇOBAN',25),
('KARAYAZI',25),
('KÖPRÜKÖY',25),
('NARMAN',25),
('OLTU',25),
('OLUR',25),
('PALANDÖKEN',25),
('PASÝNLER',25),
('PAZARYOLU',25),
('ÞENKAYA',25),
('TEKMAN',25),
('TORTUM',25),
('UZUNDERE',25),
('YAKUTÝYE',25);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALPU',26),
('BEYLÝKOVA',26),
('ÇÝFTELER',26),
('GÜNYÜZÜ',26),
('HAN',26),
('ÝNÖNÜ',26),
('MAHMUDÝYE',26),
('MÝHALGAZÝ',26),
('MÝHALIÇÇIK',26),
('ODUNPAZARI',26),
('SARICAKAYA',26),
('SEYÝTGAZÝ',26),
('SÝVRÝHÝSAR',26),
('TEPEBAÞI',26);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ARABAN',27),
('ÝSLAHÝYE',27),
('KARKAMIÞ',27),
('NÝZÝP',27),
('NURDAÐI',27),
('OÐUZELÝ',27),
('ÞAHÝNBEY',27),
('ÞEHÝTKAMÝL',27),
('YAVUZELÝ',27);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALUCRA',28),
('BULANCAK',28),
('ÇAMOLUK',28),
('ÇANAKÇI',28),
('DERELÝ',28),
('DOÐANKENT',28),
('ESPÝYE',28),
('EYNESÝL',28),
('GÖRELE',28),
('GÜCE',28),
('KEÞAP',28),
('MERKEZ',28),
('PÝRAZÝZ',28),
('ÞEBÝNKARAHÝSAR',28),
('TÝREBOLU',28),
('YAÐLIDERE',28);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('KELKÝT',29),
('KÖSE',29),
('KÜRTÜN',29),
('MERKEZ',29),
('ÞÝRAN',29),
('TORUL',29);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ÇUKURCA',30),
('DERECÝK',30),
('MERKEZ',30),
('ÞEMDÝNLÝ',30),
('YÜKSEKOVA',30);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALTINÖZÜ',31),
('ANTAKYA',31),
('ARSUZ',31),
('BELEN',31),
('DEFNE',31),
('DÖRTYOL',31),
('ERZÝN',31),
('HASSA',31),
('ÝSKENDERUN',31),
('KIRIKHAN',31),
('KUMLU',31),
('PAYAS',31),
('REYHANLI',31),
('SAMANDAÐ',31),
('YAYLADAÐI',31);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ARALIK',76),
('KARAKOYUNLU',76),
('MERKEZ',76),
('TUZLUCA',76);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKSU',32),
('ATABEY',32),
('EÐÝRDÝR',32),
('GELENDOST',32),
('GÖNEN',32),
('KEÇÝBORLU',32),
('MERKEZ',32),
('SENÝRKENT',32),
('SÜTÇÜLER',32),
('ÞARKÝKARAAÐAÇ',32),
('ULUBORLU',32),
('YALVAÇ',32),
('YENÝÞARBADEMLÝ',32);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ADALAR',34),
('ARNAVUTKÖY',34),
('ATAÞEHÝR',34),
('AVCILAR',34),
('BAÐCILAR',34),
('BAHÇELÝEVLER',34),
('BAKIRKÖY',34),
('BAÞAKÞEHÝR',34),
('BAYRAMPAÞA',34),
('BEÞÝKTAÞ',34),
('BEYKOZ',34),
('BEYLÝKDÜZÜ',34),
('BEYOÐLU',34),
('BÜYÜKÇEKMECE',34),
('ÇATALCA',34),
('ÇEKMEKÖY',34),
('ESENLER',34),
('ESENYURT',34),
('EYÜPSULTAN',34),
('FATÝH',34),
('GAZÝOSMANPAÞA',34),
('GÜNGÖREN',34),
('KADIKÖY',34),
('KAÐITHANE',34),
('KARTAL',34),
('KÜÇÜKÇEKMECE',34),
('MALTEPE',34),
('PENDÝK',34),
('SANCAKTEPE',34),
('SARIYER',34),
('SÝLÝVRÝ',34),
('SULTANBEYLÝ',34),
('SULTANGAZÝ',34),
('ÞÝLE',34),
('ÞÝÞLÝ',34),
('TUZLA',34),
('ÜMRANÝYE',34),
('ÜSKÜDAR',34),
('ZEYTÝNBURNU',34);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALÝAÐA',35),
('BALÇOVA',35),
('BAYINDIR',35),
('BAYRAKLI',35),
('BERGAMA',35),
('BEYDAÐ',35),
('BORNOVA',35),
('BUCA',35),
('ÇEÞME',35),
('ÇÝÐLÝ',35),
('DÝKÝLÝ',35),
('FOÇA',35),
('GAZÝEMÝR',35),
('GÜZELBAHÇE',35),
('KARABAÐLAR',35),
('KARABURUN',35),
('KARÞIYAKA',35),
('KEMALPAÞA',35),
('KINIK',35),
('KÝRAZ',35),
('KONAK',35),
('MENDERES',35),
('MENEMEN',35),
('NARLIDERE',35),
('ÖDEMÝÞ',35),
('SEFERÝHÝSAR',35),
('SELÇUK',35),
('TÝRE',35),
('TORBALI',35),
('URLA',35);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AFÞÝN',46),
('ANDIRIN',46),
('ÇAÐLAYANCERÝT',46),
('DULKADÝROÐLU',46),
('EKÝNÖZÜ',46),
('ELBÝSTAN',46),
('GÖKSUN',46),
('NURHAK',46),
('ONÝKÝÞUBAT',46),
('PAZARCIK',46),
('TÜRKOÐLU',46);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('EFLANÝ',78),
('ESKÝPAZAR',78),
('MERKEZ',78),
('OVACIK',78),
('SAFRANBOLU',78),
('YENÝCE',78);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AYRANCI',70),
('BAÞYAYLA',70),
('ERMENEK',70),
('KAZIMKARABEKÝR',70),
('MERKEZ',70),
('SARIVELÝLER',70);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKYAKA',36),
('ARPAÇAY',36),
('DÝGOR',36),
('KAÐIZMAN',36),
('MERKEZ',36),
('SARIKAMIÞ',36),
('SELÝM',36),
('SUSUZ',36);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ABANA',37),
('AÐLI',37),
('ARAÇ',37),
('AZDAVAY',37),
('BOZKURT',37),
('CÝDE',37),
('ÇATALZEYTÝN',37),
('DADAY',37),
('DEVREKANÝ',37),
('DOÐANYURT',37),
('HANÖNÜ',37),
('ÝHSANGAZÝ',37),
('ÝNEBOLU',37),
('KÜRE',37),
('MERKEZ',37),
('PINARBAÞI',37),
('SEYDÝLER',37),
('ÞENPAZAR',37),
('TAÞKÖPRÜ',37),
('TOSYA',37);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKKIÞLA',38),
('BÜNYAN',38),
('DEVELÝ',38),
('FELAHÝYE',38),
('HACILAR',38),
('ÝNCESU',38),
('KOCASÝNAN',38),
('MELÝKGAZÝ',38),
('ÖZVATAN',38),
('PINARBAÞI',38),
('SARIOÐLAN',38),
('SARIZ',38),
('TALAS',38),
('TOMARZA',38),
('YAHYALI',38),
('YEÞÝLHÝSAR',38);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BAHÞILI',71),
('BALIÞEYH',71),
('ÇELEBÝ',71),
('DELÝCE',71),
('KARAKEÇÝLÝ',71),
('KESKÝN',71),
('MERKEZ',71),
('SULAKYURT',71),
('YAHÞÝHAN',71);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BABAESKÝ',39),
('DEMÝRKÖY',39),
('KOFÇAZ',39),
('LÜLEBURGAZ',39),
('MERKEZ',39),
('PEHLÝVANKÖY',39),
('PINARHÝSAR',39),
('VÝZE',39);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKÇAKENT',40),
('AKPINAR',40),
('BOZTEPE',40),
('ÇÝÇEKDAÐI',40),
('KAMAN',40),
('MERKEZ',40),
('MUCUR',40);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ELBEYLÝ',79),
('MERKEZ',79),
('MUSABEYLÝ',79),
('POLATELÝ',79);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BAÞÝSKELE',41),
('ÇAYIROVA',41),
('DARICA',41),
('DERÝNCE',41),
('DÝLOVASI',41),
('GEBZE',41),
('GÖLCÜK',41),
('ÝZMÝT',41),
('KANDIRA',41),
('KARAMÜRSEL',41),
('KARTEPE',41),
('KÖRFEZ',41);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AHIRLI',42),
('AKÖREN',42),
('AKÞEHÝR',42),
('ALTINEKÝN',42),
('BEYÞEHÝR',42),
('BOZKIR',42),
('CÝHANBEYLÝ',42),
('ÇELTÝK',42),
('ÇUMRA',42),
('DERBENT',42),
('DEREBUCAK',42),
('DOÐANHÝSAR',42),
('EMÝRGAZÝ',42),
('EREÐLÝ',42),
('GÜNEYSINIR',42),
('HADÝM',42),
('HALKAPINAR',42),
('HÜYÜK',42),
('ILGIN',42),
('KADINHANI',42),
('KARAPINAR',42),
('KARATAY',42),
('KULU',42),
('MERAM',42),
('SARAYÖNÜ',42),
('SELÇUKLU',42),
('SEYDÝÞEHÝR',42),
('TAÞKENT',42),
('TUZLUKÇU',42),
('YALIHÜYÜK',42),
('YUNAK',42);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALTINTAÞ',43),
('ASLANAPA',43),
('ÇAVDARHÝSAR',43),
('DOMANÝÇ',43),
('DUMLUPINAR',43),
('EMET',43),
('GEDÝZ',43),
('HÝSARCIK',43),
('MERKEZ',43),
('PAZARLAR',43),
('SÝMAV',43),
('ÞAPHANE',43),
('TAVÞANLI',43);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKÇADAÐ',44),
('ARAPGÝR',44),
('ARGUVAN',44),
('BATTALGAZÝ',44),
('DARENDE',44),
('DOÐANÞEHÝR',44),
('DOÐANYOL',44),
('HEKÝMHAN',44),
('KALE',44),
('KULUNCAK',44),
('PÜTÜRGE',44),
('YAZIHAN',44),
('YEÞÝLYURT',44);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AHMETLÝ',45),
('AKHÝSAR',45),
('ALAÞEHÝR',45),
('DEMÝRCÝ',45),
('GÖLMARMARA',45),
('GÖRDES',45),
('KIRKAÐAÇ',45),
('KÖPRÜBAÞI',45),
('KULA',45),
('SALÝHLÝ',45),
('SARIGÖL',45),
('SARUHANLI',45),
('SELENDÝ',45),
('SOMA',45),
('ÞEHZADELER',45),
('TURGUTLU',45),
('YUNUSEMRE',45);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ARTUKLU',47),
('DARGEÇÝT',47),
('DERÝK',47),
('KIZILTEPE',47),
('MAZIDAÐI',47),
('MÝDYAT',47),
('NUSAYBÝN',47),
('ÖMERLÝ',47),
('SAVUR',47),
('YEÞÝLLÝ',47);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKDENÝZ',33),
('ANAMUR',33),
('AYDINCIK',33),
('BOZYAZI',33),
('ÇAMLIYAYLA',33),
('ERDEMLÝ',33),
('GÜLNAR',33),
('MEZÝTLÝ',33),
('MUT',33),
('SÝLÝFKE',33),
('TARSUS',33),
('TOROSLAR',33),
('YENÝÞEHÝR',33);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BODRUM',48),
('DALAMAN',48),
('DATÇA',48),
('FETHÝYE',48),
('KAVAKLIDERE',48),
('KÖYCEÐÝZ',48),
('MARMARÝS',48),
('MENTEÞE',48),
('MÝLAS',48),
('ORTACA',48),
('SEYDÝKEMER',48),
('ULA',48),
('YATAÐAN',48);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BULANIK',49),
('HASKÖY',49),
('KORKUT',49),
('MALAZGÝRT',49),
('MERKEZ',49),
('VARTO',49);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ACIGÖL',50),
('AVANOS',50),
('DERÝNKUYU',50),
('GÜLÞEHÝR',50),
('HACIBEKTAÞ',50),
('KOZAKLI',50),
('MERKEZ',50),
('ÜRGÜP',50);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALTUNHÝSAR',51),
('BOR',51),
('ÇAMARDI',51),
('ÇÝFTLÝK',51),
('MERKEZ',51),
('ULUKIÞLA',51);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKKUÞ',52),
('ALTINORDU',52),
('AYBASTI',52),
('ÇAMAÞ',52),
('ÇATALPINAR',52),
('ÇAYBAÞI',52),
('FATSA',52),
('GÖLKÖY',52),
('GÜLYALI',52),
('GÜRGENTEPE',52),
('ÝKÝZCE',52),
('KABADÜZ',52),
('KABATAÞ',52),
('KORGAN',52),
('KUMRU',52),
('MESUDÝYE',52),
('PERÞEMBE',52),
('ULUBEY',52),
('ÜNYE',52);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BAHÇE',80),
('DÜZÝÇÝ',80),
('HASANBEYLÝ',80),
('KADÝRLÝ',80),
('MERKEZ',80),
('SUMBAS',80),
('TOPRAKKALE',80);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ARDEÞEN',53),
('ÇAMLIHEMÞÝN',53),
('ÇAYELÝ',53),
('DEREPAZARI',53),
('FINDIKLI',53),
('GÜNEYSU',53),
('HEMÞÝN',53),
('ÝKÝZDERE',53),
('ÝYÝDERE',53),
('KALKANDERE',53),
('MERKEZ',53),
('PAZAR',53);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ADAPAZARI',54),
('AKYAZI',54),
('ARÝFÝYE',54),
('ERENLER',54),
('FERÝZLÝ',54),
('GEYVE',54),
('HENDEK',54),
('KARAPÜRÇEK',54),
('KARASU',54),
('KAYNARCA',54),
('KOCAALÝ',54),
('PAMUKOVA',54),
('SAPANCA',54),
('SERDÝVAN',54),
('SÖÐÜTLÜ',54),
('TARAKLI',54);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('19 MAYIS',55),
('ALAÇAM',55),
('ASARCIK',55),
('ATAKUM',55),
('AYVACIK',55),
('BAFRA',55),
('CANÝK',55),
('ÇARÞAMBA',55),
('HAVZA',55),
('ÝLKADIM',55),
('KAVAK',55),
('LADÝK',55),
('SALIPAZARI',55),
('TEKKEKÖY',55),
('TERME',55),
('VEZÝRKÖPRÜ',55),
('YAKAKENT',55);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BAYKAN',56),
('ERUH',56),
('KURTALAN',56),
('MERKEZ',56),
('PERVARÝ',56),
('ÞÝRVAN',56),
('TÝLLO',56);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AYANCIK',57),
('BOYABAT',57),
('DÝKMEN',57),
('DURAÐAN',57),
('ERFELEK',57),
('GERZE',57),
('MERKEZ',57),
('SARAYDÜZÜ',57),
('TÜRKELÝ',57);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKINCILAR',58),
('ALTINYAYLA',58),
('DÝVRÝÐÝ',58),
('DOÐANÞAR',58),
('GEMEREK',58),
('GÖLOVA',58),
('GÜRÜN',58),
('HAFÝK',58),
('ÝMRANLI',58),
('KANGAL',58),
('KOYULHÝSAR',58),
('MERKEZ',58),
('SUÞEHRÝ',58),
('ÞARKIÞLA',58),
('ULAÞ',58),
('YILDIZELÝ',58),
('ZARA',58);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKÇAKALE',63),
('BÝRECÝK',63),
('BOZOVA',63),
('CEYLANPINAR',63),
('EYYÜBÝYE',63),
('HALFETÝ',63),
('HALÝLÝYE',63),
('HARRAN',63),
('HÝLVAN',63),
('KARAKÖPRÜ',63),
('SÝVEREK',63),
('SURUÇ',63),
('VÝRANÞEHÝR',63);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BEYTÜÞÞEBAP',73),
('CÝZRE',73),
('GÜÇLÜKONAK',73),
('ÝDÝL',73),
('MERKEZ',73),
('SÝLOPÝ',73),
('ULUDERE',73);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ÇERKEZKÖY',59),
('ÇORLU',59),
('ERGENE',59),
('HAYRABOLU',59),
('KAPAKLI',59),
('MALKARA',59),
('MARMARAEREÐLÝSÝ',59),
('MURATLI',59),
('SARAY',59),
('SÜLEYMANPAÞA',59),
('ÞARKÖY',59);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALMUS',60),
('ARTOVA',60),
('BAÞÇÝFTLÝK',60),
('ERBAA',60),
('MERKEZ',60),
('NÝKSAR',60),
('PAZAR',60),
('REÞADÝYE',60),
('SULUSARAY',60),
('TURHAL',60),
('YEÞÝLYURT',60),
('ZÝLE',60);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKÇAABAT',61),
('ARAKLI',61),
('ARSÝN',61),
('BEÞÝKDÜZÜ',61),
('ÇARÞIBAÞI',61),
('ÇAYKARA',61),
('DERNEKPAZARI',61),
('DÜZKÖY',61),
('HAYRAT',61),
('KÖPRÜBAÞI',61),
('MAÇKA',61),
('OF',61),
('ORTAHÝSAR',61),
('SÜRMENE',61),
('ÞALPAZARI',61),
('TONYA',61),
('VAKFIKEBÝR',61),
('YOMRA',61);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ÇEMÝÞGEZEK',62),
('HOZAT',62),
('MAZGÝRT',62),
('MERKEZ',62),
('NAZIMÝYE',62),
('OVACIK',62),
('PERTEK',62),
('PÜLÜMÜR',62);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BANAZ',64),
('EÞME',64),
('KARAHALLI',64),
('MERKEZ',64),
('SÝVASLI',64),
('ULUBEY',64);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('BAHÇESARAY',65),
('BAÞKALE',65),
('ÇALDIRAN',65),
('ÇATAK',65),
('EDREMÝT',65),
('ERCÝÞ',65),
('GEVAÞ',65),
('GÜRPINAR',65),
('ÝPEKYOLU',65),
('MURADÝYE',65),
('ÖZALP',65),
('SARAY',65),
('TUÞBA',65);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALTINOVA',77),
('ARMUTLU',77),
('ÇINARCIK',77),
('ÇÝFTLÝKKÖY',77),
('MERKEZ',77),
('TERMAL',77);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('AKDAÐMADENÝ',66),
('AYDINCIK',66),
('BOÐAZLIYAN',66),
('ÇANDIR',66),
('ÇAYIRALAN',66),
('ÇEKEREK',66),
('KADIÞEHRÝ',66),
('MERKEZ',66),
('SARAYKENT',66),
('SARIKAYA',66),
('SORGUN',66),
('ÞEFAATLÝ',66),
('YENÝFAKILI',66),
('YERKÖY',66);
 
INSERT INTO Ilce(Ad, IlID) VALUES 
('ALAPLI',67),
('ÇAYCUMA',67),
('DEVREK',67),
('EREÐLÝ',67),
('GÖKÇEBEY',67),
('KÝLÝMLÝ',67),
('KOZLU',67),
('MERKEZ',67);

INSERT INTO Bolge(Ad) VALUES 
('Akdeniz Bölgesi'),
('Doðu Anadolu Bölgesi'),
('Ege Bölgesi'),
('Güneydoðu Anadolu Bölgesi'),
('Ýç Anadolu Bölgesi'),
('Karadeniz Bölgesi'),
('Marmara Bölgesi');

INSERT INTO PersonelTip(Ad,Maas) VALUES
('Genel Müdür',20000),
('Müdür',15000),
('Þoför',12000),
('Temizlik Görevlisi',4250),
('Kasiyer',4000),
('Memur',8000);

INSERT INTO Sirket(Ad) VALUES
('Arçelik'),
('Vestel'),
('Sunny'),
('Bosch'),
('Finlux'),
('LG'),
('Samsung'),
('Apple'),
('Xioami'),
('Motorola'),
('Nokia'),
('Huawei'),
('Opet'),
('Petrol Ofisi'),
('Lukoil'),
('Yozgat Bozok Üniversitesi'),
('Gittigidiyor'),
('Facebook'),
('Twitter'),
('Linkedin'),
('Sürmeligaz'),
('Türk Telekom'),
('Türk Hava Yollarý'),
('Vaillant');

-----

INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (477245,76775194195,'Delal Abdullatif','Abzak',3,05516237258);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (358094,17732541499,'Fatma Özlem','Acar',5,05321591567);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (698064,76537431273,'Özde','Acarkan',4,05538889616);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (189315,85151143619,'Atahan','Adanýr',1,05526936469);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (204847,11379365878,'Hacý Mehmet','Adýgüzel',4,05454372893);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (830076,58824555184,'Mükerrem Zeynep','Aðca',3,05438265159);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (820002,44415469771,'Bestami','Aðýraðaç',6,05413738741);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (824795,28239178841,'Aykanat','Aðýroðlu',5,05327967961);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (398309,86472494723,'Þennur','Aðnar',4,05323127675);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (571275,29888261637,'Tutkum','Ahmadý Asl',3,05458336665);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (394503,83145261682,'Mügenur','Ahmet',2,05455797254);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (511034,71967959667,'Sevinç','Ak',2,05333495234);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (397647,42969173417,'Kayýhan Nedim','Akarcalý',2,05458524211);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (962653,75829825585,'Lemi','Akarçay',1,05441999614);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (522381,53426342356,'Cihan','Akarpýnar',5,05342783359);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (804742,65165134165,'Rafi','Akaþ',1,05556347627);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (354223,28419941538,'Mehmetcan','Akay',4,05458358784);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (923430,56185259388,'Nuhaydar','Akbilmez',1,05514643251);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (506165,86191993969,'Emine Münevver','Akca',5,05539257561);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (293007,21188318352,'Servet','Akçagunay',6,05433896783);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (446380,68148518597,'Çilem','Akçay',5,05414215631);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (583780,43861235284,'Recep Ali Samet','Akdoðan',2,05415944552);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (832832,65293632624,'Emre Ayberk','Akfýrat',2,05319249917);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (114998,77891178868,'Kerime Hacer','Akýllý',2,05455159536);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (368571,55938566873,'Ercüment','Akýncýlar',1,05333462821);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (269303,99265515519,'Sarper','Akýþ',2,05353291845);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (600393,77411511235,'Berker','Akkiray',6,05318438793);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (729177,72544827676,'Ýclal','Akkoyun',3,05437595533);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (560692,39521154869,'Lemis','Akküt',2,05524652953);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (664750,96798693169,'Ahmet Polat','Aklar Çörekçi',6,05327427485);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (457923,45711648789,'Ata Kerem','Akman',3,05333363569);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (309974,11793937165,'Ahmet Raþit','Akoðuz',2,05533822911);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (590199,65728228947,'Ecem Hatice','Akova',4,05353974746);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (642695,52658731558,'Nüket','Aksan',4,05446874947);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (426861,78297217461,'Senem','Aksevim',2,05524339651);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (201678,47138341965,'Ayþen','Aksoy',4,05347183744);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (863474,96565536946,'Pekcan','Aksöz',3,05429749861);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (388256,14663865117,'Bedirhan Lütfü','Akþamoðlu',1,05524761843);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (810259,37572125933,'Semina','Aktuna',3,05334846738);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (110995,17141439423,'Eda Sena','Akyýldýz',4,05416451652);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (835713,11118916651,'Müyesser','Akyildirim',1,05412229761);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (325906,39312628513,'Selinti','Al',5,05422133378);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (868867,16562715654,'Bahar Özlem','Albaþ',1,05432544549);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (451968,64824114262,'Ýlma','Aldað',4,05415177645);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (583733,89311592281,'Kutlu','Alibeyoðlu',4,05313789917);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (488742,87968492492,'Nesibe Nurefþan','Alkan',6,05328649648);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (490136,18192436785,'Ömer Buðra','Alparslan',5,05316319131);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (996822,83622332112,'Hiba','Alpuðan',1,05315925223);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (922508,57323798761,'Mazlum','Altan',5,05311517356);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (270469,37896889195,'Elif Tuðçe','Altaþ',5,05329841166);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (726014,58975184673,'Ahmet Ruken','Altay',6,05526439161);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (372430,43486411439,'Yaþar Utku Anýl','Altýn',1,05421947465);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (692283,42956544671,'Rana','Altýnoklu',5,05454176197);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (437726,34957159146,'Fethullah','Altýnöz',1,05354257654);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (596147,59176168781,'Burak Tatkan','Altýntaþ',1,05539295283);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (351705,41944955245,'Merve Ece','Altýok',5,05514683492);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (473547,54557573922,'Rima','Altýparmak',1,05321911756);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (611321,96539653145,'Elif Dilay','Altinkaya',1,05553179172);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (909848,29726697158,'Sýrma Begüm','Altunbaþ',5,05358777383);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (630374,64994486647,'Nefse','Altunbulak',6,05557141631);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (509163,79877977524,'Büþra Gül','Altundal',4,05425655562);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (997524,27771519191,'Erna','Aluç',4,05448849357);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (848481,65366735615,'Hikmet Nazlý','Alver',1,05525127586);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (784666,83589237458,'Ýsmail Umut','Anýk',2,05423948226);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (367260,58124143746,'Ýlkay Ramazan','Ankara',1,05555175557);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (317330,78144999729,'Nebahat','Ansen',1,05429361996);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (246244,36574174157,'Ýlyas Umut','Apul',5,05538667375);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (541729,74963466615,'Halim','Aral',1,05411289383);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (243967,37719858227,'Yasin Þükrü','Arap',5,05448859881);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (356159,33169122839,'Cansev','Arat',5,05418431367);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (958673,57613579793,'Memet Ali','Ardýç',5,05334665533);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (542329,58873225746,'Deniz Dilay','Arýcan',6,05558798115);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (305045,14791528821,'Ýzlem','Arýnç',3,05317796683);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (559414,87426236888,'Öget','Arif',5,05323259783);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (163679,57317933515,'Þeyda Nur','Arikan',5,05447297442);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (335962,51223917327,'Zeki Yiðithan','Armutcu',6,05454437421);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (646250,91679818845,'Nunazlý','Arpacý',4,05512462362);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (540070,61318991245,'Ferdacan','Aruca',6,05453381415);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (324392,39441547637,'Þerife','Asil',3,05359165733);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (576126,77219275456,'Mustafa Burhan','Askýn',3,05531798477);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (482602,84487916288,'Ilým','Aslantürk',1,05413867232);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (562734,86199924781,'Sevginur','Aþcý',1,05446716644);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (402118,59571486163,'Hayrunnisa','Aþveren',1,05313353945);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (353328,96768764688,'Hanife Duygu','Ata',6,05441395557);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (426028,24548745754,'Sevtap','Atan',5,05436168925);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (431471,11199251779,'Paksoy','Ateþ',6,05434648518);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (982696,19122884754,'Ýlkim','Ateþcan',5,05426485317);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (329933,37468993829,'Rubabe Gökçen','Atlý',4,05453294236);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (587791,13517164197,'Saba','Atmaca',3,05329629343);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (348642,75893455466,'Çisem','Atok',2,05356268448);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (251050,16398512923,'Sabiha Elvan','Atol',2,05449574997);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (100121,62915829498,'Edip','Attila',6,05552373457);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (465847,74835731621,'Almina','Avcý Özsoy',3,05445255262);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (967548,11684595355,'Saime','Avýandý',5,05351961223);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (426153,73444918517,'Nehar','Avþar',5,05423855386);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (229150,34296712325,'Kaan Muharrem','Ay',4,05456114175);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (852035,15895688296,'Murat Kaan','Ayanoglu',4,05359538684);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (616147,18611242743,'Murat Sinan','Ayaz',4,05524785494);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (194284,99146352537,'Ateþ','Aycý',3,05559249328);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (206455,95964336475,'Zeynep Nihan','Aydýnlýoðlu',4,05521772522);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (443722,33563979324,'Kerime','Aydoðan Yozgat',5,05323533695);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (576302,92634876339,'Hami','Aydoðdu',4,05315362661);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (400166,85688271693,'Thomas','Aygen',2,05423971136);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (939041,11666957535,'Güneþ','Aykan',6,05446782386);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (759937,36335714677,'Elif Feyza','Ayrým',6,05519393948);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (151738,65299194171,'Uður Ali','Aysal',3,05529624516);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (639804,89193797196,'Osman Yasin','Aysan',1,05424874437);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (594864,91241219718,'Adem','Ayvacýk',2,05538935798);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (786196,36375797449,'Sera Cansýn','Azbay',5,05553331734);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (356688,58758457552,'Ali Ýsmail','Babacan',5,05524663839);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (270227,84184429961,'Ruhugül','Babadostu',3,05555692665);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (428129,89119527479,'Alçiçek','Bad',3,05331439162);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (903997,19396254998,'Memet','Baðcý',4,05317741288);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (849584,11366292597,'Mercan','Baðçivan',3,05354719522);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (553630,43775122275,'Gökay','Baðýþ',4,05526473318);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (880151,76843659638,'Pýrýltý','Bahçeli',1,05339136769);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (258829,49231856229,'Özgün','Bahtýyar',1,05558284136);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (518991,38624484386,'Özgen','Baka',1,05551187958);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (740058,17786843629,'Seung Hun','Baki',5,05532442757);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (725548,51578598388,'Gülser','Bal',6,05327139918);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (575667,49615848347,'Yüksel','Balcý',1,05531486968);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (863696,31198484734,'Ecren','Baldo',1,05354199836);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (793131,99428769395,'Muhammet Raþit','Balý',2,05513413623);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (170878,31853199952,'Sakýp','Balýoðlu',5,05356251195);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (581238,32941265995,'Kazým','Balta',6,05421935312);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (602235,94997875821,'Abdullah Atakan','Baluken',5,05525922679);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (618722,71216768218,'Coþkun','Baran',2,05423137324);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (886405,48695484698,'Serdar Kaan','Barbaros',4,05318289928);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (451295,55981566133,'Ezel','Bargan',3,05437182899);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (784255,65596789157,'Ayþegül','Barutçuoðlu',3,05322885728);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (164288,65838762498,'Sefa Kadir','Baþar',4,05528777313);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (477240,26989378519,'Elif Etga','Baþeðmez',4,05514281642);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (706968,64633836496,'Balýn','Baþtepe',1,05548721349);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (851317,94483559194,'Mahperi','Baþtopçu',3,05452791199);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (859350,39436551298,'Erol Özgür','Baþtuð',4,05356238678);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (834016,93752792796,'Atak','Batar',1,05542929945);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (867852,62877939216,'Safa','Batga',6,05335933127);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (377331,88969884939,'Gökmen','Battal',2,05436779954);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (563864,85521347716,'Fazýl Erem','Batuk',6,05547256781);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (197545,39712185522,'Bensu','Batur',4,05446537584);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (496879,42766945919,'Nazým Orhun','Baturalp',4,05356161472);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (284481,66445149266,'Safa Ahmet','Baydar',5,05441384689);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (184948,97865992295,'Demircan','Baydil',6,05553562463);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (847209,38166985189,'Burçin Kübra','Baykal',5,05415444919);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (945807,56176964556,'Derviþ Haluk','Baykan',4,05417512161);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (398327,89165712612,'Taylan Remzi','Baykuþ',1,05318329747);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (926574,35978799913,'Abdulvahap','Bayrakoðlu',4,05347341696);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (600943,28357438344,'Aygün','Bayram',4,05441684899);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (818670,93872718398,'Ayla','Baytýn',2,05428227731);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (110709,48315368563,'Kubilay Barýþ','Begiç',1,05344511696);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (116581,99433697464,'Mustafa Samed','Beðenilmiþ',4,05455349182);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (503985,27758138533,'Berfin Dilay','Bekaroðlu',5,05427993318);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (599767,72113996543,'Ýbrahim Onat','Belge',3,05442824155);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (539991,26173265811,'Jutenya','Benan',1,05451371211);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (764315,99994161538,'Hulki','Bent',6,05554858274);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (820731,73214461447,'Mustafa Doðukan','Berberoðlu',6,05554243714);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (569175,52871937762,'Hüner','Berk',6,05414955367);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (334909,19811697487,'Buse Gizem','Berker',3,05544223658);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (338341,34332949671,'Halime','Beydað',2,05517826375);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (616717,53456924319,'Didem','Býçaksýz',5,05316559498);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (554510,68462218132,'Mihrinaz','Bilal',1,05349739359);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (955728,38719573713,'Lal','Bilgeç',2,05316525514);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (205913,96727443527,'Senay','Bilgen',5,05456959955);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (643423,88276859778,'Remzi','Bilgi',6,05415194456);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (688121,41891284346,'Armaðan','Bilgiç',2,05555129592);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (727803,57596835781,'Çelik','Bilgir',1,05332833493);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (422218,46553911187,'Kübra Tansu','Bilgit',3,05548644288);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (210942,31547714551,'Uluç Emre','Binbay',1,05442868411);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (680994,15569168165,'Mehmet Buðrahan','Birgili',4,05551936452);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (285867,25879885373,'Doðuþcan','Biriz',5,05342239314);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (797019,22331895875,'Altan','Boy',5,05443572171);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (151745,31672587112,'Bengisu','Boya',1,05327151442);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (738896,42975212628,'Onur Taylan','Boylu',6,05548438599);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (731938,63448242236,'Ayseren','Boyuktaþ',6,05325499213);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (298801,28784621986,'Pekin','Boz',5,05352581664);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (471663,91693379372,'Aksu','Bozdað',4,05547379396);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (903063,56199699631,'Arkan','Bozdemir',4,05442837296);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (542907,99361215814,'Ýltem','Boztepe',6,05438499679);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (105265,13524962189,'Betül','Bozyer',6,05327745248);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (632995,38665269442,'Ogün','Bölge',1,05432174953);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (226345,21121645742,'Ýbrahim Hakký','Bugey',5,05523527227);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (295942,17693241758,'Onay','Buðdaypýnarý',2,05423844344);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (592450,88574345957,'Cankýz','Bulgan',4,05558275427);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (797559,63871936184,'Arzucan','Bulgur',6,05412959264);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (845173,35641673856,'Asiye','Burabak',2,05432378132);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (742288,84328588715,'Ahmet Yasin','Burak',1,05549418784);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (417022,67399312251,'Yaprak','Bural',5,05342376973);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (270850,97275154551,'Aleda','Buyuran',2,05347954617);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (852213,25915791257,'Can Güney','Bülbül',5,05535427117);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (720258,32433477556,'Mahmut Bilal','Bülend',3,05555366673);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (591308,72155874911,'Saliha Zeynep','Bülent',5,05556722563);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (598088,17228255131,'Melike Dilara','Büyükfýrat',2,05327971823);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (200391,55582176468,'Hayriye','Büyükgüngör',6,05559179385);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (347589,55491779228,'Sebiha','Büyüköztürk',2,05458546773);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (344515,29666996451,'Mehmet','Can Akçaözoðlu',4,05326648876);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (862869,45636451339,'Mehmet Enes','Canan',4,05527938333);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (299958,79483172124,'Kurtbey','Canbaðý',4,05345166619);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (377440,82161372267,'Mustafa Taha','Canbek',4,05459185158);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (191973,53378125892,'Sena Nur','Candan',6,05412571481);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (415841,65175732656,'Abdullah Emirhan','Caner',6,05334496561);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (734013,15825826291,'Mustafa Kerem','Cansu',6,05511831821);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (793550,15331126574,'Doktora','Canuyar',4,05357997555);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (839352,45131833118,'Seyit','Ceran',6,05555232757);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (998152,14423283572,'Selma Simge','Ceylan',3,05426996952);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (413655,17815865719,'Aþkým','Chiklyaukova',2,05519176494);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (659286,61867155739,'Özgür','Choi',3,05421888268);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (636969,84655474398,'Tuðce','Cibooðlu',2,05327787494);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (656211,54151142669,'Özer Seçkin','Ciddi',1,05458827179);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (559252,53948824757,'Balkýn','Cigerlioðlu',5,05414324161);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (143365,77711382952,'Yücel','Civan',3,05539636652);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (309133,24665998135,'Þansal','Coþan',2,05556158629);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (714122,28593216421,'Oðuzcan','Coþandal',3,05556588295);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (965156,34877221845,'Mayýs','Cumalý',6,05312139319);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (910708,97897664264,'Büþra','Cüce',2,05539856894);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (510934,44922218741,'Afra Selcen','Çaðan',4,05414517762);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (522413,47539924467,'Gönül','Çaðatay',6,05457182625);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (137088,42273441652,'Doðangün','Çaðlar',3,05312343411);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (888133,93838282998,'Elif Ege','Çaðlayan',1,05331367578);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (935029,63622449634,'Özen','Çakan',6,05312653316);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (963254,51129834126,'Dilhan','Çakanel',4,05354578557);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (309474,31792347121,'Maral','Çakýcý',6,05343787815);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (145159,38844446992,'Mahire','Çalým',6,05335299267);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (583873,68799152278,'Hacý Bayram Ufuk','Çamaþ',6,05322468438);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (723020,43228167714,'Oltun','Çanga',6,05434433756);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (780445,73746272575,'Önel','Çapa',6,05554547789);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (743230,23119238192,'Bayülken','Çaprak',5,05325613683);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (176483,58763874193,'Dilseren','Çarýcý',2,05333737529);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (503163,91239483456,'Elif Beyza','Çark',3,05519478148);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (583852,25372696773,'Elvan','Çatal',4,05523392679);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (719179,95883867899,'Esim','Çaylar',2,05514194872);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (716500,44758337999,'Sena','Çekmecelioðlu',4,05556376244);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (239661,44951751835,'Muhammed Üzeyir','Çekmeci',4,05427357472);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (927145,52999736553,'Aydýn Mert','Çelebican',5,05529842588);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (974723,54693649723,'Çaðkan','Çelenlioðlu',5,05425268851);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (837282,85765374529,'Zümra','Çelýk',5,05326672621);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (846035,85389385173,'Bayar','Çelik',3,05448995843);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (161320,91917262492,'Gönülgül','Çelikaðý',2,05545332962);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (337633,74318447225,'Ece Pýnar','Çeliker',1,05536841918);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (982168,18482548338,'Mehmet Tarýk','Çelikkol',2,05329342943);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (569121,46352541376,'Elife','Çerçi',1,05436661894);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (284399,67115137169,'Efecan','Çetintaþ',6,05555329795);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (823080,11683612249,'Rýdvan','Çýkýkcý',4,05434397992);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (574856,58331725356,'Hatice Gamze','Çýnar',1,05538386856);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (699713,83273535354,'Yansý Hilal','Çýnaroðlu',4,05338185484);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (763316,66723382823,'Omaç','Çýngýr',1,05559374787);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (582924,91554873494,'Erhan','Çýray',5,05441532448);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (531673,19457278158,'Þüheda','Çiçekli',4,05344163566);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (580026,33142736813,'Ünkan','Çini',3,05353975453);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (695173,37544232471,'Ahmet Gazi','Çintan',1,05449874199);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (243213,34265557355,'Seher Ýrem','Çitfçi',3,05337487785);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (590208,28376386835,'Gürbüz','Çivici',5,05557866414);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (688708,94966986313,'Zülal','Çolak',1,05423359339);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (154826,61354237849,'Ozan Ege','Çomu',4,05436669953);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (628045,24179196264,'Hilal Ebru','Çonay',3,05326918914);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (339203,43662532472,'Ayben','Çorumlu',2,05543671163);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (954287,96367594971,'Abdulbaki','Çotur',6,05453628512);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (440494,25131488522,'Neva','Çuhadar',1,05519664397);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (259770,29616659663,'Öznur','Çulhaoðlu',3,05411798171);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (384205,85351826723,'Olgun','Dadalýoðlu',6,05353836541);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (885343,84883791599,'Çaðrý Atahan','Daðar',6,05332862339);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (376259,11784731886,'Özalp','Daðbað',4,05442574812);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (455708,25364375959,'Hüsne Aysun','Dal',2,05556558784);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (410357,18162683329,'Aydonat','Dalkýlýç',1,05337655436);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (586559,19268864527,'Ezgin','Dallý',1,05547517137);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (700078,62854497377,'Refiye Seda','Dalyaprak',4,05543332837);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (695642,61788234922,'Esat Erdem','Daniþ',4,05313357564);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (501723,84517815369,'Ayþe Neslihan','Daþdemir',4,05358717236);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (951454,65722241773,'Fetullah','Davutoðlu',6,05531664982);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (328446,22751772563,'Mert Görkem','Dayýoðlu',5,05412578315);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (747788,34951282725,'Ergün','Deðirmendereli',5,05417463943);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (789173,67761225536,'Hülya','Delý Chasan',6,05322585763);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (569394,37125331745,'Doga Elif','Delice',2,05419815549);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (474213,62753329962,'Muhammed Bazit','Deliloðlu',4,05448221783);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (923814,14563135794,'Miraç','Demýrören',1,05424548239);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (607854,67479457772,'Hürel','Demiriz',4,05448698624);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (871987,73487125383,'Sömer','Demiroðlu',3,05458615349);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (462457,61491988335,'Aysel Aysu','Demirsatan',2,05442732549);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (547938,34544982829,'Mehmet Kemal','Dengizek',2,05311131428);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (933794,18236642447,'Alya','Denizgünü',1,05538453948);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (501740,75957372875,'Zeynep Büþra','Derdemez',5,05428445123);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (317608,98315826525,'Tubanur','Dereli',2,05534132734);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (608506,86466435857,'Dalay','Derya',1,05521349932);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (993482,32256635136,'Bedir','Destereci',6,05418628414);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (247529,76556274271,'Rümeysa Ýrem','Devecel',4,05437873116);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (477641,78327919278,'Osman Sinan','Devrim',2,05449898598);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (864975,55863257487,'Saliha Canan','Dývarcý',5,05538898797);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (467598,22418725651,'Samet Emre','Dikbaþ',3,05318347577);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (434516,74691582974,'Haldun','Dinçtürk',4,05412337957);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (213064,88787666192,'Goncagül','Diri',1,05548897257);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (792024,36815262376,'Ziya','Doðramacý',3,05539974213);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (806512,42591844988,'Zehra Pelin','Döger',1,05422168785);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (798708,88633576995,'Seli M Sharef','Dökülmez',5,05413828946);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (450139,89334129493,'Firuze','Dönder',1,05554124613);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (452430,28331312281,'Doruk Deniz','Döner',4,05429681455);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (372588,52718776181,'Çisil Zeynep','Dönmez',5,05348498363);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (878952,41343269913,'Tugce','Dudu',3,05448545161);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (121606,55522745483,'Enver','Dur',3,05437674448);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (984276,99468821112,'Sanber','Durak',3,05411257164);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (124768,72857553171,'Birsen','Durmuþ',5,05548453136);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (210363,85437394228,'Taçmin','Durmuþoðlu',3,05551156897);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (722458,16635793914,'Karanalp','Dursun',5,05421493681);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (351939,81911634116,'Öktem','Duymuþ',1,05431943754);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (249129,25963616791,'Elanaz','Dülgerbaki',1,05526549824);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (415310,25316661998,'Fidan','Dündar',2,05353474493);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (819107,38479141515,'Barýn','Düþenkalkar',5,05519644223);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (174337,99849734447,'Mehmet Erman','Düzbayýr',6,05514436489);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (461207,64418835833,'Cem Efe','Edeþ',4,05444817585);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (504673,81372677115,'Erem','Edibali Mp',3,05339592635);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (724985,34293452834,'Volkan Eyüp','Efþin',4,05323537197);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (136245,14598398152,'Ýbrahim Alp Tekin','Ege',1,05541233174);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (502652,25629967625,'Güngör Erkin','Egeli',4,05352194878);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (326487,83464695165,'Çaðýn','Egin',4,05531922273);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (903193,55861426365,'Alphan','Ekercan',6,05318719876);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (312655,85555618928,'Lale','Ekrem',4,05416544191);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (665865,32328816581,'Baðýþ Can','Elbaþý',5,05423725379);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (420345,24335913124,'Mert Cem','Eliçin',1,05418653861);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (452681,48539548382,'Ahmet Sencer','Emikoðlu',6,05353753864);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (530826,83123695339,'Akife','Erbay',5,05326984628);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (333877,91745162767,'Burç','Erbil',3,05541361388);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (841487,38369331411,'Nadire','Erbul',5,05335432854);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (555614,86476844381,'Hüseyin Zeyd','Ercoþkun',3,05329317964);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (688719,51669554766,'Aynur Gül','Ercüment',1,05347656719);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (714538,92321541965,'Samed','Erek',4,05313856329);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (658893,75819234564,'Cem Ozan','Erim',2,05419377924);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (217920,94227742874,'Bahar Cemre','Erin',5,05441848342);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (873679,47141122871,'Rekin','Erkek',3,05331744133);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (725743,76611657997,'Hüseyin Serkan','Erkekli',6,05538327174);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (661444,43754847867,'Ýbrahim Candaþ','Erki',2,05355498926);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (898266,13578797818,'Beniz','Erkmen',5,05539692444);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (311622,12358188516,'Hasan Burak','Erkoç',1,05549185436);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (864871,55933988111,'Selman','Erkoþan',2,05423533886);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (972055,71444622644,'Hanife Nur','Erkovan',4,05458673972);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (380697,51386853764,'Alper Emin','Erkuþ',1,05454829517);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (970367,38974562137,'Elif Kevser','Eroðlu',5,05522296666);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (981863,24555266263,'Abdullah Mert','Erol',5,05553222386);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (195398,16659782156,'Çisel','Ersin',4,05522715461);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (602505,83737521241,'Ýlkin','Ersöz',4,05343463252);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (231571,98684178441,'Cantekin','Erten',3,05358461692);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (619840,48683288923,'Onur Kerem','Ertepýnar',3,05311891985);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (187687,91148211525,'Ýsmail Enes','Eruzun',1,05533353673);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (308891,19819248745,'Hamýd','Eryýldýz',5,05336476822);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (353444,92187988875,'Tunca','Eryýlmaz',6,05545485531);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (819505,76525924725,'Arslan','Erzurumlu',6,05425945665);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (802780,29719316444,'Neslihan Buþra','Esat',2,05443593222);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (385564,67552879716,'Lütfiye Sena','Esen',3,05558781553);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (680466,28278948621,'Belin','Esendemir',5,05323234869);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (947621,15172515844,'Rukiye','Esgin',3,05511993255);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (384492,12976899199,'Ýslam','Eshaqzada',1,05416952476);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (847061,56347665148,'Batýray','Eski',1,05346792639);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (302562,77881475251,'Süheyl','Esvap',3,05545834432);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (741349,65613485686,'Yargý Yekta','Eþe',1,05459312715);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (316156,23791132635,'Elzem','Evrenos',2,05356942196);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (794933,51265912496,'Ilgaz','Eyipiþiren',2,05423582787);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (422430,77826675346,'Ongar','Eyyupoðlu',3,05434126467);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (615111,23641692723,'Faik','Ezber',1,05526513387);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (460932,25818843721,'Turan','Fahri',2,05538997228);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (886661,15249936716,'Okbay','Fatih',2,05527621929);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (358435,32666499945,'Latife','Fatin',6,05437522314);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (392717,91417291527,'Eyüp Orhun','Fýndýk',1,05316515818);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (330885,55367679281,'Ýrfan Anýl','Fýndýkçý',6,05447533231);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (623732,82288796977,'Ertuð','Furuncuoðlu',2,05359883382);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (683453,57279912756,'Berhudan','Garip',2,05444977181);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (629708,45669273213,'Nihan','Gazitepe',3,05313151256);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (822722,65293859449,'Menekþe','Geben',5,05426835929);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (391735,52653921717,'Þeniz','Geboloðlu',2,05345838898);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (199105,24535237812,'Zeynep Senahan','Geçioðlu',4,05333779114);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (709199,31537491344,'Hayri Anýl','Geçkin',5,05535567136);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (651210,41535986414,'Muazzez Ece','Gemalmaz',1,05545636161);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (521544,49661551334,'Kerem Cahit','Gençoðlu',6,05446594574);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (878308,68929469821,'Sadýk Can','Gezmiþ',1,05444112654);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (733352,52546938799,'Resmiye Elif','Gýrgýn',3,05517985917);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (153455,89646955882,'Nergiz','Gilim',3,05319647335);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (849021,74827177728,'Mehmet Gökalp','Ginoviç',4,05345949383);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (955382,44233256626,'Mehmetali','Girgin',5,05436515552);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (513507,47795865111,'Abdullah Halit','Golba',3,05341698145);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (360445,18875968987,'Tilbe','Göç',5,05537732789);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (258602,39848941952,'Kubra','Göçmen',2,05555559251);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (369590,12735755374,'Kubilay','Gödek',5,05413314697);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (939979,75789896534,'Busem','Gökçeaslan',6,05451112221);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (221582,93948474282,'Banuhan','Gökçek',6,05349754717);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (300500,58194653345,'Örgün','Gökhan',1,05528449399);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (286884,37281561845,'Melike','Göksoy',4,05415499347);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (305495,67924286399,'Yeþim','Gölmes',6,05335794821);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (662016,49233271186,'Nilüfer','Gönay',3,05325271727);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (628585,66314495593,'Denizhan','Gönül',4,05351653553);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (946492,28557457999,'Þueda','Göreke',4,05533218387);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (706413,95267347489,'Ersin','Görgülü',1,05352585134);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (410514,87858923514,'Þahabettin','Görgüner',6,05533622863);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (887442,73261371998,'Ayþe Elif','Görür',6,05315871293);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (559697,88484611774,'Nazým Berke','Göven',6,05312569137);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (284266,66125694766,'Meltem','Göymen',5,05516118463);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (624225,82619458588,'Abdulhalim','Guguk',2,05428261894);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (832357,88656661213,'Gülten','Güdücü',4,05338495136);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (921661,96833132583,'Iþýnbýke','Gülcan',1,05333221117);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (840674,89574923954,'Vedia','Gülçin',6,05352823163);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (412435,42893877889,'Fatma Sena','Güldoðuþ',1,05546376818);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (628730,35661365221,'Ömer Okan','Gülebakan',4,05331496455);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (523847,18357827383,'Aybike','Güleç',1,05515833421);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (782934,99548237136,'Bektaþ','Gülenç',5,05312856955);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (392826,67338331219,'Emircan','Güleryüz',3,05413617121);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (914428,51224628389,'Merter','Gülkan',3,05343539454);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (190626,11918661472,'Sevgi Tutku','Güllüce',2,05557285688);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (353279,22799476915,'Denktaþ','Gülþen',5,05328869638);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (669592,64748647323,'Köksal','Gültaþ',3,05338169866);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (539882,31217842766,'Hasan Fahri','Gültepe',2,05516584319);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (766204,52218181753,'Öymen','Gümüþsoy',1,05452843343);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (367990,98781579847,'Eylem','Gündüz',2,05512182352);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (263036,95123998552,'Melek Diler','Günel',6,05512123855);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (693612,55754929261,'Argun','Güneri',6,05428967925);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (809800,92961747764,'Mehmet Yekta','Güneyi',6,05537859748);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (484821,28481329462,'Yasemin Erva','Güntek',5,05556786455);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (180398,99767498274,'Günan','Güral',3,05515977935);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (576017,49632586993,'Osman Cihan','Gürdemir',5,05532929941);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (662599,91739733689,'Okyanus','Gürel',6,05434765474);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (288988,37934981664,'Mert Alican','Güreþ',1,05554112122);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (214408,94513417496,'Zeynep Doða','Gürses',1,05336967395);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (689562,62183227675,'Tarýk','Güven',1,05525656438);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (948335,13385358515,'Birgen','Güvener',4,05455292259);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (366356,32912254371,'Ahmet Korhan','Güzel',4,05353927477);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (241938,54559899183,'Manolya','Güzeller',5,05535768112);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (384313,43398647734,'Mustafa Berkay','Güzeloðlu',1,05531732268);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (838031,53714813358,'Mehmet Anýl','Hacýalioðlu',6,05415793633);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (350930,74828115831,'Ahmet Furkan','Hacýlar',1,05412127315);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (328080,72145362352,'Fazilet','Hacýoðlu',6,05519177532);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (462994,31956654338,'Kývýlcým','Hadi',5,05344382336);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (552902,98187841693,'Çisil Hazal','Hafýz',3,05453142714);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (828402,72153365664,'Feray','Hakverdi',3,05552723167);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (977566,52881231669,'Büþranur','Halaçoðlu',1,05413619653);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (556621,24465224669,'Selin Sýla','Halýcýlar',5,05333949246);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (169628,31583255188,'Yeter','Hamamcýoðlu',5,05357624124);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (597633,65821911674,'Ramazan Tarýk','Hamarat',6,05339711483);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (731065,52582625347,'Boran','Hamidi',1,05445688677);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (929562,32822572671,'Tazika Hilal','Hamzaoðlu',1,05559697535);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (247243,51336789872,'Aynur Dilan','Hancý',1,05417123698);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (440529,14267536667,'Ayman','Hangül',3,05356633896);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (762429,93757545859,'Berrak','Harman',6,05511492925);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (181156,55784741665,'Erk Deha','Harmankaya',6,05341744658);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (528496,25784132493,'Perihan','Haykýr',2,05543239362);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (870891,38667199445,'Turhan Onur','Hýrlak',2,05424177235);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (607103,53928198996,'Furkan','Hýzarcýoðlu',4,05453116688);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (620854,91462168344,'Mustafa Ali','Hiçyýlmam',5,05532843882);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (349788,39959462645,'Muhammed Sefa','Hilal',6,05416318389);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (795885,42615162935,'Argün','Hilmi',3,05318335965);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (369973,65649635321,'Fadik','Himoðlu',6,05436622685);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (787122,76536334737,'Ahmet Hakký','Hirik',5,05548654924);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (417854,46647377666,'Mustafa Sefa','Hopacý',2,05451768324);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (973575,59857934166,'Toykan','Horata',3,05358317483);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (647228,47926165467,'Selime','Hüner',5,05335971818);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (987203,15814265216,'Denizcan','Ilýk',5,05445979871);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (946102,72111153159,'Ayþe Zeyneb','Irýcýoðlu',2,05541978342);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (129799,78647556792,'Mustafa Furkan','Iþýnay',6,05531796167);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (703017,79756725967,'Sude','Ýbrahim',2,05346623858);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (427768,49634489437,'Güçlü','Ýçten',5,05346439364);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (738296,32821785613,'Katya','Ýlgezdi',3,05357157149);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (336357,97477839231,'Halid','Ýlhan',4,05512858796);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (448322,31518946126,'Nihal','Ýlýsu',2,05441592425);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (694505,96191811189,'Elif Nisan','Ýmamoðlu',6,05428748736);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (167680,24228357499,'Emine Selcen','Ýmre',1,05534586984);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (691557,64286937334,'Tevfik','Ýnal',2,05442427836);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (574180,77323194317,'Ýbrahim Kaðan','Ýncekara',6,05336621376);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (345368,55472554554,'Sidar','Ýnceoðlu',4,05547657264);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (319297,35495866268,'Nesli','Ýpçizade',4,05557754794);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (775956,61438257533,'Ýhsan Vehbi','Ýpekoðlu',4,05422153666);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (933462,66221982821,'Necati','Ýrsoy',5,05354636279);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (384149,58117573977,'Zerin','Ýshakoðlu',4,05436429365);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (630382,51685192758,'Dursun Korel','Ýþgören',5,05448646463);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (965934,82231541861,'Ahuþen','Ýþgüzar',3,05527825556);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (890316,73516488491,'Uzel','Kabataþ',3,05439731272);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (376207,25499198929,'Melis Ezgi','Kabayuka',3,05322165835);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (928971,55677875419,'Þaziye','Kabukçu',5,05458583676);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (881073,12884797359,'Bergüzar','Kaçaranoðlu',3,05455381216);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (291830,12655935328,'Ömer Faruk','Kadý',4,05332935872);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (184579,97939355214,'Daðhan','Kadoðlu',4,05416961834);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (156295,36951715395,'Ünzile','Kalfaoðlu',3,05435346756);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (410324,49296438628,'Sezer','Kalsýn',5,05514451625);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (376802,56653833395,'Þensoy','Kalyoncu',3,05337798434);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (169852,99624543526,'Necatý','Kamýþlý',4,05328222579);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (987077,76135384149,'Þahan','Kandaþoðlu',3,05444672216);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (954271,27739569778,'Necip Fazýl','Kanlý',4,05518843266);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (724716,56176126436,'Muharrem','Kanmaz',1,05524547214);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (256259,87655323381,'Zeynep Figen','Kantarcý',5,05518369528);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (301870,72244522919,'Çilay','Kapsýz',4,05545561213);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (807509,95771835296,'Suna','Karaaslanlý',4,05358917726);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (398858,33393675265,'Ahmet Can','Karabacak',2,05549621817);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (749812,79363846113,'Asya Sema','Karabað',2,05451878983);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (118078,67847485161,'Gül Sena','Karabýyýk',1,05529342195);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (962548,54488649429,'Fatma Büþra','Karabýyýklý',5,05445672186);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (958251,71558794697,'Arca','Karabulut',1,05527635523);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (964626,16398141268,'Abdullatif','Karacabey',6,05439483526);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (725936,26181757998,'Tuðra','Karacan',1,05548493814);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (547117,14431193195,'Emir Doðan','Karaçay',1,05451641948);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (845551,34368554664,'Haluk Barýþ','Karaçeþme',5,05344892245);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (390363,15739118554,'Seyit Ahmet','Karadað',3,05529828719);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (640435,41616681461,'Cevza','Karadalan',6,05416877992);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (535155,38398726362,'Mustafa Emir','Karademir',4,05334215862);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (618057,95694168716,'Ilgar Pamir','Karaismail',3,05338968444);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (175895,68963314755,'Seren','Karakan',1,05452118334);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (311256,35862457955,'Büþra Hazal','Karakaplan',6,05434484376);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (416917,31943123958,'Naci','Karakaya',1,05436496254);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (912022,85883598944,'Oðuz Selim','Karakelle',2,05519638761);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (647707,32254886826,'Faik Altuð','Karakoca',4,05533934488);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (573662,92467966388,'Dinçol','Karalar',6,05545972387);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (489410,94653855426,'Ceyhun Kadir','Karamollaoðlu',5,05335469264);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (116872,62584725988,'Tayyibe','Karanisoðlu',5,05527754857);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (674802,86485583712,'Hayriye Gül','Karartý',4,05354341916);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (362794,86311396263,'Gülsanem','Karasapan',3,05335633555);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (573480,81772451824,'Yelda','Kardaþ',4,05433369592);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (372525,48468572877,'Kuntay Yiðit','Karga',6,05448945131);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (650779,32471221465,'Ahmet Berke','Kargýn',2,05515395192);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (949900,11644333944,'Kývanç','Kasacý',2,05355338267);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (236798,52527481268,'Vira','Kasemllar',2,05455294821);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (130529,69561679435,'Örsel','Kaþka',5,05316647937);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (955295,41224282289,'Esma Ece','Kavak',3,05515394244);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (230409,74782753948,'Benek','Kavas',6,05352487666);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (329728,31816551438,'Hale Nur','Kavasoðlu',1,05444512382);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (336222,19498832229,'Ümýt','Kavukçu',1,05315185354);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (967470,85444779935,'Ýshak','Kayacan',3,05533385383);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (363850,94685215691,'Ibrahým','Kayahan',2,05556235839);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (870855,92544447654,'Ödül','Kayalý',2,05433738645);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (660752,13467469913,'Ege Sarp','Kayar',2,05427233665);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (349247,56287234285,'Mahmut Onur','Kayhan',1,05436825183);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (898830,97771664367,'Mimoza','Kaynamýþ',2,05425947729);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (436979,44346667645,'Cemile','Kazici',4,05322878173);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (877407,84349743367,'Belit','Keçe',2,05324993284);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (859144,34335248962,'Aslý Nur','Kefal',4,05436994181);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (521850,15887744757,'Acun','Keleþ',2,05534914733);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (879079,72793565668,'Behçet Kutay','Kerem',2,05323448128);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (843105,63993755996,'Ayþe Merve','Kerigan',2,05419514865);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (751914,55231999125,'Behin','Kerimov',4,05347548926);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (756226,97542291641,'Fatma Hilal','Kesbiç',4,05341396788);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (136043,12691742795,'Nun','Kesgin',5,05535117433);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (280852,24293229981,'Ahmet Mehdi','Keskin',1,05442894481);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (963429,19513666341,'Mehpare','Keteci',2,05432418795);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (267159,17167425121,'Muhammed Ýkbal','Kevkir',1,05445142152);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (471914,11168734786,'Alaatin','Kýlçadýr',6,05319711251);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (928575,94978865428,'Hamit','Kýldýr',3,05415189583);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (994220,34784357841,'Muktedir','Kýlýnçarslan',3,05549672966);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (656260,27363459343,'Onur Abdi','Kýna',6,05543519889);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (677175,35243195554,'Lokman','Kýrbýyýk',4,05551734874);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (971456,87125118555,'Mert','Kýrgýz',1,05337189988);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (586338,99463876231,'Gülenay','Kýrýþ',4,05322283864);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (537307,68852224525,'Mürþide','Kýrkpýnar',1,05413827933);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (373987,68497371312,'Furkan Fatih','Kýrmýzý',4,05548321417);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (873765,22142563412,'Hatice Büþra','Kýrtaþ',4,05347619267);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (299997,58368699538,'Yaþar Fatih Enes','Kýrtay',6,05418478358);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (443538,76485371934,'Parla','Kýryayla',1,05451865822);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (888841,72576757227,'Gülçe','Kývýlcým',1,05558146236);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (727858,36316531429,'Yasin Burak','Kýzýl',1,05519342343);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (994545,37855827795,'Alim','Kýzýlboða',4,05346672528);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (326675,29379728848,'Ýþçan','Kýzýlca',2,05339718762);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (366360,61961825255,'Evren Burak','Kýzýlýrmak',3,05319896847);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (764954,51477245748,'Özge Gizem','Kýzýlkaya',3,05428322424);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (659476,13972411269,'Dilþad Nur','Kýzýltuð',6,05315291244);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (582544,56431823393,'Enes','Kýzmaz',6,05352667416);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (920161,71593954623,'Yalçýn','Kilmen',5,05328349969);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (215921,17777976714,'Ali Aydýn','Kirezçik',1,05335518975);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (991739,93817463569,'S.Kaancan','Kiþial',4,05338786716);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (211592,48536921955,'Maisam','Kiþin',2,05555262311);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (636509,13747876322,'Mehmet Han','Kocabaþ',4,05357964439);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (154195,92525877979,'Irazhakkýna','Kocabýyýk',1,05338462998);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (599350,78113563896,'Yiðithan','Kocademir',2,05529385961);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (594684,27246527332,'Ýrem Ceren','Koçak',5,05318296171);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (529692,91784379652,'Yusuf Süha','Koçbaba',1,05525535254);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (864050,85819131773,'Ýptal','Koçsoy',2,05351645854);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (560731,92389621123,'Abdulsamet','Konakoðlu',5,05336824519);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (568558,14481452839,'Mehmet Barýþ','Kondakcýoðlu',4,05324691167);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (775468,14787648176,'Ahenk','Kontacý',3,05448396335);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (485180,59375698375,'Hayat','Konyar',4,05532975236);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (729374,27125531697,'Yiðit Alperen','Koparan',4,05334483627);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (817521,54518954311,'Güner','Korkmazcan',6,05419221791);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (442011,63951296548,'Berfu Ýrem','Koþkulu',3,05349817493);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (180799,54839547187,'Ýlke','Kotan',4,05544349775);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (952976,64494427251,'Ali Ozan','Kovancý',6,05527224153);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (258774,69336329959,'Fatmanur','Koytak',1,05555747192);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (336309,47516741827,'Ýbrahim Fehmi','Koyunsev',1,05418896641);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (218502,33753918577,'Aslýnaz','Kozakçýoðlu',4,05432157379);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (521465,68287721483,'Ataalp','Köçer',2,05341784735);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (353738,31281667271,'Macide','Kökcü',3,05346645435);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (902404,77864766644,'Mustafa','Köken',4,05546269731);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (224471,63983513299,'Aybar','Körmükçü',5,05532862287);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (211770,61183633659,'Sahýn','Köse',6,05539219295);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (531875,44954644535,'Tunç','Köybaþý',6,05431927764);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (248963,88978442217,'Ruveyda','Kuday',6,05539934956);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (229009,64295884163,'Gürol','Kudu',6,05342855916);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (808255,45367216555,'Chakan','Kukaracý',2,05455427637);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (626176,39725842556,'Elis','Kul',3,05517789314);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (329392,31331755741,'Selma','Kuloðlu',6,05543579465);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (193057,67631877193,'Hüseyin','Kumru',6,05347815392);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (207301,64377153638,'Acar Oðuztan','Kundakçý',5,05444369547);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (413146,51235529587,'Güney','Kunter',6,05333241536);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (916734,41192273726,'Özge Sýla','Kuntman',5,05354752819);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (124859,43324225488,'Seval','Kurtan',4,05355795355);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (272626,28186626323,'Berna','Kurtuluþ',2,05336922596);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (683266,75458763917,'Þerif Erkam','Kutanoglu',1,05546938186);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (328423,71655486157,'Melike Tamara','Kutlay',5,05544463254);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (632930,45114423688,'Ayçað','Küçükbey',6,05313415252);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (266565,18185383372,'Sadiye','Küçükkase',5,05422695591);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (508823,87881687618,'Ali','Küçükler',3,05428751776);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (510122,28622166773,'Nigar','Külahlýoglu',4,05342538225);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (510895,79833628937,'Gülben','Kürk',3,05322276515);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (115919,68528966199,'Ayþe Ferhunde','Kürkcü',1,05347177131);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (611057,59947735417,'Eralp','Kürüm',2,05537134649);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (321729,69239111696,'Alperen','Küskü',6,05539575936);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (297406,42551618828,'Zehra Sena','Madran',6,05413536445);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (831458,42187727518,'Gündüz','Maðden',3,05333314281);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (273344,82683281711,'Osman Emre','Maldar',6,05524697182);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (987847,51971526745,'Kubat','Maleký Ravasan',2,05418663846);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (682945,15226961184,'Bahar Elçin','Mammadov',2,05451151951);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (116943,63414197469,'Nuelif','Mardanlou',5,05531331454);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (459442,94791764149,'Mehmet Eren','Masaracý',4,05529277915);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (276937,26144653653,'Melis','Masýr',1,05421818688);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (318129,11745729133,'Fatýma','Matur',4,05551759296);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (292054,73583366295,'Karaca','Maydagil',4,05443411887);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (246519,49339211424,'Zafer Engin','Memiþler',3,05514719353);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (382680,27649515821,'Duygun','Mengüç',4,05353739947);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (319687,34788396611,'Havagül','Mercimekçi',1,05548114696);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (773444,48852646956,'Arif Furkan','Merdan',4,05451748146);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (360433,98653587483,'Halit Can','Mert',6,05548616245);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (175089,58331475948,'Pertev','Metin',1,05445538238);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (274817,85141476314,'Selis','Mezarcý',3,05526969128);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (186402,92586163687,'Galip','Mirzanlý',4,05452692517);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (910117,95761377994,'Tülay Tuðçe','Misoðlu',5,05436854764);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (403782,66236148956,'Ahuse','Mohamed',2,05514681562);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (801997,14687839146,'Barbaros','Molla Ametalý',5,05339269331);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (426989,79683537996,'Lawrence Tezoh','Morbenli',6,05521995813);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (612670,93325299368,'Görkem','Morelli',3,05555531426);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (206178,61945965979,'Abdurahman','Morgül',5,05511381723);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (474174,46661831179,'Zülcenah','Mortepe',1,05356489882);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (420426,59494654676,'Saadetnur','Mumcu',2,05417145736);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (129029,94427166943,'Hasan Gürkan','Muratoðlu',3,05431678666);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (547973,46712124724,'Sehmus','Mursal',3,05426581916);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (835630,52914999771,'Berkan','Musaoðlu',5,05431558623);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (220849,59798756235,'Ersel','Muslu',5,05357147587);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (425056,78638333425,'Batuð','Mutman',5,05543884782);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (833974,55431979538,'Dilsu','Münif',3,05434163972);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (122953,56226888519,'Erdoðan','Nalbant',5,05511787217);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (763136,39276386899,'Batý','Nalbantoðlu',4,05558183564);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (599170,93287487968,'Türkan','Nalçacý',1,05511857331);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (771634,42161913579,'Gülpýnar','Namdar',6,05358863559);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (522109,73135184534,'Gökçin','Namlý',4,05359873511);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (910236,86585464115,'Ülker','Nayman',3,05344575781);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (148865,15624477962,'Eþlem','Nerkis',5,05328185958);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (615804,15567232868,'Nazlý Özüm','Niþancý',1,05442559756);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (663179,14679333289,'Alkýz','Numanoðlu',2,05523864888);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (474129,25466653557,'Nimet','Ocalan',4,05345482997);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (669362,52962759736,'Ýsmail Egecan','Oçar',4,05351634365);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (811611,12779252287,'Kamer','Oduncu',5,05547576254);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (389571,84658786859,'Gencal','Oguz',5,05445475592);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (820128,22757161918,'Kürþat','Oðuz Fp',5,05418579231);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (929866,64884324862,'Ýrem Baþak','Oðuzhan',6,05324899493);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (416154,75695378966,'Ulaþ Can','Okan',5,05427678515);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (603432,73962214634,'Tunahan','Okatan',3,05332417688);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (766275,35728828726,'Ýzel','Okcu',6,05334925688);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (294078,99398799674,'Eliz','Okkaya',6,05426449657);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (159300,16638514126,'Çisil','Okumuþ',6,05425955374);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (469627,14825225766,'Kerem Can','Onuþ',5,05515634588);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (812905,19131699898,'Keremcan','Oraloðlu',5,05549567474);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (855079,89841156777,'Talip','Orhan',5,05531193411);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (678452,16397898998,'Beste','Orhon',6,05518599318);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (133197,67855784149,'Ismet','Orman',4,05326854565);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (617226,75684212684,'Mustafa Bora','Ozgun',4,05545332668);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (590931,94691944875,'Oðan','Öcal',1,05356424459);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (840200,42541336389,'Ahmet Cihat','Öðredik',5,05335113297);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (789164,53172575717,'Vahide','Ökmen',1,05533432143);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (795473,56888931789,'Murtaza','Ölmezler',6,05551454163);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (917191,29127563797,'Gönen','Önder',5,05558251257);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (507171,74532599316,'Zeynep Tuba','Önen',2,05547942311);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (462609,58838718685,'Günkut','Önoðlu',6,05553768275);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (417041,27147581413,'Faruk Doðukan','Öreroðlu',3,05559815738);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (791698,18511796954,'Günyol Ufuk','Örge',3,05445449743);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (394363,51631422649,'Selimcan','Örs',3,05315876798);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (855164,22948736868,'Raif Anýl','Öter',2,05412829888);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (577057,79296674346,'Okan Deniz','Övül',2,05446147333);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (200696,51485359175,'Mustafa Selman','Öyüþ',1,05528767313);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (544399,51152841231,'Aysel','Öz',6,05559251543);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (607766,96118732899,'Ajlan','Özakyol',4,05522486489);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (688754,53714656277,'Ayhan Furkan','Özar',2,05426218837);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (337764,39151247686,'Ebru Ece','Özata',1,05348233248);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (233082,16521546532,'Berfin Elif','Özay',6,05333145378);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (653994,16776911643,'Muhammet','Özaydýn',1,05333773163);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (276422,96931844753,'Arda Alan','Özayral',1,05442677463);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (153420,81487678945,'Iþýlay','Özbey',3,05315761935);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (754495,68212179478,'Þelale','Özbir',4,05521781149);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (139066,27664666726,'Oktay Emir','Özcan',4,05318359221);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (350233,54317821685,'Güniz','Özdel',6,05323452162);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (864364,35154479828,'Murathan','Özdil',5,05453549586);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (756290,64245324385,'Kadirr','Özdinçer',4,05318127225);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (653726,74849597345,'Anýl Seçkin','Özelçi',2,05412535517);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (436818,27893693673,'Dilay Nur','Özer',2,05329778978);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (778268,86337369654,'Þemsi Yiðit','Özev',1,05515883581);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (276366,85488175834,'Ýlay','Özgenç',6,05437613181);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (910288,32246914512,'Bedia','Özgenoðlu',6,05318587593);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (666248,39741899753,'Kadir Anýl','Özgezgin',3,05525647188);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (111226,63165519548,'Ecem','Özgül',4,05526493568);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (581249,69759946641,'Giray','Özgümüþ',1,05546296152);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (845392,47295489741,'Abdulsamed','Özgür',3,05332543919);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (777332,71533431678,'Tendü','Özgürün',4,05328192933);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (914768,15427475344,'Emine Tuðçe','Özýrk',2,05344638453);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (666643,11433313961,'Mehmet Yüþa','Özkol',2,05349669317);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (209421,88187419329,'Egehan','Özkök',5,05515762127);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (679125,99592791829,'Mustafa Eren','Özkul',1,05344947984);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (561038,88356729722,'Ýremnur','Özmez',2,05439154922);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (818211,47561743549,'Fahir','Özpak',4,05437594679);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (804316,63426754159,'Ali Ahmet','Özperçin',5,05445268419);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (637511,57614414594,'Eyüpcan','Özperk',3,05531734271);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (833264,45618622488,'Merve Nur','Özpolat',4,05551587538);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (750052,46437947937,'Muhammer','Özsoydan',3,05358183217);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (570066,54744782453,'Arkadaþ Necati','Öztaþ',1,05544344993);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (147659,85339121757,'Günaydýn','Özteker',3,05342145156);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (518469,13484912796,'Zuleyha','Öztemel',2,05315699633);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (103301,17741551661,'Mustafa Oðuzhan','Öztunç',5,05341659199);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (863364,28658498911,'Okcan','Öztürk',2,05517584185);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (229263,33656746438,'Muhammed Emin','Özüberk',2,05452433381);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (870871,96517934749,'Gamzenur','Padak',5,05347864444);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (370921,11929815562,'Muhammed Kerem','Pak',3,05412475773);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (981126,69482887938,'Zeynep Ecehan','Pakdemirli',4,05332942976);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (157625,47199623321,'Þafak','Pakdil',5,05333365418);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (177166,24391613727,'Þükran','Pakkan',5,05344986384);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (442739,76352575464,'Altay','Paksoy',6,05429878499);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (874510,48822325669,'Hicret','Palanko',3,05328363544);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (745140,21171633511,'Nusret','Palut',3,05319599338);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (992185,77646173199,'Ömer','Pamukçu',1,05538534622);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (745593,13464691647,'Mehmet Ziya','Pançar',4,05532487415);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (593116,96454687511,'Aysu','Parlak',5,05435362847);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (587421,89159441566,'Cenap','Paþolar',3,05446925191);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (626537,25732437539,'Ata','Pazar',6,05431764786);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (723529,18235834835,'Þaban','Pehlevan',2,05344843968);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (443031,84121269694,'Hüma','Pehlivan',1,05352469958);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (899894,87786256815,'Ekin Esme','Pehlivanlý',5,05442392943);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (679192,55437594112,'Mehtap','Pehlivanoðlu',4,05447578329);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (798187,64432853948,'Mehmet Said','Pekdogdu',6,05328583765);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (216845,46436933254,'Cihad','Pektemek',5,05311952819);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (389488,98534725955,'Þenay','Piriþtina',1,05423995925);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (903487,72355342799,'Ümran','Poçan',5,05341782537);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (824807,55769479683,'Evren','Pomay',6,05431528627);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (276505,96947857165,'Kevser','Portakal',5,05431968566);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (959901,78918635244,'Ziynet','Posbýyýk',6,05451188163);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (895372,52783192286,'Muhammed Kutay','Poslu',4,05529389717);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (214684,88657335795,'Efgan','Puca',5,05422672962);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (847156,69143432789,'Bahar Merve','Purçu',4,05455585172);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (784868,14153374185,'Dilara Ayþim','Ramis',4,05521419572);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (958552,28254668618,'Tomurcuk','Rauf',1,05311731891);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (723288,79376173643,'Simavi','Remzi',2,05356527711);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (461617,47848925314,'Esma Eda','Revan',6,05559865977);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (766615,78395313718,'Utku','Rona',3,05432167443);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (557290,45821933612,'Nurseli','Ruþan',2,05434858244);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (575770,77952823678,'Urçuk','Saatçiler',5,05533262475);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (702411,27281822325,'Çaðatay','Sabah',6,05352463961);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (412712,81645215528,'Niyazi Umut','Sabri',3,05436458158);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (650893,59646976323,'Çaðla','Saçak',3,05554391244);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (465287,78138596143,'Ayþe Berre','Sadak',6,05327927921);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (608924,18948939715,'Ali Gürel','Sadýklar',6,05447497933);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (227848,42387412264,'Tayyip','Sadýkoðlu',6,05516497776);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (937058,65861974194,'Neþat','Sadri',1,05344741661);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (881817,17421937642,'Ferudun','Saf',4,05518752572);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (528570,22211355321,'Ayþe Saliha','Sakarya',3,05444165186);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (841657,94273663722,'Emre Can','Sakaryalý',1,05328684283);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (519587,11872238783,'Ömer Sefa','Saltuk',3,05556452214);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (423750,35742678449,'Ahmet Enes','Samancý',6,05532329682);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (453334,79592531577,'Ali Ýzzeddin','Samar',3,05441151495);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (814558,98725814672,'Fatma Serra','Sami',2,05337325677);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (116836,99172494626,'Arcan','Saparca',1,05455253243);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (357765,67683423214,'Günnaz','Sar',2,05343177998);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (910730,62562191287,'Simge Nur','Saraçgil',2,05354382538);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (714469,87783232948,'Nesrin Gökçe','Saraçlar',5,05434827157);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (124379,37926669213,'Ayþe Iþýl','Saray',4,05321669337);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (379525,29496984275,'Nuece','Sarýaltun',5,05546487985);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (426530,81839875231,'Muhterem','Sarýoðlu',3,05414241138);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (470828,99167639114,'Esengül','Sarýteke',3,05447242939);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (646887,21186367618,'Cansunur','Savca',6,05324612235);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (128271,35998224955,'Necmettin','Saydam',1,05349651711);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (681019,45176898487,'Melike Nursultan','Saydan',3,05532654178);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (983049,73565562225,'Ayçiçek','Saygýn',1,05324699113);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (557615,97684118985,'Muhammet Fatih','Sayýcý',6,05458456472);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (377518,64279311329,'Orkide','Sayýl',5,05525721345);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (546788,61284129863,'Özge Elif','Sayraç',3,05428251316);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (203380,43374565684,'Refia','Sazak',2,05525857862);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (159224,96155944269,'Yasemin Bahar','Schmitz',1,05351471891);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (323495,81159891929,'Mina','Sel',3,05522352371);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (951998,33376125447,'Servet Ecenaz','Selcuk',4,05431393891);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (562455,51561495459,'Sevde Nur','Selvi',5,05551571663);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (686869,12858547342,'Abdullah Furkan','Sentürk',3,05452952311);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (999019,35765253444,'Olca','Sevcan',2,05542161229);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (696088,21448497847,'Nebi','Sever',1,05422282297);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (804328,95131443621,'Yasemin','Sevigen',1,05411558668);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (180716,45233961583,'Günay','Seydaoðlu',5,05343321946);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (718212,89616622391,'Züleyha','Seyfi',1,05442515484);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (576800,71621185584,'Tünay','Seyhan',2,05514281373);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (742064,53546874953,'Tanju','Seymen',1,05547124947);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (481696,56368798771,'Muhammed Sait','Seytin',3,05352573835);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (641538,16125721982,'Mehmet Akif','Sýraç',6,05546322713);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (943861,92936831938,'Kaan Kubilay','Simavlý',6,05345227356);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (737554,22652218319,'Ayþe Gül','Sobacý',4,05537935642);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (614788,53816313296,'Canel','Sofyalýoðlu',4,05425764519);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (117844,31885478614,'Rabia Kübra','Solak',4,05314667817);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (332731,19389448477,'Ýkbal','Songur',6,05347937797);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (764198,16339884624,'Esat','Soyadý',3,05419176571);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (384498,69838614883,'Yunus Göker','Soylu',1,05344462269);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (523540,19158464784,'Kanaat','Soyulmaz',2,05315257467);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (265055,31521515881,'Cengizhan','Sökel',6,05442492139);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (545305,24982812113,'Gencay','Söker',2,05353382283);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (728153,27519178718,'Gazanfer','Söylemez',6,05332521978);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (540779,66348199251,'Dorukhan','Sözeri',4,05355715752);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (704399,83833367859,'Hesna Ezgi','Sözüer',1,05457331983);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (639474,58241634512,'Ýlknur','Sözümçetin',2,05433152569);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (579043,98456719191,'Firuz','Su',5,05538978432);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (423425,47722269385,'Hasan Gökay','Sugötüren',5,05432772771);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (927266,33458255273,'Güzay','Sular',1,05315593542);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (502895,93331718496,'Özgün Mert','Suna',4,05442162316);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (476838,75435756357,'Ýpar','Suyunu',5,05559878424);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (956885,44722182868,'Güral','Sühan',3,05548978385);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (564292,61526281996,'Naz Beril','Süleymanzade',1,05413725644);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (457080,38723211192,'Ýris','Süreyya',6,05316649956);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (434169,59816966343,'Gülselin','Sürmeli',1,05429186727);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (878413,35536716742,'Alper','Þadi',3,05454169265);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (379440,69378726817,'Abbas','Þahabettinoðlu',3,05423677751);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (251394,17411378118,'Nugaye','Þahin',2,05551342626);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (218701,47487186574,'Buraktan','Þahingöz',4,05454973429);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (212772,14198829856,'Efe Mustafa','Þakarcan',4,05347839718);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (837265,81427488845,'Behiye','Þamlýoðlu',2,05342328895);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (438705,86543138477,'Yaðmur Helin','Þarkýþla',3,05521532623);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (178557,83329168888,'Aslýcan','Þekercioðlu',3,05441749615);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (579884,15665235654,'Çiðdem','Þekeryan',3,05529796244);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (373073,41162725376,'Taykut','Þen Özen',2,05314631178);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (473610,59129335933,'Fehime Þuheda','Þenbaþ',1,05319148253);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (530677,89243135482,'Öðünç','Þencan',2,05427634444);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (405479,86966562231,'Gürkan','Þendað',2,05524953187);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (537183,54731174743,'Sezanur','Þendiller',5,05332334562);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (489173,41658363623,'Seher','Þengül',6,05333561114);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (534931,61611147398,'Nejat','Þenocak',1,05327492141);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (340736,55959575772,'Yeliz','Þenyurd',2,05554318324);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (646225,88999273989,'Ali Tarýk','Þerbetçi',1,05532262531);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (801031,94384977359,'Ada','Þeref',1,05326277236);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (224183,73787725311,'Yunus Emre','Þerifoðlu',2,05345735768);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (383265,41594227613,'Melike Deniz','Þevkin',2,05335318762);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (135756,64451834683,'Mehveþ','Tabak',6,05552122267);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (651643,81587636693,'Furkan Ali Can','Tabanlý',4,05427994795);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (219304,13249241721,'Aykan','Tabir',4,05457197873);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (173754,28337883942,'Ahmet Utku','Taç',1,05425566917);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (130290,31645775166,'Dilara','Taçgýn',1,05458762232);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (873915,92911883752,'Miraç Ayberk','Tahir',5,05514793655);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (401513,46825529885,'Kardelen','Tahmazoðlu',5,05531776833);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (101798,33638152929,'Pýnar Gül','Talantemur',2,05438247494);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (713208,48375915367,'Arel','Talaþ',6,05349884586);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (221613,89732819962,'Ayþegül Begüm','Tanbaþý',3,05427957193);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (911911,58789914589,'Farshad','Tanýþ',3,05312881213);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (920153,79754517678,'Güzin Duygu','Tanrýkulu',5,05437156199);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (304669,74258562518,'Ebru Ümmühan','Tarakçý',1,05349463429);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (661339,55533932217,'Numan','Tarhan',3,05336693148);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (118023,26739842898,'Çeliker','Tarlakazan',6,05456188193);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (104092,88616273378,'Seven','Taþ',3,05433861972);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (119231,48847513813,'Bala','Taþak',4,05341965374);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (670401,43343812674,'Köker','Taþcýoðlu',4,05356341312);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (565304,35975735633,'Batuðhan','Taþðýn',6,05542423929);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (184445,56944739796,'Güven','Taþlý',3,05454156852);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (206645,27772599587,'Ecegül','Taþyürek',2,05457281862);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (845377,58275199745,'Beyzanur','Tatlý',6,05531492177);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (488053,11415382824,'Kerem Arda','Tatlýsu',2,05519451935);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (542971,65275351197,'Abdüssamet','Tayan',6,05358178215);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (693558,72778437739,'Tilbe Sunay','Tayfun',5,05342529643);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (969106,84558483976,'Ýsmail','Tazegül',1,05547968761);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (357145,81247492173,'Oður','Tecer',3,05415588574);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (444942,75219324969,'Aktan','Teker',6,05422395591);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (733049,39395994135,'Ahmet Buðra','Tekin',5,05444252198);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (515509,67667958116,'Deniz Hale','Tekþan',6,05442936421);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (217122,65192217622,'Umut Salih','Tektaþ',3,05343669287);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (602075,51241624512,'Iþýltan','Tekten',4,05516242625);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (903122,14365792987,'Erdem','Temizer',3,05459267191);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (268191,97468413683,'Atalay Furkan','Tenim',5,05539579434);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (340600,38637315559,'Ali Alp','Tercan',3,05452725451);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (221411,67899518613,'Sabiha Esra','Terzi',4,05337584329);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (643309,82284725374,'Yakup Can','Tetik',5,05416669669);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (256949,53999559575,'Talya','Tezmen',3,05358444671);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (830041,29994477814,'Tuðbanur','Tiftikci',1,05329677657);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (238121,52525228346,'Aktaç','Togay',2,05349989325);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (843528,58895498728,'Ahucan','Toðan',3,05559228847);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (563637,53886774844,'Saime Þura','Tokaç',3,05414974621);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (688257,57137666443,'Doðcan','Tokalý',3,05519419286);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (923460,73342285952,'Bilhan','Tokatlýoðlu',6,05535459167);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (172556,25846368231,'Muhammed Bilal','Tokdoðan',5,05416655989);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (957489,64684798567,'Þükrü Özümcan','Toker',4,05518711831);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (698922,94236422797,'Ecenur','Tokgöz',4,05521743294);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (853375,84762664994,'Baysal','Tolunay',3,05514425997);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (419044,21482197483,'Müge','Topal',6,05536565634);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (677174,28827993555,'Dilþah','Topalan',1,05423585398);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (136783,99455149536,'Saliha','Topoyan',5,05311468468);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (878611,85764978157,'Tarcan','Toptan',5,05433654213);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (515134,16235635248,'Rüya Su','Torðutalp',1,05435385895);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (986174,73182651485,'Gülþen Dilan','Torol',6,05546563879);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (923454,86828425239,'Velit','Toygar',3,05559479883);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (414031,78954222114,'Perker','Tufan',4,05339472786);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (678349,53333677997,'Lerzan','Tugrul',4,05419472424);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (455623,91528315677,'Nue','Tuðmen',3,05431212218);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (195201,76861685669,'Yaþar Emre','Tunçay',6,05313736497);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (167114,85954428138,'Aybüke Ayça','Turna',4,05546933243);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (240164,22966967549,'Muhammet Mustafa','Turul',1,05512565478);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (702136,85323379724,'Lalezar','Turunç',5,05535343129);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (907958,56618585116,'Ýyilem','Tüdeþ',2,05551189161);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (513274,44127823949,'Ýstemi Furkan','Tüfekci',3,05324671194);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (165037,31845218388,'Ýlsel','Tüfekçioðlu',1,05359942397);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (708025,14837242381,'Muhammed Can','Türkmenoðlu',4,05326712365);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (231772,19163666482,'Mebruke','Türkoðlu',5,05317374933);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (726647,63921239582,'Ümmü Gülsüm','Tüt',1,05515195312);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (339701,88342823132,'Gökböri Mert','Ubay',6,05535937154);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (861321,57788689498,'Zeynep Neslihan','Uçanok',1,05452936433);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (860202,73767419545,'Malik','Uçar',4,05455132376);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (116124,71976627613,'Umut Mert','Uçma',4,05552969291);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (206284,81415161995,'Enginsu','Uður',1,05539652656);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (220572,77249794157,'Mervegül','Ulaþ',6,05528263362);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (526365,15985236368,'Uður','Uluð',3,05545212358);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (217935,66388347251,'Caner Hazar','Uluhan',2,05553236228);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (754793,36953331788,'Ayþim','Ulupýnar',3,05433284942);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (474924,59741562167,'Arife Gülbiz','Ulusoy',3,05311747626);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (552895,33714922212,'Hatice Berna','Ulutaþ',2,05549234716);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (545016,94392793542,'Kuntay','Urgancý',2,05446811171);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (534700,42533928873,'Berra','Urgancýoðlu',1,05334813942);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (928350,65843296763,'Zehranaz','Usanmaz',2,05449649188);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (465204,99574534854,'Ahuela','Usluer',1,05447229134);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (894268,13914644273,'Bedriye Seray','Usta',2,05338438278);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (531880,29676788791,'Alp Dora','Ustabaþý',2,05316447576);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (555490,58354557776,'Gülümse','Usumi',2,05535541979);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (265162,26428228739,'Engin Uður','Uþak',4,05426944531);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (730912,14597189972,'Gizemnur','Uyu',2,05354694159);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (398844,91268282644,'Kemal Tolga','Uz',4,05557788514);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (152201,82314157946,'Tahsin','Uzun',6,05434955318);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (458758,36892594688,'Ugur Can','Uzundönekoðlu',2,05351326471);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (364892,63821422218,'Arsun','Uzunýrmak',2,05552449119);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (427722,79978714623,'Özgecan','Üçler',6,05333323887);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (960103,21924943117,'Sýddýka','Üçtaþ',1,05351854377);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (254065,64283168544,'Ýmran Musavi','Ülgey',2,05428599345);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (150076,91941419384,'Ebrar','Ünay',5,05335465245);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (341122,95669818293,'Açýlay','Ünl Ü',4,05312829857);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (981628,43699186558,'Müzehher Zeynep','Ünlü',6,05536429837);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (439879,65921636621,'Aybirgen','Ürkmeztürk',5,05346927422);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (618215,93458829126,'Akif','Üskent',4,05457251532);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (470368,13579718825,'Volkan','Üstbaþ',4,05452659991);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (991243,79632537565,'Özmen','Üstünel',6,05524161711);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (967879,55231968516,'Gülender','Üþenmez',4,05353427196);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (551237,28193456973,'Muzaffer','Üzar',3,05349664933);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (724264,94445588225,'Mediha Burcu','Vanlý',4,05552537361);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (436036,55741484831,'Sulhadin','Varlý',4,05423392677);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (900797,21819524834,'Buket','Y I L D I Z',2,05516828951);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (738359,72892748779,'Þerif','Yakupoðlu',1,05345997822);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (756484,48672285553,'Sena Simay','Yalçýnkaya',3,05441991259);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (883836,84455852225,'Mümüne Nihan','Yalçýntaþ',6,05331955937);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (511711,48947653924,'Edis','Yalmaç',2,05422676699);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (508950,64751613734,'Alagül','Yalman',2,05426479812);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (418439,94248266668,'Nazým Bircan','Yalova',6,05442588699);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (429384,46235314774,'Ekin Ege','Yamanoðlu',5,05315791979);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (184992,67824714922,'Ayþe Melisa','Yanýk',3,05458436639);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (605271,93523241941,'Anýl Görkem','Yapar',4,05539274338);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (106817,48932697844,'Cavit','Yaprak',1,05312357432);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (776721,72171794878,'Gülþah','Yarbas',1,05437743511);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (538691,69429595169,'Iþýltý','Yardýmcý',6,05315882839);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (348737,22312596689,'Ayþe Cansu','Yaþa',5,05522779974);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (741693,29737718615,'Muhammed Ali Duran','Yaþýn',4,05338513556);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (864331,85193537768,'Nurullah','Yaþin',5,05434619288);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (250062,57126162378,'Nüvit','Yavaþer',3,05456228444);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (252003,11619426871,'Taner','Yay',2,05335761748);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (346389,64911681786,'Sezen','Yayla',3,05341359487);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (413535,57675819934,'Tuna Han Salih','Yazýcýgil',1,05441325695);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (487544,94653781195,'Raif','Yazýcýoðlu',6,05332929353);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (746886,25458311335,'Dilara Zeynep','Yeksan',5,05319491384);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (498569,39664811554,'Muhammed Enes','Yel',3,05551436248);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (990281,25756368733,'Büþra Hilal','Yelegen',5,05452158648);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (703758,69751981186,'Meryem Sümeyye','Yeniceli',5,05343929571);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (754525,69716418864,'Þayan','Yeniev',5,05519453758);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (605959,65916718213,'Aykut','Yerlikaya',3,05517629995);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (245373,55781439263,'Ýlkyaz','Yerliyurt',3,05522478378);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (202632,38278764441,'Gülþen','Yerzhan',5,05429684556);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (506541,99676489415,'Nurettin Hazar','Yeþilçimen',6,05542621434);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (765731,27659195159,'Ali Furkan','Yeþilova',5,05526211498);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (901651,14641266467,'Kolçak','Yýkýlmazsoy',1,05437366925);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (260282,32455241762,'Selen Elif','Yýldýrýmer',2,05333117546);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (808640,41999744826,'Azelya','Yýldýzdöken',4,05558734482);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (617832,37955382792,'Ýbrahim Engin','Yýldýzoðlu',3,05449864884);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (647685,31123678614,'Sadri','Yirmibeþcik',6,05422915615);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (453600,27888477932,'Enes Said','Yolcu',5,05536913483);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (456993,45535845844,'Eser','Yorgun',6,05415887927);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (935362,17737987762,'Selcen','Yorulmaz',5,05537811328);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (210320,13328277269,'Alaaddin','Yöndem',2,05553732945);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (888621,26317163586,'Jiyan','Yörüten',2,05545861834);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (105614,77284569689,'Buse','Yudulmaz',1,05425759911);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (394833,23782997593,'Ali Berk','Yumurtacý',5,05516486382);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (579206,23216755891,'Yusuf Ozan','Yurteri',4,05536649661);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (826087,84557718464,'Yiðit','Yurtsever',5,05345511115);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (951186,41991288425,'Ahmet Berk','Yücekayalý',6,05538338174);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (860889,88681754854,'Tanberk','Yükselen',2,05455439275);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (211810,51852844553,'Zarife Begüm','Yürük',5,05311883977);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (913661,51751532158,'Ayþe Aylin','Yürükgil',6,05418122783);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (845310,22369751977,'Emre Miraç','Yüzbaþýoðlu Gür',5,05325799315);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (197741,91113629918,'Ýpek Nazlý','Zabun',3,05448238196);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (945184,57156923389,'Mütesir','Zaðlý',2,05539393786);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (739305,66431515179,'Nurfer','Zaptiye',6,05317152382);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (753616,82445661781,'Büþra Gülin','Zeybek',5,05333592799);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (446424,14282298514,'Bernanur','Zeybekci',1,05337281579);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (542688,45128771928,'Nur Dilay','Zilan',6,05443167714);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (478552,78171734974,'Ali Tunahan','Ziyade',2,05454284592);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (210775,56695676936,'Paker','Zorkiriþçi',3,05319396372);
INSERT INTO Personel(SicilNo, Tc, Ad, Soyad, PersonelTipi, Telefon) VALUES (922207,21471474217,'Beyda','Zöð',3,05341478499);
----
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (741693,1)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (186402,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (537183,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (982696,2)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (465287,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (319297,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (200391,7)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (917191,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (377518,4)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (562734,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (382680,2)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (886405,2)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (935029,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (347589,5)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (802780,2)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (798187,1)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (714469,4)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (501740,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (419044,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (947621,2)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (502652,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (576800,4)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (413655,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (270469,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (510934,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (252003,1)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (681019,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (804328,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (899894,5)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (114998,6)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (590199,1)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (443031,7)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (725936,5)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (405479,7)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (139066,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (879079,4)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (933794,3)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (647707,1)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (233082,7)
INSERT INTO SatisTemsilcisi (SicilNo, BolgeID) VALUES (719179,2)

---
INSERT INTO Danisman (SicilNo, SirketID) VALUES (984276,15)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (392826,18)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (828402,23)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (304669,23)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (530826,3)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (849021,17)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (795885,7)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (301870,10)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (474213,16)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (356688,7)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (987077,2)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (481696,20)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (860202,24)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (745593,19)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (959901,19)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (974723,5)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (121606,24)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (530677,11)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (835630,13)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (586338,19)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (574180,14)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (172556,9)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (754793,18)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (394363,18)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (309974,24)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (337764,10)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (745140,5)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (460932,15)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (841487,6)
INSERT INTO Danisman (SicilNo, SirketID) VALUES (299997,7)
---


INSERT INTO Adres (SicilNo, IlceID) VALUES (835713,1)
INSERT INTO Adres (SicilNo, IlceID) VALUES (471914,2)
INSERT INTO Adres (SicilNo, IlceID) VALUES (431471,3)
INSERT INTO Adres (SicilNo, IlceID) VALUES (849584,4)
INSERT INTO Adres (SicilNo, IlceID) VALUES (204847,5)
INSERT INTO Adres (SicilNo, IlceID) VALUES (488053,6)
INSERT INTO Adres (SicilNo, IlceID) VALUES (666643,7)
INSERT INTO Adres (SicilNo, IlceID) VALUES (252003,8)
INSERT INTO Adres (SicilNo, IlceID) VALUES (949900,9)
INSERT INTO Adres (SicilNo, IlceID) VALUES (939041,10)
INSERT INTO Adres (SicilNo, IlceID) VALUES (823080,11)
INSERT INTO Adres (SicilNo, IlceID) VALUES (967548,12)
INSERT INTO Adres (SicilNo, IlceID) VALUES (318129,13)
INSERT INTO Adres (SicilNo, IlceID) VALUES (376259,14)
INSERT INTO Adres (SicilNo, IlceID) VALUES (309974,15)
INSERT INTO Adres (SicilNo, IlceID) VALUES (519587,16)
INSERT INTO Adres (SicilNo, IlceID) VALUES (190626,17)
INSERT INTO Adres (SicilNo, IlceID) VALUES (370921,18)
INSERT INTO Adres (SicilNo, IlceID) VALUES (311622,19)
INSERT INTO Adres (SicilNo, IlceID) VALUES (291830,20)
INSERT INTO Adres (SicilNo, IlceID) VALUES (136043,21)
INSERT INTO Adres (SicilNo, IlceID) VALUES (369590,22)
INSERT INTO Adres (SicilNo, IlceID) VALUES (811611,23)
INSERT INTO Adres (SicilNo, IlceID) VALUES (686869,24)
INSERT INTO Adres (SicilNo, IlceID) VALUES (881073,25)
INSERT INTO Adres (SicilNo, IlceID) VALUES (384492,26)
INSERT INTO Adres (SicilNo, IlceID) VALUES (219304,27)
INSERT INTO Adres (SicilNo, IlceID) VALUES (210320,28)
INSERT INTO Adres (SicilNo, IlceID) VALUES (948335,29)
INSERT INTO Adres (SicilNo, IlceID) VALUES (745593,30)
INSERT INTO Adres (SicilNo, IlceID) VALUES (660752,31)
INSERT INTO Adres (SicilNo, IlceID) VALUES (518469,32)
INSERT INTO Adres (SicilNo, IlceID) VALUES (587791,33)
INSERT INTO Adres (SicilNo, IlceID) VALUES (105265,34)
INSERT INTO Adres (SicilNo, IlceID) VALUES (898266,35)
INSERT INTO Adres (SicilNo, IlceID) VALUES (470368,36)
INSERT INTO Adres (SicilNo, IlceID) VALUES (636509,37)
INSERT INTO Adres (SicilNo, IlceID) VALUES (894268,38)
INSERT INTO Adres (SicilNo, IlceID) VALUES (659476,39)
INSERT INTO Adres (SicilNo, IlceID) VALUES (784868,40)
INSERT INTO Adres (SicilNo, IlceID) VALUES (212772,41)
INSERT INTO Adres (SicilNo, IlceID) VALUES (440529,42)
INSERT INTO Adres (SicilNo, IlceID) VALUES (446424,43)
INSERT INTO Adres (SicilNo, IlceID) VALUES (903122,44)
INSERT INTO Adres (SicilNo, IlceID) VALUES (998152,45)
INSERT INTO Adres (SicilNo, IlceID) VALUES (547117,46)
INSERT INTO Adres (SicilNo, IlceID) VALUES (568558,47)
INSERT INTO Adres (SicilNo, IlceID) VALUES (923814,48)
INSERT INTO Adres (SicilNo, IlceID) VALUES (730912,49)
INSERT INTO Adres (SicilNo, IlceID) VALUES (136245,50)
INSERT INTO Adres (SicilNo, IlceID) VALUES (901651,51)
INSERT INTO Adres (SicilNo, IlceID) VALUES (388256,52)
INSERT INTO Adres (SicilNo, IlceID) VALUES (663179,53)
INSERT INTO Adres (SicilNo, IlceID) VALUES (801997,54)
INSERT INTO Adres (SicilNo, IlceID) VALUES (775468,55)
INSERT INTO Adres (SicilNo, IlceID) VALUES (305045,56)
INSERT INTO Adres (SicilNo, IlceID) VALUES (469627,57)
INSERT INTO Adres (SicilNo, IlceID) VALUES (708025,58)
INSERT INTO Adres (SicilNo, IlceID) VALUES (947621,59)
INSERT INTO Adres (SicilNo, IlceID) VALUES (682945,60)
INSERT INTO Adres (SicilNo, IlceID) VALUES (886661,61)
INSERT INTO Adres (SicilNo, IlceID) VALUES (793550,62)
INSERT INTO Adres (SicilNo, IlceID) VALUES (914768,63)
INSERT INTO Adres (SicilNo, IlceID) VALUES (615804,64)
INSERT INTO Adres (SicilNo, IlceID) VALUES (680994,65)
INSERT INTO Adres (SicilNo, IlceID) VALUES (148865,66)
INSERT INTO Adres (SicilNo, IlceID) VALUES (579884,67)
INSERT INTO Adres (SicilNo, IlceID) VALUES (390363,68)
INSERT INTO Adres (SicilNo, IlceID) VALUES (987203,69)
INSERT INTO Adres (SicilNo, IlceID) VALUES (734013,70)
INSERT INTO Adres (SicilNo, IlceID) VALUES (521850,71)
INSERT INTO Adres (SicilNo, IlceID) VALUES (852035,72)
INSERT INTO Adres (SicilNo, IlceID) VALUES (526365,73)
INSERT INTO Adres (SicilNo, IlceID) VALUES (641538,74)
INSERT INTO Adres (SicilNo, IlceID) VALUES (515134,75)
INSERT INTO Adres (SicilNo, IlceID) VALUES (764198,76)
INSERT INTO Adres (SicilNo, IlceID) VALUES (678452,77)
INSERT INTO Adres (SicilNo, IlceID) VALUES (964626,78)
INSERT INTO Adres (SicilNo, IlceID) VALUES (251050,79)
INSERT INTO Adres (SicilNo, IlceID) VALUES (233082,80)
INSERT INTO Adres (SicilNo, IlceID) VALUES (868867,81)
INSERT INTO Adres (SicilNo, IlceID) VALUES (722458,82)
INSERT INTO Adres (SicilNo, IlceID) VALUES (159300,83)
INSERT INTO Adres (SicilNo, IlceID) VALUES (195398,84)
INSERT INTO Adres (SicilNo, IlceID) VALUES (653994,85)
INSERT INTO Adres (SicilNo, IlceID) VALUES (110995,86)
INSERT INTO Adres (SicilNo, IlceID) VALUES (267159,87)
INSERT INTO Adres (SicilNo, IlceID) VALUES (598088,88)
INSERT INTO Adres (SicilNo, IlceID) VALUES (251394,89)
INSERT INTO Adres (SicilNo, IlceID) VALUES (881817,90)
INSERT INTO Adres (SicilNo, IlceID) VALUES (295942,91)
INSERT INTO Adres (SicilNo, IlceID) VALUES (358094,92)
INSERT INTO Adres (SicilNo, IlceID) VALUES (935362,93)
INSERT INTO Adres (SicilNo, IlceID) VALUES (103301,94)
INSERT INTO Adres (SicilNo, IlceID) VALUES (215921,95)
INSERT INTO Adres (SicilNo, IlceID) VALUES (740058,96)
INSERT INTO Adres (SicilNo, IlceID) VALUES (413655,97)
INSERT INTO Adres (SicilNo, IlceID) VALUES (410357,98)
INSERT INTO Adres (SicilNo, IlceID) VALUES (266565,99)
INSERT INTO Adres (SicilNo, IlceID) VALUES (490136,100)
INSERT INTO Adres (SicilNo, IlceID) VALUES (723529,101)
INSERT INTO Adres (SicilNo, IlceID) VALUES (933794,102)
INSERT INTO Adres (SicilNo, IlceID) VALUES (523847,103)
INSERT INTO Adres (SicilNo, IlceID) VALUES (982168,104)
INSERT INTO Adres (SicilNo, IlceID) VALUES (791698,105)
INSERT INTO Adres (SicilNo, IlceID) VALUES (616147,106)
INSERT INTO Adres (SicilNo, IlceID) VALUES (360445,107)
INSERT INTO Adres (SicilNo, IlceID) VALUES (608924,108)
INSERT INTO Adres (SicilNo, IlceID) VALUES (982696,109)
INSERT INTO Adres (SicilNo, IlceID) VALUES (812905,110)
INSERT INTO Adres (SicilNo, IlceID) VALUES (523540,111)
INSERT INTO Adres (SicilNo, IlceID) VALUES (231772,112)
INSERT INTO Adres (SicilNo, IlceID) VALUES (586559,113)
INSERT INTO Adres (SicilNo, IlceID) VALUES (332731,114)
INSERT INTO Adres (SicilNo, IlceID) VALUES (903997,115)
INSERT INTO Adres (SicilNo, IlceID) VALUES (531673,116)
INSERT INTO Adres (SicilNo, IlceID) VALUES (336222,117)
INSERT INTO Adres (SicilNo, IlceID) VALUES (963429,118)
INSERT INTO Adres (SicilNo, IlceID) VALUES (334909,119)
INSERT INTO Adres (SicilNo, IlceID) VALUES (308891,120)
INSERT INTO Adres (SicilNo, IlceID) VALUES (226345,121)
INSERT INTO Adres (SicilNo, IlceID) VALUES (745140,122)
INSERT INTO Adres (SicilNo, IlceID) VALUES (646887,123)
INSERT INTO Adres (SicilNo, IlceID) VALUES (293007,124)
INSERT INTO Adres (SicilNo, IlceID) VALUES (696088,125)
INSERT INTO Adres (SicilNo, IlceID) VALUES (922207,126)
INSERT INTO Adres (SicilNo, IlceID) VALUES (419044,127)
INSERT INTO Adres (SicilNo, IlceID) VALUES (900797,128)
INSERT INTO Adres (SicilNo, IlceID) VALUES (960103,129)
INSERT INTO Adres (SicilNo, IlceID) VALUES (873765,130)
INSERT INTO Adres (SicilNo, IlceID) VALUES (528570,131)
INSERT INTO Adres (SicilNo, IlceID) VALUES (348737,132)
INSERT INTO Adres (SicilNo, IlceID) VALUES (797019,133)
INSERT INTO Adres (SicilNo, IlceID) VALUES (845310,134)
INSERT INTO Adres (SicilNo, IlceID) VALUES (467598,135)
INSERT INTO Adres (SicilNo, IlceID) VALUES (737554,136)
INSERT INTO Adres (SicilNo, IlceID) VALUES (328446,137)
INSERT INTO Adres (SicilNo, IlceID) VALUES (820128,138)
INSERT INTO Adres (SicilNo, IlceID) VALUES (353279,139)
INSERT INTO Adres (SicilNo, IlceID) VALUES (855164,140)
INSERT INTO Adres (SicilNo, IlceID) VALUES (240164,141)
INSERT INTO Adres (SicilNo, IlceID) VALUES (743230,142)
INSERT INTO Adres (SicilNo, IlceID) VALUES (579206,143)
INSERT INTO Adres (SicilNo, IlceID) VALUES (615111,144)
INSERT INTO Adres (SicilNo, IlceID) VALUES (394833,145)
INSERT INTO Adres (SicilNo, IlceID) VALUES (316156,146)
INSERT INTO Adres (SicilNo, IlceID) VALUES (628045,147)
INSERT INTO Adres (SicilNo, IlceID) VALUES (167680,148)
INSERT INTO Adres (SicilNo, IlceID) VALUES (280852,149)
INSERT INTO Adres (SicilNo, IlceID) VALUES (420345,150)
INSERT INTO Adres (SicilNo, IlceID) VALUES (177166,151)
INSERT INTO Adres (SicilNo, IlceID) VALUES (556621,152)
INSERT INTO Adres (SicilNo, IlceID) VALUES (199105,153)
INSERT INTO Adres (SicilNo, IlceID) VALUES (426028,154)
INSERT INTO Adres (SicilNo, IlceID) VALUES (981863,155)
INSERT INTO Adres (SicilNo, IlceID) VALUES (309133,156)
INSERT INTO Adres (SicilNo, IlceID) VALUES (545305,157)
INSERT INTO Adres (SicilNo, IlceID) VALUES (440494,158)
INSERT INTO Adres (SicilNo, IlceID) VALUES (415310,159)
INSERT INTO Adres (SicilNo, IlceID) VALUES (455708,160)
INSERT INTO Adres (SicilNo, IlceID) VALUES (583852,161)
INSERT INTO Adres (SicilNo, IlceID) VALUES (746886,162)
INSERT INTO Adres (SicilNo, IlceID) VALUES (474129,163)
INSERT INTO Adres (SicilNo, IlceID) VALUES (376207,164)
INSERT INTO Adres (SicilNo, IlceID) VALUES (502652,165)
INSERT INTO Adres (SicilNo, IlceID) VALUES (626537,166)
INSERT INTO Adres (SicilNo, IlceID) VALUES (990281,167)
INSERT INTO Adres (SicilNo, IlceID) VALUES (528496,168)
INSERT INTO Adres (SicilNo, IlceID) VALUES (460932,169)
INSERT INTO Adres (SicilNo, IlceID) VALUES (172556,170)
INSERT INTO Adres (SicilNo, IlceID) VALUES (285867,171)
INSERT INTO Adres (SicilNo, IlceID) VALUES (852213,172)
INSERT INTO Adres (SicilNo, IlceID) VALUES (249129,173)
INSERT INTO Adres (SicilNo, IlceID) VALUES (276937,174)
INSERT INTO Adres (SicilNo, IlceID) VALUES (539991,175)
INSERT INTO Adres (SicilNo, IlceID) VALUES (725936,176)
INSERT INTO Adres (SicilNo, IlceID) VALUES (888621,177)
INSERT INTO Adres (SicilNo, IlceID) VALUES (265162,178)
INSERT INTO Adres (SicilNo, IlceID) VALUES (118023,179)
INSERT INTO Adres (SicilNo, IlceID) VALUES (477240,180)
INSERT INTO Adres (SicilNo, IlceID) VALUES (729374,181)
INSERT INTO Adres (SicilNo, IlceID) VALUES (417041,182)
INSERT INTO Adres (SicilNo, IlceID) VALUES (594684,183)
INSERT INTO Adres (SicilNo, IlceID) VALUES (702411,184)
INSERT INTO Adres (SicilNo, IlceID) VALUES (656260,185)
INSERT INTO Adres (SicilNo, IlceID) VALUES (728153,186)
INSERT INTO Adres (SicilNo, IlceID) VALUES (382680,187)
INSERT INTO Adres (SicilNo, IlceID) VALUES (765731,188)
INSERT INTO Adres (SicilNo, IlceID) VALUES (139066,189)
INSERT INTO Adres (SicilNo, IlceID) VALUES (954271,190)
INSERT INTO Adres (SicilNo, IlceID) VALUES (503985,191)
INSERT INTO Adres (SicilNo, IlceID) VALUES (997524,192)
INSERT INTO Adres (SicilNo, IlceID) VALUES (206645,193)
INSERT INTO Adres (SicilNo, IlceID) VALUES (453600,194)
INSERT INTO Adres (SicilNo, IlceID) VALUES (436818,195)
INSERT INTO Adres (SicilNo, IlceID) VALUES (272626,196)
INSERT INTO Adres (SicilNo, IlceID) VALUES (551237,197)
INSERT INTO Adres (SicilNo, IlceID) VALUES (824795,198)
INSERT INTO Adres (SicilNo, IlceID) VALUES (958552,199)
INSERT INTO Adres (SicilNo, IlceID) VALUES (680466,200)
INSERT INTO Adres (SicilNo, IlceID) VALUES (452430,201)
INSERT INTO Adres (SicilNo, IlceID) VALUES (173754,202)
INSERT INTO Adres (SicilNo, IlceID) VALUES (600943,203)
INSERT INTO Adres (SicilNo, IlceID) VALUES (590208,204)
INSERT INTO Adres (SicilNo, IlceID) VALUES (354223,205)
INSERT INTO Adres (SicilNo, IlceID) VALUES (484821,206)
INSERT INTO Adres (SicilNo, IlceID) VALUES (946492,207)
INSERT INTO Adres (SicilNo, IlceID) VALUES (714122,208)
INSERT INTO Adres (SicilNo, IlceID) VALUES (510122,209)
INSERT INTO Adres (SicilNo, IlceID) VALUES (863364,210)
INSERT INTO Adres (SicilNo, IlceID) VALUES (298801,211)
INSERT INTO Adres (SicilNo, IlceID) VALUES (677174,212)
INSERT INTO Adres (SicilNo, IlceID) VALUES (917191,213)
INSERT INTO Adres (SicilNo, IlceID) VALUES (326675,214)
INSERT INTO Adres (SicilNo, IlceID) VALUES (379525,215)
INSERT INTO Adres (SicilNo, IlceID) VALUES (259770,216)
INSERT INTO Adres (SicilNo, IlceID) VALUES (344515,217)
INSERT INTO Adres (SicilNo, IlceID) VALUES (531880,218)
INSERT INTO Adres (SicilNo, IlceID) VALUES (802780,219)
INSERT INTO Adres (SicilNo, IlceID) VALUES (909848,220)
INSERT INTO Adres (SicilNo, IlceID) VALUES (741693,221)
INSERT INTO Adres (SicilNo, IlceID) VALUES (571275,222)
INSERT INTO Adres (SicilNo, IlceID) VALUES (830041,223)
INSERT INTO Adres (SicilNo, IlceID) VALUES (647685,224)
INSERT INTO Adres (SicilNo, IlceID) VALUES (863696,225)
INSERT INTO Adres (SicilNo, IlceID) VALUES (539882,226)
INSERT INTO Adres (SicilNo, IlceID) VALUES (353738,227)
INSERT INTO Adres (SicilNo, IlceID) VALUES (329392,228)
INSERT INTO Adres (SicilNo, IlceID) VALUES (448322,229)
INSERT INTO Adres (SicilNo, IlceID) VALUES (265055,230)
INSERT INTO Adres (SicilNo, IlceID) VALUES (709199,231)
INSERT INTO Adres (SicilNo, IlceID) VALUES (210942,232)
INSERT INTO Adres (SicilNo, IlceID) VALUES (169628,233)
INSERT INTO Adres (SicilNo, IlceID) VALUES (130290,234)
INSERT INTO Adres (SicilNo, IlceID) VALUES (151745,235)
INSERT INTO Adres (SicilNo, IlceID) VALUES (309474,236)
INSERT INTO Adres (SicilNo, IlceID) VALUES (329728,237)
INSERT INTO Adres (SicilNo, IlceID) VALUES (165037,238)
INSERT INTO Adres (SicilNo, IlceID) VALUES (170878,239)
INSERT INTO Adres (SicilNo, IlceID) VALUES (117844,240)
INSERT INTO Adres (SicilNo, IlceID) VALUES (416917,241)
INSERT INTO Adres (SicilNo, IlceID) VALUES (462994,242)
INSERT INTO Adres (SicilNo, IlceID) VALUES (910288,243)
INSERT INTO Adres (SicilNo, IlceID) VALUES (647707,244)
INSERT INTO Adres (SicilNo, IlceID) VALUES (993482,245)
INSERT INTO Adres (SicilNo, IlceID) VALUES (665865,246)
INSERT INTO Adres (SicilNo, IlceID) VALUES (720258,247)
INSERT INTO Adres (SicilNo, IlceID) VALUES (260282,248)
INSERT INTO Adres (SicilNo, IlceID) VALUES (650779,249)
INSERT INTO Adres (SicilNo, IlceID) VALUES (358435,250)
INSERT INTO Adres (SicilNo, IlceID) VALUES (738296,251)
INSERT INTO Adres (SicilNo, IlceID) VALUES (929562,252)
INSERT INTO Adres (SicilNo, IlceID) VALUES (366356,253)
INSERT INTO Adres (SicilNo, IlceID) VALUES (581238,254)
INSERT INTO Adres (SicilNo, IlceID) VALUES (580026,255)
INSERT INTO Adres (SicilNo, IlceID) VALUES (356159,256)
INSERT INTO Adres (SicilNo, IlceID) VALUES (951998,257)
INSERT INTO Adres (SicilNo, IlceID) VALUES (398858,258)
INSERT INTO Adres (SicilNo, IlceID) VALUES (927266,259)
INSERT INTO Adres (SicilNo, IlceID) VALUES (443722,260)
INSERT INTO Adres (SicilNo, IlceID) VALUES (101798,261)
INSERT INTO Adres (SicilNo, IlceID) VALUES (229263,262)
INSERT INTO Adres (SicilNo, IlceID) VALUES (552895,263)
INSERT INTO Adres (SicilNo, IlceID) VALUES (218502,264)
INSERT INTO Adres (SicilNo, IlceID) VALUES (243213,265)
INSERT INTO Adres (SicilNo, IlceID) VALUES (724985,266)
INSERT INTO Adres (SicilNo, IlceID) VALUES (229150,267)
INSERT INTO Adres (SicilNo, IlceID) VALUES (338341,268)
INSERT INTO Adres (SicilNo, IlceID) VALUES (859144,269)
INSERT INTO Adres (SicilNo, IlceID) VALUES (845551,270)
INSERT INTO Adres (SicilNo, IlceID) VALUES (547938,271)
INSERT INTO Adres (SicilNo, IlceID) VALUES (994220,272)
INSERT INTO Adres (SicilNo, IlceID) VALUES (319687,273)
INSERT INTO Adres (SicilNo, IlceID) VALUES (965156,274)
INSERT INTO Adres (SicilNo, IlceID) VALUES (747788,275)
INSERT INTO Adres (SicilNo, IlceID) VALUES (437726,276)
INSERT INTO Adres (SicilNo, IlceID) VALUES (864364,277)
INSERT INTO Adres (SicilNo, IlceID) VALUES (677175,278)
INSERT INTO Adres (SicilNo, IlceID) VALUES (319297,279)
INSERT INTO Adres (SicilNo, IlceID) VALUES (878413,280)
INSERT INTO Adres (SicilNo, IlceID) VALUES (845173,281)
INSERT INTO Adres (SicilNo, IlceID) VALUES (628730,282)
INSERT INTO Adres (SicilNo, IlceID) VALUES (766275,283)
INSERT INTO Adres (SicilNo, IlceID) VALUES (423750,284)
INSERT INTO Adres (SicilNo, IlceID) VALUES (999019,285)
INSERT INTO Adres (SicilNo, IlceID) VALUES (311256,286)
INSERT INTO Adres (SicilNo, IlceID) VALUES (565304,287)
INSERT INTO Adres (SicilNo, IlceID) VALUES (926574,288)
INSERT INTO Adres (SicilNo, IlceID) VALUES (128271,289)
INSERT INTO Adres (SicilNo, IlceID) VALUES (727858,290)
INSERT INTO Adres (SicilNo, IlceID) VALUES (759937,291)
INSERT INTO Adres (SicilNo, IlceID) VALUES (786196,292)
INSERT INTO Adres (SicilNo, IlceID) VALUES (246244,293)
INSERT INTO Adres (SicilNo, IlceID) VALUES (792024,294)
INSERT INTO Adres (SicilNo, IlceID) VALUES (458758,295)
INSERT INTO Adres (SicilNo, IlceID) VALUES (156295,296)
INSERT INTO Adres (SicilNo, IlceID) VALUES (754793,297)
INSERT INTO Adres (SicilNo, IlceID) VALUES (569394,298)
INSERT INTO Adres (SicilNo, IlceID) VALUES (286884,299)
INSERT INTO Adres (SicilNo, IlceID) VALUES (329933,300)
INSERT INTO Adres (SicilNo, IlceID) VALUES (695173,301)
INSERT INTO Adres (SicilNo, IlceID) VALUES (810259,302)
INSERT INTO Adres (SicilNo, IlceID) VALUES (243967,303)
INSERT INTO Adres (SicilNo, IlceID) VALUES (994545,304)
INSERT INTO Adres (SicilNo, IlceID) VALUES (270469,305)
INSERT INTO Adres (SicilNo, IlceID) VALUES (124379,306)
INSERT INTO Adres (SicilNo, IlceID) VALUES (288988,307)
INSERT INTO Adres (SicilNo, IlceID) VALUES (617832,308)
INSERT INTO Adres (SicilNo, IlceID) VALUES (847209,309)
INSERT INTO Adres (SicilNo, IlceID) VALUES (202632,310)
INSERT INTO Adres (SicilNo, IlceID) VALUES (841487,311)
INSERT INTO Adres (SicilNo, IlceID) VALUES (535155,312)
INSERT INTO Adres (SicilNo, IlceID) VALUES (819107,313)
INSERT INTO Adres (SicilNo, IlceID) VALUES (518991,314)
INSERT INTO Adres (SicilNo, IlceID) VALUES (340600,315)
INSERT INTO Adres (SicilNo, IlceID) VALUES (632995,316)
INSERT INTO Adres (SicilNo, IlceID) VALUES (870891,317)
INSERT INTO Adres (SicilNo, IlceID) VALUES (955728,318)
INSERT INTO Adres (SicilNo, IlceID) VALUES (457080,319)
INSERT INTO Adres (SicilNo, IlceID) VALUES (145159,320)
INSERT INTO Adres (SicilNo, IlceID) VALUES (970367,321)
INSERT INTO Adres (SicilNo, IlceID) VALUES (337764,322)
INSERT INTO Adres (SicilNo, IlceID) VALUES (763136,323)
INSERT INTO Adres (SicilNo, IlceID) VALUES (325906,324)
INSERT INTO Adres (SicilNo, IlceID) VALUES (733049,325)
INSERT INTO Adres (SicilNo, IlceID) VALUES (859350,326)
INSERT INTO Adres (SicilNo, IlceID) VALUES (324392,327)
INSERT INTO Adres (SicilNo, IlceID) VALUES (560692,328)
INSERT INTO Adres (SicilNo, IlceID) VALUES (498569,329)
INSERT INTO Adres (SicilNo, IlceID) VALUES (197545,330)
INSERT INTO Adres (SicilNo, IlceID) VALUES (626176,331)
INSERT INTO Adres (SicilNo, IlceID) VALUES (666248,332)
INSERT INTO Adres (SicilNo, IlceID) VALUES (258602,333)
INSERT INTO Adres (SicilNo, IlceID) VALUES (349788,334)
INSERT INTO Adres (SicilNo, IlceID) VALUES (373073,335)
INSERT INTO Adres (SicilNo, IlceID) VALUES (916734,336)
INSERT INTO Adres (SicilNo, IlceID) VALUES (955295,337)
INSERT INTO Adres (SicilNo, IlceID) VALUES (878952,338)
INSERT INTO Adres (SicilNo, IlceID) VALUES (651210,339)
INSERT INTO Adres (SicilNo, IlceID) VALUES (383265,340)
INSERT INTO Adres (SicilNo, IlceID) VALUES (640435,341)
INSERT INTO Adres (SicilNo, IlceID) VALUES (489173,342)
INSERT INTO Adres (SicilNo, IlceID) VALUES (688121,343)
INSERT INTO Adres (SicilNo, IlceID) VALUES (351705,344)
INSERT INTO Adres (SicilNo, IlceID) VALUES (951186,345)
INSERT INTO Adres (SicilNo, IlceID) VALUES (808640,346)
INSERT INTO Adres (SicilNo, IlceID) VALUES (771634,347)
INSERT INTO Adres (SicilNo, IlceID) VALUES (831458,348)
INSERT INTO Adres (SicilNo, IlceID) VALUES (137088,349)
INSERT INTO Adres (SicilNo, IlceID) VALUES (227848,350)
INSERT INTO Adres (SicilNo, IlceID) VALUES (534700,351)
INSERT INTO Adres (SicilNo, IlceID) VALUES (840200,352)
INSERT INTO Adres (SicilNo, IlceID) VALUES (297406,353)
INSERT INTO Adres (SicilNo, IlceID) VALUES (806512,354)
INSERT INTO Adres (SicilNo, IlceID) VALUES (795885,355)
INSERT INTO Adres (SicilNo, IlceID) VALUES (496879,356)
INSERT INTO Adres (SicilNo, IlceID) VALUES (412435,357)
INSERT INTO Adres (SicilNo, IlceID) VALUES (692283,358)
INSERT INTO Adres (SicilNo, IlceID) VALUES (397647,359)
INSERT INTO Adres (SicilNo, IlceID) VALUES (738896,360)
INSERT INTO Adres (SicilNo, IlceID) VALUES (723020,361)
INSERT INTO Adres (SicilNo, IlceID) VALUES (124859,362)
INSERT INTO Adres (SicilNo, IlceID) VALUES (670401,363)
INSERT INTO Adres (SicilNo, IlceID) VALUES (203380,364)
INSERT INTO Adres (SicilNo, IlceID) VALUES (384313,365)
INSERT INTO Adres (SicilNo, IlceID) VALUES (372430,366)
INSERT INTO Adres (SicilNo, IlceID) VALUES (339203,367)
INSERT INTO Adres (SicilNo, IlceID) VALUES (981628,368)
INSERT INTO Adres (SicilNo, IlceID) VALUES (661444,369)
INSERT INTO Adres (SicilNo, IlceID) VALUES (553630,370)
INSERT INTO Adres (SicilNo, IlceID) VALUES (583780,371)
INSERT INTO Adres (SicilNo, IlceID) VALUES (513274,372)
INSERT INTO Adres (SicilNo, IlceID) VALUES (955382,373)
INSERT INTO Adres (SicilNo, IlceID) VALUES (436979,374)
INSERT INTO Adres (SicilNo, IlceID) VALUES (820002,375)
INSERT INTO Adres (SicilNo, IlceID) VALUES (956885,376)
INSERT INTO Adres (SicilNo, IlceID) VALUES (716500,377)
INSERT INTO Adres (SicilNo, IlceID) VALUES (510934,378)
INSERT INTO Adres (SicilNo, IlceID) VALUES (239661,379)
INSERT INTO Adres (SicilNo, IlceID) VALUES (531875,380)
INSERT INTO Adres (SicilNo, IlceID) VALUES (632930,381)
INSERT INTO Adres (SicilNo, IlceID) VALUES (542688,382)
INSERT INTO Adres (SicilNo, IlceID) VALUES (839352,383)
INSERT INTO Adres (SicilNo, IlceID) VALUES (681019,384)
INSERT INTO Adres (SicilNo, IlceID) VALUES (180716,385)
INSERT INTO Adres (SicilNo, IlceID) VALUES (808255,386)
INSERT INTO Adres (SicilNo, IlceID) VALUES (456993,387)
INSERT INTO Adres (SicilNo, IlceID) VALUES (833264,388)
INSERT INTO Adres (SicilNo, IlceID) VALUES (862869,389)
INSERT INTO Adres (SicilNo, IlceID) VALUES (629708,390)
INSERT INTO Adres (SicilNo, IlceID) VALUES (457923,391)
INSERT INTO Adres (SicilNo, IlceID) VALUES (557290,392)
INSERT INTO Adres (SicilNo, IlceID) VALUES (429384,393)
INSERT INTO Adres (SicilNo, IlceID) VALUES (569121,394)
INSERT INTO Adres (SicilNo, IlceID) VALUES (216845,395)
INSERT INTO Adres (SicilNo, IlceID) VALUES (750052,396)
INSERT INTO Adres (SicilNo, IlceID) VALUES (422218,397)
INSERT INTO Adres (SicilNo, IlceID) VALUES (417854,398)
INSERT INTO Adres (SicilNo, IlceID) VALUES (474174,399)
INSERT INTO Adres (SicilNo, IlceID) VALUES (547973,400)
INSERT INTO Adres (SicilNo, IlceID) VALUES (401513,401)
INSERT INTO Adres (SicilNo, IlceID) VALUES (201678,402)
INSERT INTO Adres (SicilNo, IlceID) VALUES (873679,403)
INSERT INTO Adres (SicilNo, IlceID) VALUES (157625,404)
INSERT INTO Adres (SicilNo, IlceID) VALUES (845392,405)
INSERT INTO Adres (SicilNo, IlceID) VALUES (218701,406)
INSERT INTO Adres (SicilNo, IlceID) VALUES (336309,407)
INSERT INTO Adres (SicilNo, IlceID) VALUES (522413,408)
INSERT INTO Adres (SicilNo, IlceID) VALUES (818211,409)
INSERT INTO Adres (SicilNo, IlceID) VALUES (423425,410)
INSERT INTO Adres (SicilNo, IlceID) VALUES (513507,411)
INSERT INTO Adres (SicilNo, IlceID) VALUES (461617,412)
INSERT INTO Adres (SicilNo, IlceID) VALUES (647228,413)
INSERT INTO Adres (SicilNo, IlceID) VALUES (110709,414)
INSERT INTO Adres (SicilNo, IlceID) VALUES (713208,415)
INSERT INTO Adres (SicilNo, IlceID) VALUES (372525,416)
INSERT INTO Adres (SicilNo, IlceID) VALUES (211592,417)
INSERT INTO Adres (SicilNo, IlceID) VALUES (452681,418)
INSERT INTO Adres (SicilNo, IlceID) VALUES (756484,419)
INSERT INTO Adres (SicilNo, IlceID) VALUES (619840,420)
INSERT INTO Adres (SicilNo, IlceID) VALUES (886405,421)
INSERT INTO Adres (SicilNo, IlceID) VALUES (874510,422)
INSERT INTO Adres (SicilNo, IlceID) VALUES (119231,423)
INSERT INTO Adres (SicilNo, IlceID) VALUES (773444,424)
INSERT INTO Adres (SicilNo, IlceID) VALUES (106817,425)
INSERT INTO Adres (SicilNo, IlceID) VALUES (511711,426)
INSERT INTO Adres (SicilNo, IlceID) VALUES (258829,427)
INSERT INTO Adres (SicilNo, IlceID) VALUES (662016,428)
INSERT INTO Adres (SicilNo, IlceID) VALUES (410324,429)
INSERT INTO Adres (SicilNo, IlceID) VALUES (246519,430)
INSERT INTO Adres (SicilNo, IlceID) VALUES (575667,431)
INSERT INTO Adres (SicilNo, IlceID) VALUES (576017,432)
INSERT INTO Adres (SicilNo, IlceID) VALUES (427768,433)
INSERT INTO Adres (SicilNo, IlceID) VALUES (521544,434)
INSERT INTO Adres (SicilNo, IlceID) VALUES (963254,435)
INSERT INTO Adres (SicilNo, IlceID) VALUES (544399,436)
INSERT INTO Adres (SicilNo, IlceID) VALUES (335962,437)
INSERT INTO Adres (SicilNo, IlceID) VALUES (914428,438)
INSERT INTO Adres (SicilNo, IlceID) VALUES (413146,439)
INSERT INTO Adres (SicilNo, IlceID) VALUES (602075,440)
INSERT INTO Adres (SicilNo, IlceID) VALUES (794933,441)
INSERT INTO Adres (SicilNo, IlceID) VALUES (247243,442)
INSERT INTO Adres (SicilNo, IlceID) VALUES (380697,443)
INSERT INTO Adres (SicilNo, IlceID) VALUES (764954,444)
INSERT INTO Adres (SicilNo, IlceID) VALUES (200696,445)
INSERT INTO Adres (SicilNo, IlceID) VALUES (562455,446)
INSERT INTO Adres (SicilNo, IlceID) VALUES (725548,447)
INSERT INTO Adres (SicilNo, IlceID) VALUES (394363,448)
INSERT INTO Adres (SicilNo, IlceID) VALUES (688719,449)
INSERT INTO Adres (SicilNo, IlceID) VALUES (630382,450)
INSERT INTO Adres (SicilNo, IlceID) VALUES (913661,451)
INSERT INTO Adres (SicilNo, IlceID) VALUES (211810,452)
INSERT INTO Adres (SicilNo, IlceID) VALUES (987847,453)
INSERT INTO Adres (SicilNo, IlceID) VALUES (766204,454)
INSERT INTO Adres (SicilNo, IlceID) VALUES (238121,455)
INSERT INTO Adres (SicilNo, IlceID) VALUES (236798,456)
INSERT INTO Adres (SicilNo, IlceID) VALUES (733352,457)
INSERT INTO Adres (SicilNo, IlceID) VALUES (731065,458)
INSERT INTO Adres (SicilNo, IlceID) VALUES (391735,459)
INSERT INTO Adres (SicilNo, IlceID) VALUES (642695,460)
INSERT INTO Adres (SicilNo, IlceID) VALUES (372588,461)
INSERT INTO Adres (SicilNo, IlceID) VALUES (895372,462)
INSERT INTO Adres (SicilNo, IlceID) VALUES (569175,463)
INSERT INTO Adres (SicilNo, IlceID) VALUES (977566,464)
INSERT INTO Adres (SicilNo, IlceID) VALUES (835630,465)
INSERT INTO Adres (SicilNo, IlceID) VALUES (669362,466)
INSERT INTO Adres (SicilNo, IlceID) VALUES (927145,467)
INSERT INTO Adres (SicilNo, IlceID) VALUES (789164,468)
INSERT INTO Adres (SicilNo, IlceID) VALUES (678349,469)
INSERT INTO Adres (SicilNo, IlceID) VALUES (191973,470)
INSERT INTO Adres (SicilNo, IlceID) VALUES (522381,471)
INSERT INTO Adres (SicilNo, IlceID) VALUES (616717,472)
INSERT INTO Adres (SicilNo, IlceID) VALUES (742064,473)
INSERT INTO Adres (SicilNo, IlceID) VALUES (688754,474)
INSERT INTO Adres (SicilNo, IlceID) VALUES (838031,475)
INSERT INTO Adres (SicilNo, IlceID) VALUES (614788,476)
INSERT INTO Adres (SicilNo, IlceID) VALUES (563637,477)
INSERT INTO Adres (SicilNo, IlceID) VALUES (607103,478)
INSERT INTO Adres (SicilNo, IlceID) VALUES (559252,479)
INSERT INTO Adres (SicilNo, IlceID) VALUES (256949,480)
INSERT INTO Adres (SicilNo, IlceID) VALUES (656211,481)
INSERT INTO Adres (SicilNo, IlceID) VALUES (350233,482)
INSERT INTO Adres (SicilNo, IlceID) VALUES (962548,483)
INSERT INTO Adres (SicilNo, IlceID) VALUES (817521,484)
INSERT INTO Adres (SicilNo, IlceID) VALUES (473547,485)
INSERT INTO Adres (SicilNo, IlceID) VALUES (241938,486)
INSERT INTO Adres (SicilNo, IlceID) VALUES (974723,487)
INSERT INTO Adres (SicilNo, IlceID) VALUES (537183,488)
INSERT INTO Adres (SicilNo, IlceID) VALUES (570066,489)
INSERT INTO Adres (SicilNo, IlceID) VALUES (180799,490)
INSERT INTO Adres (SicilNo, IlceID) VALUES (967879,491)
INSERT INTO Adres (SicilNo, IlceID) VALUES (751914,492)
INSERT INTO Adres (SicilNo, IlceID) VALUES (330885,493)
INSERT INTO Adres (SicilNo, IlceID) VALUES (833974,494)
INSERT INTO Adres (SicilNo, IlceID) VALUES (679192,495)
INSERT INTO Adres (SicilNo, IlceID) VALUES (345368,496)
INSERT INTO Adres (SicilNo, IlceID) VALUES (347589,497)
INSERT INTO Adres (SicilNo, IlceID) VALUES (121606,498)
INSERT INTO Adres (SicilNo, IlceID) VALUES (661339,499)
INSERT INTO Adres (SicilNo, IlceID) VALUES (200391,500)
INSERT INTO Adres (SicilNo, IlceID) VALUES (928971,501)
INSERT INTO Adres (SicilNo, IlceID) VALUES (436036,502)
INSERT INTO Adres (SicilNo, IlceID) VALUES (693612,503)
INSERT INTO Adres (SicilNo, IlceID) VALUES (824807,504)
INSERT INTO Adres (SicilNo, IlceID) VALUES (245373,505)
INSERT INTO Adres (SicilNo, IlceID) VALUES (181156,506)
INSERT INTO Adres (SicilNo, IlceID) VALUES (903193,507)
INSERT INTO Adres (SicilNo, IlceID) VALUES (864975,508)
INSERT INTO Adres (SicilNo, IlceID) VALUES (864871,509)
INSERT INTO Adres (SicilNo, IlceID) VALUES (368571,510)
INSERT INTO Adres (SicilNo, IlceID) VALUES (340736,511)
INSERT INTO Adres (SicilNo, IlceID) VALUES (451295,512)
INSERT INTO Adres (SicilNo, IlceID) VALUES (724716,513)
INSERT INTO Adres (SicilNo, IlceID) VALUES (945807,514)
INSERT INTO Adres (SicilNo, IlceID) VALUES (923430,515)
INSERT INTO Adres (SicilNo, IlceID) VALUES (903063,516)
INSERT INTO Adres (SicilNo, IlceID) VALUES (122953,517)
INSERT INTO Adres (SicilNo, IlceID) VALUES (349247,518)
INSERT INTO Adres (SicilNo, IlceID) VALUES (847061,519)
INSERT INTO Adres (SicilNo, IlceID) VALUES (481696,520)
INSERT INTO Adres (SicilNo, IlceID) VALUES (582544,521)
INSERT INTO Adres (SicilNo, IlceID) VALUES (907958,522)
INSERT INTO Adres (SicilNo, IlceID) VALUES (376802,523)
INSERT INTO Adres (SicilNo, IlceID) VALUES (210775,524)
INSERT INTO Adres (SicilNo, IlceID) VALUES (795473,525)
INSERT INTO Adres (SicilNo, IlceID) VALUES (184445,526)
INSERT INTO Adres (SicilNo, IlceID) VALUES (250062,527)
INSERT INTO Adres (SicilNo, IlceID) VALUES (688257,528)
INSERT INTO Adres (SicilNo, IlceID) VALUES (945184,529)
INSERT INTO Adres (SicilNo, IlceID) VALUES (683453,530)
INSERT INTO Adres (SicilNo, IlceID) VALUES (163679,531)
INSERT INTO Adres (SicilNo, IlceID) VALUES (922508,532)
INSERT INTO Adres (SicilNo, IlceID) VALUES (727803,533)
INSERT INTO Adres (SicilNo, IlceID) VALUES (958673,534)
INSERT INTO Adres (SicilNo, IlceID) VALUES (637511,535)
INSERT INTO Adres (SicilNo, IlceID) VALUES (413535,536)
INSERT INTO Adres (SicilNo, IlceID) VALUES (861321,537)
INSERT INTO Adres (SicilNo, IlceID) VALUES (384149,538)
INSERT INTO Adres (SicilNo, IlceID) VALUES (367260,539)
INSERT INTO Adres (SicilNo, IlceID) VALUES (300500,540)
INSERT INTO Adres (SicilNo, IlceID) VALUES (639474,541)
INSERT INTO Adres (SicilNo, IlceID) VALUES (845377,542)
INSERT INTO Adres (SicilNo, IlceID) VALUES (175089,543)
INSERT INTO Adres (SicilNo, IlceID) VALUES (574856,544)
INSERT INTO Adres (SicilNo, IlceID) VALUES (555490,545)
INSERT INTO Adres (SicilNo, IlceID) VALUES (299997,546)
INSERT INTO Adres (SicilNo, IlceID) VALUES (356688,547)
INSERT INTO Adres (SicilNo, IlceID) VALUES (176483,548)
INSERT INTO Adres (SicilNo, IlceID) VALUES (911911,549)
INSERT INTO Adres (SicilNo, IlceID) VALUES (830076,550)
INSERT INTO Adres (SicilNo, IlceID) VALUES (462609,551)
INSERT INTO Adres (SicilNo, IlceID) VALUES (542329,552)
INSERT INTO Adres (SicilNo, IlceID) VALUES (843528,553)
INSERT INTO Adres (SicilNo, IlceID) VALUES (726014,554)
INSERT INTO Adres (SicilNo, IlceID) VALUES (473610,555)
INSERT INTO Adres (SicilNo, IlceID) VALUES (596147,556)
INSERT INTO Adres (SicilNo, IlceID) VALUES (485180,557)
INSERT INTO Adres (SicilNo, IlceID) VALUES (420426,558)
INSERT INTO Adres (SicilNo, IlceID) VALUES (402118,559)
INSERT INTO Adres (SicilNo, IlceID) VALUES (650893,560)
INSERT INTO Adres (SicilNo, IlceID) VALUES (474924,561)
INSERT INTO Adres (SicilNo, IlceID) VALUES (220849,562)
INSERT INTO Adres (SicilNo, IlceID) VALUES (434169,563)
INSERT INTO Adres (SicilNo, IlceID) VALUES (973575,564)
INSERT INTO Adres (SicilNo, IlceID) VALUES (611057,565)
INSERT INTO Adres (SicilNo, IlceID) VALUES (211770,566)
INSERT INTO Adres (SicilNo, IlceID) VALUES (546788,567)
INSERT INTO Adres (SicilNo, IlceID) VALUES (540070,568)
INSERT INTO Adres (SicilNo, IlceID) VALUES (154826,569)
INSERT INTO Adres (SicilNo, IlceID) VALUES (775956,570)
INSERT INTO Adres (SicilNo, IlceID) VALUES (462457,571)
INSERT INTO Adres (SicilNo, IlceID) VALUES (564292,572)
INSERT INTO Adres (SicilNo, IlceID) VALUES (534931,573)
INSERT INTO Adres (SicilNo, IlceID) VALUES (695642,574)
INSERT INTO Adres (SicilNo, IlceID) VALUES (659286,575)
INSERT INTO Adres (SicilNo, IlceID) VALUES (206178,576)
INSERT INTO Adres (SicilNo, IlceID) VALUES (366360,577)
INSERT INTO Adres (SicilNo, IlceID) VALUES (689562,578)
INSERT INTO Adres (SicilNo, IlceID) VALUES (910730,579)
INSERT INTO Adres (SicilNo, IlceID) VALUES (116872,580)
INSERT INTO Adres (SicilNo, IlceID) VALUES (474213,581)
INSERT INTO Adres (SicilNo, IlceID) VALUES (700078,582)
INSERT INTO Adres (SicilNo, IlceID) VALUES (867852,583)
INSERT INTO Adres (SicilNo, IlceID) VALUES (100121,584)
INSERT INTO Adres (SicilNo, IlceID) VALUES (111226,585)
INSERT INTO Adres (SicilNo, IlceID) VALUES (116943,586)
INSERT INTO Adres (SicilNo, IlceID) VALUES (804316,587)
INSERT INTO Adres (SicilNo, IlceID) VALUES (731938,588)
INSERT INTO Adres (SicilNo, IlceID) VALUES (935029,589)
INSERT INTO Adres (SicilNo, IlceID) VALUES (364892,590)
INSERT INTO Adres (SicilNo, IlceID) VALUES (797559,591)
INSERT INTO Adres (SicilNo, IlceID) VALUES (726647,592)
INSERT INTO Adres (SicilNo, IlceID) VALUES (442011,593)
INSERT INTO Adres (SicilNo, IlceID) VALUES (224471,594)
INSERT INTO Adres (SicilNo, IlceID) VALUES (843105,595)
INSERT INTO Adres (SicilNo, IlceID) VALUES (756290,596)
INSERT INTO Adres (SicilNo, IlceID) VALUES (377518,597)
INSERT INTO Adres (SicilNo, IlceID) VALUES (254065,598)
INSERT INTO Adres (SicilNo, IlceID) VALUES (691557,599)
INSERT INTO Adres (SicilNo, IlceID) VALUES (229009,600)
INSERT INTO Adres (SicilNo, IlceID) VALUES (207301,601)
INSERT INTO Adres (SicilNo, IlceID) VALUES (461207,602)
INSERT INTO Adres (SicilNo, IlceID) VALUES (798187,603)
INSERT INTO Adres (SicilNo, IlceID) VALUES (135756,604)
INSERT INTO Adres (SicilNo, IlceID) VALUES (952976,605)
INSERT INTO Adres (SicilNo, IlceID) VALUES (706968,606)
INSERT INTO Adres (SicilNo, IlceID) VALUES (957489,607)
INSERT INTO Adres (SicilNo, IlceID) VALUES (669592,608)
INSERT INTO Adres (SicilNo, IlceID) VALUES (508950,609)
INSERT INTO Adres (SicilNo, IlceID) VALUES (451968,610)
INSERT INTO Adres (SicilNo, IlceID) VALUES (929866,611)
INSERT INTO Adres (SicilNo, IlceID) VALUES (346389,612)
INSERT INTO Adres (SicilNo, IlceID) VALUES (630374,613)
INSERT INTO Adres (SicilNo, IlceID) VALUES (804742,614)
INSERT INTO Adres (SicilNo, IlceID) VALUES (415841,615)
INSERT INTO Adres (SicilNo, IlceID) VALUES (217122,616)
INSERT INTO Adres (SicilNo, IlceID) VALUES (542971,617)
INSERT INTO Adres (SicilNo, IlceID) VALUES (832832,618)
INSERT INTO Adres (SicilNo, IlceID) VALUES (822722,619)
INSERT INTO Adres (SicilNo, IlceID) VALUES (151738,620)
INSERT INTO Adres (SicilNo, IlceID) VALUES (848481,621)
INSERT INTO Adres (SicilNo, IlceID) VALUES (784255,622)
INSERT INTO Adres (SicilNo, IlceID) VALUES (741349,623)
INSERT INTO Adres (SicilNo, IlceID) VALUES (369973,624)
INSERT INTO Adres (SicilNo, IlceID) VALUES (951454,625)
INSERT INTO Adres (SicilNo, IlceID) VALUES (590199,626)
INSERT INTO Adres (SicilNo, IlceID) VALUES (597633,627)
INSERT INTO Adres (SicilNo, IlceID) VALUES (164288,628)
INSERT INTO Adres (SicilNo, IlceID) VALUES (928350,629)
INSERT INTO Adres (SicilNo, IlceID) VALUES (937058,630)
INSERT INTO Adres (SicilNo, IlceID) VALUES (605959,631)
INSERT INTO Adres (SicilNo, IlceID) VALUES (439879,632)
INSERT INTO Adres (SicilNo, IlceID) VALUES (284266,633)
INSERT INTO Adres (SicilNo, IlceID) VALUES (933462,634)
INSERT INTO Adres (SicilNo, IlceID) VALUES (403782,635)
INSERT INTO Adres (SicilNo, IlceID) VALUES (628585,636)
INSERT INTO Adres (SicilNo, IlceID) VALUES (540779,637)
INSERT INTO Adres (SicilNo, IlceID) VALUES (217935,638)
INSERT INTO Adres (SicilNo, IlceID) VALUES (739305,639)
INSERT INTO Adres (SicilNo, IlceID) VALUES (284481,640)
INSERT INTO Adres (SicilNo, IlceID) VALUES (763316,641)
INSERT INTO Adres (SicilNo, IlceID) VALUES (284399,642)
INSERT INTO Adres (SicilNo, IlceID) VALUES (392826,643)
INSERT INTO Adres (SicilNo, IlceID) VALUES (417022,644)
INSERT INTO Adres (SicilNo, IlceID) VALUES (607854,645)
INSERT INTO Adres (SicilNo, IlceID) VALUES (385564,646)
INSERT INTO Adres (SicilNo, IlceID) VALUES (193057,647)
INSERT INTO Adres (SicilNo, IlceID) VALUES (515509,648)
INSERT INTO Adres (SicilNo, IlceID) VALUES (357765,649)
INSERT INTO Adres (SicilNo, IlceID) VALUES (789173,650)
INSERT INTO Adres (SicilNo, IlceID) VALUES (184992,651)
INSERT INTO Adres (SicilNo, IlceID) VALUES (118078,652)
INSERT INTO Adres (SicilNo, IlceID) VALUES (133197,653)
INSERT INTO Adres (SicilNo, IlceID) VALUES (221411,654)
INSERT INTO Adres (SicilNo, IlceID) VALUES (305495,655)
INSERT INTO Adres (SicilNo, IlceID) VALUES (446380,656)
INSERT INTO Adres (SicilNo, IlceID) VALUES (754495,657)
INSERT INTO Adres (SicilNo, IlceID) VALUES (521465,658)
INSERT INTO Adres (SicilNo, IlceID) VALUES (554510,659)
INSERT INTO Adres (SicilNo, IlceID) VALUES (373987,660)
INSERT INTO Adres (SicilNo, IlceID) VALUES (115919,661)
INSERT INTO Adres (SicilNo, IlceID) VALUES (583873,662)
INSERT INTO Adres (SicilNo, IlceID) VALUES (537307,663)
INSERT INTO Adres (SicilNo, IlceID) VALUES (878308,664)
INSERT INTO Adres (SicilNo, IlceID) VALUES (175895,665)
INSERT INTO Adres (SicilNo, IlceID) VALUES (847156,666)
INSERT INTO Adres (SicilNo, IlceID) VALUES (321729,667)
INSERT INTO Adres (SicilNo, IlceID) VALUES (258774,668)
INSERT INTO Adres (SicilNo, IlceID) VALUES (379440,669)
INSERT INTO Adres (SicilNo, IlceID) VALUES (538691,670)
INSERT INTO Adres (SicilNo, IlceID) VALUES (981126,671)
INSERT INTO Adres (SicilNo, IlceID) VALUES (130529,672)
INSERT INTO Adres (SicilNo, IlceID) VALUES (754525,673)
INSERT INTO Adres (SicilNo, IlceID) VALUES (703758,674)
INSERT INTO Adres (SicilNo, IlceID) VALUES (581249,675)
INSERT INTO Adres (SicilNo, IlceID) VALUES (384498,676)
INSERT INTO Adres (SicilNo, IlceID) VALUES (618722,677)
INSERT INTO Adres (SicilNo, IlceID) VALUES (972055,678)
INSERT INTO Adres (SicilNo, IlceID) VALUES (777332,679)
INSERT INTO Adres (SicilNo, IlceID) VALUES (958251,680)
INSERT INTO Adres (SicilNo, IlceID) VALUES (920161,681)
INSERT INTO Adres (SicilNo, IlceID) VALUES (576800,682)
INSERT INTO Adres (SicilNo, IlceID) VALUES (328423,683)
INSERT INTO Adres (SicilNo, IlceID) VALUES (511034,684)
INSERT INTO Adres (SicilNo, IlceID) VALUES (116124,685)
INSERT INTO Adres (SicilNo, IlceID) VALUES (946102,686)
INSERT INTO Adres (SicilNo, IlceID) VALUES (599767,687)
INSERT INTO Adres (SicilNo, IlceID) VALUES (328080,688)
INSERT INTO Adres (SicilNo, IlceID) VALUES (828402,689)
INSERT INTO Adres (SicilNo, IlceID) VALUES (591308,690)
INSERT INTO Adres (SicilNo, IlceID) VALUES (776721,691)
INSERT INTO Adres (SicilNo, IlceID) VALUES (301870,692)
INSERT INTO Adres (SicilNo, IlceID) VALUES (903487,693)
INSERT INTO Adres (SicilNo, IlceID) VALUES (729177,694)
INSERT INTO Adres (SicilNo, IlceID) VALUES (888841,695)
INSERT INTO Adres (SicilNo, IlceID) VALUES (693558,696)
INSERT INTO Adres (SicilNo, IlceID) VALUES (879079,697)
INSERT INTO Adres (SicilNo, IlceID) VALUES (124768,698)
INSERT INTO Adres (SicilNo, IlceID) VALUES (738359,699)
INSERT INTO Adres (SicilNo, IlceID) VALUES (522109,700)
INSERT INTO Adres (SicilNo, IlceID) VALUES (986174,701)
INSERT INTO Adres (SicilNo, IlceID) VALUES (820731,702)
INSERT INTO Adres (SicilNo, IlceID) VALUES (887442,703)
INSERT INTO Adres (SicilNo, IlceID) VALUES (923460,704)
INSERT INTO Adres (SicilNo, IlceID) VALUES (426153,705)
INSERT INTO Adres (SicilNo, IlceID) VALUES (871987,706)
INSERT INTO Adres (SicilNo, IlceID) VALUES (890316,707)
INSERT INTO Adres (SicilNo, IlceID) VALUES (983049,708)
INSERT INTO Adres (SicilNo, IlceID) VALUES (292054,709)
INSERT INTO Adres (SicilNo, IlceID) VALUES (780445,710)
INSERT INTO Adres (SicilNo, IlceID) VALUES (860202,711)
INSERT INTO Adres (SicilNo, IlceID) VALUES (224183,712)
INSERT INTO Adres (SicilNo, IlceID) VALUES (603432,713)
INSERT INTO Adres (SicilNo, IlceID) VALUES (304669,714)
INSERT INTO Adres (SicilNo, IlceID) VALUES (337633,715)
INSERT INTO Adres (SicilNo, IlceID) VALUES (507171,716)
INSERT INTO Adres (SicilNo, IlceID) VALUES (434516,717)
INSERT INTO Adres (SicilNo, IlceID) VALUES (230409,718)
INSERT INTO Adres (SicilNo, IlceID) VALUES (849021,719)
INSERT INTO Adres (SicilNo, IlceID) VALUES (350930,720)
INSERT INTO Adres (SicilNo, IlceID) VALUES (465847,721)
INSERT INTO Adres (SicilNo, IlceID) VALUES (653726,722)
INSERT INTO Adres (SicilNo, IlceID) VALUES (541729,723)
INSERT INTO Adres (SicilNo, IlceID) VALUES (444942,724)
INSERT INTO Adres (SicilNo, IlceID) VALUES (476838,725)
INSERT INTO Adres (SicilNo, IlceID) VALUES (683266,726)
INSERT INTO Adres (SicilNo, IlceID) VALUES (617226,727)
INSERT INTO Adres (SicilNo, IlceID) VALUES (416154,728)
INSERT INTO Adres (SicilNo, IlceID) VALUES (939979,729)
INSERT INTO Adres (SicilNo, IlceID) VALUES (658893,730)
INSERT INTO Adres (SicilNo, IlceID) VALUES (962653,731)
INSERT INTO Adres (SicilNo, IlceID) VALUES (348642,732)
INSERT INTO Adres (SicilNo, IlceID) VALUES (501740,733)
INSERT INTO Adres (SicilNo, IlceID) VALUES (987077,734)
INSERT INTO Adres (SicilNo, IlceID) VALUES (442739,735)
INSERT INTO Adres (SicilNo, IlceID) VALUES (443538,736)
INSERT INTO Adres (SicilNo, IlceID) VALUES (819505,737)
INSERT INTO Adres (SicilNo, IlceID) VALUES (787122,738)
INSERT INTO Adres (SicilNo, IlceID) VALUES (698064,739)
INSERT INTO Adres (SicilNo, IlceID) VALUES (247529,740)
INSERT INTO Adres (SicilNo, IlceID) VALUES (725743,741)
INSERT INTO Adres (SicilNo, IlceID) VALUES (477245,742)
INSERT INTO Adres (SicilNo, IlceID) VALUES (880151,743)
INSERT INTO Adres (SicilNo, IlceID) VALUES (195201,744)
INSERT INTO Adres (SicilNo, IlceID) VALUES (576126,745)
INSERT INTO Adres (SicilNo, IlceID) VALUES (220572,746)
INSERT INTO Adres (SicilNo, IlceID) VALUES (105614,747)
INSERT INTO Adres (SicilNo, IlceID) VALUES (574180,748)
INSERT INTO Adres (SicilNo, IlceID) VALUES (600393,749)
INSERT INTO Adres (SicilNo, IlceID) VALUES (992185,750)
INSERT INTO Adres (SicilNo, IlceID) VALUES (143365,751)
INSERT INTO Adres (SicilNo, IlceID) VALUES (422430,752)
INSERT INTO Adres (SicilNo, IlceID) VALUES (902404,753)
INSERT INTO Adres (SicilNo, IlceID) VALUES (302562,754)
INSERT INTO Adres (SicilNo, IlceID) VALUES (114998,755)
INSERT INTO Adres (SicilNo, IlceID) VALUES (575770,756)
INSERT INTO Adres (SicilNo, IlceID) VALUES (599350,757)
INSERT INTO Adres (SicilNo, IlceID) VALUES (465287,758)
INSERT INTO Adres (SicilNo, IlceID) VALUES (317330,759)
INSERT INTO Adres (SicilNo, IlceID) VALUES (478552,760)
INSERT INTO Adres (SicilNo, IlceID) VALUES (426861,761)
INSERT INTO Adres (SicilNo, IlceID) VALUES (477641,762)
INSERT INTO Adres (SicilNo, IlceID) VALUES (766615,763)
INSERT INTO Adres (SicilNo, IlceID) VALUES (425056,764)
INSERT INTO Adres (SicilNo, IlceID) VALUES (129799,765)
INSERT INTO Adres (SicilNo, IlceID) VALUES (959901,766)
INSERT INTO Adres (SicilNo, IlceID) VALUES (414031,767)
INSERT INTO Adres (SicilNo, IlceID) VALUES (577057,768)
INSERT INTO Adres (SicilNo, IlceID) VALUES (749812,769)
INSERT INTO Adres (SicilNo, IlceID) VALUES (723288,770)
INSERT INTO Adres (SicilNo, IlceID) VALUES (299958,771)
INSERT INTO Adres (SicilNo, IlceID) VALUES (453334,772)
INSERT INTO Adres (SicilNo, IlceID) VALUES (991243,773)
INSERT INTO Adres (SicilNo, IlceID) VALUES (426989,774)
INSERT INTO Adres (SicilNo, IlceID) VALUES (920153,775)
INSERT INTO Adres (SicilNo, IlceID) VALUES (703017,776)
INSERT INTO Adres (SicilNo, IlceID) VALUES (510895,777)
INSERT INTO Adres (SicilNo, IlceID) VALUES (509163,778)
INSERT INTO Adres (SicilNo, IlceID) VALUES (427722,779)
INSERT INTO Adres (SicilNo, IlceID) VALUES (323495,780)
INSERT INTO Adres (SicilNo, IlceID) VALUES (357145,781)
INSERT INTO Adres (SicilNo, IlceID) VALUES (504673,782)
INSERT INTO Adres (SicilNo, IlceID) VALUES (206284,783)
INSERT INTO Adres (SicilNo, IlceID) VALUES (837265,784)
INSERT INTO Adres (SicilNo, IlceID) VALUES (153420,785)
INSERT INTO Adres (SicilNo, IlceID) VALUES (651643,786)
INSERT INTO Adres (SicilNo, IlceID) VALUES (412712,787)
INSERT INTO Adres (SicilNo, IlceID) VALUES (573480,788)
INSERT INTO Adres (SicilNo, IlceID) VALUES (426530,789)
INSERT INTO Adres (SicilNo, IlceID) VALUES (351939,790)
INSERT INTO Adres (SicilNo, IlceID) VALUES (377440,791)
INSERT INTO Adres (SicilNo, IlceID) VALUES (965934,792)
INSERT INTO Adres (SicilNo, IlceID) VALUES (643309,793)
INSERT INTO Adres (SicilNo, IlceID) VALUES (623732,794)
INSERT INTO Adres (SicilNo, IlceID) VALUES (152201,795)
INSERT INTO Adres (SicilNo, IlceID) VALUES (753616,796)
INSERT INTO Adres (SicilNo, IlceID) VALUES (624225,797)
INSERT INTO Adres (SicilNo, IlceID) VALUES (273344,798)
INSERT INTO Adres (SicilNo, IlceID) VALUES (530826,799)
INSERT INTO Adres (SicilNo, IlceID) VALUES (394503,800)
INSERT INTO Adres (SicilNo, IlceID) VALUES (699713,801)
INSERT INTO Adres (SicilNo, IlceID) VALUES (178557,802)
INSERT INTO Adres (SicilNo, IlceID) VALUES (326487,803)
INSERT INTO Adres (SicilNo, IlceID) VALUES (784666,804)
INSERT INTO Adres (SicilNo, IlceID) VALUES (996822,805)
INSERT INTO Adres (SicilNo, IlceID) VALUES (602505,806)
INSERT INTO Adres (SicilNo, IlceID) VALUES (704399,807)
INSERT INTO Adres (SicilNo, IlceID) VALUES (443031,808)
INSERT INTO Adres (SicilNo, IlceID) VALUES (270227,809)
INSERT INTO Adres (SicilNo, IlceID) VALUES (742288,810)
INSERT INTO Adres (SicilNo, IlceID) VALUES (877407,811)
INSERT INTO Adres (SicilNo, IlceID) VALUES (883836,812)
INSERT INTO Adres (SicilNo, IlceID) VALUES (482602,813)
INSERT INTO Adres (SicilNo, IlceID) VALUES (501723,814)
INSERT INTO Adres (SicilNo, IlceID) VALUES (826087,815)
INSERT INTO Adres (SicilNo, IlceID) VALUES (969106,816)
INSERT INTO Adres (SicilNo, IlceID) VALUES (636969,817)
INSERT INTO Adres (SicilNo, IlceID) VALUES (389571,818)
INSERT INTO Adres (SicilNo, IlceID) VALUES (853375,819)
INSERT INTO Adres (SicilNo, IlceID) VALUES (885343,820)
INSERT INTO Adres (SicilNo, IlceID) VALUES (274817,821)
INSERT INTO Adres (SicilNo, IlceID) VALUES (189315,822)
INSERT INTO Adres (SicilNo, IlceID) VALUES (864331,823)
INSERT INTO Adres (SicilNo, IlceID) VALUES (702136,824)
INSERT INTO Adres (SicilNo, IlceID) VALUES (147659,825)
INSERT INTO Adres (SicilNo, IlceID) VALUES (384205,826)
INSERT INTO Adres (SicilNo, IlceID) VALUES (846035,827)
INSERT INTO Adres (SicilNo, IlceID) VALUES (210363,828)
INSERT INTO Adres (SicilNo, IlceID) VALUES (967470,829)
INSERT INTO Adres (SicilNo, IlceID) VALUES (276366,830)
INSERT INTO Adres (SicilNo, IlceID) VALUES (563864,831)
INSERT INTO Adres (SicilNo, IlceID) VALUES (312655,832)
INSERT INTO Adres (SicilNo, IlceID) VALUES (400166,833)
INSERT INTO Adres (SicilNo, IlceID) VALUES (878611,834)
INSERT INTO Adres (SicilNo, IlceID) VALUES (837282,835)
INSERT INTO Adres (SicilNo, IlceID) VALUES (864050,836)
INSERT INTO Adres (SicilNo, IlceID) VALUES (912022,837)
INSERT INTO Adres (SicilNo, IlceID) VALUES (167114,838)
INSERT INTO Adres (SicilNo, IlceID) VALUES (506165,839)
INSERT INTO Adres (SicilNo, IlceID) VALUES (562734,840)
INSERT INTO Adres (SicilNo, IlceID) VALUES (362794,841)
INSERT INTO Adres (SicilNo, IlceID) VALUES (778268,842)
INSERT INTO Adres (SicilNo, IlceID) VALUES (608506,843)
INSERT INTO Adres (SicilNo, IlceID) VALUES (398309,844)
INSERT INTO Adres (SicilNo, IlceID) VALUES (555614,845)
INSERT INTO Adres (SicilNo, IlceID) VALUES (674802,846)
INSERT INTO Adres (SicilNo, IlceID) VALUES (438705,847)
INSERT INTO Adres (SicilNo, IlceID) VALUES (910236,848)
INSERT INTO Adres (SicilNo, IlceID) VALUES (923454,849)
INSERT INTO Adres (SicilNo, IlceID) VALUES (405479,850)
INSERT INTO Adres (SicilNo, IlceID) VALUES (971456,851)
INSERT INTO Adres (SicilNo, IlceID) VALUES (559414,852)
INSERT INTO Adres (SicilNo, IlceID) VALUES (256259,853)
INSERT INTO Adres (SicilNo, IlceID) VALUES (714469,854)
INSERT INTO Adres (SicilNo, IlceID) VALUES (899894,855)
INSERT INTO Adres (SicilNo, IlceID) VALUES (410514,856)
INSERT INTO Adres (SicilNo, IlceID) VALUES (508823,857)
INSERT INTO Adres (SicilNo, IlceID) VALUES (488742,858)
INSERT INTO Adres (SicilNo, IlceID) VALUES (209421,859)
INSERT INTO Adres (SicilNo, IlceID) VALUES (643423,860)
INSERT INTO Adres (SicilNo, IlceID) VALUES (339701,861)
INSERT INTO Adres (SicilNo, IlceID) VALUES (561038,862)
INSERT INTO Adres (SicilNo, IlceID) VALUES (559697,863)
INSERT INTO Adres (SicilNo, IlceID) VALUES (592450,864)
INSERT INTO Adres (SicilNo, IlceID) VALUES (104092,865)
INSERT INTO Adres (SicilNo, IlceID) VALUES (798708,866)
INSERT INTO Adres (SicilNo, IlceID) VALUES (832357,867)
INSERT INTO Adres (SicilNo, IlceID) VALUES (214684,868)
INSERT INTO Adres (SicilNo, IlceID) VALUES (860889,869)
INSERT INTO Adres (SicilNo, IlceID) VALUES (213064,870)
INSERT INTO Adres (SicilNo, IlceID) VALUES (377331,871)
INSERT INTO Adres (SicilNo, IlceID) VALUES (248963,872)
INSERT INTO Adres (SicilNo, IlceID) VALUES (646225,873)
INSERT INTO Adres (SicilNo, IlceID) VALUES (428129,874)
INSERT INTO Adres (SicilNo, IlceID) VALUES (587421,875)
INSERT INTO Adres (SicilNo, IlceID) VALUES (398327,876)
INSERT INTO Adres (SicilNo, IlceID) VALUES (639804,877)
INSERT INTO Adres (SicilNo, IlceID) VALUES (530677,878)
INSERT INTO Adres (SicilNo, IlceID) VALUES (583733,879)
INSERT INTO Adres (SicilNo, IlceID) VALUES (450139,880)
INSERT INTO Adres (SicilNo, IlceID) VALUES (840674,881)
INSERT INTO Adres (SicilNo, IlceID) VALUES (718212,882)
INSERT INTO Adres (SicilNo, IlceID) VALUES (153455,883)
INSERT INTO Adres (SicilNo, IlceID) VALUES (221613,884)
INSERT INTO Adres (SicilNo, IlceID) VALUES (855079,885)
INSERT INTO Adres (SicilNo, IlceID) VALUES (197741,886)
INSERT INTO Adres (SicilNo, IlceID) VALUES (187687,887)
INSERT INTO Adres (SicilNo, IlceID) VALUES (503163,888)
INSERT INTO Adres (SicilNo, IlceID) VALUES (594864,889)
INSERT INTO Adres (SicilNo, IlceID) VALUES (398844,890)
INSERT INTO Adres (SicilNo, IlceID) VALUES (392717,891)
INSERT INTO Adres (SicilNo, IlceID) VALUES (620854,892)
INSERT INTO Adres (SicilNo, IlceID) VALUES (455623,893)
INSERT INTO Adres (SicilNo, IlceID) VALUES (582924,894)
INSERT INTO Adres (SicilNo, IlceID) VALUES (646250,895)
INSERT INTO Adres (SicilNo, IlceID) VALUES (471663,896)
INSERT INTO Adres (SicilNo, IlceID) VALUES (662599,897)
INSERT INTO Adres (SicilNo, IlceID) VALUES (333877,898)
INSERT INTO Adres (SicilNo, IlceID) VALUES (529692,899)
INSERT INTO Adres (SicilNo, IlceID) VALUES (161320,900)
INSERT INTO Adres (SicilNo, IlceID) VALUES (150076,901)
INSERT INTO Adres (SicilNo, IlceID) VALUES (353444,902)
INSERT INTO Adres (SicilNo, IlceID) VALUES (714538,903)
INSERT INTO Adres (SicilNo, IlceID) VALUES (560731,904)
INSERT INTO Adres (SicilNo, IlceID) VALUES (573662,905)
INSERT INTO Adres (SicilNo, IlceID) VALUES (154195,906)
INSERT INTO Adres (SicilNo, IlceID) VALUES (870855,907)
INSERT INTO Adres (SicilNo, IlceID) VALUES (186402,908)
INSERT INTO Adres (SicilNo, IlceID) VALUES (576302,909)
INSERT INTO Adres (SicilNo, IlceID) VALUES (873915,910)
INSERT INTO Adres (SicilNo, IlceID) VALUES (943861,911)
INSERT INTO Adres (SicilNo, IlceID) VALUES (809800,912)
INSERT INTO Adres (SicilNo, IlceID) VALUES (599170,913)
INSERT INTO Adres (SicilNo, IlceID) VALUES (612670,914)
INSERT INTO Adres (SicilNo, IlceID) VALUES (502895,915)
INSERT INTO Adres (SicilNo, IlceID) VALUES (618215,916)
INSERT INTO Adres (SicilNo, IlceID) VALUES (605271,917)
INSERT INTO Adres (SicilNo, IlceID) VALUES (834016,918)
INSERT INTO Adres (SicilNo, IlceID) VALUES (762429,919)
INSERT INTO Adres (SicilNo, IlceID) VALUES (991739,920)
INSERT INTO Adres (SicilNo, IlceID) VALUES (888133,921)
INSERT INTO Adres (SicilNo, IlceID) VALUES (818670,922)
INSERT INTO Adres (SicilNo, IlceID) VALUES (221582,923)
INSERT INTO Adres (SicilNo, IlceID) VALUES (217920,924)
INSERT INTO Adres (SicilNo, IlceID) VALUES (698922,925)
INSERT INTO Adres (SicilNo, IlceID) VALUES (418439,926)
INSERT INTO Adres (SicilNo, IlceID) VALUES (841657,927)
INSERT INTO Adres (SicilNo, IlceID) VALUES (801031,928)
INSERT INTO Adres (SicilNo, IlceID) VALUES (545016,929)
INSERT INTO Adres (SicilNo, IlceID) VALUES (129029,930)
INSERT INTO Adres (SicilNo, IlceID) VALUES (724264,931)
INSERT INTO Adres (SicilNo, IlceID) VALUES (851317,932)
INSERT INTO Adres (SicilNo, IlceID) VALUES (214408,933)
INSERT INTO Adres (SicilNo, IlceID) VALUES (487544,934)
INSERT INTO Adres (SicilNo, IlceID) VALUES (489410,935)
INSERT INTO Adres (SicilNo, IlceID) VALUES (363850,936)
INSERT INTO Adres (SicilNo, IlceID) VALUES (590931,937)
INSERT INTO Adres (SicilNo, IlceID) VALUES (459442,938)
INSERT INTO Adres (SicilNo, IlceID) VALUES (688708,939)
INSERT INTO Adres (SicilNo, IlceID) VALUES (928575,940)
INSERT INTO Adres (SicilNo, IlceID) VALUES (602235,941)
INSERT INTO Adres (SicilNo, IlceID) VALUES (263036,942)
INSERT INTO Adres (SicilNo, IlceID) VALUES (804328,943)
INSERT INTO Adres (SicilNo, IlceID) VALUES (706413,944)
INSERT INTO Adres (SicilNo, IlceID) VALUES (341122,945)
INSERT INTO Adres (SicilNo, IlceID) VALUES (618057,946)
INSERT INTO Adres (SicilNo, IlceID) VALUES (910117,947)
INSERT INTO Adres (SicilNo, IlceID) VALUES (807509,948)
INSERT INTO Adres (SicilNo, IlceID) VALUES (719179,949)
INSERT INTO Adres (SicilNo, IlceID) VALUES (206455,950)
INSERT INTO Adres (SicilNo, IlceID) VALUES (607766,951)
INSERT INTO Adres (SicilNo, IlceID) VALUES (159224,952)
INSERT INTO Adres (SicilNo, IlceID) VALUES (694505,953)
INSERT INTO Adres (SicilNo, IlceID) VALUES (954287,954)
INSERT INTO Adres (SicilNo, IlceID) VALUES (593116,955)
INSERT INTO Adres (SicilNo, IlceID) VALUES (870871,956)
INSERT INTO Adres (SicilNo, IlceID) VALUES (611321,957)
INSERT INTO Adres (SicilNo, IlceID) VALUES (863474,958)
INSERT INTO Adres (SicilNo, IlceID) VALUES (205913,959)
INSERT INTO Adres (SicilNo, IlceID) VALUES (353328,960)
INSERT INTO Adres (SicilNo, IlceID) VALUES (664750,961)
INSERT INTO Adres (SicilNo, IlceID) VALUES (921661,962)
INSERT INTO Adres (SicilNo, IlceID) VALUES (276422,963)
INSERT INTO Adres (SicilNo, IlceID) VALUES (276505,964)
INSERT INTO Adres (SicilNo, IlceID) VALUES (270850,965)
INSERT INTO Adres (SicilNo, IlceID) VALUES (268191,966)
INSERT INTO Adres (SicilNo, IlceID) VALUES (336357,967)
INSERT INTO Adres (SicilNo, IlceID) VALUES (756226,968)
INSERT INTO Adres (SicilNo, IlceID) VALUES (557615,969)
INSERT INTO Adres (SicilNo, IlceID) VALUES (898830,970)
INSERT INTO Adres (SicilNo, IlceID) VALUES (184948,971)
INSERT INTO Adres (SicilNo, IlceID) VALUES (910708,972)
INSERT INTO Adres (SicilNo, IlceID) VALUES (184579,973)
INSERT INTO Adres (SicilNo, IlceID) VALUES (552902,954)
INSERT INTO Adres (SicilNo, IlceID) VALUES (317608,955)
INSERT INTO Adres (SicilNo, IlceID) VALUES (579043,956)
INSERT INTO Adres (SicilNo, IlceID) VALUES (389488,957)
INSERT INTO Adres (SicilNo, IlceID) VALUES (360433,958)
INSERT INTO Adres (SicilNo, IlceID) VALUES (231571,959)
INSERT INTO Adres (SicilNo, IlceID) VALUES (814558,960)
INSERT INTO Adres (SicilNo, IlceID) VALUES (367990,961)
INSERT INTO Adres (SicilNo, IlceID) VALUES (194284,962)
INSERT INTO Adres (SicilNo, IlceID) VALUES (470828,963)
INSERT INTO Adres (SicilNo, IlceID) VALUES (116836,964)
INSERT INTO Adres (SicilNo, IlceID) VALUES (269303,965)
INSERT INTO Adres (SicilNo, IlceID) VALUES (542907,966)
INSERT INTO Adres (SicilNo, IlceID) VALUES (294078,967)
INSERT INTO Adres (SicilNo, IlceID) VALUES (793131,968)
INSERT INTO Adres (SicilNo, IlceID) VALUES (116581,969)
INSERT INTO Adres (SicilNo, IlceID) VALUES (136783,970)
INSERT INTO Adres (SicilNo, IlceID) VALUES (586338,971)
INSERT INTO Adres (SicilNo, IlceID) VALUES (984276,972)
INSERT INTO Adres (SicilNo, IlceID) VALUES (782934,973)
INSERT INTO Adres (SicilNo, IlceID) VALUES (465204,967)
INSERT INTO Adres (SicilNo, IlceID) VALUES (679125,968)
INSERT INTO Adres (SicilNo, IlceID) VALUES (169852,969)
INSERT INTO Adres (SicilNo, IlceID) VALUES (506541,970)
INSERT INTO Adres (SicilNo, IlceID) VALUES (180398,971)
INSERT INTO Adres (SicilNo, IlceID) VALUES (174337,972)
INSERT INTO Adres (SicilNo, IlceID) VALUES (764315,973)
