# ============================================================
# VERİ GÖRSELLEŞTİRME
# Hafta 3 - Grafik Türleri ve ggplot2
# ============================================================


# ------------------------------------------------------------
# 1. GGPLOT2 PAKETİNİN YÜKLENMESİ
# ------------------------------------------------------------

library(ggplot2)


# ------------------------------------------------------------
# 2. VERİ SETİNİN OKUNMASI
# ------------------------------------------------------------

# mtcars veri setinin okunması
df <- read.csv("mtcars.csv", header = TRUE)


# ------------------------------------------------------------
# 3. VERİ SETİNİN İNCELENMESİ
# ------------------------------------------------------------

# İlk 6 gözlemin görüntülenmesi
head(df)

# Veri setinin boyutu
# Satır ve sütun sayısını verir.
dim(df)

# Değişken isimleri
names(df)

# Veri setinin yapısı
# Değişkenlerin veri tiplerini incelememizi sağlar.
str(df)

# Değişkenlere ait özet istatistikler
summary(df)


# ============================================================
# 4. HİSTOGRAM
# ============================================================

# Histogram:
# Nicel bir değişkenin dağılımını incelemek için kullanılan
# grafiksel bir gösterimdir.
#
# Gözlem değerleri belirli aralıklara (sınıflara/binlere)
# ayrılır ve her aralıktaki gözlem sıklığı
# bitişik çubuklarla gösterilir.


# ------------------------------------------------------------
# Histogram Ne İşe Yarar?
# ------------------------------------------------------------

# 1. Dağılımın biçimini incelemeye yardımcı olur.
#    Dağılım simetrik mi, sağa mı veya sola mı çarpık?

# 2. Gözlemlerin hangi değer aralıklarında
#    yoğunlaştığını gösterir.

# 3. Verinin yayılımı hakkında görsel bilgi sağlar.

# 4. Olası uç değerlerin fark edilmesine yardımcı olabilir.
#    Ancak histogram tek başına bir gözlemin
#    aykırı değer olduğuna karar vermek için yeterli değildir.

# 5. Tek tepeli veya çok tepeli dağılım yapılarının
#    fark edilmesine yardımcı olabilir.


# ------------------------------------------------------------
# mpg Değişkeninin Histogramı
# ------------------------------------------------------------

ggplot(df, aes(x = mpg)) +
  geom_histogram(
    bins = 5,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Yakıt Verimliliğinin Dağılımı",
    x = "Yakıt Verimliliği (mpg)",
    y = "Frekans"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# bins Nedir?
# ------------------------------------------------------------

# bins, histogramda veri aralığının kaç sınıfa
# bölüneceğini belirler.
#
# bins değeri arttıkça:
# Sınıflar daralır ve daha fazla ayrıntı görülür.
#
# bins değeri azaldıkça:
# Sınıflar genişler ve dağılımın genel yapısı
# daha belirgin hale gelir.
#
# Histogram için her durumda geçerli
# tek bir doğru bins değeri yoktur.


# Farklı bins değerlerinin karşılaştırılması

ggplot(df, aes(x = mpg)) +
  geom_histogram(
    bins = 5,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Histogram - bins = 5",
    x = "Yakıt Verimliliği (mpg)",
    y = "Frekans"
  ) +
  theme_minimal()


ggplot(df, aes(x = mpg)) +
  geom_histogram(
    bins = 15,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Histogram - bins = 15",
    x = "Yakıt Verimliliği (mpg)",
    y = "Frekans"
  ) +
  theme_minimal()


# ÖNEMLİ:
# Veri aynı olmasına rağmen bins değeri değiştiğinde
# histogramın görünümü değişebilir.


# ------------------------------------------------------------
# binwidth Nedir?
# ------------------------------------------------------------

# bins     = Kaç sınıf oluşturulacağını belirler.
# binwidth = Her sınıfın genişliğini belirler.

ggplot(df, aes(x = mpg)) +
  geom_histogram(
    binwidth = 5,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Histogram - Sınıf Genişliği = 5",
    x = "Yakıt Verimliliği (mpg)",
    y = "Frekans"
  ) +
  theme_minimal()


# ============================================================
# 5. YOĞUNLUK GRAFİĞİ (DENSITY PLOT)
# ============================================================

# Yoğunluk grafiği:
# Nicel bir değişkenin dağılımının biçimini
# yumuşatılmış bir eğri ile gösterir.
#
# Histogramdan farklı olarak gözlemleri
# belirli sınıflara (bins) ayırmaz.


# ------------------------------------------------------------
# Yoğunluk Grafiği Ne İşe Yarar?
# ------------------------------------------------------------

# 1. Dağılımın biçimini incelemeye yardımcı olur.

# 2. Gözlemlerin hangi değerler çevresinde
#    daha fazla yoğunlaştığını gösterir.

# 3. Dağılımın tek veya birden fazla tepeye
#    sahip olup olmadığını değerlendirmeye yardımcı olur.

# ÖNEMLİ:
# Y ekseni gözlem sayısını değil,
# olasılık yoğunluğunu gösterir.
#
# Eğrinin altında kalan toplam alan 1'dir.
#
# Belirli bir aralıktaki eğri altı alan,
# o aralık için tahmini olasılığı ifade eder.


# ------------------------------------------------------------
# mpg Değişkeninin Yoğunluk Grafiği
# ------------------------------------------------------------

ggplot(df, aes(x = mpg)) +
  geom_density(
    fill = "steelblue",
    alpha = 0.4
  ) +
  labs(
    title = "Yakıt Verimliliğinin Yoğunluk Grafiği",
    x = "Yakıt Verimliliği (mpg)",
    y = "Yoğunluk"
  ) +
  theme_minimal()


# ============================================================
# 6. KATEGORİK DEĞİŞKENLERİN GÖRSELLEŞTİRİLMESİ
# ============================================================

# cyl değişkeninde her silindir grubunda
# kaç araç bulunduğunu inceleyelim.

table(df$cyl)


# ------------------------------------------------------------
# geom_bar()
# ------------------------------------------------------------

# geom_bar(), her kategoride bulunan gözlem sayısını
# otomatik olarak hesaplar.

ggplot(df, aes(x = factor(cyl))) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Silindir Sayısına Göre Araç Sayısı",
    x = "Silindir Sayısı",
    y = "Araç Sayısı"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# İKİ KATEGORİK DEĞİŞKENİN BİRLİKTE GÖSTERİMİ
# ------------------------------------------------------------

# mtcars veri setinde:
# cyl = silindir sayısı
# am  = şanzıman türü
#       0 = Otomatik
#       1 = Manuel
#
# cyl ve am veri setinde sayısal olarak saklanmaktadır.
# Ancak burada bu değişkenleri kategorik olarak kullanacağımız
# için factor türüne dönüştürüyoruz.

mtcars$cyl <- factor(mtcars$cyl)

mtcars$am <- factor(
  mtcars$am,
  levels = c(0, 1),
  labels = c("Otomatik", "Manuel")
)


# ------------------------------------------------------------
# 1. STACKED BAR PLOT - Üst Üste Sütunlar
# ------------------------------------------------------------

# x = cyl:
# Araçları silindir sayısına göre gruplandırır.
#
# fill = am:
# Her silindir grubunu şanzıman türüne göre
# Otomatik ve Manuel olarak ayırır.
#
# geom_bar() her gruptaki araç sayısını otomatik olarak hesaplar.
#
# geom_bar() için varsayılan position = "stack"tir.
# Bu nedenle Otomatik ve Manuel araçlar aynı sütun içinde
# üst üste gösterilir.

ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar()


# ------------------------------------------------------------
# 2. DODGED BAR PLOT - Yan Yana Sütunlar
# ------------------------------------------------------------

# position = "dodge":
# Otomatik ve Manuel araçları üst üste göstermek yerine
# yan yana sütunlar halinde gösterir.
#
# Böylece her silindir grubunda Otomatik ve Manuel
# araç SAYILARINI karşılaştırmak daha kolay hale gelir.
#
# fill = am              -> Neye göre gruplandıracağımızı belirler.
# position = "dodge"     -> Grupların nasıl yerleşeceğini belirler.

ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = "dodge")


# ------------------------------------------------------------
# 3. FILLED BAR PLOT - Oransal Sütunlar
# ------------------------------------------------------------

# position = "fill":
# Her silindir grubunun toplam sütun yüksekliğini 1'e (%100'e)
# eşitler.
#
# Bu nedenle burada araç sayılarını değil,
# her silindir grubu içindeki Otomatik ve Manuel
# araçların ORANLARINI karşılaştırırız.
#
# Y ekseninde:
# 0.00 = %0
# 0.50 = %50
# 1.00 = %100

ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = "fill")

# ------------------------------------------------------------
# Frekansların Grafik Üzerinde Gösterilmesi
# ------------------------------------------------------------

# geom_bar() gözlem sayılarını kendi içinde hesaplar.
#
# ..count.. veri setinde bulunan bir değişken değildir.
# ggplot2 tarafından grafik oluşturulurken hesaplanan
# frekans değeridir.
#
# aes(label = ..count..):
# Hesaplanan gözlem sayısını metin etiketi olarak kullanır.

ggplot(df, aes(x = factor(cyl))) +
  geom_bar(fill = "steelblue") +
  geom_text(
    stat = "count",
    aes(label = ..count..),
    vjust = -0.5
  ) +
  labs(
    title = "Silindir Sayısına Göre Araç Sayısı",
    x = "Silindir Sayısı",
    y = "Araç Sayısı"
  ) +
  theme_minimal()


ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "steelblue") +
  geom_text(
    aes(label = after_stat(count)),
    stat = "count",
    vjust = -0.5
  )


# ============================================================
# 7. SÜREKLİ BİR DEĞİŞKENİN GRUPLARA GÖRE İNCELENMESİ
# ============================================================

# Yakıt verimliliğinin (mpg) silindir gruplarına göre
# nasıl değiştiğini inceleyelim.


# ------------------------------------------------------------
# Gruplama Değişkenlerinin Hazırlanması
# ------------------------------------------------------------

# cyl veri setinde sayısal olarak tutulmaktadır.
# Ancak burada 4, 6 ve 8 değerlerini araçları ayıran
# kategoriler olarak kullanacağız.
# Bu nedenle faktöre dönüştürüyoruz.

df$cyl <- factor(df$cyl)


# am değişkeni şanzıman türünü göstermektedir:
# 0 = Otomatik
# 1 = Manuel
#
# am değişkenini faktöre dönüştürürken
# kategorilere açıklayıcı isimler veriyoruz.

df$am <- factor(
  df$am,
  levels = c(0, 1),
  labels = c("Otomatik", "Manuel")
)


# Dönüşümden sonra veri yapısını tekrar kontrol edelim.

str(df)


# ------------------------------------------------------------
# BOXPLOT
# ------------------------------------------------------------

# Boxplot, nicel bir değişkenin dağılımını özetler.
# Burada mpg dağılımını silindir gruplarına göre karşılaştırıyoruz.

ggplot(df, aes(x = cyl, y = mpg)) +
  geom_boxplot() +
  labs(
    title = "Silindir Gruplarına Göre Yakıt Verimliliği",
    x = "Silindir Sayısı",
    y = "Yakıt Verimliliği (mpg)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# VIOLIN PLOT
# ------------------------------------------------------------

# Violin grafiği dağılımın biçimini ve
# gözlemlerin hangi bölgelerde yoğunlaştığını gösterir.

ggplot(df, aes(x = cyl, y = mpg)) +
  geom_violin(
    fill = "lightblue",
    alpha = 0.6
  ) +
  labs(
    title = "Silindir Gruplarına Göre Yakıt Verimliliği",
    x = "Silindir Sayısı",
    y = "Yakıt Verimliliği (mpg)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# JITTER
# ------------------------------------------------------------

# Jitter grafiği her gözlemi ayrı bir nokta olarak gösterir.
#
# width = 0.15:
# Noktaları yatay yönde küçük miktarda sağa-sola kaydırır.
# Böylece üst üste binmeleri azaltılır.

ggplot(df, aes(x = cyl, y = mpg)) +
  geom_jitter(
    width = 0.15,
    size = 2,
    alpha = 0.7
  ) +
  labs(
    title = "Silindir Gruplarındaki Gözlemler",
    x = "Silindir Sayısı",
    y = "Yakıt Verimliliği (mpg)"
  ) +
  theme_minimal()


# ============================================================
# 8. KATMANLARIN BİRLİKTE KULLANILMASI
# BOXPLOT + JITTER
# ============================================================

# Aynı grafik üzerine birden fazla geom eklenebilir.
#
# geom_boxplot():
# Her silindir grubundaki dağılımı özetler.
#
# geom_jitter():
# Özetin arkasındaki bireysel gözlemleri gösterir.
#
# Ayrıca jitter noktalarını şanzıman türüne göre
# farklı renklerle göstereceğiz.

ggplot(
  df,
  aes(
    x = cyl,
    y = mpg
  )
) +
  
  # Birinci katman: dağılımın özeti
  geom_boxplot() +
  
  # İkinci katman: bireysel gözlemler
  # Renk şanzıman türüne göre değişmektedir.
  geom_jitter(
    aes(color = am),
    width = 0.15,
    size = 2,
    alpha = 0.7
  ) +
  
  # Grafik ve eksen başlıkları
  labs(
    title = "Silindir Gruplarına Göre Yakıt Verimliliği",
    x = "Silindir Sayısı",
    y = "Yakıt Verimliliği (mpg)",
    color = "Şanzıman Türü"
  ) +
  
  # Grafik teması
  theme_minimal()