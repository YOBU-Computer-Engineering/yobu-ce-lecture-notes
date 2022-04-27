update Personel 
set personelTipi = 'G' 
where personelNo>0 and personelNo<8

update Personel 
set personelTipi = 'T' 
where personelNo>7 and personelNo<25

update Personel 
set personelTipi = 'M' 
where personelNo>24 and personelNo<50

update Personel 
set personelTipi = 'S' 
where personelNo>49 and personelNo<59

update Personel
set maas = 20000
where personelTipi='G'

update Personel
set maas = 4250
where personelTipi='T'

update Personel
set maas = 10000
where personelTipi='M'

update Personel
set maas = 6250
where personelTipi='S'

update Personel
set maas = 5500
where personelTipi='K'

select AVG(maas) from Personel --maas ortalamasını getirir.

select count(1) from Personel --toplam personel sayısını getirir.
select sum(maas) from Personel --toplam ödenen maaşı getirir

--4.hafta aradan sonra.
UPDATE Personel set maas = maas*1.17 WHERE personelTipi='T'

DECLARE @maas_zam_oran money
SET @maas_zam_oran = 1.17
SELECT @maas_zam_oran

UPDATE Personel set maas = maas*@maas_zam_oran	 WHERE personelTipi='T'

Select top 2 * from Personel order by maas desc

Select MAX(maas) as enyuksek from Personel  