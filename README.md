# SinFlix 🍿

SinFlix, modern ve kullanıcı dostu bir arayüzle film keşfi ve yönetimi sunan bir Flutter uygulamasıdır. Kullanıcılar, favori filmlerini kaydedebilir, profil bilgilerini görüntüleyebilir ve akıcı bir deneyim için Lottie animasyonlarıyla zenginleştirilmiş bir uygulama kullanabilir.

---

## 🚀 Özellikler

- **Kimlik Doğrulama**  
  - 📧 E-posta ile güvenli kayıt ve giriş  
  - 🔒 Token saklama ve otomatik giriş yönetimi (`flutter_secure_storage`)  
  - ✅ Başarılı işlemlerde Lottie animasyonları  

- **Ana Sayfa**  
  - 🎬 Sonsuz kaydırma ile film listesi (sayfa başına 5 film)  
  - 🔄 Pull-to-refresh ve loading göstergeleri  
  - ❤️ Favori film ekleme/çıkarma (anlık UI güncellemeleri)  

- **Profil Sayfası**  
  - 👤 Kullanıcı bilgilerini görüntüleme  
  - 📋 Favori filmlerin listelenmesi  

- **Navigasyon**  
  - 🧭 Bottom Navigation Bar ile sezgisel gezinti  
  - 🔁 GoRouter ile tip-güvenli ve dinamik yönlendirme  
  - 📍 Sayfa state'lerinin korunması  

- **Ek Özellikler**  
  - 🎉 Sınırlı teklif için özel Bottom Sheet tasarımı  
  - 📲 Özelleştirilmiş Splash Screen ve uygulama ikonu  
  - 🧩 Custom Widget'lar ile tekrar kullanılabilir UI bileşenleri  
  - 📊 Firebase Analytics ile ekran görüntüleme takibi  
  - 🛠 Firebase Crashlytics ile hata raporlama  
  - 🎨 Merkezi tema yönetimi  
  - 📜 Talker ile gelişmiş loglama altyapısı  

---

## 🛠 Kullanılan Teknolojiler

| Katman                   | Teknoloji/Açıklama                              |
|--------------------------|------------------------------------------------|
| **Framework**            | Flutter: Mobil uygulama geliştirme             |
| **Durum Yönetimi**       | BLoC: Esnek ve ölçeklenebilir durum yönetimi  |
| **Mimari**               | Clean Architecture: Katmanlı ve sürdürülebilir yapı |
| **Güvenlik**             | flutter_secure_storage: Güvenli token saklama  |
| **Animasyon**            | Lottie: Kullanıcı deneyimini zenginleştiren animasyonlar |
| **UI Bileşenleri**       | Custom Widgets: Tekrar kullanılabilir komponentler |
| **Loglama**              | Logger & Talker: Hata takibi ve detaylı loglama |

---

## 📱 Ekranlar

- **Giriş Ekranı**: Kullanıcı girişi için modern ve güvenli arayüz  
- **Kayıt Ekranı**: Yeni kullanıcıların kolayca kaydolabileceği form  
- **Ana Ekran**: Sonsuz kaydırma ile film listeleme  
- **Profil Ekranı**: Kullanıcı bilgileri ve favori filmler  
- **Bottom Sheet**: Sınırlı teklifler için dinamik popup  
- **Splash Screen**: Markaya özel açılış ekranı  

---

## 🔑 Kimlik Doğrulama

- E-posta ile hızlı ve güvenli kayıt/giriş  
- Token'ların güvenli saklanması (`flutter_secure_storage`)  
- Başarılı işlemlerde otomatik yönlendirme ve animasyonlar  

---

## 🏠 Ana Sayfa

- **Sonsuz Kaydırma**: `infinite_scroll_pagination` ile verimli veri yükleme  
- **Sayfa Başına 5 Film**: Optimize edilmiş veri gösterimi  
- **Pull-to-Refresh**: Yenileme için akıcı kullanıcı deneyimi  
- **Favori Yönetimi**: Anlık favori ekleme/çıkarma  

---

## 👤 Profil Sayfası

- Kullanıcı bilgilerinin sade ve şık gösterimi  
- Favori filmlerin listelenmesi ve kolay erişim  

---

## 🔄 Navigasyon

- **BottomNavigationBar**: Kullanıcı dostu gezinme  
- **GoRouter**: Tip-güvenli, dinamik ve performans odaklı yönlendirme  
- **State Koruma**: Sayfalar arasında geçişlerde veri kaybı önleme  

---

## 🌟 Bonus Özellikler

- **Firebase Analytics**: Kullanıcı davranışlarını izleme  
- **Firebase Crashlytics**: Gerçek zamanlı hata raporlama  
- **Merkezi Tema Yönetimi**: Tutarlı ve özelleştirilebilir UI  
- **Talker**: Gelişmiş loglama ile geliştirme sürecini kolaylaştırma  

---

## 📦 Kurulum

1. Depoyu klonlayın:
   ```bash
   git clone https://github.com/bahtinursinik/SinFlix.git
   ```
2. Proje dizinine gidin:
   ```bash
   cd SinFlix
   ```
3. Bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```
4. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```

---

## 📸 Ekran Görüntüleri

| Splash Screen | Giriş Ekranı | Kayıt Ekranı | Ana Sayfa | Profil Sayfası |
|--------------|--------------|-----------|----------------|--------------|
| ![Giriş](https://github.com/user-attachments/assets/cde4800a-55fb-45f4-95d7-b012f9850d96) | ![Kayıt](https://github.com/user-attachments/assets/2d1481dc-c054-4abe-b0a7-e4d4acab6b85) | ![Ana Ekran](https://github.com/user-attachments/assets/68f85a06-6903-4f13-a6af-40619b204c91) | ![Profil](https://github.com/user-attachments/assets/45c961a5-07fd-4b9e-b499-949971b60fed) | ![Bottom Sheet](https://github.com/user-attachments/assets/bbb39a91-f4e2-41c5-834c-4290914e81c7) |

| Resim Yükleme | Bottom Sheet | Diğer Görseller |
|---------------|----------------|-----------------|
| ![Splash](https://github.com/user-attachments/assets/daad154d-2e3f-41b1-963e-77fc72f14485) | ![Favoriler](https://github.com/user-attachments/assets/2a20de52-2276-44e3-ac50-b3fbff14d369) | ![Ek Görseller](https://github.com/user-attachments/assets/24e94b6b-a377-412d-9394-09a8d28f0382) |

---

<img width="2514" height="1544" alt="image" src="https://github.com/user-attachments/assets/24e94b6b-a377-412d-9394-09a8d28f0382" />
<img width="3054" height="1664" alt="image" src="https://github.com/user-attachments/assets/661da710-fcf5-4184-82cd-7585006067c1" />
<img width="2062" height="246" alt="image" src="https://github.com/user-attachments/assets/63258be0-bd0f-41e0-9d20-f862b93a5ac2" />
<img width="2058" height="302" alt="image" src="https://github.com/user-attachments/assets/57e7925c-a788-4511-a7d4-31cdb00ec00d" />
<img width="1298" height="816" alt="image" src="https://github.com/user-attachments/assets/f0b54a62-b312-4120-b9a8-2e50e30954aa" />
<img width="2060" height="172" alt="image" src="https://github.com/user-attachments/assets/6132fc10-98bf-48dc-84ea-d52f05207b32" />
