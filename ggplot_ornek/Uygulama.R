# ============================================================
# VBA203 - VERİ GÖRSELLEŞTİRME
# İLK 5 HAFTA GENEL UYGULAMA
# Veri Seti: iris
# ============================================================

# VERİ SETİNİN TANITIMI
#
# iris, R programında hazır olarak bulunan bir veri setidir.
# Üç farklı süsen (Iris) çiçeği türüne ait fiziksel ölçümleri
# içermektedir.
#
# Veri setinde toplam 150 gözlem ve 5 değişken bulunmaktadır.
# Her satır bir çiçeği, her sütun ise çiçeğin bir özelliğini
# temsil etmektedir.
#
# Veri setinde üç çiçek türü bulunmaktadır:
#
# 1. setosa     : 50 gözlem
# 2. versicolor : 50 gözlem
# 3. virginica  : 50 gözlem
#
# DEĞİŞKENLERİN AÇIKLAMASI
#
# 1. Sepal.Length
#    Çanak yaprak uzunluğu (cm)
#    Sayısal (sürekli) değişken
#
# 2. Sepal.Width
#    Çanak yaprak genişliği (cm)
#    Sayısal (sürekli) değişken
#
# 3. Petal.Length
#    Taç yaprak uzunluğu (cm)
#    Sayısal (sürekli) değişken
#
# 4. Petal.Width
#    Taç yaprak genişliği (cm)
#    Sayısal (sürekli) değişken
#
# 5. Species
#    Çiçeğin ait olduğu tür
#    Kategorik (factor) değişken
#
# NOT:
# Sepal, çiçeğin dış kısmındaki çanak yaprağı;
# Petal ise genellikle renkli olan taç yaprağı ifade eder.

library(ggplot2)
data(iris)

# ============================================================
# A - VERIYI TANIMA VE GRAFIK SECIMI
# ============================================================

# SORU 1
# iris veri setinin ilk 6 satirini goruntuleyiniz. Gozlem ve degisken
# sayisini bulunuz. Degisken isimlerini ve turlerini inceleyiniz.



# SORU 2
# Veri setindeki eksik degerleri kontrol ediniz.
# Sepal.Length ve Petal.Length degiskenlerinin ozet istatistiklerini
# goruntuleyiniz. Hangisinin degiskenligi daha fazla gorunuyor?




# ============================================================
# B - TEK DEGISKENLI GRAFIKLER
# ============================================================

# SORU 3
# Species turlerinin gozlem sayilarini gosteren bir sutun grafigi ciziniz.
# Sutunlari ture gore renklendiriniz; baslik ve eksen etiketlerini ekleyiniz.
# Her turde kac gozlem oldugunu yorumlayiniz.





# SORU 4
# Sepal.Length icin bir histogram olusturunuz.
# binwidth = 0.5 kullaniniz. Dolgu ve kenarlik renklerini belirleyiniz.
# Dagilimin yogunlastigi araligi yorumlayiniz.





# SORU 5
# Petal.Length icin bir yogunluk grafigi (geom_density) ciziniz.
# Ayni degiskenin histogramiyla karsilastiriniz: Iki grafik neyi farkli
# bicimde gosteriyor?


# ============================================================
# C - ESTETIK ESLEME, KATMANLAR VE GRUP KARSILASTIRMASI
# ============================================================

# SORU 6
# Sepal.Length (x) ile Petal.Length (y) icin sacilim grafigi ciziniz.
# Noktalarin rengini Species degiskenine gore belirleyiniz.
# Nokta boyutunu ve saydamligini (alpha) duzenleyiniz.
# Turlerin dagilimlarini yorumlayiniz.






# SORU 7
# Petal.Width (x) ve Petal.Length (y) icin sacilim grafigi ciziniz.
# Noktalarin rengini Species'e gore ayarlayiniz.
# aes(color = Species) ile geom_point(color = "steelblue") arasindaki
# farki aciklayiniz.





# SORU 8
# Species gruplarina gore Sepal.Width dagilimini kutu grafigiyle
# (geom_boxplot) gosteriniz. Kutulari ture gore renklendiriniz.
# Medyanlari ve yayilimlari karsilastiriniz.





# ============================================================
# D - OLCEKLER, ETIKETLER VE TEMALAR
# ============================================================

# SORU 9
# Sepal.Length (x), Petal.Length (y) sacilim grafiginde noktalari
# Sepal.Width sayisal degiskenine gore renklendiriniz.
# scale_color_viridis_c() kullaniniz. Renklerin neyi temsil ettigini
# aciklayiniz.





# SORU 10
# SORU 6'daki grafigi yeniden olusturunuz.
# Species kategorilerine scale_color_manual() ile uc farkli renk atayiniz.
# Baslik, eksen ve lejant etiketlerini duzenleyiniz.





# SORU 11
# Sepal.Length (x) ve Petal.Length (y) sacilim grafigi ciziniz.
# scale_x_continuous(breaks = ...) ve scale_y_continuous(breaks = ...)
# kullanarak eksen isaretlerini degistiriniz.
# breaks ile limits arasindaki farki aciklayiniz.




# SORU 12
# SORU 11'deki grafigi theme_minimal() ve theme_classic() ile
# iki kez ciziniz. Hangi temayi tercih ettiginizi gerekcelendiriniz.


# ============================================================
# E - COK PANElLI GRAFIKLER (FACETING)
# ============================================================

# SORU 13
# Sepal.Length (x) ve Petal.Length (y) sacilim grafigini
# facet_wrap(~ Species) kullanarak uc panele ayiriniz.
# Panelleri once tek satirda, sonra tek sutunda gosteriniz.




# SORU 14
# SORU 13'teki grafigi bir kez varsayilan sabit olceklerle,
# bir kez scales = "free" secenegiyle ciziniz.
# Paneller arasi karsilastirmada hangisi daha uygun? Neden?




# SORU 15
# Sepal.Length degerini iki kategoriye ayiriniz:
# 5.8'den kucuk olanlar "Kisa", 5.8 ve uzeri olanlar "Uzun".
# Yeni kategorik degiskeni iris veri cercevesine ekleyiniz.
# Petal.Length (x) ve Petal.Width (y) grafigini
# facet_grid(Yeni_Kategori ~ Species) ile gosteriniz.
# (Yeni_Kategori yerine olusturdugunuz sutun adini kullaniniz.)




# ============================================================
# F - CAPRAZ TABLO VE OZET VERIDEN GRAFIK
# ============================================================

# SORU 16
# SORU 15'te olusturdugunuz Kisa/Uzun kategorisi ile Species icin
# bir capraz tablo olusturunuz (table).
# Her hucredeki sayinin neyi ifade ettigini aciklayiniz.





# SORU 17
# Capraz tabloyu as.data.frame() ile veri cercevesine donusturunuz.
# Ortaya cikan Freq sutununu kullanarak geom_col() ile bir grafik ciziniz.
# X ekseninde Species, dolgu renginde Kisa/Uzun kategorisi olsun.
# geom_bar() ile geom_col() arasindaki farki aciklayiniz.





# SORU 18
# SORU 17'deki grafigi bir kez yan yana sutunlarla
# (position = "dodge"), bir kez yiginli sutunlarla gosteriniz.
# Hangi grafik turler arasi sayilari karsilastirmayi kolaylastiriyor?





# SORU 19
# Capraz tablodan elde ettiginiz veri cercevesiyle bir grafik olusturunuz.
# facet_wrap() kullanarak Kisa ve Uzun gruplarini ayri panellerde
# gosteriniz. Her panelde Species sayilarini karsilastiriniz.


# ============================================================
# G - BAGIMSIZ UYGULAMA
# ============================================================

# SORU 20
# iris veri setiyle kendi arastirma sorunuzu belirleyiniz.
# En az iki degisken kullanarak uygun bir ggplot2 grafigi olusturunuz.
# Grafik basligi, eksen etiketleri, en az bir estetik esleme ve
# bir tema duzenlemesi bulunmalidir.
# Grafik seciminizi ve bulgularinizi en az 3 cumleyle aciklayiniz.



