# VBA203 – Veri Görselleştirme: Tarih Değişkenleri ve Çizgi Grafikleri



library(ggplot2)


# Tarih değişkeni oluşturma

# Metin tarihlerini `as.Date()` ile dönüştürme

tarih_metin = c("01.03.2024", "15.03.2024", "28.03.2024")
class(tarih_metin)

# Gün.ay.yıl biçimindeki metni tarihe çevir.
tarih = as.Date(tarih_metin, format = "%d.%m.%Y")
class(tarih)
tarih

tarih_1 = as.Date("05/11/2024", format = "%d/%m/%Y")
tarih_2 = as.Date("2024-11-05", format = "%Y-%m-%d")
tarih_1
tarih_2

# Not: Ay ve gün adları bilgisayarın dil ayarına göre değişebilir.
# Ayrı sütunlardan tarih oluşturma: `airquality`

veri_hava = airquality
veri_hava$Yil = 1973

# Yıl, ay ve günü tek metinde birleştir.
veri_hava$tarih_metin = paste(veri_hava$Yil,
                               veri_hava$Month,
                               veri_hava$Day,
                               sep = "-")
head(veri_hava[, c("Yil", "Month", "Day", "tarih_metin")])

veri_hava$Tarih = as.Date(veri_hava$tarih_metin,
                            format = "%Y-%m-%d")
class(veri_hava$Tarih)
head(veri_hava[, c("Tarih", "Temp")])

# `seq()` ile tarih dizisi oluşturma

baslangic = as.Date("2024-01-01")
bitis = as.Date("2024-01-07")
gunler = seq(from = baslangic, to = bitis, by = "day")
gunler

ayin_ilk_gunu = as.Date("2024-01-01")
aylar = seq(from = ayin_ilk_gunu, by = "month", length.out = 6)
aylar

# `format()` ile tarih bilgilerini çıkarma

ornek_tarih = as.Date("2024-11-05")
yil = format(ornek_tarih, "%Y")
ay = format(ornek_tarih, "%m")
gun = format(ornek_tarih, "%d")

yil
ay
gun
class(yil)  # format() metin üretir.


# Tarih değişkenleriyle çizgi grafikleri

# `economics` verisiyle temel grafik

class(economics$date)
head(economics[, c("date", "unemploy")])

ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line(color = "steelblue", linewidth = 0.8) +
  labs(title = "Tarihe Göre İşsiz Kişi Sayısı",
       x = "Tarih", y = "İşsiz kişi sayısı (bin)") +
  theme_minimal()

# `airquality` verisiyle çizgi ve noktalar

ggplot(veri_hava, aes(x = Tarih, y = Temp)) +
  geom_line(color = "darkgreen", linewidth = 0.7) +
  geom_point(color = "darkgreen", size = 1.2) +
  labs(title = "1973 Yılında Günlük Sıcaklık Değerleri",
       x = "Tarih", y = "Sıcaklık (°F)") +
  theme_minimal()

# `scale_x_date()` ile tarih eksenini düzenleme

ggplot(veri_hava, aes(x = Tarih, y = Temp)) +
  geom_line(color = "steelblue") +
  scale_x_date(date_breaks = "1 month", date_labels = "%m.%Y") +
  labs(title = "Sıcaklık Değerleri: Aylık Tarih İşaretleri",
       x = "Tarih (ay.yıl)", y = "Sıcaklık (°F)") +
  theme_minimal()

# `subset()` ile tarih aralığı seçme

ilk_tarih = as.Date("1973-06-01")
son_tarih = as.Date("1973-06-30")

haziran = subset(veri_hava, Tarih >= ilk_tarih & Tarih <= son_tarih)
head(haziran[, c("Tarih", "Temp")])

ggplot(haziran, aes(x = Tarih, y = Temp)) +
  geom_line(color = "steelblue") +
  geom_point(size = 1.5) +
  scale_x_date(date_breaks = "1 week", date_labels = "%d.%m") +
  labs(title = "Haziran 1973 Sıcaklık Değerleri",
       x = "Gün.Ay", y = "Sıcaklık (°F)") +
  theme_minimal()

# `economics_long` ile birden fazla değişkeni gösterme

head(economics_long[, c("date", "variable", "value")])

ggplot(economics_long, aes(x = date, y = value)) +
  geom_line(color = "steelblue", linewidth = 0.6) +
  facet_wrap(~ variable, scales = "free_y") +
  labs(title = "Ekonomik Göstergelerin Tarihe Göre Grafikleri",
       x = "Tarih", y = "Değer") +
  theme_minimal()


# Sık yapılan hata: Tarihi metin olarak bırakmak

ornek = data.frame(
  Tarih = c("01.01.2024", "01.02.2024", "01.10.2024", "01.11.2024"),
  Deger = c(12, 15, 18, 14)
)
class(ornek$Tarih)

ggplot(ornek, aes(x = Tarih, y = Deger, group = 1)) +
  geom_line(color = "firebrick") +
  geom_point(size = 2) +
  labs(title = "Tarih Metin Olarak Tutulursa",
       x = "Metin tarih", y = "Örnek değer") +
  theme_minimal()

ornek$Tarih = as.Date(ornek$Tarih, format = "%d.%m.%Y")
class(ornek$Tarih)

ggplot(ornek, aes(x = Tarih, y = Deger)) +
  geom_line(color = "darkgreen") +
  geom_point(size = 2) +
  scale_x_date(date_breaks = "2 months", date_labels = "%m.%Y") +
  labs(title = "Tarih Date Türüne Dönüştürülürse",
       x = "Tarih", y = "Örnek değer") +
  theme_minimal()


# Alıştırmalar

# Alıştırma 1: Metinden tarihe

# ÇÖZÜM :
# tarihler = c("23.04.2024", "19.05.2024")
# class(tarihler)
# tarihler = as.Date(tarihler, format = "%d.%m.%Y")
# class(tarihler)
# tarihler

# Alıştırma 2: Tarih dizisi ve tarih bilgisi

# ÇÖZÜM:
# baslangic = as.Date("2024-01-01")
# tarihler = seq(from = baslangic, by = "month", length.out = 5)
# tarihler
# format(tarihler[1], "%Y")
# format(tarihler[1], "%m")

# Alıştırma 3: Tarih aralığında grafik

# ÇÖZÜM:
# ilk_tarih = as.Date("1973-07-01")
# son_tarih = as.Date("1973-07-31")
# temmuz = subset(veri_hava, Tarih >= ilk_tarih & Tarih <= son_tarih)
#
# ggplot(temmuz, aes(x = Tarih, y = Temp)) +
#   geom_line(color = "steelblue") +
#   geom_point(size = 1.5) +
#   scale_x_date(date_breaks = "1 week", date_labels = "%d.%m") +
#   labs(title = "Temmuz 1973 Sıcaklık Değerleri",
#        x = "Tarih", y = "Sıcaklık (°F)") +
#   theme_minimal()
