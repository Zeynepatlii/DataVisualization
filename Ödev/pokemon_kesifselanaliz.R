
# VBA203 - Veri Görselleştirme | Pokémon Ödev 1 

# ============================================================
# 0. Paket ve veri seti
# ============================================================

# paket daha önce kurulu olduğu için library()
# yeterli eğer paketi ilk kez kuruyorsanız install.packages("ggplot")
# kullanınız. 

library(ggplot2)

# CSV ve R dosyası aynı klasörde olmalı yani veri dosyanız
# çalışma dizinizde olmalı. import Dataset ile de okutabilirsiniz.

pokemon = read.csv("Pokemon.csv", check.names = FALSE)
head(pokemon)

# Veri dosyasını okuyoruz. check.names = FALSE, Type 2 gibi boşluk içeren sütun adlarını korur.

# ============================================================
# A. Veri setini tanıyalım
# ============================================================

# A1. Veri setinde kaç Pokémon ve kaç değişken bulunmaktadır?

nrow(pokemon) 
ncol(pokemon)
dim(pokemon)

# Veri setinde 800 pokekon ve 13 değişken bulunmaktadır. 

# A2. Değişken isimleri ve türleri

names(pokemon)
str(pokemon)

# A3. HP, Attack, Defense, Speed ve Type 1 
      #değişkenlerinin neyi ifade ettiğini açıklayınız.

# HP: sağlık, Attack: saldırı, Defense: savunma,
# Speed: hız, Type 1: birincil Pokémon türü.

# A4. Veri setinde eksik değer olup olmadığını belirleyiniz.

sum(is.na(pokemon))
colSums(is.na(pokemon))

# Type 2 değişkeninde 386 eksik değer vardır.

# ============================================================
# B. Türlerin dağılımı
# ============================================================

# Her türde kaç Pokémon var?
turler = table(pokemon$`Type 1`)
turler

# En çok ve en az görülen tür

sort(turler, decreasing = TRUE)


# B1. Pokémon karakterlerinin birincil türlerine 
  # (Type 1) göre dağılımını gösteren bir sütun grafiği oluşturunuz.
  # Grafik başlığı ve eksen etiketlerini ekleyiniz.
  # Sütunları renklendiriniz.
  # En fazla ve en az karaktere sahip türleri belirleyiniz.


ggplot(pokemon, aes(x = `Type 1`, fill = `Type 1`)) +
  geom_bar() +
  labs(title = "Pokemon Türlerinin Dağılımı",
       x = "Birincil Tür", y = "Pokemon Sayısı") +
  theme_minimal()

# YORUM: En fazla Water (112), en az Flying (4) gözlemi vardır. Sütunlar türlerin frekansını gösterir.

# ============================================================
# Saldırı histogramı
# ============================================================

#B2. Saldırı Gücünün Dağılımı 
# Pokémon karakterlerinin saldırı gücü (Attack) 
# değerlerini gösteren bir histogram oluşturunuz.
# Uygun bir binwidth belirleyiniz.
# Dolgu ve kenarlık renklerini düzenleyiniz.
# Dağılımın genel yapısını yorumlayınız.


ggplot(pokemon, aes(x = Attack)) +
  geom_histogram(binwidth = 10,
                 fill = "steelblue", color = "white") +
  labs(title = "Saldırı Gücünün Dağılımı",
       x = "Attack", y = "Pokemon Sayısı") +
  theme_minimal()

summary(pokemon$Attack)

# YORUM: Histogram Attack değerlerinin hangi aralıklarda yoğunlaştığını gösterir. binwidth = 10 her sütunun 10 puanlık aralığı kapsamasıdır.

# ============================================================
# Saldırı ve Savunma
# ============================================================

# B3. Saldırı ve Savunma İlişkisi 
# Attack ve Defense değişkenlerini kullanarak bir saçılım grafiği oluşturunuz.
#	X ekseninde Attack, Y ekseninde Defense kullanınız.
#	Noktaları hız (Speed) değişkenine göre renklendiriniz.
#	scale_color_viridis_c() fonksiyonunu kullanınız.
#	İki değişken arasındaki ilişkiyi yorumlayınız.

ggplot(pokemon, aes(x = Attack, y = Defense, color = Speed)) +
  geom_point() +
  scale_color_viridis_c()+
  labs(title = "Saldırı ve Savunma İlişkisi",
       x = "Saldırı", y = "Savunma", color = "Hız") +
  theme_minimal()

# YORUM: Noktalar genel olarak sağa doğru yükselir: Attack arttıkça Defense de artma eğilimindedir. Renkler Speed değerini gösterir.

# ============================================================
# En sık görülen üç türün hızı
# ============================================================
# En fazla gözleme sahip üç birincil Pokémon türünü belirleyiniz. 
# Bu üç türün hız (Speed) dağılımlarını kutu grafiğiyle karşılaştırınız.
# geom_boxplot() kullanınız.
# Kutu grafiklerini türlerine göre renklendiriniz.
# Medyanları ve dağılımları karşılaştırınız.
.

turler =  sort(table(pokemon$`Type 1`), decreasing = TRUE)
head(turler, 3)

# En sık görülen üç tür: Water, Normal, Grass.
# Bu türlere ait satırları seçelim.
uc_tur = pokemon[pokemon$`Type 1` %in%
                    c("Water", "Normal", "Grass"), ]

ggplot(uc_tur, aes(x = `Type 1`, y = Speed, fill = `Type 1`)) +
  geom_boxplot() +
  labs(title = "Üç Pokemon Türünde Hız Dağılımı",
       x = "Tür", y = "Speed") +
  theme_minimal()


# YORUM: Kutu grafiklerinde ortadaki çizgi medyandır. 
# Kutuların konumunu ve genişliğini karşılaştırarak ,
# türlerin hız dağılımlarını yorumlayabiliriz.

# ============================================================
# C Sürekli ve kategorik renk ölçekleri
# ============================================================
# C5. Sürekli ve Kategorik Renk Ölçekleri 
# Aynı Attack–Defense saçılım grafiğini iki farklı biçimde oluşturunuz.
# Grafik A: Noktaları Speed değişkenine göre renklendiriniz.
# Grafik B: Noktaları Legendary değişkenine göre renklendiriniz.
# İlk grafikte sürekli, ikinci grafikte kategorik renk ölçeği kullanınız.
# İki grafik arasındaki farkı açıklayınız.


 #Grafik A: Speed sayısal olduğu için sürekli renk ölçeği
ggplot(pokemon, aes(x = Attack, y = Defense, color = Speed)) +
  geom_point() +
  scale_color_viridis_c() +
  labs(title = "A: Sürekli Renk Ölçeği") +
  theme_minimal()

#scale_color_viridis_d -> discrete değişkenler için
# Grafik B: Legendary iki kategorili bir değişkendir.
# factor() ile kategorik olduğunu belirtiyoruz.

pokemon$Legendary = factor (pokemon$Legendary, 
                            levels = c("True","False"),
                            labels = c("True", "False"))
ggplot(pokemon,
       aes(x = Attack, y = Defense, color = Legendary)) +
  geom_point() +
  scale_color_manual(values = c("steelblue", "tomato")) +
  labs(title = "B: Kategorik Renk Ölçeği",
       color = "Efsanevi mi?") +
  theme_minimal()

# YORUM: Grafik A renk geçişiyle hızın sayısal değerlerini gösterir. Grafik B iki kategoriyi ayrı renklerle gösterir.

# ============================================================
# C Eksen ölçekleri ve temalar
# ============================================================
# Grafik A: minimal tema
ggplot(pokemon, aes(x = HP, y = Attack)) +
  geom_point(color = "steelblue") +
  scale_x_continuous(breaks = seq(0, 300, 50)) +
  scale_y_continuous(breaks = seq(0, 200, 25)) +
  labs(title = "HP ve Attack - Minimal Tema",
       x = "HP", y = "Attack") +
  theme_minimal()

# Grafik B: klasik tema
ggplot(pokemon, aes(x = HP, y = Attack)) +
  geom_point(color = "steelblue") +
  scale_x_continuous(breaks = seq(0, 300, 50)) +
  scale_y_continuous(breaks = seq(0, 200, 25)) +
  labs(title = "HP ve Attack - Klasik Tema",
       x = "HP", y = "Attack") +
  theme_classic()

# YORUM: İki grafikte de veri aynıdır; yalnızca tema değişir. breaks eksendeki işaretleri belirler, eksen sınırlarını zorunlu olarak değiştirmez.

# ============================================================
# D. En güçlü Pokémon hangisi?
# ============================================================
# Güç tanımımız: Total (altı temel özelliğin toplamı).
max(pokemon$Total)

summary(pokemon$Total)

# En yüksek Total değerine sahip Pokémonlar
pokemon[pokemon$Total == max(pokemon$Total),
        c("Name", "Total")]

# Total değeri en yüksek 10 Pokémon formu
sirali = pokemon[order(pokemon$Total, decreasing = TRUE), ]
ilk_on = head(sirali, 10)

# Grafikte isimlerin görünmesi için yatay sütunlar
ggplot(ilk_on, aes(x = reorder(Name, Total), y = Total)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Toplam Puanı En Yüksek 10 Pokémon",
       x = "Pokémon", y = "Total") +
  theme_minimal()


# YORUM: Bu çalışmada güç, Total puanıdır. En yüksek değer 780 olup üç Pokémon formu eşittir. Başka bir güç tanımı farklı bir sıralama oluşturabilir.
