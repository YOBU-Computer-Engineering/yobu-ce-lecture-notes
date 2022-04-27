	create table Personel(
		personelNo int identity(1,1) not null,
		adi varchar(25) not null,
		soyadi varchar(45) not null,
		personelTipi char(1) not null,

		CONSTRAINT pk_personel PRIMARY KEY(personelNo)
	);

	GO 

	create table Danisman(
		personelNo int,
		sirket varchar(100),
		CONSTRAINT fk_danisman_personel FOREIGN KEY (personelNo) REFERENCES Personel(personelNo)
	);

	GO

	create table SatisTemsilcisi(
		personelNo int,
		bolge varchar(100),
		CONSTRAINT fk_satisTemsilcisi_personel FOREIGN KEY (personelNo) REFERENCES Personel(personelNo)
	);

	GO

	ALTER TABLE Personel
		ADD tc varchar(11) not null

	ALTER TABLE Personel
		ADD telefon nvarchar(12) not null

	ALTER TABLE Personel
		ADD adres nvarchar(500)

	GO

	CREATE table Bolge(
		bolgeId int identity(1,1),
		bolgeAd nvarchar(30),
		CONSTRAINT pk_bolge PRIMARY KEY (bolgeId)
	);

	ALTER TABLE Bolge
	ADD personelNo INT FOREIGN KEY (personelNo) REFERENCES Personel(personelNo)