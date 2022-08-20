2.sınav = sensörlerden çıkacak

Kare dalganın büyüklüğünü ardunio kodlarıyla belirtiyoruz.
<-Ultrasonik sensor örneği projesinde

Map fonksyonu gömülüdür.

PulseIn(echopin, HIGH* 0.4324) //bir mikrosaniye döner. //değişkenle çarğmasının sebebi santimetreye çevirir(ses dalgasının cm ye çevirmek için)

Cm yi if ile kontrol ediyoruz.
----

LDR sensörü ardunio: foto registor. Işığı algılar başka ışık yaktırırız, perde açıksa ve ışık geliyorsa kapattırırız örneğin.

Daha kararlısı: 
Fotodiyot: üzerinde bir ışık geliğinde açık hale geliyor. Telefonlarda fotodiyot var telefon kulağa geldiğinde ekranı kapatır. Otomatik ışıkta aynı şekilde oluyor.
diyot(tek yönde akım geçiriyor.)

Transistorlar: 
1 0 üretmek amaç veya yükselteç olarak kullanılır( küçük sinyali alı yükseltirsin)

Flex sensör: bir şeylerin kırılmasına göre değer verir. 
---
Force sensör: bir şeye ne kadar kuvvet (N) uyguladığınızın değeri.

Gaz sensörleri: hangi gazı ölçtüğüne göre farklılşır. Duman için karbon monoksit sensörü almak gerekir
Doğlgaz ölçeceksen bütan sensörü alman gerekir.
Oksijen için, karbon için ayrı sensörler alınmalıdır

Potasyometre 
Bilgisayarlar, yazılım dilleri bir işi sürekli yapmaz. Örneklenmiş halini gösterir.
Örneğin sinus fonksyonu c++ da çizdirmek istersek bunları örnekler ile çizdirir.

Potansyometre veya diğer comp.lerde 0~5V arasında 1024 parçaya böler. 

Ardunio 5 v yetmiyosa diğer taraftan yeni bir pil ile devredeki elemanlar beslenebilir.
Önemli not: yeni eklenen pil toprağı ana toprağa bağlanmalı(- ucu)

Termocouple: ntc etc ye göre farkları var. Fark: 2500 dereceye kadar termocouplelar ölçebilir.
Etc-ntc ölçüm aralığı daha düşük.

Datasheet: sürekli başvurulması gereken dökümanlar.

Elektronikte transistörlü yükselteç develeriyle sinyali adam edip gösteririz bazen. Programlama diline gerek kalmadan bunu yaparız. 

---
	• Geri dönen reading değişkeni voltage = reading * 5.5/1024 olarak hesaplıyoz.
	• 0.32 volt okudu. -18 C oldu 

Pwm: kare dalga: 0 ile 1 arasındaki süre değerini biz ayarlarız(haberleşme modül sitemidir aslında). Özel kare dalgaları buradan alıp gönderilebilir. Ardunio üzerinde bu bacak başlığı yazıyor



Not: treshold eşikdeğer anlamına gelir.

Tone() ses dalgası.

Mq-7: karbonmonoksit kgaz sensörü
Mq-2: doğalgaz bütan ölçer.

Tilt sensörü(eğim diye çeviremeyiz, dengenin değimesi anlamına gelir): eğilme sensörü: dengesi bozulduysa bir değer dönderir. 
gyroskop: 3 boyutlu denge gösterir(telefonlarda kullanılır).
Tilt sensörü buna benzer. Daha basitidir.Genellikle içinde civa olur. 
Uçaklarda gyroskop kullanılır.
İlk gyroskopa baktık. Uçaklarda ilk gyroskop tipleri kullanılırmış.

PIR sensör: her yere freans atar. Hareketleri algılar. Küresel bir şekilde atar. Bu frekansın değişip değişmediğine bakıyor.
Flame sensör : alev varsa algılar.

Opamp dedi

