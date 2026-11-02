## ============================================================
## VBA203 - VERİ GÖRSELLEŞTİRME
## Çizgi Grafiği - Line Graph
## ============================================================


## 1. GEREKLİ PAKETİN YÜKLENMESİ

library(ggplot2)
library (grid) #arrow() ve unit() için


## 2. VERİ SETİNİN OLUŞTURULMASI

# 2024 yılına ait 12 aylık örnek satış verisi

satis <- data.frame(
  Ay = 1:12,
  Miktar = c(120, 135, 128, 150, 160, 155,
             175, 170, 190, 205, 200, 220)
)


# Veri setini görüntüleyelim.


# Değişkenlerin yapısını inceleyelim.



## 3. TEMEL ÇİZGİ GRAFİĞİ

# geom_line() gözlemleri çizgilerle birleştirir.
# X ekseninde tarih, Y ekseninde satış miktarı bulunur.


  
#x eksenini düzenleyelim.

#breaks eksende gösterilecek konumları, 
#labels ise bu konumlarda yazılacak metinleri belirler.
  

ggplot(satis, aes(x = Ay, y = Miktar)) +
  geom_line() +
  scale_x_continuous(breaks = 1:12)
  


## 4. ÇİZGİNİN GÖRÜNÜMÜNÜ DÜZENLEME

# Çizginin rengini düzenleme ve nokta ekleme

# `color` komutu kullanılır ve istenen renk, 
# `geom_line( )` içinde çift tırnak " " işaretleri arasında yazılır.
#  gözlem noktaları geom_point() ile grafiğe eklenir. 

# Grafiği oluşturalım

ggplot(satis, aes(x = Ay, y = Miktar)) +
  geom_line() +
  geom_point()+
  scale_x_continuous(breaks = 1:12)


# Çizgi Biçimlendirme

# ggplot2 paketinde çizgilerin görünümünü değiştirmek için 
# linetype parametresi kullanılır. Bu parametre sayesinde çizgiler düz, 
# noktalı, kesikli veya nokta-çizgi gibi farklı biçimlerde gösterilebilir.
# ggplot2, farklı çizgi tipleri sunar. 
# İstenen çizgi tipini belirlemek için "linetype" parametresine 
# uygun bir değer atanır.


# Çizgi tipi	 Açıklama
# "solid"	     Düz çizgi
# "dashed"	   Kesikli çizgi
# "dotted"	   Noktalı çizgi
# "dotdash"	   Nokta-çizgi
# "longdash"	 Uzun kesikli çizgi
# "twodash"	   İki farklı uzunlukta kesikli çizgi








## ÇİZGİ KALINLIĞI (LINE SIZE)

# ggplot2 paketinde çizgi kalınlığını değiştirmek için
# linewidth parametresi kullanılır.
#
# linewidth değeri arttıkça çizgi kalınlaşır.
# Örneğin: 0.5, 1, 1.5, 2, 3


## Örnek 1: İnce çizgi




## Örnek 2: Orta kalınlıkta çizgi




## Örnek 3: Kalın çizgi




## Örnek 4: Çizgi kalınlığı, tipi ve rengini birlikte değiştirme



##ÇİZGİ GRAFİĞİNE OK EKLEME (ADDING ARROW)

# Çizgilerin uçlarına ok eklemek için arrow() kullanılır.
# arrow() fonksiyonu grid paketinde bulunmaktadır.

library(ggplot2)
library(grid)


## Örnek 1: Çizginin sonuna ok ekleme



## Örnek 2: Okun açısını değiştirme

# angle: Ok ucunun açısını belirler (derece).


## Örnek 3: Çizginin iki ucuna ok ekleme

# ends = "both": Çizginin başlangıcına ve sonuna ok ekler.


## Örnek 4: İçi dolu ok ekleme

# type = "closed": İçi dolu ok ucu oluşturur.
# type = "open": Açık ok ucu oluşturur.



## Örnek 5: Her iki uçta içi dolu ok

# Okun özelliklerini ayrı bir nesnede tanımlayabiliriz.


## ÇİZGİ GRAFİĞİNE VERİ ETİKETLERİ EKLEME

# geom_text() gözlemlerin değerlerini grafik üzerinde gösterir.
# label = Miktar: Satış miktarlarını etiket olarak kullanır.
# vjust = Veri etiketlerinin dikey konumunu belirler.


## Örnek 1: Temel veri etiketleri




# y EKSENİNİ BİÇİMLENDİRME
# Parametre	                  # Görevi
# limits = c(100, 250)	      # Y ekseninin alt ve üst sınırlarını belirler.
# breaks = seq(100, 250, 50)	# Y ekseninde 100, 150, 200 ve 250 değerlerini gösterir.




## 9. AYNI GRAFİKTE BİRDEN FAZLA ÇİZGİ OLUŞTURMA

## Veri setinin oluşturulması

satis2 <- data.frame(
  Ay = rep(1:12, 2),
  Urun = rep(c("Ürün A", "Ürün B"), each = 12),
  Miktar = c(
    120, 135, 128, 150, 160, 155,
    175, 170, 190, 205, 200, 220,
    100, 115, 125, 120, 140, 150,
    145, 165, 160, 180, 195, 210
  )
)

## Örnek 1: İki ürünün satışlarını aynı grafikte gösterme

# group = Urun: Her ürün için ayrı çizgi oluşturur.




## Örnek 2: Ürünleri farklı renklerle gösterme

# color = Urun: Her ürün için farklı renk kullanır.




## Örnek 3: Ürünleri farklı çizgi tipleriyle gösterme

# linetype = Urun: Her ürün için farklı çizgi tipi kullanır.




## 10. ÇİZGİ RENKLERİNİ DÜZENLEME

## Temel grafiği oluşturalım.



## Örnek 1: Brewer renk paleti kullanma

# scale_color_brewer(): Hazır renk paletlerini kullanır.
# palette: Kullanılacak renk paletini belirler.



## Örnek 2: Farklı bir Brewer renk paleti



## Örnek 3: Renkleri manuel belirleme

# scale_color_manual(): Renkleri kullanıcı belirler.




## Örnek 4: Gruplara özel renk atama



## 11. LEJANTIN KONUMUNU DEĞİŞTİRME

## Temel grafiğe renk paleti ekleyelim.




## Örnek 1: Lejantı üstte gösterme




## Örnek 2: Lejantı altta gösterme



## Örnek 3: Lejantı solda gösterme



## Örnek 4: Lejantı sağda gösterme



## Örnek 5: Lejantı kaldırma



