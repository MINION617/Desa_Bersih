# Desa Bersih — Project Structure

Folder ini adalah **satu sketch Processing utuh**. Nama folder harus
tetap `DesaBersih` (sama dengan `DesaBersih.pde`) — itu aturan
Processing, semua tab `.pde` di dalam folder ini otomatis ikut
ter-compile bareng jadi satu program saat `DesaBersih.pde` dibuka.

## Cara pakai
1. Buka `DesaBersih.pde` lewat Processing IDE (bukan file lain).
2. Semua tab lain (Actors, Props, Palette, TimeLine, S01-S23) akan
   otomatis muncul sebagai tab-tab di IDE yang sama.
3. Klik Run — `setup()` load background, `draw()` manggil
   `runTimeline()` yang otomatis pilih scene aktif.

## Isi folder
```
DesaBersih/
├── DesaBersih.pde   <- setup()/draw() SATU-SATUNYA di project ini
├── TimeLine.pde     <- runTimeline() dispatcher + durasi tiap scene
├── Palette.pde      <- warna bersama (baru starter set)
├── Props.pde        <- kosong, tinggal pindahkan props S01-S03 lama
├── Actors.pde       <- SEMUA fungsi drawXxx karakter
├── S01.pde ... S23.pde  <- satu file per shot
├── data/
│   └── background_s7-s12.png
└── README.md        <- file ini
```

## Status tiap scene
| Scene | Status |
|---|---|
| S01-S03 | Pernah dibangun sesi sebelumnya, tapi kodenya **tidak ada** di sesi ini — tab-nya cuma stub `TODO`, tinggal tempel kode lama kamu ke fungsi `sceneSXX()`. |
| S04-S06 | Belum dibangun — stub kosong. |
| **S07** | **Selesai** — Karso pidato (gestur tangan + mulut buka-tutup) di tengah panggung, Dolf & Rahma idle di karpet kiri, Sari/Bu Darmi/Ibu Sari idle di karpet kanan. |
| S08-S23 | Belum dibangun — stub kosong. |

## Yang masih perlu dicek
- **Skala karakter di S07** (`S07_CHAR_SCALE = 0.33`) — hasil estimasi
  dari preview komposit, cek lagi pas dirender asli di Processing,
  gampang di-tweak di satu angka itu.
- **`drawDolfIdle()`** di `Actors.pde` — diturunkan langsung dari
  `drawDolfWalking()` (kaki/lengan dibekukan, cuma badan atas &
  kepala ikut napas), belum lewat ronde preview terpisah kayak
  Karso pidato. Tolong di-flag kalau ada yang janggal.
- **`drawBuDarmiIdle()`** dan **`drawWargaPerempuanWalking()`** —
  file aslinya tidak punya parameter posisi (langsung gambar di
  satu titik tetap), jadi aku bungkus jadi `(x, y)` biar konsisten
  sama karakter lain. Secara visual harusnya sama persis kayak
  aslinya, cuma sekarang bisa dipindah-pindah posisinya.
