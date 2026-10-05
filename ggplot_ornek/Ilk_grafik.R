# ============================================================
# VERİ GÖRSELLEŞTİRME - HAFTA 2
# İlk ggplot2 Uygulaması: mtcars
# ============================================================


# 1. VERİ SETİNİ OKUMA
# ------------------------------------------------------------

df <- read.csv("mtcars.csv", header = TRUE)


# 2. VERİ SETİNİ İNCELEME
# ------------------------------------------------------------

# İlk 6 gözlemi gösterir
head(df)

# Veri setinin yapısını gösterir
str(df)

# Satır ve sütun sayısını gösterir
dim(df)

# Değişken isimlerini gösterir
names(df)


# 3. DEĞİŞKENLER
# ------------------------------------------------------------

# mpg  : Yakıt verimliliği (mil/galon)
# cyl  : Silindir sayısı
# disp : Motor hacmi (inç küp)
# hp   : Motor gücü (beygir gücü)
# drat : Arka aks oranı
# wt   : Araç ağırlığı (1000 lbs)
# qsec : Çeyrek mil süresi (saniye)
# vs   : Motor tipi (0 = V tipi, 1 = sıralı)
# am   : Şanzıman (0 = otomatik, 1 = manuel)
# gear : İleri vites sayısı
# carb : Karbüratör sayısı


# 4. GGPLOT2 PAKETİNİ YÜKLEME
# ------------------------------------------------------------

library(ggplot2)


# 5. İLK GRAFİĞİMİZ
# ------------------------------------------------------------
ggplot(data = df,
       aes(x = disp, y = mpg)) +
  geom_point()


# data = df
# Kullanacağımız veri setini belirtir.

# mapping ==> aes(x = disp, y = mpg)
# # x = disp  - Motor hacmi x ekseninde
# y = mpg   - Yakıt verimliliği y ekseninde
# layer ==> geom_point() -> Her otomobili bir nokta ile göster
# Bu nedenle oluşturduğumuz grafik bir saçılım grafiğidir.

#--------------------------------------------------------------

ggplot(data = df,
       aes(x = disp, y = mpg)) +
  geom_point(color = "steelblue",
             size = 3,
             alpha = 0.7)

# color -> Noktaların rengini belirler
# size  -> Noktaların büyüklüğünü belirler
# alpha -> Noktaların saydamlığını belirler
#          1 = tamamen opak
#          0 = tamamen sayda m

# Bir görsel özellik bütün gözlemler için SABİT olacaksa
# , geom_point() içine yazılır.
#
# Örnek:
# color = "steelblue" -> Bütün noktalar aynı renktedir.
# size = 3            -> Bütün noktalar aynı büyüklüktedir.
# alpha = 0.7         -> Bütün noktalar aynı saydamlıktadır.

# GÖRSEL ÖZELLİKLER: EŞLEME ve SABİT DEĞER
# ------------------------------------------------------------

# Bir görsel özellik bir DEĞİŞKENE göre değişecekse
# aes() İÇİNE yazılır.
#
# Örnek:
# color = hp  -> Noktaların rengi hp değişkenine göre değişir.
# size = wt   -> Noktaların büyüklüğü wt değişkenine göre değişir.
#

ggplot(data = df,
       aes(x = disp,
           y = mpg,
           color = hp,
           size = wt)) +
  geom_point(alpha = 0.7)




#--------------------------------------------------------------
ggplot(data = df,
       aes(x = disp, y = mpg,
           color = hp)) +
  geom_point(size = 3)

# color = hp
# Motor gücü (hp) RENK görsel özelliğine eşlendi.

#--------------------------------------------------------------

ggplot(data = df,
       aes(x = disp,
           y = mpg,
           color = hp,
           size = wt)) +
  geom_point(alpha = 0.7)

#--------------------------------------------------------------


Sys.setlocale(category = "LC_ALL", locale = "Turkish")

ggplot(data = df,
       aes(x = disp, y = mpg,
           color = hp,
           size = wt)) +
  geom_point(alpha = 0.7) +
  xlab(expression("Motor Hacmi (inç^3)")) +
  ylab("Yakıt Verimliliği (mil/galon)")

# xlab() - x ekseninin başlığını değiştirir
# ylab() -> y ekseninin başlığını değiştirir

ggplot(data = df,
       aes(x = disp, y = mpg,
           color = hp,
           size = wt)) +
  geom_point(alpha = 0.7) +
  xlab(expression("Motor Hacmi (" * "inç"^3 * ")")) +
  ylab("Yakıt Verimliliği (mil/galon)")

#-------------------------------------------------------------
ggplot(data = df,
       aes(x = disp, y = mpg)) +
  geom_point(
    color = "steelblue",
    size = 3,
    alpha = 0.7
  ) +
  labs(
    title = "Motor Hacmi ve Yakıt Verimliliği",
    x = "Motor Hacmi (inç³)",
    y = "Yakıt Verimliliği (mil/galon)"
  )

#-------------------------------------------------------------
# scale_color_gradient()
# Sürekli bir değişkenin renk ölçeğini belirler.

# low  -> düşük değerlerin rengi
# high -> yüksek değerlerin rengi

ggplot(data = df,
       aes(x = disp,
           y = mpg,
           color = hp,
           size = wt)) +
  geom_point(alpha = 0.7) +
  scale_color_gradient(
    low = "lightblue",
    high = "darkblue"
  ) +
  xlab("Motor Hacmi (inç küp)") +
  ylab("Yakıt Verimliliği (mil/galon)")

#--------------------------------------------------------------

# annotate() -> Grafiğin üzerine açıklama eklemek için kullanılır.
#
# "text" -> Eklenecek öğenin metin olduğunu belirtir.
# x ve y  -> Yazının grafikteki konumunu belirler.
# label   -> Grafikte gösterilecek metindir.
# \n      -> Metinde alt satıra geçer.

ggplot(data = df,
       aes(x = disp, y = mpg,
           color = hp,
           size = wt)) +
  geom_point(alpha = 0.7) +
  xlab("Motor Hacmi (inç küp)") +
  ylab("Yakıt Verimliliği (mil/galon)") +
  annotate("text",
           x = 400,
           y = 30,
           label = "Motor hacmi arttıkça\nmpg azalma eğiliminde")

#------------------------------------------------------------

# GRAFİĞE AÇIKLAMA VE OK EKLEME
# ------------------------------------------------------------

# annotate("text")    -> Grafik üzerine metin ekler.
# annotate("segment") -> İki nokta arasına çizgi çizer.
#
# x, y       -> Çizginin başlangıç noktası
# xend, yend -> Çizginin bitiş noktası
# arrow()     -> Çizginin ucuna ok ekler.

ggplot(data = df,
       aes(x = disp, y = mpg)) +
  geom_point(
    color = "steelblue",
    size = 3,
    alpha = 0.7
  ) +
  xlab("Motor Hacmi (inç küp)") +
  ylab("Yakıt Verimliliği (mil/galon)") +
  
  # Grafik üzerine açıklama
  annotate("text",
           x = 400, y = 30,
           label = "Dikkat çeken gözlem") +
  
  # Açıklamadan ilgili noktaya ok çizme
  annotate("segment",
           x = 380, y = 29,
           xend = 330, yend = 24,
           arrow = arrow())

# HATIRLA:
# aes(color = hp)              -> hp RENK ile temsil edilir.
# geom_point(color = "blue")  -> tüm noktalar MAVİ çizilir.
