0-49 sayfalar
4-8. hafta sınav:
1.Robot tipleri
2.Mikroişlemci, mikrokontrolcü

-Assembly devre elemanlarıyla diğer devre elemanlarının farkı bilinmeli.
Assembly d e: surface mounted device = devreye koyulan mikro kondansatör(assembly) ler sayesinde mikroişlemciler assembly daha az enerji tüketebilir.

-İşlemci içerisinde küçü bir ram bellek vardır.

SMD IO?

-Yonga, mikrodenetleyici anlamına gelir

MİKROİŞLEMCİ
1.Arm mimari, risk mimari ile üretilir.
2.Seri haberleşme yapan bir IO bileşeni olur içinde.
3.Reciver-transmitterları ile aldım verdim yapıyor.
4.Paralel iletişim yapan işlemci yok.
5.Seri iletişim yapar. Bu sayede? Usb, wifi vb bağlanabilmesini sağlar
6.Ondalık sayı hesabı yapabilir

Hexadecimal kod:
1 2 3 4 5 6 7 8 9 A B C D E F
Bu sistem çok kullanılr.
Mikdrodenetleyiciye hexadecimal olarak gönderilir kodlar.

---

Ripplelı, noiseli)( bilgi gönderirsen mikrodenetleyiciye, çıktılar yanlış bilgi verir. Bu yüzden besleme gerilimlerinin (prize doğru voltajı takma) düzgün olması hayati bir konudur.

-Assembly: küçük mdüller. Şarzı az yiyo.

Ardunio.com ÜZERİNDEKİ MODELLERİN İNCELENMESİ
Tech specs, donanım sistem ayrıntıları, özellikleri anlamına gelir
LEONARDO(daha a enerji)

6 analog girişi var

Dc current per IO ping 20ma(5 volt 20 miliamper): büyük bir servoya bağamak istersen. Akım isteyecektir. Onun önüne dc çalışan röleler atmak gerekiyor. Yoksa bozulur

16 mhz clock speed sahip

Ardunio mega:
16mhz:(aynı hız az)
16 analog girişi var
Hızın önemi yok.
16 bit işlemci
Veriyolu 16 bittir yani

DUE:
Daha fazla hız
84 mhz

---

## Ardunyoları birbirine wifi ile bağlanılır convension olarak.

Tüm kapılar not kapısından üretilir. Ve içerisi d flipfloplardan oluşur.
Anot:+
Katot:-

---

Potasyometrenin ayakları 0-5 volt arası giriş olur bunu analog girişle okuyabiliriz
analogRead(a0) a0 analog girişinin değerini okur kod kısmında.

Mapping: bir seviyey, başka bir seviyeye eşitleme mantığıdır.

Ders molası sonrası yazılımın temelleri anlatıldı
