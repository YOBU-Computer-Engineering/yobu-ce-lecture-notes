--Bolge_ID`si 5 olan kaydı getiriniz
 SELECT * FROM Bolge WHERE Bolge_ID = 5

--Sicil numarası 984276 olan personelin ad, soyad ve Tc bilgisini getiriniz. 
SELECT Tc, Ad, Soyad from Personel WHERE SicilNo = (SELECT SicilNo from Danisman WHERE SicilNo = 984276)

--veritabanında toplam kaç adet bölge varsa, bölge id`lerini tersten sıralayan sorguyu yazınız
SELECT BolgeId from SatisTemsilcisi group by BolgeId having BolgeID > 4 order by BolgeID desc

--Personel tipine göre verilen maaşlarının ortalamasının 5000den büyük olan kayıtları alfabetik sırayla getiren sorguyu yazınız
SELECT Ad, sum(Maas) from PersonelTip group by Ad having avg(maas)>5000  

--eğer personel tipi 3 olan herhangi kayıt varsa, bu personel tipine ait kayıtlardan isimleri ve soyisimleri benzersiz olan personelleri getiriniz
IF EXISTS(SELECT 1 from personel WHERE PersonelTipi = 3)
	BEGIN
		SELECT distinct Ad from personel WHERE PersonelTipi=3
	END

--ilçe tablosunda GEBZE, KAHTA, CİDE İllerine ait IID(İl id)`lerini getiriniz.
SELECT * from Ilce WHERE Ad IN('GEBZE', 'KAHTA', 'CİDE')
---------------------

--veritabanına Cabbar Cabbar ad ve soyadında, 123456 sicil numarasında bir kullanıcı ekleyiniz ve personel tipini 4 olarak belirleyiniz.
insert into Personel values(123456, 45112233444, 'Cabbar', 'Cabbar', 4, 123123123123, 1)
SELECT * from personel WHERE Tc = 45112233444

--nvarchar max veritüründe bir değişken tanımlayınız. adı Cabbar olan çalışanın adını ad değişkenine atadıktan sonra, bu değişkeni ekrana yazdırınız.
declare @ad nvarchar(max);
SELECT @ad = Ad from Personel WHERE Ad = 'Cavit'
print @ad

--Eğer 123456 sicil numaralı bir kayıt varsa, Cabbar isimli kullanıcının primini %100 arttırınız
IF EXISTS (SELECT 1 FROM Personel WHERE SicilNo = 123456)
	BEGIN
		UPDATE Personel SET prim=2 WHERE SicilNo = 123456
	END

--Cabbar bey, şirketimizin değerli bir çalışanı olduğunu kanıtlamıştır. Cabbar beyin personel tipini 1`e, genel müdüre getiriniz. Sicil no kullanınız(123456)
UPDATE Personel SET PersonelTipi = 1 WHERE SicilNo = 123456
--Cabbar bey, şirkete gelmeden önce %15`lik prim aldığından diğer genel müdürlerden fazla maaş almaktadır. bu yüzden Cabbar beyin primini 1 olarak tekrar ayarlanması gerekmektedir.
--SQL EXEC Komutunun içinde bir değişken çağırarak Cabbar beyin primini tekrardan 1 yapınız.
DECLARE @SQL_Query1 nvarchar(max) = 'UPDATE Personel SET Prim = 1 WHERE SicilNo = 123456';
EXEC(@SQL_Query1);

--Veritabanında varolan Adres Tablosuna Adres2 adında boş geçilebilir bir alan ekleyen SQL sorgusunu yazınız. Daha sonrasında 
--eklediğiniz alanı kaldıran SQL sorgusunu yazınız
ALTER TABLE Adres
	ADD Adres3 nvarchar(max)
ALTER TABLE Adres
	DROP COLUMN Adres3

--Danisman tablosundan ilk 5 kaydı getiriniz
SELECT TOP 5 * from Danisman

----Danisman tablosunan şirket idleri en küçük olan 5 kaydı TOP ve Order By komutu kullanarak getiriniz. 
SELECT TOP 5 * from Danisman order by SirketID asc

--Şirketteki yöneticilein, veritabanına kaydolduğu idlerin küçük olmasıyla primlerindeki artış arasındaki korelasyon arasındaki ilişki olup olmadığı merak edilmektedir.
--Personel Tipi 1 olan kayıtları Personel Tipi ve Personel_ID sütunlarını kullanarak order by komutu ile sıralayınız.
SELECT * from personel WHERE PersonelTipi = 1 order by PersonelTipi, Per_ID 

--Bolge ID`si 4`ten büyük bölgelerde kaç adet satiş temsilcisi olduğunu gösteren komutu yazınız
SELECT BolgeID ,COUNT(*) from SatisTemsilcisi GROUP BY BolgeID HAVING BolgeID > 4

--Hangi şirkette kaç adet çalışan olduğunu gösteren sql sorgusunu yazınıSELECT SirketID, COUNT(SirketID) FROM Danisman GROUP BY SirketID 

