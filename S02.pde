// =========================================================
// S02.pde (10.0 dtk)
// Menampilkan pemandangan balai desa luar dan jalanan rusak (bgS02).
// Ditambahkan animasi gumpalan awan bergerak melintasi langit.
// =========================================================

void sceneS02(float localTime) {
  // 1. Gambar background utama Scene 2
  image(bgS02, 0, 0, width, height); //

  // 2. Gambar awan-awan bergerak (Gaya flat khas animasi)
  // Pergerakan diikat ke localTime agar pergerakan mulus rata di 24 fps
  pushMatrix();
  noStroke();
  fill(255, 255, 255, 200); // Putih semi-transparan mendung tipis

  // Awan 1 (Bergerak sedang di atas area gunung)
  float cloud1X = (localTime * 25.0) % (width + 300) - 200;
  drawStylizedCloud(cloud1X, 130);

  // Awan 2 (Bergerak agak cepat di sisi kanan langit)
  float cloud2X = ((localTime * 40.0) + 500) % (width + 300) - 200;
  drawStylizedCloud(cloud2X, 90);

  // Awan 3 (Bergerak paling lambat di latar belakang jauh)
  float cloud3X = ((localTime * 15.0) + 900) % (width + 300) - 200;
  drawStylizedCloud(cloud3X, 170);

  popMatrix();
}

// Helper fungsi lokal untuk menggambar gumpalan awan bergaya blob
void drawStylizedCloud(float x, float y) {
  pushMatrix();
  translate(x, y);
  ellipse(0, 0, 140, 45);
  ellipse(-45, 5, 90, 35);
  ellipse(45, 5, 90, 35);
  popMatrix();
}
