// =========================================================
// DesaBersih.pde
// MAIN SKETCH — satu-satunya tempat setup()/draw() boleh ada.
// Semua tab .pde lain di folder ini otomatis ikut ter-compile
// bareng (aturan Processing: semua tab harus satu folder yang
// namanya sama dengan file utama ini -> folder "DesaBersih").
// =========================================================

import processing.sound.*;  // Butuh library "Sound" — install via
                             // Sketch > Import Library > Sound

final int FPS      = 24;

// Audio dialog utama (1 file untuk seluruh animasi)
SoundFile dialogAudio;

// ---- Aset gambar background yang dipakai di project ----
PImage bgS07toS12;
PImage bgS01; 
PImage bgS02; // Aset baru untuk latar belakang luar Scene 2

// DesaBersih.pde
void setup() {
  size(1280, 720);
  frameRate(FPS);
  smooth();
  
  // Font diinisialisasi sekali di sini, tidak perlu di tiap SXX.pde
  fJudul = createFont("Impact", 40);
  fSub   = createFont("Arial Bold", 20);
  
  bgS07toS12 = loadImage("background_s7-s12.png");
  bgS01      = loadImage("background s1.png"); 
  bgS02      = loadImage("background s2 alt.png"); 
  
  // Load audio — diputar otomatis saat timeline mulai (lihat TimeLine.pde)
  dialogAudio = new SoundFile(this, "DialogAnimasi.wav");

  frameCount = int(0 * FPS); 
}


void draw() {
  background(0); // SATU-SATUNYA background(0) di seluruh project[cite: 4]

  runTimeline(); // dispatcher scene ada di TimeLine.pde[cite: 4]
}
