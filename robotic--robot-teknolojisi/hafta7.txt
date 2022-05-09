hafta 7 

Temel dc motorlar: 
+ ve - vardır
+sı 5 v -si 0 v dir.
Fabrika da kullanılır.
Hız kontrolü yapılabilir.
Gerilim değiştirilerek hız kontrolü yapılır.
24-48 mtorlar var
Tork: dönme kuvveti
Motora yük bindiğinde motor durur torku azdır.
Bu motorlar önüne dişli kutu eklenir bu hızı azaltır ve torka aktarır ve arttırır
Güçlü motorlar redüktörlü robotlar kullanlarak yapılır.
Dc motorun arkasında bir cihaz var: encoder.
Bu encoder üzerinden motoru belirli bir dönümden sonra hızı kesmeye, ne kadar döndermeye yarar.
Doğrudan redüktörlü veya encoderli dc motorlar tercihen kullanılabilir.
Encoder + reduktor olan motorlar da vardır.
-motorlar wattlar ile ifade edilir.
Koşu bantlarında dc motor kullanılır ama beygir ile ifade edilir.

Ac:
+ - önemli değildir
Bilgisayarın fişlerinin yönü önemli değildir.
Önemli olan şeyi frekansıdır.
Endüsttide çok kullanılır.
Hız kontrolü yine yapılabilir ama dc ye göre göreceli kötüdür.
Ac nin faydası: redüktörsüz şekilde de torklu çalışır

Vrms-> etkin değer
Ac değerleri vrms ile ile ifade edilir.
Ev elektriğinin vrmssi 240
Sanayi tipi 380 dir.

Ac türleri:
Asenkron motor:
Güçlü bir şey çalıştırma yapılınca güç düşer
Dc ile ac motor çalıştırmak istiyorsak convertera ihtiyacımız olur.

TIRTIKLI kırmızı her yerde gözüken motorlar: 
-tesla 2019 a kadar bunu kullanmış.
-gelen enerjiyi 3 fazlı şekilde dc den acye dönüşür.
-yeni tesla motoru ac ve kendileri üretmiş
2 saniyede hızlanmasının sebebei: ac metorlar çok hıızlı torku var. Dc de amaç hız kontrolü, o kullanılmaz.
-evdeki robotlar ac motordur.
Ac robotların en kötü sorunu çok ısınır

Senkron vs asenkron ac motor farkı:
Senkron:
Senkron her zaman sabit hızda döner
Tork değeri yüksektir
Hızın sabit kalması gerekn yerlerde kullanılır.
Redüktörlü ac motor:
-Çok ısınırlar
-farklı çözümleri var.
-Robotikte kullanılacaksa ısınma
-sorunun düşünmek lazım.

İnvertar: Bataryaan enerji geliyorsa dcden acye çeviren bir çevirici olan invertera ihtiyacı vardır.
Converter: ac dan dc ye çevirir.
Bilgisayar şarz aletlerin dcden acye çevirr.

Peki neden tuğla gibi bunlar?:
Telefoncularda yaptığın tamirin hemen bozulmasının sebebi, dcnin tam olarak çevrilememesi, bunun kontrolü kaliteli bir güç kaynağıya yapılmalı.
Teslerini osilatör ile yaparız.

SERVO MOTOR:
Ac veya dc olabilir.
Bir kare dalga ile açı belirler
Belirli bir açıda dönüşler için kullanılır.
Robotikte en çok kullanılan motor tipidir.
Kullanımı kolaydır.
Robot kollarının mantığı tamamen servodur.
-içerisinde bir motor var. Ucunad bir redüktor ve altında ne kadar açı vereceğini söyleyen bir kontrol kartı var.
Kontrol boardı:
Kırmızı uç . Güç ucu
Siyah toprak
Sarı: bir kare dalga veriliyor. Bu kare dalga ne kadar açı verileceğini belirler.
Robotikte pwm(pulse widht modulation):
5Voltu belirli bir süre veriyor.
200 ms 5v veriyor. 50ms 0 veriyor . Bunun ortalama değeri 4 tür. 4 gibi bir değer veriyor bize. Veya 150 5v, 100 0 v veriyor.


Geçen haftaki kod parçalarından sınavda sorulacak. Sınavdaki ardunyo sorusu gibi sorular olacak

Haftaya sadece sınav olacak ders olmayacak.
12 mayısta raporlar yüklenecek.
 rapolar veya arayüz üzerinden sunum yapılabilir.


enc

Motor tipleri: 

DC örnekleri: pil, telefon,bilgisayar bataryaları.
	- Ac den dc ye geçiriliyor.
Dc:
- Hem akım hem gerilim doğrudur.
- Pil şeklinde üretilmiştir.
- Tesla ile ac ye geçilmiştir.

Geçen hafta bu kontrolü elle yaptık simulasyonda
Kare dalganın frkansı değiştirilierk açı hesaplanıyor.
5, 6 eksenli robot kolu bununla alakalı.
Çizim: step
Cnc: step, açılı robot

Servo devam:


Bu hafta da sınava dahil
Servo ile ilgili sınavda soru sorulacak.





