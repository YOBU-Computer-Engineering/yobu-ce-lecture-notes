Hazırlayan: Engin Karataş
No: 16008118040

AŞAĞIDAKİ VERİTABANI DİYAGRAMLARINA GÖRE 17 ADET SORUYU CEVAPLAYINIZ 
Aşağıda sorular yeşil, cevaplar ise sql syntax highlighting şeklinde belirtilmiştir. Soruların başında büyük harfle kırmızı renk ile yazılan ifadeler, sorunun hangi konuya ait olduğunu gösterir.

SELECT
1.	Bolge_ID`si 5 olan kaydı getiriniz
SELECT * FROM Bolge WHERE Bolge_ID = 5

İÇ İÇE SELECT
2.	Sicil numarası 984276 olan personelin ad, soyad ve Tc bilgisini getiriniz.
SELECT Tc, Ad, Soyad FROM Personel WHERE SicilNo = (SELECT SicilNo FROM Danisman WHERE SicilNo = 984276)

GROUP BY, HAVİNG, ORDER BY,
3.	Veritabanında toplam kaç adet bölge varsa, bölge id`lerini tersten sıralayan sorguyu yazınız.
SELECT BolgeId FROM SatisTemsilcisi group by BolgeId having BolgeID > 4 ORDER BY BolgeID desc

GROUP BY, HAVİNG, ORDER BY, SUM, AVG
4.	Personel tipine göre verilen maaşlarının ortalamasının 5000den büyük olan kayıtları alfabetik sırayla getiren sorguyu yazınız.
SELECT Ad, sum(Maas) FROM PersonelTip group by Ad having avg(maas)>5000


EXISTS, DISTINCT
5.	Eğer personel tipi 3 olan herhangi kayıt varsa, bu personel tipine ait kayıtlardan isimleri ve soyisimleri benzersiz olan personelleri getiriniz.
IF EXISTS(SELECT 1 FROM personel WHERE PersonelTipi = 3)
BEGIN
SELECT distinct Ad FROM personel WHERE PersonelTipi=3
END

IN
6.	İlçe tablosunda GEBZE, KAHTA, CİDE İllerine ait IID(İl id)`lerini getiriniz.
SELECT * FROM Ilce WHERE Ad IN('GEBZE', 'KAHTA', 'CİDE')

GROUP BY, COUNT
7.	Hangi bölgede kaç adet satiş temsilcisi olduğunu gösteren komutu yazınız.
SELECT BolgeID ,COUNT(*) FROM SatisTemsilcisi GROUP BY BolgeID

GROUP BY, COUNT, HAVING
8.	Bolge ID`si 4`ten büyük bölgelerde kaç adet satiş temsilcisi olduğunu gösteren komutu yazınız.
SELECT SirketID, COUNT(SirketID) FROM Danisman GROUP BY SirketID

KOŞULLU INSERT
9.	Veritabanına Cabbar Cabbar ad ve soyadında, 123456 sicil numarasında bir kullanıcı ekleyiniz ve personel tipini 4 olarak belirleyiniz.
insert into Personel values(123456, 45112233444, 'Cabbar', 'Cabbar', 4, 123123123123, 1)
SELECT * FROM personel WHERE Tc = 45112233444

DEĞİŞKEN TANIMI, PRINT, SELECT ILE DEĞIŞKENE DEĞER ATAMA
10.	nvarchar max veritüründe bir değişken tanımlayınız. adı Cabbar olan çalışanın adını ad değişkenine atadıktan sonra, bu değişkeni ekrana yazdırınız.
declare @ad nvarchar(max);
SELECT @ad = Ad FROM Personel WHERE Ad = 'Cavit'
print @ad

UPDATE, EXISTS
11.	Eğer 123456 sicil numaralı bir kayıt varsa, Cabbar isimli kullanıcının primini %100 arttırınız.
IF EXISTS (SELECT 1 FROM Personel WHERE SicilNo = 123456)
BEGIN
UPDATE Personel SET prim=2 WHERE SicilNo = 123456
END

UPDATE, WHERE
12.	Cabbar bey, şirketimizin değerli bir çalışanı olduğunu kanıtlamıştır. Cabbar beyin personel tipini 1`e, genel müdüre getiriniz. Sicil no kullanınız(123456)
UPDATE Personel SET PersonelTipi = 1 WHERE SicilNo = 123456




EXEC, DECLARE
13.	Cabbar bey, şirkete gelmeden önce %15`lik prim aldığından diğer genel müdürlerden fazla maaş almaktadır. bu yüzden Cabbar beyin primini 1 olarak tekrar ayarlanması gerekmektedir. SQL EXEC komutunun içinde bir değişken çağırarak Cabbar beyin primini tekrardan 1 yapınız.
DECLARE @SQL_Query1 nvarchar(max) = 'UPDATE Personel SET Prim = 1 WHERE SicilNo = 123456';
EXEC(@SQL_Query1);

ALTER TABLE, ADD, DROP COLUMN
14.	Veritabanında varolan Adres Tablosuna Adres2 adında boş geçilebilir bir alan ekleyen SQL sorgusunu yazınız. Daha sonrasında eklediğiniz alanı kaldıran SQL sorgusunu yazınız.
ALTER TABLE Adres
a.	ADD Adres3 nvarchar(max)
ALTER TABLE Adres
b.	DROP COLUMN Adres3

TOP
15.	Danisman tablosundan ilk 5 kaydı getiriniz.
SELECT TOP 5 * FROM Danisman

TOP, ORDER BY
16.	Danisman tablosunan şirket Id`leri en küçük olan 5 kaydı TOP ve ORDER BY komutu kullanarak getiriniz.
SELECT TOP 5 * FROM Danisman ORDER BY SirketID ASC



ORDER BY
17.	Şirketteki yöneticilein, veritabanına kaydolduğu idlerin küçük olmasıyla primlerindeki artış arasındaki korelasyon arasındaki ilişki olup olmadığı merak edilmektedir.
Personel Tipi 1 olan kayıtları Personel Tipi ve Personel_ID sütunlarını kullanarak ORDER BY komutu ile sıralayınız.
SELECT * FROM personel WHERE PersonelTipi = 1 ORDER BY PersonelTipi, Per_ID
