/**
 * ============================================================
 * S04 — TRUK MASUK FRAME (RESCALED TO 1280x720 @24FPS)
 * ============================================================
 */

void sceneS04(float localTime) {
  // 1. Bersihkan layar dengan warna langit penuh
  background(166, 208, 230);
  
  // 2. Bungkus Dunia Virtual 800x400 dengan Skala Proposional 1.6x
  pushMatrix();
  translate(0f, 80f); // Posisikan di lantai bawah, menyisakan 80px ruang langit alami di atas
  scale(1.6f);        // 800f * 1.6f = 1280f | 400f * 1.6f = 640f (+80f offset = 720f)
  
  s04_drawCloud(190f, 95f, 65f);
  s04_drawCloud(630f, 75f, 75f);
  s04_drawMountain();
  
  // Gambar Jalan Tanah (Menggunakan lebar virtual 800f)
  noStroke(); fill(135, 83, 47);
  rect(0f, 210f, 800f, 65f);
  
  // Gambar Area Sawah (Menggunakan lebar virtual 800f)
  fill(160, 212, 114); rect(0f, 275f, 800f, 125f);
  s04_drawRiceFieldDetails();
  
  // Pengendalian Posisi Truk Berdasarkan Waktu Mutlak
  float s04_truckX = -250f + (localTime * 160f); 
  float s04_wheelAngle = s04_truckX * 0.06f; 
  
  // Efek Kumpulan Debu
  if (frameCount % 3 == 0 && s04_truckX > -150f && s04_truckX < 900f) {
    s04_spawnDust(s04_truckX + 20f, 175f + 65f); 
  }
  s04_drawDust(s04_truckX);
  
  // Gambar Truk Utama & Tokoh Duduk
  s04_drawTruck(s04_truckX, 175f, s04_wheelAngle);
  popMatrix();

  // ---- Dialog Ibu Sari (di luar transform world 800x400, biar teks gak ikut ke-scale) ----
  if (localTime >= 4.0f && localTime < 6.1f) {
    drawDialogBubble("IBU SARI", "Sari! Sudah sampai, turun!");
  }
}

// --- helper internal lingkungan S04 (Kunci batas koordinat di 800f) ---
void s04_drawMountain() {
  noStroke(); fill(137, 169, 186); beginShape(); vertex(520f, 215f); vertex(680f, 140f); vertex(840f, 215f); endShape(CLOSE);
  fill(218, 231, 237); beginShape(); vertex(655f, 152f); vertex(680f, 140f); vertex(705f, 152f); vertex(695f, 162f); vertex(680f, 155f); vertex(665f, 162f); endShape(CLOSE);
}
void s04_drawCloud(float x, float y, float size) {
  fill(255, 255, 255, 240); noStroke(); ellipse(x, y, size * 1.5f, size * 0.8f); ellipse(x - size * 0.4f, y + size * 0.1f, size, size * 0.7f); ellipse(x + size * 0.4f, y + size * 0.1f, size, size * 0.7f);
}
void s04_drawRiceFieldDetails() {
  stroke(133, 184, 88); strokeWeight(8f);
  for (int i = -200; i < 800; i += 75) line((float)i, 275f, (float)i + 150f, 400f);
  stroke(73, 115, 43); strokeWeight(3f);
  for (int x = 20; x < 900; x += 60) {
    for (int y = 295; y < 400; y += 35) {
      float pOffset = ((float)y - 275f) * 0.52f;
      line((float)x + pOffset, (float)y, (float)x + pOffset - 6f, (float)y - 14f); line((float)x + pOffset, (float)y, (float)x + pOffset, (float)y - 17f); line((float)x + pOffset, (float)y, (float)x + pOffset + 6f, (float)y - 14f);
    }
  }
}
void s04_spawnDust(float x, float y) {}
void s04_drawDust(float speedRef) {}
void s04_drawTruck(float x, float y, float wAngle) {
  fill(110, 118, 124); rect(x, y + 25f, 95f, 40f);
  float roadBumpy = sin(frameCount * 0.4f) * 1.2f;
  pushMatrix(); translate(x + 28f, y + 42f + roadBumpy); scale(0.18f); drawBuSariDuduk(0f, 0f); popMatrix();
  pushMatrix(); translate(x + 62f, y + 42f + roadBumpy); scale(0.18f); drawSariDuduk(0f, 0f); popMatrix();
  noStroke(); fill(139, 148, 154); rect(x, y + 38f, 95f, 27f); fill(116, 124, 130); rect(x, y + 36f, 95f, 3f);
  fill(139, 148, 154); rect(x + 95f, y, 50f, 65f); beginShape(); vertex(x + 145f, y); vertex(x + 165f, y + 25f); vertex(x + 145f, y + 25f); endShape(CLOSE); rect(x + 145f, y + 25f, 40f, 40f);
  fill(206, 224, 232); rect(x + 100f, y + 6f, 25f, 20f); beginShape(); vertex(x + 130f, y + 6f); vertex(x + 143f, y + 6f); vertex(x + 152f, y + 22f); vertex(x + 130f, y + 22f); endShape(CLOSE);
  stroke(85, 92, 97); strokeWeight(2f); line(x + 95f, y, x + 95f, y + 65f); line(x + 145f, y + 25f, x + 145f, y + 65f); line(x + 145f, y + 25f, x + 185f, y + 25f);
  fill(45); noStroke(); rect(x + 185f, y + 28f, 5f, 33f); fill(242, 242, 204); rect(x + 185f, y + 32f, 4f, 8f);
  fill(75); rect(x + 180f, y + 60f, 12f, 7f); rect(x - 4f, y + 55f, 5f, 10f); fill(35); rect(x + 15f, y + 62f, 45f, 6f); rect(x + 120f, y + 62f, 45f, 6f);
  s04_drawWheel(x + 38f, y + 65f, wAngle); s04_drawWheel(x + 142f, y + 65f, wAngle);
}
void s04_drawWheel(float wx, float wy, float wAngle) {
  pushMatrix(); translate(wx, wy); rotate(wAngle); fill(38); noStroke(); ellipse(0f, 0f, 38f, 38f); fill(85); ellipse(0f, 0f, 24f, 24f); stroke(38); strokeWeight(3f); line(-12f, 0f, 11f, 0f); line(0f, -12f, 0f, 11f); fill(210); noStroke(); ellipse(0f, 0f, 6f, 6f); popMatrix();
}
