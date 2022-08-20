Soru: Personel içerisinden satýþ temsilci olmayanlarý rastgele ekrana getiren sql kodunu yazýnýz.
(Personel ve SatisTemsilcisi Tablosu kullanýlacaktýr)

Cevap 1: 

SELECT * from Personel p
WHERE p.SicilNo not in (Select SicilNo from SatisTemsilcisi)
ORDER BY newid()

Cevap 2:
select * from Personel as p
LEFT JOIN SatisTemsilcisi as s ON p.SicilNo = s.SicilNo
where p.SicilNo Not in(Select SicilNo from SatisTemsilcisi)
ORDER BY newid()

Soru: personeller içerisinde toplam genel müdür sayýsý 20 den büyükse genel müdürlere %10 zam yapan t-sql yazýnýz ve zam güncellemesini PersonelTip tablosunda gerçekleþtiriniz.

Cevap 1:
Declare @deneme int
set @deneme = (select count(PersonelTipi) from Personel
where PersonelTipi=1)

if @deneme > 20
update PersonelTip set Maas=Maas*1.1
where PersonelTip.Ad = 'Genel Müdür'


Cevap 2: 
Declare @deneme int
set @deneme = (select count(PersonelTipi) from Personel p, PersonelTip t
WHERE p.PersonelTipi = t.Tip_ID
AND t.Ad='Genel Müdür')
if @deneme > 20
update PersonelTip set Maas=Maas*1.1
where PersonelTip.Ad = 'Genel Müdür'

@deneme deðiþkenine 171 genel müdür sayýsý atandý.
iç select sorgusu 171 dönderdi.

Cevap 3:
Declare @tip_id int
Declare @genel_mudur_sayi int
set @tip_id = (select Tip_ID from PersonelTip WHERE Ad='Genel Müdür')
set @genel_mudur_sayi = (select count(PersonelTipi) from Personel p, PersonelTip t
WHERE p.PersonelTipi = t.Tip_ID
AND t.Tip_ID=@tip_id)
if @genel_mudur_sayi > 20
update PersonelTip set Maas=Maas*1.1
where PersonelTip.Tip_ID = @tip_id

Soru: 0 dan 5 (5 dahil deðil) e kadar sayýp ekrana yazdýran FOR döngüsünü yazýnýz.
DECLARE @cnt INT = 0;
WHILE @cnt < 5
BEGIN
   print @cnt
   SET @cnt = @cnt + 1;
END;

Soru: Tüm personel içerisinden isminin baþ harfi a ile baþlayan ilk 10 personelin isimlerini FOR döngüsü ile ekrana yazdýrýn.


döngü olmalý, 10 a kadar.
döngü içerisi, a ile baþlayan isimler (print())
  if ( yeni id li personel varsa ekrana eklesin yoksa döngü cont. olsun)
 
Cevap: (Tam cevap deðil, kontrol edilecek)
DECLARE @id INT = 1;
Declare @isim nvarchar(100)
WHILE @id < 11
BEGIN
   select @isim = Ad from Personel WHERE UPPER(Ad) like 'A%' ORDER BY Per_ID
   print @isim
   SET @id = @id + 1;
END;

Soru: Bir iþyerindeki en düþük maaþ alan personelTipi'ne ait personel bilgilerini veren T-SQL program kodu yazýnýz.

Cevap: 
Declare @min_maas money
select @min_maas = min(maas) from PersonelTip

Declare @Tip_id1 nvarchar(100)
set @Tip_id1 = (select Tip_ID From PersonelTip WHERE Maas=@min_maas)
print @Tip_id1

select * from Personel WHERE PersonelTipi=@Tip_id1

Cevap 2:
Declare @Tip_id2 nvarchar(100)
set @Tip_id2 = (select Tip_ID From PersonelTip WHERE Maas=(select min(maas) from PersonelTip))
print @Tip_id2
select * from Personel WHERE PersonelTipi=@Tip_id2

Soru: Tüm personelin bilgilerini, personel tip deðerlerini CASE yapýsýný kullanarak yazdýrýnýz.
PersonelTip aþaðýdadýr.

1-Genel Müdür
2-Müdür
3-Þoför
4-Temizlik Görevlisi
5-Kasiyer
6-Memur

2 tür soru var, deðiþken kullanmadan, deðiþken kullanarak.

Cevap:

Declare @gm nvarchar(50)='Genel Müdür'
Declare @tg nvarchar(50)='Müdür'
Declare @þf nvarchar(50)='Þoför'
Declare @tm nvarchar(50)='Temizlik görevlisi'
Declare @ks nvarchar(50)='Kasiyer'
Declare @Me nvarchar(50)='Memur'

select *,'Personel Tipi'=
case
when PersonelTipi=1 then @gm
when PersonelTipi=2 then @tg
when PersonelTipi=3 then @þf
when PersonelTipi=4 then @tm
when PersonelTipi=5 then @ks
when PersonelTipi=6 then @Me
end
from Personel


Soru: 0'dan 100'e kadar çift sayýlarý ekrana yazdýran T Sql sorgusunu yazýnýz

Cevap1: 
DECLARE @sayac2 INT 
Select @sayac2=0
While (@sayac2 <100)
BEGIN
Select @sayac2=@sayac2+1
if(@sayac2%2=0)
 begin
 Print @sayac2 
 End
End

Cevap2:
DECLARE @sayac1 INT 
Select @sayac1=0
While (@sayac1 <100)
BEGIN
SELECT @sayac1=@sayac1+2
print @sayac1
End


Soru: 1'den 15'e kadar while ile döngü kurup sayýlarý ekrana yazdýrýn fakat döngü 8 olduðunda sonlansýn.

Cevap:
DECLARE @sayac3 INT 
Select @sayac3=1 
WHILE (@sayac3<15) 
 BEGIN 
 SELECT @sayac3=@sayac3+1 
 if(@sayac3=8)
 begin
 Break 
 end
 END 
Print 'sayac :'+cast(@sayac3 as nvarchar)

cast iþlemi bilinçli tür dönüþümü iþlemidir.
break döngüyü sonlandýrýr.

Soru: 1'den 15'e kadar while ile döngü kurup sayýlarý ekrana yazdýrýn fakat döngü 11 olduðunda ekrana yazmasýn.

Cevap:
DECLARE @sayac INT 
SELECT @sayac=1 
WHILE (@sayac < 15) 
BEGIN 
 SELECT @sayac=@sayac+1 
if(@sayac=11) 
 BEGIN 
 Continue 
 END 
Print 'sayac :' 
Print @sayac 
 END 
  
--temp table kullanýmý

CREATE TABLE #Sirket ( 
 Sirket_ID INT, 
 Ad VARCHAR(55)
 ) 
 
 temp table # ile baþlar. bellekte tutulur. Tables kýsmýnda görünmez.

insert into #Sirket(KitapNo, KitapAdi, ISBNNo) ...
update #Sirket ...
delete from #Sirket...

















