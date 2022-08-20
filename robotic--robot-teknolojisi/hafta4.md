Progrem 
Yazılımı rama yazmamızı sağlıyor. Kütüphaane eklenmei gerekli kullanılmalı.
 
Cpp:
Serial.print(i,Dex) i yi decimal larak yazdır
Ardunio:
Digitalread ile buton oku
Serialread() ile de okua var

analogWrite() seçilen pinlere 0,5 v yazamıyoruz. 0 ila 256 arasında değer giriyoruz bu kendisini 0 5 e çeviriyor

Gecikmeler:
Delay()
Millis() her ay 2 saat çalıışması gerek örneğin. 50 gün kadar sayabiliyor. 
delayMicroseconds(mikrosaniye olarak bekletir 10^-6)


Onboard fonksyon = gömülü sistemlerin içinde olanfonksyonlar
Mathamatik:
Max(x,y)
Abs(x)
Constrain(x,a,b) A b  arasına x i sıkıştırır. X addan küçük se a yı yoksa b yi döner

Seri haberleşme:
Serial bir objeir. Bu gömülü bir objedir. Buun methodlarını kullanırız.
Serial.Begin (9600) saniyede 9600 kere çalıışır.
Serial begin yazılınca tx rx pin olmaktan çıkıp seri iletmeye başlar

Ardunio megada 3 tane tx rx var
-Serial.println



Serial.available(): wifidan veya bloothuttan veri gelmeye başladığında 1 değerini dönderir
Ondan sonra işlemlere başlaız.

Serialwrite tx rx üzerinden yazar
Serial print sadece okuur

İnterruptlar(kesmeler)

Romlar:
Eep rom ve rom silinmeyen romlardır. Kullanılacak, silinmeyecek bir değer varsa bunu eeproma yazabilirsin. Kütüphane anımayıp kullanılmalı.

Serihabeleşm egibi diğer haberleşme türleri
I2c haberleşme  veri yolu
Data kablosu ve clock kablosu var 
Master-slave mantığında sadece gönderme alma yok şeklinde arunyolar arası veri transferi gerçekleştirilebiliyor.
Toprakları b1.

Elektrikte gerilim: su analojisi: suyun ne kadar fazla olması gerilimdir. Ne hadar hızlı aktığı akımdır.
Gerilim: potansiyel fark(V), iki nokta arasındaki gerilim farkıdır. 

SPI:
4 pin üzerinden çalışır.

Kütüphaneleri ardunyo uno üzerinde var
---
Ödev: mayısın 2. haftası:



