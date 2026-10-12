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

titanic =  read.csv("titanik_veriseti.csv")


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

colnames(titanic)[colnames(titanic) == "PassengerId"] = "Yolcu_No"
colnames(titanic)[colnames(titanic) == "Survived"]    = "Hayatta_Kalma"
colnames(titanic)[colnames(titanic) == "Pclass"]      = "Yolcu_Sinifi"
colnames(titanic)[colnames(titanic) == "Name"]        = "Isim"
colnames(titanic)[colnames(titanic) == "Sex"]         = "Cinsiyet"
colnames(titanic)[colnames(titanic) == "Age"]         = "Yas"
colnames(titanic)[colnames(titanic) == "SibSp"]       = "Kardes_Es"
colnames(titanic)[colnames(titanic) == "Parch"]       = "Ebeveyn_Cocuk"
colnames(titanic)[colnames(titanic) == "Ticket"]      = "Bilet_No"
colnames(titanic)[colnames(titanic) == "Fare"]        = "Bilet_Ucreti"
colnames(titanic)[colnames(titanic) == "Cabin"]       = "Kabin"
colnames(titanic)[colnames(titanic) == "Embarked"]    = "Binis_Limani"


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

titanic$Hayatta_Kalma = factor(
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

titanic$Yolcu_Sinifi = factor(
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

titanic$Cinsiyet = factor(
  titanic$Cinsiyet,
  levels = c("female", "male"),
  labels = c("Kadın", "Erkek")
)


# ------------------------------------------------------------
# Biniş limanı
# ------------------------------------------------------------

titanic$Binis_Limani = factor(
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

yas_ozet = data.frame(
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
    bins = 15,
    fill = "steelblue",
    color = "white", 
    na.rm = TRUE
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
  aes(x = Hayatta_Kalma, color = Hayatta_Kalma, 
      fill = Hayatta_Kalma)
) +
  geom_bar(
    #fill = "steelblue"
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

#geom_bar()  Kişileri sayar.
#after_stat()  Hesaplanan sayılara erişmemizi sağlar.
#geom_text()  Hesapladığımız yüzdeleri grafiğe yazar.

#count	Kategorideki kişi sayısı
#sum(count)	Toplam kişi sayısı
#* 100	Yüzde hesaplama
#round(..., 1)	Bir ondalık basamağa yuvarlama
#paste0(..., "%")	Yüzde işaretini ekleme


ggplot(
  titanic,
  aes(
    x = Hayatta_Kalma,
    color = Hayatta_Kalma,
    fill = Hayatta_Kalma
  )
) +
  geom_bar() +
  geom_text(
    stat = "count",
    aes(
      label = after_stat(
        paste0(round(count / sum(count) * 100, 1), "%")
      )
    ),
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

#Birlikte yüzdeleri hesaplayalım

ggplot(
  titanic,
  aes(
    x = Cinsiyet,
    color = Cinsiyet,
    fill = Cinsiyet
  )
) +
  geom_bar() +
  geom_text(
    stat = "count",
    aes(
      label = after_stat(
        paste0(round(count / sum(count) * 100, 1), "%")
      )
    ),
    vjust = -0.5
  ) +
  labs(
    title = "Cinsiyete göre yolcu dağılımı",
    x = "Cinsiyet",
    y = "Yolcu Sayısı"
  ) +
  theme_minimal()

# ============================================================
# CİNSİYETE GÖRE HAYATTA KALMA ORANLARININ GÖRSELLEŞTİRİLMESİ
# ============================================================

# ARAŞTIRMA SORUSU:
# Titanic'te cinsiyete göre yolcuların hayatta kalma
# oranları nedir?

# ------------------------------------------------------------
# 1. GRAFİĞİN OLUŞTURULMASI
# ------------------------------------------------------------

ggplot(
  titanic,
  
  aes(
    # X ekseninde cinsiyet kategorileri yer alacaktır.
    # Kadın ve erkek yolcular ayrı sütunlarla gösterilecektir.
    x = Cinsiyet,
    
    # Hayatta kalma durumuna göre sütunların içi renklendirilir.
    # Böylece hayatta kalanlar ve kalmayanlar ayırt edilir.
    fill = Hayatta_Kalma
  )
  
) +
  
  # ----------------------------------------------------------
# 2. SÜTUN GRAFİĞİ
# ----------------------------------------------------------

geom_bar(
  # geom_bar() her kategorideki gözlem sayısını
  # otomatik olarak hesaplar.
  
  # position = "fill":
  # Her cinsiyet grubunun toplamını 1 (%100) kabul eder.
  #
  # Böylece kadın ve erkek yolcuların sayıları yerine,
  # her cinsiyet içerisindeki hayatta kalma oranları
  # karşılaştırılabilir.
  #
  # Örneğin:
  # Kadınların %74,2'si hayatta kalmıştır.
  # Erkeklerin %18,9'u hayatta kalmıştır.
  
  position = "fill"
) +
  
  
  # ----------------------------------------------------------
# 3. SÜTUNLARIN İÇİNE YÜZDELERİN YAZDIRILMASI
# ----------------------------------------------------------

geom_text(
  
  # geom_text() grafiğin üzerine yazı eklememizi sağlar.
  
  # stat = "count":
  # R, her kategoride kaç gözlem olduğunu hesaplar.
  #
  # Örneğin:
  # Hayatta kalan kadın sayısı = 233
  # Hayatta kalmayan kadın sayısı = 81
  #
  # Hayatta kalan erkek sayısı = 109
  # Hayatta kalmayan erkek sayısı = 468
  
  stat = "count",
  
  aes(
    
    # label:
    # Grafiğin üzerinde hangi bilginin yazılacağını belirtir.
    
    # after_stat():
    # R, gözlem sayılarını hesapladıktan sonra
    # bu sayıları kullanarak yeni hesaplamalar yapmamızı sağlar.
    
    label = after_stat(
      
      # paste0():
      # Birden fazla ifadeyi birleştirir.
      # Burada hesaplanan sayının sonuna "%" işareti ekler.
      #
      # Örneğin:
      # paste0(74.2, "%")
      # Sonuç: "74.2%"
      
      paste0(
        
        # round():
        # Hesaplanan yüzdeleri yuvarlar.
        #
        # İkinci parametre olan 1,
        # virgülden sonra bir basamak gösterileceğini belirtir.
        
        round(
          
          # ------------------------------------------------
          # YÜZDE HESAPLAMA
          # ------------------------------------------------
          
          # Yüzde hesaplama formülü:
          #
          # İlgili gruptaki kişi sayısı
          # ---------------------------------- x 100
          # Aynı cinsiyetteki toplam kişi sayısı
          
          count / ave(count, x, FUN = sum) * 100,
          
          1
        ),
        
        "%"
      )
    )
  ),
  
  # --------------------------------------------------------
  # 4. YAZILARIN KONUMLANDIRILMASI
  # --------------------------------------------------------
  
  # position_fill(vjust = 0.5):
  # Yüzdeleri her renkli bölümün ortasına yerleştirir.
  #
  # vjust = 0.5 -> Ortada
  #
  # Buradaki 0.5 bir ortalama değildir.
  # Yazının konumunu belirler.
  
  position = position_fill(vjust = 0.5),
  
  # Yazı rengini beyaz yapar.
  color = "white",
  
  # Yazı büyüklüğünü belirler.
  size = 5
  
) +
  
  
# ----------------------------------------------------------
# 5. Y EKSENİNİN YÜZDE OLARAK GÖSTERİLMESİ
# ----------------------------------------------------------

scale_y_continuous(
  
  # position = "fill" kullanıldığında
  # Y eksenindeki değerler 0 ile 1 arasındadır.
  #
  # 0    -> %0
  # 0.25 -> %25
  # 0.50 -> %50
  # 0.75 -> %75
  # 1    -> %100
  #
  # scales::label_percent() bu değerleri
  # yüzde biçiminde göstermemizi sağlar.
  #
  # Bu işlem veriyi değiştirmez.
  # Yalnızca eksen etiketlerinin görünümünü değiştirir.
  
  labels = scales::label_percent()
  
) +
  
  
# ----------------------------------------------------------
# 6. GRAFİK BAŞLIKLARI
# ----------------------------------------------------------

labs(
  title = "Cinsiyete Göre Hayatta Kalma Oranları",
  
  subtitle = "Kadın ve erkek yolcuların grup içi yüzdeleri",
  
  x = "Cinsiyet",
  
  y = "Oran (%)",
  
  fill = "Hayatta Kalma Durumu",
  
  caption = "Veri: Titanic"
) +
  
  
  # ----------------------------------------------------------
# 7. GRAFİK TEMASI
# ----------------------------------------------------------

# theme_minimal():
# Gereksiz arka plan öğelerini azaltarak
# sade ve okunabilir bir grafik oluşturur.

theme_minimal()


# ============================================================
# EK AÇIKLAMA: ave() FONKSİYONU
# ============================================================

# ave() fonksiyonu, verileri belirli gruplara ayırarak
# her grup için ayrı hesaplama yapmamızı sağlar.
#
# Genel kullanımı:
#
# ave(degerler, gruplar, FUN = islem)
#
# degerler : Üzerinde işlem yapılacak sayılar
# gruplar  : Hangi gruba ait olduklarını gösteren değişken
# FUN      : Yapılacak işlem (sum, mean vb.)


# ------------------------------------------------------------
# BASİT BİR ÖRNEK
# ------------------------------------------------------------

# Dört öğrencinin notları
notlar = c(60, 70, 80, 90)

# Öğrencilerin sınıfları
sinif = c("A", "A", "B", "B")

# Her sınıfın toplam notunu hesaplayalım.

ave(notlar, sinif, FUN = sum)

# SONUÇ:
# 130 130 170 170
#
# A sınıfı:
# 60 + 70 = 130
#
# B sınıfı:
# 80 + 90 = 170
#
# ave(), her öğrencinin karşısına
# ait olduğu sınıfın toplamını yazar.


# ------------------------------------------------------------
# TITANIC GRAFİĞİNDE ave() NE YAPIYOR?
# ------------------------------------------------------------

# ave(count, x, FUN = sum)
#
# count:
# Her cinsiyet ve hayatta kalma kategorisindeki kişi sayısı.
#
# x:
# Grafikteki cinsiyet kategorisini temsil eder.
#
# FUN = sum:
# Aynı cinsiyete ait kişi sayılarını toplar.
#
# Kadın:
# 81 + 233 = 314
#
# Erkek:
# 468 + 109 = 577
#
# Böylece her kategorinin yüzdesi,
# kendi cinsiyet grubunun toplamına göre hesaplanır.


# ------------------------------------------------------------
# YÜZDE HESAPLAMA ÖRNEKLERİ
# ------------------------------------------------------------

# Hayatta kalan kadınların yüzdesi
233 / 314 * 100
# %74,2

# Hayatta kalmayan kadınların yüzdesi
81 / 314 * 100
# %25,8

# Hayatta kalan erkeklerin yüzdesi
109 / 577 * 100
# %18,9

# Hayatta kalmayan erkeklerin yüzdesi
468 / 577 * 100
# %81,1


# ============================================================
# GRAFİĞİN YORUMLANMASI
# ============================================================

# Kadın yolcuların %74,2'si hayatta kalırken,
# erkek yolcuların %18,9'u hayatta kalmıştır.
#
# Kadınlarda hayatta kalma oranı erkeklerden daha yüksektir.
#




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



# ============================================================
# 12. YOLCU SINIFI x HAYATTA KALMA
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

#Yolcu sınıfına göre hayatta kalma oranlarının grafik üzerine yazılması

ggplot(titanic, 
       aes(
         x = Yolcu_Sinifi,
         fill = Hayatta_Kalma)) +
  geom_bar(position = "fill",
           ) +
  geom_text(
    stat = "count",
    aes(label = after_stat(
        paste0(round(count / ave(count, x, FUN = sum) * 100,1),"%"))),
    position = position_fill(vjust = 0.5),
    color = "white",
    size = 5
    
  ) +
scale_y_continuous(
  
  labels = scales::label_percent()
  
) +

labs(
  title = "Yolcu Sınıfına Göre Hayatta Kalma Oranları",
  x = "Yolcu Sınıfı",
  y = "Oran (%)",
  fill = "Hayatta Kalma Durumu"
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
# GRAFİĞİN YORUMLANMASI
# ============================================================

# Bu saçılım grafiğinde (scatter plot),
# X ekseninde yolcuların yaşları,
# Y ekseninde ise ödedikleri bilet ücretleri gösterilmektedir.
#
# Her nokta bir yolcuyu temsil etmektedir.
#
# Noktaların renkleri yolcuların hayatta kalma
# durumlarına göre belirlenmiştir.
#
# Grafikte yolcuların büyük bölümünün düşük bilet
# ücretlerinde yoğunlaştığı görülmektedir.
#
# Yüksek bilet ücreti ödeyen yolcular arasında
# hayatta kalanların daha fazla olduğu dikkat çekmektedir.
#
# Bununla birlikte düşük bilet ücreti ödeyen yolcular
# arasında hem hayatta kalanlar hem de kalamayanlar vardır.
#
# Yaş ile bilet ücreti arasında belirgin bir doğrusal
# ilişki gözlenmemektedir.
#
# Ayrıca bazı yolcuların diğerlerine göre çok daha
# yüksek bilet ücretleri ödediği görülmektedir.
# Bu gözlemler yüksek değerli uç gözlemler olarak
# değerlendirilebilir.
#
# SONUÇ:
# Grafik, bilet ücreti ile hayatta kalma durumu
# arasında olası bir ilişkiye işaret etmektedir.
#
# Ancak yalnızca bu grafikten hareketle yüksek
# bilet ücreti ödemenin hayatta kalmayı artırdığı
# sonucuna ulaşılamaz.
#
# Ayrıca noktaların üst üste gelmesi nedeniyle
# gruplardaki yolcu sayıları doğrudan karşılaştırılamaz.

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