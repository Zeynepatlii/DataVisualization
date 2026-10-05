# ============================================================
# TITANIC VERİ SETİ
# KEŞİFSEL VERİ ANALİZİ VE GÖRSELLEŞTİRME
# ============================================================


# ============================================================
# 1. GEREKLİ PAKET
# ============================================================

library(ggplot2)


# ============================================================
# 2. VERİ SETİNİN OKUNMASI
# ============================================================

titanic <- read.csv("titanic.csv")


# ============================================================
# 3. VERİ SETİNİ TANIYALIM
# ============================================================

# İlk 6 gözlem
head(titanic)

# Son 6 gözlem
tail(titanic)

# Veri setinin boyutu
# İlk değer satır, ikinci değer sütun sayısını gösterir.
dim(titanic)

# Gözlem sayısı
nrow(titanic)

# Değişken sayısı
ncol(titanic)

# Değişken isimleri
names(titanic)

# Veri setinin yapısı
str(titanic)

# Genel özet
summary(titanic)


# ============================================================
# 4. DEĞİŞKEN ADLARININ DÜZENLENMESİ
# ============================================================

# Veri setindeki bazı İngilizce değişken adlarını
# daha anlaşılır Türkçe isimlerle değiştirelim.

colnames(titanic)[colnames(titanic) == "PassengerId"] <- "Yolcu_No"
colnames(titanic)[colnames(titanic) == "Survived"]    <- "Hayatta_Kalma"
colnames(titanic)[colnames(titanic) == "Pclass"]      <- "Yolcu_Sinifi"
colnames(titanic)[colnames(titanic) == "Name"]        <- "Isim"
colnames(titanic)[colnames(titanic) == "Sex"]         <- "Cinsiyet"
colnames(titanic)[colnames(titanic) == "Age"]         <- "Yas"
colnames(titanic)[colnames(titanic) == "SibSp"]       <- "Kardes_Es"
colnames(titanic)[colnames(titanic) == "Parch"]       <- "Ebeveyn_Cocuk"
colnames(titanic)[colnames(titanic) == "Ticket"]      <- "Bilet_No"
colnames(titanic)[colnames(titanic) == "Fare"]        <- "Bilet_Ucreti"
colnames(titanic)[colnames(titanic) == "Cabin"]       <- "Kabin"
colnames(titanic)[colnames(titanic) == "Embarked"]    <- "Binis_Limani"


# Yeni değişken isimlerini kontrol edelim.

names(titanic)


# Veri setinin ilk satırlarını tekrar görelim.

head(titanic)


# ============================================================
# 5. DEĞİŞKENLERİ TANIYALIM
# ============================================================

# Yolcu_No       : Yolcu numarası
#
# Hayatta_Kalma  : Hayatta kalma durumu
#                  0 = Hayatta kalmadı
#                  1 = Hayatta kaldı
#
# Yolcu_Sinifi   : Yolcu sınıfı
#                  1 = Birinci sınıf
#                  2 = İkinci sınıf
#                  3 = Üçüncü sınıf
#
# Isim           : Yolcunun adı
#
# Cinsiyet       : Cinsiyet
#
# Yas            : Yaş
#
# Kardes_Es      : Gemideki kardeş/eş sayısı
#
# Ebeveyn_Cocuk  : Gemideki ebeveyn/çocuk sayısı
#
# Bilet_No       : Bilet numarası
#
# Bilet_Ucreti   : Bilet ücreti
#
# Kabin          : Kabin numarası
#
# Binis_Limani   : Yolcunun gemiye bindiği liman
#                  C = Cherbourg
#                  Q = Queenstown
#                  S = Southampton


# ============================================================
# 6. VERİ KALİTESİNİ KONTROL EDELİM
# ============================================================


# ------------------------------------------------------------
# 6.1. Eksik değerler
# ------------------------------------------------------------

# Her değişkendeki eksik değer sayısı

colSums(is.na(titanic))


# ------------------------------------------------------------
# 6.2. Eksik değer yüzdeleri
# ------------------------------------------------------------

round(
  colSums(is.na(titanic)) / nrow(titanic) * 100,
  1
)


# ------------------------------------------------------------
# 6.3. Toplam eksik değer sayısı
# ------------------------------------------------------------

sum(is.na(titanic))


# ------------------------------------------------------------
# 6.4. Tam gözlem sayısı
# ------------------------------------------------------------

sum(complete.cases(titanic))


# NOT:
# Eksik değer bulunması, bu gözlemlerin doğrudan
# silinmesi gerektiği anlamına gelmez.
#
# Öncelikle:
# - Hangi değişkenlerde eksiklik var?
# - Ne kadar eksiklik var?
# - Eksiklik analizi nasıl etkileyebilir?
#
# soruları değerlendirilmelidir.


# ============================================================
# 7. DEĞİŞKEN TÜRLERİNİN DÜZENLENMESİ
# ============================================================

# Bazı değişkenler veri setinde sayısal olarak tutulmaktadır.
# Ancak istatistiksel olarak kategorik değişkenlerdir.


# ------------------------------------------------------------
# Hayatta kalma durumu
# ------------------------------------------------------------

titanic$Hayatta_Kalma <- factor(
  titanic$Hayatta_Kalma,
  levels = c(0, 1),
  labels = c(
    "Hayatta Kalmadı",
    "Hayatta Kaldı"
  )
)


# ------------------------------------------------------------
# Yolcu sınıfı
# ------------------------------------------------------------

titanic$Yolcu_Sinifi <- factor(
  titanic$Yolcu_Sinifi,
  levels = c(1, 2, 3),
  labels = c(
    "1. Sınıf",
    "2. Sınıf",
    "3. Sınıf"
  )
)


# ------------------------------------------------------------
# Cinsiyet
# ------------------------------------------------------------

titanic$Cinsiyet <- factor(
  titanic$Cinsiyet,
  levels = c("female", "male"),
  labels = c("Kadın", "Erkek")
)


# ------------------------------------------------------------
# Biniş limanı
# ------------------------------------------------------------

titanic$Binis_Limani <- factor(
  titanic$Binis_Limani,
  levels = c("C", "Q", "S"),
  labels = c(
    "Cherbourg",
    "Queenstown",
    "Southampton"
  )
)


# Dönüşümden sonra veri yapısını tekrar kontrol edelim.

str(titanic)


# ============================================================
# 8. NİCEL DEĞİŞKENLERİN TEMEL İSTATİSTİKLERİ
# ============================================================


# ------------------------------------------------------------
# 8.1. YAŞ
# ------------------------------------------------------------

# Ortalama
mean(titanic$Yas, na.rm = TRUE)

# Medyan
median(titanic$Yas, na.rm = TRUE)

# Standart sapma
sd(titanic$Yas, na.rm = TRUE)

# Varyans
var(titanic$Yas, na.rm = TRUE)

# Minimum
min(titanic$Yas, na.rm = TRUE)

# Maksimum
max(titanic$Yas, na.rm = TRUE)

# Çeyrekler
quantile(
  titanic$Yas,
  probs = c(0.25, 0.50, 0.75),
  na.rm = TRUE
)

# Genel özet
summary(titanic$Yas)


# ------------------------------------------------------------
# Yaş için özet tablo
# ------------------------------------------------------------

yas_ozet <- data.frame(
  Ortalama = mean(titanic$Yas, na.rm = TRUE),
  Medyan = median(titanic$Yas, na.rm = TRUE),
  Standart_Sapma = sd(titanic$Yas, na.rm = TRUE),
  Minimum = min(titanic$Yas, na.rm = TRUE),
  Q1 = quantile(titanic$Yas, 0.25, na.rm = TRUE),
  Q3 = quantile(titanic$Yas, 0.75, na.rm = TRUE),
  Maksimum = max(titanic$Yas, na.rm = TRUE)
)

round(yas_ozet, 2)


# ------------------------------------------------------------
# 8.2. BİLET ÜCRETİ
# ------------------------------------------------------------

mean(titanic$Bilet_Ucreti, na.rm = TRUE)

median(titanic$Bilet_Ucreti, na.rm = TRUE)

sd(titanic$Bilet_Ucreti, na.rm = TRUE)

min(titanic$Bilet_Ucreti, na.rm = TRUE)

max(titanic$Bilet_Ucreti, na.rm = TRUE)

quantile(
  titanic$Bilet_Ucreti,
  na.rm = TRUE
)

summary(titanic$Bilet_Ucreti)


# ============================================================
# 9. KATEGORİK DEĞİŞKENLERİN TEMEL İSTATİSTİKLERİ
# ============================================================


# ------------------------------------------------------------
# 9.1. HAYATTA KALMA
# ------------------------------------------------------------

# Frekans
table(titanic$Hayatta_Kalma)

# Oran
prop.table(
  table(titanic$Hayatta_Kalma)
)

# Yüzde
round(
  prop.table(table(titanic$Hayatta_Kalma)) * 100,
  1
)


# ------------------------------------------------------------
# 9.2. CİNSİYET
# ------------------------------------------------------------

table(titanic$Cinsiyet)

round(
  prop.table(table(titanic$Cinsiyet)) * 100,
  1
)


# ------------------------------------------------------------
# 9.3. YOLCU SINIFI
# ------------------------------------------------------------

table(titanic$Yolcu_Sinifi)

round(
  prop.table(table(titanic$Yolcu_Sinifi)) * 100,
  1
)


# ------------------------------------------------------------
# 9.4. BİNİŞ LİMANI
# ------------------------------------------------------------

table(
  titanic$Binis_Limani,
  useNA = "ifany"
)

round(
  prop.table(
    table(
      titanic$Binis_Limani,
      useNA = "ifany"
    )
  ) * 100,
  1
)


# ============================================================
# 10. TEK DEĞİŞKENLİ GÖRSELLEŞTİRME
# ============================================================


# ------------------------------------------------------------
# 10.1. Yaş dağılımı - Histogram
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(x = Yas)
) +
  geom_histogram(
    bins = 20,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Titanic Yolcularının Yaş Dağılımı",
    x = "Yaş",
    y = "Frekans"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 10.2. Yaş dağılımı - Density
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(x = Yas)
) +
  geom_density(
    fill = "steelblue",
    alpha = 0.4,
    na.rm = TRUE
  ) +
  labs(
    title = "Titanic Yolcularının Yaş Yoğunluğu",
    x = "Yaş",
    y = "Yoğunluk"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 10.3. Bilet ücretinin dağılımı
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(x = Bilet_Ucreti)
) +
  geom_histogram(
    bins = 30,
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Bilet Ücretlerinin Dağılımı",
    x = "Bilet Ücreti",
    y = "Frekans"
  ) +
  theme_minimal()


# ============================================================
# 11. KATEGORİK DEĞİŞKENLERİN GÖRSELLEŞTİRİLMESİ
# ============================================================


# ------------------------------------------------------------
# 11.1. Hayatta kalma durumu
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(x = Hayatta_Kalma)
) +
  geom_bar(
    fill = "steelblue"
  ) +
  geom_text(
    stat = "count",
    aes(label = ..count..),
    vjust = -0.5
  ) +
  labs(
    title = "Titanic Yolcularının Hayatta Kalma Durumu",
    x = "Hayatta Kalma Durumu",
    y = "Yolcu Sayısı"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 11.2. Yolcu sınıfı
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(x = Yolcu_Sinifi)
) +
  geom_bar(
    fill = "steelblue"
  ) +
  geom_text(
    stat = "count",
    aes(label = ..count..),
    vjust = -0.5
  ) +
  labs(
    title = "Titanic Yolcularının Sınıflara Göre Dağılımı",
    x = "Yolcu Sınıfı",
    y = "Yolcu Sayısı"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 11.3. Cinsiyet
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(x = Cinsiyet)
) +
  geom_bar(
    fill = "steelblue"
  ) +
  geom_text(
    stat = "count",
    aes(label = ..count..),
    vjust = -0.5
  ) +
  labs(
    title = "Titanic Yolcularının Cinsiyete Göre Dağılımı",
    x = "Cinsiyet",
    y = "Yolcu Sayısı"
  ) +
  theme_minimal()


# ============================================================
# 12. İKİ KATEGORİK DEĞİŞKENİN İNCELENMESİ
# ============================================================


# ------------------------------------------------------------
# 12.1. CİNSİYET x HAYATTA KALMA
# ------------------------------------------------------------

# Çapraz tablo
table(
  titanic$Cinsiyet,
  titanic$Hayatta_Kalma
)


# ------------------------------------------------------------
# Satır yüzdeleri
# ------------------------------------------------------------

# Her cinsiyet grubunun kendi içerisindeki
# hayatta kalma oranlarını hesaplıyoruz.

round(
  prop.table(
    table(
      titanic$Cinsiyet,
      titanic$Hayatta_Kalma
    ),
    margin = 1
  ) * 100,
  1
)


# ------------------------------------------------------------
# Sayıları gösteren grafik
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(
    x = Cinsiyet,
    fill = Hayatta_Kalma
  )
) +
  geom_bar(
    position = "dodge"
  ) +
  labs(
    title = "Cinsiyete Göre Hayatta Kalma Durumu",
    x = "Cinsiyet",
    y = "Yolcu Sayısı",
    fill = "Hayatta Kalma"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# Oranları gösteren grafik
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(
    x = Cinsiyet,
    fill = Hayatta_Kalma
  )
) +
  geom_bar(
    position = "fill"
  ) +
  labs(
    title = "Cinsiyete Göre Hayatta Kalma Oranları",
    x = "Cinsiyet",
    y = "Oran",
    fill = "Hayatta Kalma"
  ) +
  theme_minimal()


# NOT:
#
# position = "dodge"
# -> SAYILARI karşılaştırır.
#
# position = "fill"
# -> Her grubun toplamını 1'e eşitler.
# -> ORANLARI karşılaştırmayı kolaylaştırır.


# ============================================================
# 13. YOLCU SINIFI x HAYATTA KALMA
# ============================================================


# ------------------------------------------------------------
# Çapraz tablo
# ------------------------------------------------------------

table(
  titanic$Yolcu_Sinifi,
  titanic$Hayatta_Kalma
)


# ------------------------------------------------------------
# Her sınıf içerisindeki yüzdeler
# ------------------------------------------------------------

round(
  prop.table(
    table(
      titanic$Yolcu_Sinifi,
      titanic$Hayatta_Kalma
    ),
    margin = 1
  ) * 100,
  1
)


# ------------------------------------------------------------
# Yolcu sınıfına göre hayatta kalma oranları
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(
    x = Yolcu_Sinifi,
    fill = Hayatta_Kalma
  )
) +
  geom_bar(
    position = "fill"
  ) +
  labs(
    title = "Yolcu Sınıfına Göre Hayatta Kalma",
    subtitle = "Her yolcu sınıfı içerisindeki hayatta kalma oranları",
    x = "Yolcu Sınıfı",
    y = "Oran",
    fill = "Hayatta Kalma Durumu",
    caption = "Veri: Titanic"
  ) +
  theme_minimal()


# ============================================================
# 14. NİCEL + KATEGORİK DEĞİŞKEN
# ============================================================


# ------------------------------------------------------------
# 14.1. Yaş ve hayatta kalma
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(
    x = Hayatta_Kalma,
    y = Yas
  )
) +
  geom_boxplot(
    fill = "lightblue"
  ) +
  labs(
    title = "Hayatta Kalma Durumuna Göre Yaş Dağılımı",
    x = "Hayatta Kalma Durumu",
    y = "Yaş"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 14.2. Boxplot + Jitter
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(
    x = Hayatta_Kalma,
    y = Yas
  )
) +
  geom_boxplot(
    outlier.shape = NA,
    fill = "lightblue",
    alpha = 0.6
  ) +
  geom_jitter(
    width = 0.15,
    alpha = 0.4,
    size = 1.5,
    na.rm = TRUE
  ) +
  labs(
    title = "Hayatta Kalma Durumuna Göre Yaş Dağılımı",
    subtitle = "Noktalar bireysel yolcuları göstermektedir",
    x = "Hayatta Kalma Durumu",
    y = "Yaş"
  ) +
  theme_minimal()


# ============================================================
# 15. GRUPLARA GÖRE TEMEL İSTATİSTİKLER
# ============================================================


# ------------------------------------------------------------
# Hayatta kalma durumuna göre ortalama yaş
# ------------------------------------------------------------

aggregate(
  Yas ~ Hayatta_Kalma,
  data = titanic,
  FUN = mean,
  na.rm = TRUE
)


# ------------------------------------------------------------
# Hayatta kalma durumuna göre medyan yaş
# ------------------------------------------------------------

aggregate(
  Yas ~ Hayatta_Kalma,
  data = titanic,
  FUN = median,
  na.rm = TRUE
)


# ------------------------------------------------------------
# Yolcu sınıfına göre ortalama yaş
# ------------------------------------------------------------

aggregate(
  Yas ~ Yolcu_Sinifi,
  data = titanic,
  FUN = mean,
  na.rm = TRUE
)


# ------------------------------------------------------------
# Yolcu sınıfına göre medyan bilet ücreti
# ------------------------------------------------------------

aggregate(
  Bilet_Ucreti ~ Yolcu_Sinifi,
  data = titanic,
  FUN = median,
  na.rm = TRUE
)


# ============================================================
# 16. İKİ NİCEL DEĞİŞKENİN İNCELENMESİ
# ============================================================


# ------------------------------------------------------------
# 16.1. Yaş ve bilet ücreti
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(
    x = Yas,
    y = Bilet_Ucreti
  )
) +
  geom_point(
    alpha = 0.5,
    na.rm = TRUE
  ) +
  labs(
    title = "Yaş ve Bilet Ücreti",
    x = "Yaş",
    y = "Bilet Ücreti"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 16.2. Hayatta kalma durumunu renk ile ekleyelim
# ------------------------------------------------------------

ggplot(
  titanic,
  aes(
    x = Yas,
    y = Bilet_Ucreti,
    color = Hayatta_Kalma
  )
) +
  geom_point(
    alpha = 0.6,
    size = 2,
    na.rm = TRUE
  ) +
  labs(
    title = "Yaş ve Bilet Ücreti",
    subtitle = "Yolcular hayatta kalma durumuna göre renklendirilmiştir",
    x = "Yaş",
    y = "Bilet Ücreti",
    color = "Hayatta Kalma"
  ) +
  theme_minimal()


# ============================================================
# 17. TAMAMLANMIŞ BİR GRAFİK
# ============================================================

# Şimdiye kadar öğrendiğimiz ggplot2 bileşenlerini
# tek bir grafik üzerinde bir araya getirelim.
#
# DATA
# +
# MAPPING
# +
# GEOM / LAYERS
# +
# SCALE
# +
# LABELS
# +
# THEME


ggplot(
  titanic,
  aes(
    x = Yolcu_Sinifi,
    y = Yas,
    color = Hayatta_Kalma
  )
) +
  
  # --------------------------
# LAYER 1: Boxplot
# --------------------------

geom_boxplot(
  outlier.shape = NA,
  alpha = 0.3
) +
  
  # --------------------------
# LAYER 2: Bireysel gözlemler
# --------------------------

geom_jitter(
  width = 0.15,
  alpha = 0.5,
  size = 1.5,
  na.rm = TRUE
) +
  
  # --------------------------
# SCALE
# --------------------------

scale_color_manual(
  values = c(
    "Hayatta Kalmadı" = "firebrick",
    "Hayatta Kaldı" = "steelblue"
  )
) +
  
  # --------------------------
# LABELS
# --------------------------

labs(
  title = "Titanic Yolcularında Yaş ve Hayatta Kalma",
  subtitle = "Yolcu sınıflarına göre yaş dağılımı ve hayatta kalma durumu",
  x = "Yolcu Sınıfı",
  y = "Yaş",
  color = "Hayatta Kalma Durumu",
  caption = "Veri: Titanic"
) +
  
  # --------------------------
# THEME
# --------------------------

theme_minimal()