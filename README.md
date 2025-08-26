**SinFlix**, kullanıcıların modern bir arayüzle film keşfetmesini ve favori filmlerini yönetmesini sağlayan bir Flutter uygulamasıdır. Uygulama; kayıt, giriş, favori film ekleme, profil görüntüleme gibi temel kullanıcı akışlarını destekler ve bu işlemler sırasında Lottie animasyonları ile kullanıcı deneyimi artırılmıştır.

---

## 🚀 Genel Özellikler

- 🔐 E-posta ile kullanıcı **kayıt** ve **giriş**
- 🧠 Giriş yaptıktan sonra **token saklama** ve **otomatik giriş yönetimi**
- 🏠 Ana sayfada film listesi (sonsuz kaydırma, 5 film/sayfa)
- ❤️ Favori filmleri ekleme / çıkarma, UI'da anlık güncelleme
- 👤 Profil sayfasında “Beğendiğim Filmler” bölümü
- 🔄 Pull-to-refresh ve loading göstergeleri
- 📥 Sınırlı Teklif Bottom Sheet tasarımı
- 🌍 Türkçe ve İngilizce **çoklu dil desteği** (Localization)
- 🧩 **Custom Widget** kullanımı
- 🧭 Bottom Navigation ile kolay gezinme
- 📲 Splash Screen ve özel uygulama ikonu
- 🎞️ Başarılı işlemlerde Lottie animasyonları
- 📦 MVVM + Clean Architecture yapısı
- 📚 BLoC State Management
- 🛠️ Logger Service
- 🔐 Güvenli token yönetimi (secure storage)

---

## 🧱 Kullanılan Teknolojiler

| Katman | Açıklama |
|-------|----------|
| 🎯 Flutter | Mobil uygulama geliştirme |
| 📦 BLoC | Durum yönetimi |
| 🧼 Clean Architecture | Katmanlı, sürdürülebilir yapı |
| 🔐 flutter_secure_storage | Token saklama |
| 🎨 Lottie | Animasyonlar |
| 🧪 Custom Widgets | UI tekrarını azaltmak için özelleştirilmiş bileşenler |
| 🛠 Logger | Geliştirme sürecinde hata/log takibi |

---

## 📱 Ekranlar

- **Login Screen** – Kullanıcı girişi
- **Register Screen** – Yeni kullanıcı kaydı
- **Home Screen** – Filmlerin listelendiği ana sayfa
- **Profile Screen** – Kullanıcı bilgileri ve favori filmler
- **Bottom Sheet** – Sınırlı teklif popup’ı
- **Splash Screen** – Açılış ekranı

---

## 🔑 Kimlik Doğrulama

- ✅ Kayıt ve giriş işlemleri
- ✅ Token'ın güvenli şekilde saklanması (`flutter_secure_storage`)
- ✅ Başarılı girişte otomatik yönlendirme

## 🏠 Ana Sayfa Özellikleri

- ✅ Sonsuz kaydırma (`infinite_scroll_pagination` ile verimli yönetim)
- ✅ Sayfa başına 5 film
- ✅ Pull-to-refresh ve loading animasyonları
- ✅ Favori butonu ile anlık güncelleme

## 👤 Profil Sayfası

- ✅ Kullanıcı bilgilerini gösterme
- ✅ Favorilere eklenen filmleri listeleme

## 🌐 Dil Desteği

- ✅ Uygulama, Türkçe ve İngilizce olarak kullanılabilir
- ✅ Kullanıcının sistem diline göre otomatik dil seçimi

## 🔁 Navigasyon

- ✅ `BottomNavigationBar` ile geçiş
- ✅ Sayfa state'leri korunur
- ✅ **GoRouter** ile tip-güvenli ve dinamik yönlendirme

## 🌟 Bonus Özellikler

Projeyi zenginleştirmek adına eklediğim bazı bonus özellikler:
- ✅ **Firebase Analytics** ile ekran görüntüleme takibi
- ✅ **Firebase Crashlytics** ile hata raporlama
- ✅ Merkezi bir **tema yönetimi**
- ✅ **Talker** ile detaylı loglama altyapısı

---

### 📦 Kurulum
```bash
git clone https://github.com/bahtinursinik/SinFlix.git
cd SinFlix
flutter pub get
flutter run
```

### Ekran Görüntüleri
<img width="882" height="1836" alt="image" src="https://github.com/user-attachments/assets/cde4800a-55fb-45f4-95d7-b012f9850d96" />
<img width="758" height="1506" alt="image" src="https://github.com/user-attachments/assets/2d1481dc-c054-4abe-b0a7-e4d4acab6b85" />
<img width="976" height="2020" alt="image" src="https://github.com/user-attachments/assets/68f85a06-6903-4f13-a6af-40619b204c91" />
<img width="940" height="2018" alt="image" src="https://github.com/user-attachments/assets/45c961a5-07fd-4b9e-b499-949971b60fed" />
<img width="958" height="2044" alt="image" src="https://github.com/user-attachments/assets/bbb39a91-f4e2-41c5-834c-4290914e81c7" />
<img width="978" height="2018" alt="image" src="https://github.com/user-attachments/assets/daad154d-2e3f-41b1-963e-77fc72f14485" />
<img width="940" height="2016" alt="image" src="https://github.com/user-attachments/assets/2a20de52-2276-44e3-ac50-b3fbff14d369" />
<img width="2514" height="1544" alt="image" src="https://github.com/user-attachments/assets/24e94b6b-a377-412d-9394-09a8d28f0382" />
<img width="3054" height="1664" alt="image" src="https://github.com/user-attachments/assets/661da710-fcf5-4184-82cd-7585006067c1" />
<img width="2062" height="246" alt="image" src="https://github.com/user-attachments/assets/63258be0-bd0f-41e0-9d20-f862b93a5ac2" />
<img width="2058" height="302" alt="image" src="https://github.com/user-attachments/assets/57e7925c-a788-4511-a7d4-31cdb00ec00d" />
<img width="1298" height="816" alt="image" src="https://github.com/user-attachments/assets/f0b54a62-b312-4120-b9a8-2e50e30954aa" />
<img width="2060" height="172" alt="image" src="https://github.com/user-attachments/assets/6132fc10-98bf-48dc-84ea-d52f05207b32" />




---

