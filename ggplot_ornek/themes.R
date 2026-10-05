# ============================================================
# 11. THEMES (TEMALAR)
# ============================================================

# Theme (tema), grafiğin genel görünümünü düzenler.
#
# Tema;
# - arka planı,
# - kılavuz çizgilerini,
# - yazıların görünümünü,
# - eksenlerin görünümünü,
# - lejantın konumunu
# kontrol edebilir.
#
# ÖNEMLİ:
# Theme veriyi, mapping'i veya geometrileri değiştirmez.
# Yalnızca grafiğin görsel görünümünü düzenler.


# ------------------------------------------------------------
# 1. VARSAYILAN TEMA
# ------------------------------------------------------------

# ggplot2'nin varsayılan teması theme_gray()'dir.

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
    subtitle = "Motor gücü renk ile gösterilmiştir",
    x = "Motor Hacmi (inç küp)",
    y = "Yakıt Verimliliği (mpg)",
    color = "Motor Gücü (hp)",
    caption = "Veri: mtcars"
  ) +
  theme_gray()


# ------------------------------------------------------------
# 2. MINIMAL TEMA
# ------------------------------------------------------------

# theme_minimal():
# Arka plan öğelerini azaltarak daha sade bir görünüm sağlar.

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
    subtitle = "Motor gücü renk ile gösterilmiştir",
    x = "Motor Hacmi (inç küp)",
    y = "Yakıt Verimliliği (mpg)",
    color = "Motor Gücü (hp)",
    caption = "Veri: mtcars"
  ) +
  theme_minimal()


# ------------------------------------------------------------
# 3. CLASSIC TEMA
# ------------------------------------------------------------

# theme_classic():
# Beyaz arka plan ve belirgin eksen çizgileri kullanır.

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
    subtitle = "Motor gücü renk ile gösterilmiştir",
    x = "Motor Hacmi (inç küp)",
    y = "Yakıt Verimliliği (mpg)",
    color = "Motor Gücü (hp)",
    caption = "Veri: mtcars"
  ) +
  theme_classic()


# ------------------------------------------------------------
# 4. DİĞER HAZIR TEMALAR
# ------------------------------------------------------------

# ggplot2 içerisinde kullanılabilecek bazı hazır temalar:
#
# theme_gray()       -> ggplot2'nin varsayılan teması
# theme_minimal()    -> Sade ve açık görünüm
# theme_classic()    -> Beyaz arka plan ve belirgin eksenler
# theme_bw()         -> Siyah-beyaz görünüm
# theme_light()      -> Açık renkli kılavuz çizgileri
# theme_dark()       -> Koyu arka plan
# theme_void()       -> Eksen ve arka plan öğelerinin çoğunu kaldırır


# ------------------------------------------------------------
# 5. THEME() İLE GRAFİĞİ ÖZELLEŞTİRME
# ------------------------------------------------------------

# Hazır bir tema kullandıktan sonra theme() fonksiyonu ile
# grafiğin belirli öğelerini ayrıca değiştirebiliriz.

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
    subtitle = "Motor gücü renk ile gösterilmiştir",
    x = "Motor Hacmi (inç küp)",
    y = "Yakıt Verimliliği (mpg)",
    color = "Motor Gücü (hp)",
    caption = "Veri: mtcars"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      size = 16,
      face = "bold"
    ),
    plot.subtitle = element_text(
      size = 11
    ),
    axis.title = element_text(
      size = 11
    ),
    legend.position = "right"
  )


# ------------------------------------------------------------
# ÖNEMLİ
# ------------------------------------------------------------

# labs()  -> Grafikte NE YAZACAĞINI belirler.
#
# theme() -> Bu öğelerin NASIL GÖRÜNECEĞİNİ belirler.