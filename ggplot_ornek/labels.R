# ============================================================
# 10. LABELS (GRAFİK ETİKETLERİ)
# ============================================================

# labs() fonksiyonu grafik üzerindeki açıklayıcı metinleri
# düzenlemek için kullanılır.
#
# title    -> Grafik başlığı
# subtitle -> Alt başlık
# x        -> X ekseni başlığı
# y        -> Y ekseni başlığı
# color    -> Renk lejantının başlığı
# caption  -> Grafik altında yer alan açıklama / kaynak


# ------------------------------------------------------------
# 1. GRAFİK ETİKETLERİNİN EKLENMESİ
# ------------------------------------------------------------

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