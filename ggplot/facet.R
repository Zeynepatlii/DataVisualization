# ============================================================
# VBA203 - VERI GORSELLESTIRME
# ggplot2 ILE COK PANELLI GRAFIKLER: facet_wrap() ve facet_grid()
# ============================================================

# 1. FACETING NEDIR?
library(ggplot2)

# mtcars R ile hazir gelir. Ders notundaki tum orneklerde ayni ad kullanilir.
df = read.csv("mtcars.csv")

# wt: agirlik (1000 libre), mpg: mil/galon, cyl: silindir sayisi
# am: vites turu (0 = otomatik, 1 = manuel)
head(df)

# 1.1. Ayni grafikte renklerle gruplama

ggplot(df, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(title = "Silindir Sayısına Göre Araçlar - Tek Panel",
       x = "Ağırlık (1000 libre)", y = "Mil/Galon",
       color = "Silindir Sayısı") +
  theme_minimal()

# Yorum: Gruplar ayni panelde farkli renklerle gosterilir.

# 1.2. Ayni veriyi ayri panellerde gosterme

df$cyl = factor (df$cyl, levels = c (4, 6, 8),
                 labels = c("4 Silindir", "6 Silindir", "8 Silindir"))


ggplot(df, aes(x = wt, y  = mpg)) +
  geom_point(aes(color = cyl), size = 2) +
  facet_wrap(~cyl) +
  labs( title = "Silindir Sayısına Göre Ayrı Paneller", color = "Silindir") +
  theme_minimal()


# 2. facet_wrap() ILE PANEL YERLESIMI
# 2.1. Panelleri alt alta yerlestirme

ggplot(df, aes(x = wt, y  = mpg)) +
  geom_point(aes(color = cyl), size = 2) +
  facet_wrap(~cyl, ncol = 1) +
  labs( title = "Silindir Sayısına Göre Ayrı Paneller", 
        x = "Ağırlık", y = "Mil/Galon",color = "Silindir") +
  theme_minimal()


# 3. facet_grid() ILE IKI DEGISKENE GORE PANELLER

# facet_grid(satir ~ sutun): am satirlari, cyl sutunlari belirler.


#mpg yakıt verimliliği
#wt ağırlık

df$am = factor(df$am,
               levels = c(0, 1),
               labels = c("Otomatik", "Manuel"))


ggplot(df, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl), size = 3) +
  facet_grid(am ~ cyl) +
  labs(title = "Vites Türü ve Silindir Sayısına Göre Araçlar",
       x = "Ağırlık (1000 libre)", y = "Mil/Galon", 
       color = "Silindir Sayısı") +
  theme_minimal()

# facet_grid(cyl ~ am) yazarsak ne degisir?

# 4. SABIT VE SERBEST OLCEKLER

# 4.1. Sabit olcek: her panelde ayni eksen araliklari

ggplot(df, aes(x = wt, y = mpg)) +
  geom_point(color = "steelblue", size = 3) +
  facet_wrap(~ cyl, scales = "fixed") +
  scale_x_continuous(
    breaks = 1:6,
    limits = c(1, 6)
  )
labs(title = "Sabit Ölçekler", x = "Ağırlık", y = "Mil/Galon") +
  theme_minimal()

# 4.2. Serbest olcek: her panel kendi verisine gore olceklenir
ggplot(df, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  facet_wrap(~ cyl, scales = "free") +
  labs(title = "Serbest Ölçekler", x = "Ağırlık", y = "Mil/Galon"
       ,color = "Silindir") +
  theme_light()

# 4.3. Yalnizca X eksenini serbest birakma
ggplot(df, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  facet_wrap(~ cyl, scales = "free_x") +
  labs(title = "Yalnızca X Ekseni Serbest", x = "Ağırlık", y = "Mil/Galon") +
  theme_minimal()

# Secenekler: "fixed", "free", "free_x", "free_y"
# Not: facet_grid() icin ayni sutundaki paneller X,
# ayni satirdaki paneller Y olcegini paylasir.



# 5. FARKLI GRAFIK TURLERIYLE FACETING
# 5.1. Silindir sayisina gore histogramlar
ggplot(df, aes(x = mpg)) +
  geom_histogram(binwidth = 3, fill = "steelblue", color = "white") +
  facet_wrap(~ cyl) +
  labs(title = "Silindir Sayısına Göre Yakıt Verimliliği Dağılımı",
       x = "Mil/Galon", y = "Araç Sayısı") +
  theme_minimal()

# Yorum: Gozlem sayilari farkliysa sutun yukseklikleri oran degildir.

# 5.2. Vites turune gore kutu grafikleri
ggplot(df, aes(x = factor(cyl), y = mpg, fill = cyl)) +
  geom_boxplot() +
  facet_wrap(~ am) +
  labs(title = "Vites Türüne Göre Silindir Gruplarında MPG",
       x = "Silindir Sayısı", y = "Mil/Galon", fill = "Silindir") +
  theme_minimal()


# 6. facet_wrap() ve facet_grid() KARSILASTIRMASI
# facet_wrap(~ cyl): tek degiskenin gruplari, nrow/ncol ile yerlesim
# facet_grid(am ~ cyl): iki degiskenin satir x sutun kombinasyonlari

# 7. UYGULAMA 
# 1. wt ile mpg iliskisini facet_wrap(~ gear) kullanarak gosteriniz.
#    Her panel neyi temsil ediyor?
# 2. Grafigi ncol = 1 ve nrow = 1 ile yeniden ciziniz.
#    Hangisi daha okunakli?
# 3. facet_grid(am ~ gear) ile grafik ciziniz.
#    Satir ve sutunlarin anlamini aciklayiniz.
# 4. scales = "fixed" ve scales = "free" ile iki grafik ciziniz.
#    Gruplar arasi karsilastirmada hangisi daha guvenilir? Neden?



