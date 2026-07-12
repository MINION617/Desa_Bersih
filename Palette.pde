// =========================================================
// Palette.pde
// Warna-warna yang dipakai berulang di seluruh project.
//
// CATATAN: fungsi-fungsi karakter di Actors.pde saat ini masih
// pakai variabel warna lokal masing-masing (dari file asli tiap
// karakter) supaya desain yang sudah di-approve tidak berubah
// tanpa sengaja. Palette ini disiapkan sebagai tempat konsolidasi
// bertahap — kalau mau, warna di Actors.pde bisa pindah ke sini
// satu-satu sambil di-preview ulang tiap kali biar aman.
// =========================================================

// ---- Warna umum garis & outline ----
color C_GARIS = color(40, 38, 48);   // outline khas gaya Blob/Tekotok
color C_GARIS_TIPIS = color(180);    // garis bantu lantai/dinding

// ---- Kulit ----
color C_KULIT_TERANG = color(253, 199, 161);
color C_KULIT_SEDANG  = color(240, 210, 185);
color C_KULIT_GELAP   = color(200, 139, 94);

// ---- Warna khas per karakter (dipindah ke sini bertahap) ----
// Karso
color C_KARSO_JAS    = color(175, 140, 95);
color C_KARSO_KOPIAH  = color(40, 38, 48);
color C_KARSO_AKSEN   = color(240, 200, 50);

// Sari
color C_SARI_BAJU = color(162, 122, 233);
color C_SARI_ROK  = color(102, 78, 158);
color C_SARI_PITA = color(243, 143, 153);

// Bu Sari (Ibu Sari)
color C_IBUSARI_BAJU = color(146, 120, 187);
color C_IBUSARI_ROK  = color(104, 73, 124);
color C_IBUSARI_JILBAB = color(118, 99, 166);

// Bu Darmi
color C_BUDARMI_BAJU = color(160, 125, 90);
color C_BUDARMI_ROK  = color(110, 85, 60);

// Pak Dolf
color C_DOLF_BAJU    = color(85, 87, 91);
color C_DOLF_CELANA  = color(173, 177, 182);

// Bu Rahma (WargaPerempuan)
color C_RAHMA_BAJU = color(198, 75, 59);
