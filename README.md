🌿 Hear Me - Teman Curhat AI

  Hear Me adalah aplikasi mobile berbasis Flutter yang berfungsi sebagai asisten percakapan AI untuk membantu pengguna mengekspresikan perasaan. Aplikasi ini menggunakan   Google Gemini AI   untuk memberikan respons yang empati, tenang, dan suportif.


   🚀 Fitur Unggulan

  🧠   Chat History (Memory)  
  AI dapat mengingat konteks percakapan sebelumnya sehingga interaksi terasa lebih personal.

  🔄   Dynamic Model Fetching  
  Otomatis mendeteksi model Gemini yang tersedia (misal Gemini 1.5 Flash) agar aplikasi tetap berjalan meski ada perubahan API.

  📜   Auto-Scroll  
  Tampilan otomatis bergeser ke pesan terbaru setiap kali AI memberikan jawaban.

  🎨   UI Modern & Responsif  
  Menggunakan desain   bubble chat   kekinian dengan tipografi dari   Google Fonts (Poppins)  .

  📝   Markdown Support  
  Menampilkan teks tebal, miring, dan daftar poin secara rapi sesuai respons AI.

---

   🛠️ Teknologi & Library

    Framework:   Flutter (Material 3)
    State Management:   [Riverpod](https://riverpod.dev/)
    AI Engine:   Google Generative AI (Gemini API)
    Styling:   Google Fonts & Flutter Markdown
    Environment:   Flutter Dotenv (untuk keamanan API Key)

---

   📂 Struktur Proyek

```text
lib/
├── screens/        Halaman utama aplikasi (ChatScreen)
├── services/       Logika koneksi ke API Gemini
├── widgets/        Komponen UI (ChatBubble)
└── main.dart       Titik awal aplikasi
```

---

   ⚙️ Cara Menjalankan Aplikasi

1.   Clone Repository  

 
git clone https://github.com/hafizahalfitra/flutter-ai-curhat-app.git
```

2.   Instalasi Package  

 
flutter pub get
```

3.   Pengaturan API Key  
   Buat file `.env` di folder root.
   Isi dengan:

   ```env
   GEMINI_API_KEY=YOUR_API_KEY_DISINI
   ```

4.   Jalankan Aplikasi
     flutter run

