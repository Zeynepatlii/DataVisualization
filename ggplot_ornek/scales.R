# ============================================================
# 9. SCALES (ÖLÇEKLER)
# ============================================================

# Önceki örneklerde değişkenleri görsel özelliklere eşledik.
#
# Örneğin:
#
# x = disp
# y = mpg
# color = hp
#
# Bu eşleme, hangi değişkenin hangi görsel özellikle
# gösterileceğini belirler.
#
# SCALE ise bu eşlemenin grafikte NASIL gösterileceğini belirler.
#
# Örneğin:
#
# hp -> color 
#
# Mapping: hp değişkeninin renk ile gösterileceğini belirler.
# Scale: hp değerlerinin hangi renklerle gösterileceğini belirler.


# ------------------------------------------------------------
# 1. TEMEL GRAFİK
# ------------------------------------------------------------

# disp değişkenini x eksenine,
# mpg değişkenini y eksenine,
# hp değişkenini ise renge eşliyoruz.

ggplot(
  df,
  aes(
    x = disp,
    y = mpg,
    color = hp
  )
) +
  geom_point(
    size = 3,
    alpha = 0.7
  ) +
  labs(
    title = "Motor Hacmi ve Yakıt Verimliliği",
    x = "Motor Hacmi (disp)",
    y = "Yakıt Verimliliği (mpg)",
    color = "Motor Gücü (hp)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 2. SCALE NEDİR?
# ------------------------------------------------------------

# Scale (ölçek), veri değerlerinin grafikte kullanılan
# görsel değerlere nasıl dönüştürüleceğini kontrol eder.
#
# Örneğin:
#
# Veri değeri            Görsel özellik
# ----------             --------------
# disp          ->       x eksenindeki konum
# mpg           ->       y eksenindeki konum
# hp            ->       renk
#
# ggplot2 gerekli ölçekleri varsayılan olarak otomatik oluşturur.
# Ancak bu ölçekleri istediğimiz zaman değiştirebiliriz.


# ------------------------------------------------------------
# 3. RENK ÖLÇEĞİNİN DEĞİŞTİRİLMESİ
# ------------------------------------------------------------

# hp sürekli bir değişkendir.
# Bu nedenle sürekli bir renk ölçeği kullanabiliriz.
#
# scale_color_viridis_c()
# hp değerlerinin grafikte hangi renklerle gösterileceğini
# kontrol eder.

ggplot(
  df,
  aes(
    x = disp,
    y = mpg,
    color = hp
  )
) +
  geom_point(
    size = 3,
    alpha = 0.7
  ) +
  scale_color_viridis_c() +
  labs(
    title = "Motor Hacmi ve Yakıt Verimliliği",
    x = "Motor Hacmi (disp)",
    y = "Yakıt Verimliliği (mpg)",
    color = "Motor Gücü (hp)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 4. X EKSENİ ÖLÇEĞİNİN DEĞİŞTİRİLMESİ
# ------------------------------------------------------------

# Scale yalnızca renkleri kontrol etmez.
# X ve Y eksenleri de birer ölçeğe sahiptir.
#
# scale_x_continuous():
# Sürekli bir x ekseninin görünümünü kontrol eder.
#
# breaks:
# Eksende hangi değerlerin işaretleneceğini belirler.
#
# seq(100, 500, 100):
# 100'den 500'e kadar 100'er artan değerler oluşturur.
#
# Sonuç:
# 100, 200, 300, 400, 500

ggplot(
  df,
  aes(
    x = disp,
    y = mpg,
    color = hp
  )
) +
  geom_point(
    size = 3,
    alpha = 0.7
  ) +
  scale_x_continuous(
    breaks = seq(100, 500, 100)
  ) +
  scale_color_viridis_c() +
  labs(
    title = "Motor Hacmi ve Yakıt Verimliliği",
    x = "Motor Hacmi (disp)",
    y = "Yakıt Verimliliği (mpg)",
    color = "Motor Gücü (hp)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 5. SIK KULLANILAN SCALE FONKSİYONLARI
# ------------------------------------------------------------

# EKSEN ÖLÇEKLERİ
#
# scale_x_continuous()   -> Sürekli x ekseni



# ------------------------------------------------------------
# 1. scale_y_continuous() -> Sürekli y ekseni
# ------------------------------------------------------------

# Sürekli sayısal Y eksenini düzenler.
#
# Burada Y ekseninde 10, 15, 20, 25, 30 ve 35
# değerlerinin gösterilmesini istiyoruz.

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 3) +
  scale_y_continuous(
    breaks = seq(10, 35, 5)
  ) +
  labs(
    title = "Araç Ağırlığı ve Yakıt Verimliliği",
    x = "Araç Ağırlığı",
    y = "Yakıt Verimliliği"
  ) +
  theme_minimal()

# ------------------------------------------------------------
# 2. scale_x_discrete()  --> Kategorik x ekseni
# ------------------------------------------------------------

# Kategorik X eksenini düzenler.
#
# mtcars veri setinde cyl sayısal olarak saklanmaktadır.
#
# factor(cyl):
# Silindir sayısını kategorik değişkene dönüştürür.
#
# labels:
# Kategori isimlerini değiştirmemizi sağlar.

ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "steelblue") +
  scale_x_discrete(
    labels = c(
      "4" = "4 Silindir",
      "6" = "6 Silindir",
      "8" = "8 Silindir"
    )
  ) +
  labs(
    title = "Silindir Sayısına Göre Araç Dağılımı",
    x = "Silindir Sayısı",
    y = "Araç Sayısı"
  ) +
  theme_minimal()



# ------------------------------------------------------------
# 3. scale_y_discrete()  -> Kategorik y ekseni
# ------------------------------------------------------------

# Kategorik değişken Y ekseninde de gösterilebilir.
#
# Bu örnekte silindir sayısı Y eksenindedir.
# Böylece yatay bir sütun grafiği elde edilir.

ggplot(mtcars, aes(y = factor(cyl))) +
  geom_bar(fill = "steelblue") +
  scale_y_discrete(
    labels = c(
      "4" = "4 Silindir",
      "6" = "6 Silindir",
      "8" = "8 Silindir"
    )
  ) +
  labs(
    title = "Silindir Sayısına Göre Araç Dağılımı",
    x = "Araç Sayısı",
    y = "Silindir Sayısı"
  ) +
  theme_minimal()


# ============================================================
# RENK ÖLÇEKLERİ (COLOR)
# ============================================================

# ------------------------------------------------------------
# 4. scale_color_continuous()
# ------------------------------------------------------------

# Sürekli sayısal değişkenleri renklerle gösterir.
#
# color = hp:
# Motor gücüne göre noktaların renkleri değişir.
#
# low:
# Düşük motor gücü değerlerinin rengi.
#
# high:
# Yüksek motor gücü değerlerinin rengi.

ggplot(mtcars, aes(x = wt, y = mpg, color = hp)) +
  geom_point(size = 4) +
  scale_color_continuous(
    low = "blue",
    high = "red"
  ) +
  labs(
    title = "Motor Gücüne Göre Renklendirme",
    x = "Araç Ağırlığı",
    y = "Yakıt Verimliliği",
    color = "Motor Gücü (hp)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 5. scale_color_discrete()
# ------------------------------------------------------------

# Kategorik değişkenler için renk ölçeği kullanılır.
#
# factor(cyl):
# Silindir sayısını kategorik değişkene dönüştürür.
#
# Her silindir grubu farklı bir renk alır.

ggplot(
  mtcars,
  aes(x = wt, y = mpg, color = factor(cyl))
) +
  geom_point(size = 4) +
  scale_color_discrete(
    labels = c(
      "4" = "4 Silindir",
      "6" = "6 Silindir",
      "8" = "8 Silindir"
    )
  ) +
  labs(
    title = "Silindir Sayısına Göre Renklendirme",
    x = "Araç Ağırlığı",
    y = "Yakıt Verimliliği",
    color = "Silindir Sayısı"
  ) +
  theme_minimal()


# ============================================================
# DOLGU ÖLÇEKLERİ (FILL)
# ============================================================


# ------------------------------------------------------------
# 6. scale_fill_continuous()
# ------------------------------------------------------------

# Sürekli sayısal değişkenler için dolgu renk ölçeği.
#
# shape = 21:
# İçi doldurulabilen bir nokta şeklidir.
#
# fill = hp:
# Noktaların iç rengi motor gücüne göre değişir.
#
# color = "black":
# Noktaların kenarları siyah olur.

ggplot(
  mtcars,
  aes(x = wt, y = mpg, fill = hp)
) +
  geom_point(
    shape = 21,
    size = 5,
    color = "black"
  ) +
  scale_fill_continuous(
    low = "lightyellow",
    high = "darkred"
  ) +
  labs(
    title = "Motor Gücüne Göre Dolgu Rengi",
    x = "Araç Ağırlığı",
    y = "Yakıt Verimliliği",
    fill = "Motor Gücü (hp)"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 8. scale_fill_discrete()
# ------------------------------------------------------------

# Kategorik değişkenler için dolgu ölçeği.
#
# factor(am):
# Şanzıman türünü kategorik değişkene dönüştürür.
#
# fill = factor(am):
# Sütunların içi şanzıman türüne göre renklendirilir.
#
# position = "dodge":
# Sütunları yan yana gösterir.

ggplot(
  mtcars,
  aes(x = factor(cyl), fill = factor(am))
) +
  geom_bar(position = "dodge") +
  scale_fill_discrete(
    labels = c(
      "0" = "Otomatik",
      "1" = "Manuel"
    )
  ) +
  labs(
    title = "Silindir Sayısı ve Şanzıman Türü",
    x = "Silindir Sayısı",
    y = "Araç Sayısı",
    fill = "Şanzıman Türü"
  ) +
  theme_minimal()


# ============================================================
# D. EK ÖRNEK: VIRIDIS RENK ÖLÇEĞİ
# ============================================================


# ------------------------------------------------------------
# 8. Sürekli değişken için viridis
# ------------------------------------------------------------

# Motor gücü sayısal bir değişkendir.
# Bu nedenle _c (continuous) kullanıyoruz.

ggplot(mtcars, aes(x = wt, y = mpg, color = hp)) +
  geom_point(size = 4) +
  scale_color_viridis_c() +
  labs(
    title = "Viridis: Sürekli Renk Ölçeği",
    x = "Araç Ağırlığı",
    y = "Yakıt Verimliliği",
    color = "Motor Gücü"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 9. Kategorik değişken için viridis
# ------------------------------------------------------------

# Silindir sayısını kategorik değişkene dönüştürüyoruz.
#
# _d (discrete):
# Kategorik değişkenler için kullanılır.

ggplot(
  mtcars,
  aes(x = wt, y = mpg, color = factor(cyl))
) +
  geom_point(size = 4) +
  scale_color_viridis_d() +
  labs(
    title = "Viridis: Kategorik Renk Ölçeği",
    x = "Araç Ağırlığı",
    y = "Yakıt Verimliliği",
    color = "Silindir Sayısı"
  ) +
  theme_minimal()
# ------------------------------------------------------------
# ÖNEMLİ
# ------------------------------------------------------------

# Mapping:
# HANGİ değişkenin hangi görsel özelliğe eşleneceğini belirler.
#
# Scale:
# Bu eşlemenin grafikte NASIL gösterileceğini belirler.