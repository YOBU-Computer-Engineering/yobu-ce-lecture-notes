select * from Personel
--SELECT * FROM Bolge WHERE Bolge_ID = 5

--Sicil numarası 984276 olan personelin ad, soyad ve Tc bilgisini getiriniz. 
--select Tc, Ad, Soyad from Personel WHERE SicilNo=(select SicilNo from Danisman where SicilNo = 984276)

--veritabanında toplam kaç adet bölge varsa, bölge id`lerini tersten sıralayan sorguyu yazınız
--select BolgeId from SatisTemsilcisi group by BolgeId having BolgeID > 4 order by BolgeID desc

--Personel tipine göre verilen maaşlarının ortalamasının 5000den büyük olan kayıtları alfabetik sırayla getiren sorguyu yazınız
--select Ad, sum(Maas) from PersonelTip group by Ad having avg(maas)>5000  

--eğer personel tipi 3 olan herhangi kayıt varsa, bu personel tipine ait kayıtlardan isimleri ve soyisimleri benzersiz olan personelleri getiriniz
--IF EXISTS(Select 1 from personel where PersonelTipi = 3)
--select distinct Ad from personel where PersonelTipi=3

--ilçe tablosunda GEBZE, KAHTA, CİDE İllerine ait IID(İl id)`lerini getiriniz.
--select * from Ilce where Ad IN('GEBZE', 'KAHTA', 'CİDE')
---------------------

--veritabanına Cabbar Cabbar ad ve soyadında, 123456 sicil numarasında bir kullanıcı ekleyiniz ve personel tipini 4 olarak set ediniz.
insert into Personel values(123456, 45112233444, 'Cabbar', 'Cabbar', 4, 123123123123, 1)
select * from personel where Tc = 45112233444
--nvarchar max veritüründe bir değişken tanımlayınız. adı Cabbar olan çalışanın adını ad değişkenine atadıktan sonra, bu değişkeni ekrana yazdırınız.
declare @ad nvarchar(max);
select @ad = Ad from Personel where Ad = 'Cavit'
print @ad

--Eğer Cabbar adında bir kayıt varsa, Cabbar isimli kullanıcının primini %15 arttırınız

--Cabbar bey, şirketimizin değerli bir çalışanı olduğunu kanıtlamıştır. Cabbar beyin personel tipini 1`e, genel müdüre getiriniz.

--Cabbar bey, şirkete gelmeden önce %15`lik prim aldığından diğer genel müdürlerden fazla maaş almaktadır. bu yüzden Cabbar beyin primini 1 olarak tekrar ayarlanması gerekmektedir.
--Cabbar beyin primini tekrardan 1 yapınız










