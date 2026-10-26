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
# scale_y_continuous()   -> Sürekli y ekseni
#
# scale_x_discrete()     -> Kategorik x ekseni
# scale_y_discrete()     -> Kategorik y ekseni


# RENK ÖLÇEKLERİ
#
# scale_color_continuous() -> Sürekli değişkenler için renk ölçeği
# scale_color_discrete()   -> Kategorik değişkenler için renk ölçeği


# DOLGU ÖLÇEKLERİ
#
# scale_fill_continuous()  -> Sürekli değişkenler için dolgu ölçeği
# scale_fill_discrete()    -> Kategorik değişkenler için dolgu ölçeği


# ------------------------------------------------------------
# ÖNEMLİ
# ------------------------------------------------------------

# Mapping:
# HANGİ değişkenin hangi görsel özelliğe eşleneceğini belirler.
#
# Scale:
# Bu eşlemenin grafikte NASIL gösterileceğini belirler.