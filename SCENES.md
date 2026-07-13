# Referensi Fungsi per Scene

Ringkasan isi dan fungsi-fungsi di tiap file scene (`S01.pde`–`S23.pde`),
plus file background bersama `S14_Background.pde`. Semua scene dipanggil
lewat dispatcher `runTimeline()` di `TimeLine.pde`.

### S01 — Rombongan Warga Berjalan Berhenti di Sawah
Nenek, Dolf, dan warga perempuan berjalan bersama dari kanan ke kiri, masing-masing berhenti di titik batasnya sendiri.
- `sceneS01` — hitung posisi X tiap karakter, gambar background + 3 karakter
- `drawNenekS01`, `drawWargaPerempuanS01`, `drawDolfS01` — pose jalan/berhenti masing-masing karakter

### S02 — Awan Bergerak di Atas Balai Desa
- `sceneS02` — background bgS02 + 3 awan bergerak
- `drawStylizedCloud` — satu gumpalan awan

### S03 — Karso Berdiri Bangga di Halaman Balai Desa
- `sceneS03` — susun semua layer (langit s/d Karso)
- `drawKarsoRealBangga`, `drawS03PapanAnggaranBerdebu`, `drawS03Clouds`, `drawS03Ground`, `drawS03Courtyard`, `drawS03GardenBeds`, `drawS03SizingTree`, `drawS03Trees`, `drawS03Flag`, `drawS03StatueWithPodium`, `drawS03BronzeStatue`, `drawS03CurvedRoof`, `drawS03RoofLines`, `drawS03Joglo`

### S04 — Truk Masuk Membawa Bu Sari & Sari
- `sceneS04` — kontrol posisi truk, dialog Bu Sari
- `s04_drawMountain`, `s04_drawCloud`, `s04_drawRiceFieldDetails`, `s04_spawnDust`/`s04_drawDust` (stub kosong), `s04_drawTruck`, `s04_drawWheel`
- Panggil luar: `drawBuSariDuduk`, `drawSariDuduk`

### S05 — Sari Turun, Amati Lubang Jalan
- `sceneS05` — 3 fase truk (mendekat/berhenti/pergi) + karakter turun jalan
- `s05_getTerrainDip`, `s05_drawMountain`, `s05_drawCloud`, `s05_drawPotholes`, `s05_drawJerryCan`, `s05_drawRiceFieldDetails`, `s05_drawTruck`, `s05_drawWheel`
- Panggil luar: `drawBuSariDiTruk`, `drawSariDiTruk`, `drawBuSariDiamDiTanah`, `drawSariDiamDiTanah`, `drawBuSariWalking`, `drawSariWalking`

### S06 — Sari Menatap Kantor Desa dengan Heran
- `sceneS06` — 3 fase (masuk/berhenti-ngobrol/keluar) + dialog
- `drawPeneranganKantorPalsu`, `drawClouds`, `drawGround`, `drawCourtyard`, `drawGardenBeds`, `drawTree`/`drawTrees`, `drawFlag`, `drawKarsoWithPodium`, `drawKarso`, `curvedRoof`, `roofTileLines`, `drawJoglo`, `drawColumn`, `drawWindow`, `drawFrontBase`, `drawFrontRoof`, `drawJogloWallDetails`, `drawSmallWindow`, `drawBuildingExtensions`, `drawWingWindow`, `drawColumnsFront`
- Panggil luar: `drawBuSariIdle`, `drawBuSariWalking`, `drawSariHeranDiam`, `drawSariWalking`

### S07 — Karso Berpidato di Rapat
Karso pidato di depan warga duduk mendengarkan; mendefinisikan `placeActor`, helper posisi yang dipakai banyak scene lain (S08–S12).
- `sceneS07`, `placeActor` (dispatcher pose berdasar key string)
- Panggil luar: hampir semua fungsi drawXxxIdle/Bicara/Walking dari Actors.pde

### S08 — Warga Berbisik, Sari Mencatat
Close-up bergantian Dolf/Rahma berbisik → Sari mencatat. Hanya `sceneS08` (pakai zoom manual translate+scale), memanggil `placeActor`.

### S09 — Sari Mengangkat Tangan
- `sceneS09` — animasi sudut lengan Sari interpolatif, dialog
- `placeSariAngkatTangan` — pose Sari lengan terangkat custom-angle

### S10 — Tanya-Jawab Panjang Sari vs Karso
- `sceneS10` — 7 fase, level ketegangan Karso 0-2
- `placeSariS10`, `placeKarsoSmileTension` (3 level ekspresi senyum kaku)

### S11 — Reaksi Panik Warga
- `sceneS11` — 5 fase close-up bergantian + efek jitter
- `placeDolfPanik`, `placeRahmaPanik`, `placeBuDarmiPanik`, `placeBuSariPanik`, `placeSariBicaraS11`

### S12 — Karso Menutup Rapat, Marah Terpendam
- `sceneS12` — transisi close-up → wide shot
- `placeKarsoMarahMaksa`

### S13 — Warga Bubar, Bisik-bisik di Luar Balai
Hanya `sceneS13`, memanggil layer background bersama `s14_*` (dari S14_Background.pde) + banyak fungsi Actors.pde.

### S14 — Lanjutan Luar Balai, Bu Darmi Mendekat
Hanya `sceneS14`, memanggil `s14_*` background + Actors.pde.

### S14_Background — Aset Latar Bersama S13 & S14
Bukan file scene; kumpulan helper background "luar balai":
`s14_gradientRectV/H`, `s14_drawInterior`, `s14_drawOpenDoors`, `s14_drawFacade`, `s14_drawPavement`, `s14_drawSteps`, `s14_drawForegroundPillars`, `s14_drawLighting`

### S15 — Bu Darmi Mengetuk Pintu Rumah Sari
- `sceneS15` — animasi buka pintu, ketukan, dialog
- `drawBgS15Belakang`, `drawBgS15Pintu`, `drawBgS15Depan`, `drawBuDarmiKetukMap`

### S16 — Bu Darmi Serahkan Map Bukti
- `sceneS16` — kedipan lampu (noise), dialog panjang
- `drawBgS16Belakang`, `drawBgS16MejaDepan`, `drawBuDarmiBicaraS16`, `drawSariMembacaS16`

### S17 — Sari Ambil Map, Bu Darmi Lega
- `sceneS17` — blocking posisi Sari maju-ambil-mundur
- `drawBgS17MejaDepan`, `drawBuDarmiS17`, `drawSariS17`
- Panggil luar: `drawBgS16Belakang`

### S18 — Sari & Bu Darmi Tempel Kertas di Papan Informasi
- `sceneS18` — pose & posisi X berdasar fase waktu
- `drawBackgroundPagi`, `drawPapanInformasi`, `coretanTeks`, `drawDaunBeringin`, `drawAyamJago`, `drawGulunganKertas`, `drawEmberLem`, `drawRicePlant`
- Panggil luar: `drawBuDarmiPegangKertas`, `drawSariTempel`, dll.

### S19 — Bu Rahma Kaget Lihat Papan Anggaran
Hanya `sceneS19`, memanggil ulang fungsi background dari S18.pde + Actors.pde.

### S20 — Warga Lain Datang, Ikut Menulis
Hanya `sceneS20`, 4 fase, memanggil fungsi background S18.pde + banyak Actors.pde.

### S21 — Karso Menatap Kerumunan dari Kejauhan
Scene panorama paling kompleks, tanpa dialog.
- `rndS21` (pseudo-random deterministik), `s21_qxL/qxR/qy/tOfY` (kurva jalan bezier), `s21_drawAwan`, `s21_drawRumahKecil`, `s21_tuftPadi`, `s21_tuftRumput`, `s21_drawWargaBelakang`, `sceneS21` (assembler utama)
- Panggil luar: `drawPapanInformasi`, `drawKarsoBackView`, dll.

### S22 — Close-Up Karso & Papan Anggaran
Hanya `sceneS22` — 2 bagian: jitter wajah Karso, lalu papan anggaran + narasi.

### S23 — Fade to Black & Credit Scroll
- `sceneS23` — pan kamera, fade to black, trigger credit
- `drawCreditsScroll` — render baris kredit bergulir

---
**Pola umum:** S01–S06 = fungsi lokal murni (background + gambar karakter sendiri). S07–S12 = pakai `placeActor` sentral dari S07.pde. S13–S14 berbagi background dari S14_Background.pde. S18–S22 berbagi background dari S18.pde. Semua scene akhirnya memanggil helper karakter bersama di `Actors.pde` dan `drawDialogBubble` di `UI.pde`.
