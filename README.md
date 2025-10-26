# Car Booking App

Aplikasi booking mobil Flutter dengan UI yang modern dan menarik seperti Gojek. Aplikasi ini memungkinkan pengguna untuk mencari, melihat detail, dan memesan mobil dengan mudah.

## 🚀 Fitur Utama

### 🏠 Home Screen
- Header dengan greeting dan search bar
- Kategori mobil (Semua, Keluarga, Sport, Hemat)
- Mobil unggulan dengan carousel
- Daftar mobil populer
- Daftar semua mobil tersedia

### 🔍 Search & Filter
- Pencarian mobil berdasarkan nama, merek, atau model
- Filter berdasarkan merek mobil
- Filter berdasarkan rentang harga
- Filter berdasarkan fitur mobil

### 🚗 Detail Mobil
- Galeri foto mobil dengan indicator
- Informasi lengkap mobil (spesifikasi, fitur, rating)
- Sistem rating dan review
- Kalkulator harga otomatis
- Booking langsung dari detail mobil

### 📅 Booking System
- Pilih tanggal mulai dan selesai
- Pilih lokasi pengambilan dan pengembalian
- Tambah catatan khusus
- Konfirmasi booking dengan detail lengkap
- Status booking real-time

### 📱 Riwayat Booking
- Tab untuk booking aktif, selesai, dan semua
- Detail lengkap setiap booking
- Status booking dengan color coding
- Aksi untuk membatalkan booking

### 👤 Profile User
- Informasi profil lengkap
- Statistik booking dan rating
- Edit profil
- Menu bantuan dan pengaturan
- Sistem login/logout

## 🎨 UI/UX Features

### Design System
- **Warna**: Primary green (#00AA13) seperti Gojek
- **Typography**: Google Fonts Poppins
- **Components**: Material Design 3
- **Icons**: Material Icons dengan custom styling

### Modern UI Elements
- Gradient headers
- Card-based layout
- Smooth animations
- Bottom sheets untuk form
- Floating action buttons
- Custom chips dan badges

### Responsive Design
- Adaptive layout untuk berbagai ukuran layar
- Touch-friendly interface
- Optimized untuk mobile

## 🛠️ Teknologi

### Frontend
- **Flutter**: Framework utama
- **Provider**: State management
- **Material Design 3**: UI components
- **Google Fonts**: Typography

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  google_fonts: ^6.1.0
  intl: ^0.18.1
  provider: ^6.1.1
  shared_preferences: ^2.2.2
  image_picker: ^1.0.4
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.9
  smooth_page_indicator: ^1.1.0
  flutter_rating_bar: ^4.0.1
  date_picker_timeline: ^1.2.3
  flutter_datetime_picker: ^1.5.1
```

## 📁 Struktur Project

```
lib/
├── main.dart
├── models/
│   ├── car.dart
│   ├── booking.dart
│   └── user.dart
├── providers/
│   ├── car_provider.dart
│   ├── booking_provider.dart
│   └── user_provider.dart
├── screens/
│   ├── main_screen.dart
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── car_detail_screen.dart
│   ├── booking_history_screen.dart
│   └── profile_screen.dart
├── widgets/
│   ├── car_card.dart
│   ├── featured_car_card.dart
│   ├── search_bar_widget.dart
│   ├── category_chip.dart
│   ├── booking_card.dart
│   ├── booking_bottom_sheet.dart
│   ├── filter_bottom_sheet.dart
│   └── profile_menu_item.dart
└── theme/
    └── app_theme.dart
```

## 🚀 Cara Menjalankan

1. **Clone repository**
   ```bash
   git clone <repository-url>
   cd car-booking-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run aplikasi**
   ```bash
   flutter run
   ```

## 📱 Screenshots

### Home Screen
- Header dengan search bar
- Kategori dan mobil unggulan
- Daftar mobil dengan rating dan harga

### Search & Filter
- Pencarian real-time
- Filter berdasarkan merek dan harga
- Hasil pencarian yang responsif

### Detail Mobil
- Galeri foto dengan indicator
- Informasi lengkap dan spesifikasi
- Review dan rating dari pengguna
- Booking form yang intuitif

### Booking History
- Tab untuk status booking berbeda
- Detail lengkap setiap booking
- Aksi untuk mengelola booking

### Profile
- Informasi user lengkap
- Statistik dan achievement
- Menu pengaturan dan bantuan

## 🎯 Fitur Unggulan

1. **UI/UX Modern**: Desain yang clean dan modern seperti Gojek
2. **State Management**: Menggunakan Provider untuk manajemen state
3. **Responsive Design**: Optimal di berbagai ukuran layar
4. **Real-time Search**: Pencarian yang cepat dan akurat
5. **Advanced Filtering**: Filter multi-kriteria yang powerful
6. **Booking System**: Sistem booking yang lengkap dan user-friendly
7. **Profile Management**: Manajemen profil user yang komprehensif

## 🔮 Pengembangan Selanjutnya

- [ ] Integrasi dengan backend API
- [ ] Push notifications
- [ ] Payment gateway integration
- [ ] Maps integration untuk lokasi
- [ ] Chat support
- [ ] Loyalty program
- [ ] Multi-language support
- [ ] Dark mode theme

## 📄 Lisensi

Aplikasi ini dibuat untuk keperluan pembelajaran dan demonstrasi. Silakan gunakan sesuai kebutuhan Anda.

## 👨‍💻 Developer

Dibuat dengan ❤️ menggunakan Flutter dan Material Design 3.
