/**
 * ============================================================
 * S06 — SARI MENATAP KANTOR MEWAH (BROW_RAISE, ALIS NAIK)
 * ============================================================
 * Prosedur: Mengontrol pergerakan aktor berdasarkan localTime,
 * serta menyediakan kembali seluruh fungsi arsitektur Kantor Desa.
 * Fixed: Sufiks 'f' ditambahkan pada literal float untuk mencegah type mismatch double.
 */

void sceneS06(float localTime) {
  // 1. Latar Belakang Tetap & Dasar Halaman Kantor
  background(150, 205, 255);
  drawClouds();
  drawGround();
  drawCourtyard();
  drawGardenBeds();
  
  // 2. Bangunan Joglo Utama & Ornamen Patung Karso Podium
  drawPeneranganKantorPalsu(); 
  drawJoglo();
  drawTrees();
  drawFlag(600f, 100f); 
  drawKarsoWithPodium(600f, 700f, 0.45f); // digeser dari 430 -> 600, biar pas di depan pintu joglo (pusat pintu ≈ x=600)
  
  // 3. SEGMENTASI LOGIKA PERGERAKAN KARAKTER BERDASARKAN DETIK
  float currentX;
  boolean isChatting = false;
  
  if (localTime < 2.5f) {
    // Fase 1: Berjalan masuk halaman dari tepi kanan luar layar menuju tengah
    float t = localTime / 2.5f;
    currentX = lerp(1250f, 620f, t); // target diubah 680 -> 620, biar berhenti deket podium Karso (600)
    isChatting = false;
  } else if (localTime >= 2.5f && localTime < 6.5f) {
    // Fase 2: Berhenti total di tengah (Durasi 4 detik) untuk mengobrol & heran
    currentX = 620f;
    isChatting = true;
  } else {
    // Fase 3: Melanjutkan langkah berjalan ke kiri luar layar hingga habis durasi
    float t = (localTime - 6.5f) / 2.5f; 
    currentX = lerp(620f, -150f, t);
    isChatting = false;
  }
  
  // 4. LAYER RENDER TOKOH UTAMA DI ATAS PAVING
  // Bu Sari
  pushMatrix();
  translate(currentX, 680f); scale(0.38f);               
  if (isChatting) {
    drawBuSariIdle(0f, 0f);    // Menggunakan fungsi asli dari Actors.pde
  } else {
    drawBuSariWalking(0f, 0f); 
  }
  popMatrix();
  
  // Sari (Berjalan di depan barisan kiri Ibu Sari)
  pushMatrix();
  translate(currentX - 55f, 680f); scale(0.38f);               
  if (isChatting) drawSariHeranDiam(0f, 0f); // Menampilkan ekspresi BROW_RAISE (Alis naik heran)
  else drawSariWalking(0f, 0f);   
  popMatrix();
  
  // 5. SISTEM SUBTITLE TIMING DIALOG S06
  if (localTime >= 2.3f && localTime < 4.1f) {
    drawDialogBubble("SARI", "...Hm.");
  } else if (localTime >= 4.1f && localTime < 6.73f) {
    drawDialogBubble("IBU SARI", "Apa sih, baru datang sudah melamun.");
  } else if (localTime >= 6.73f && localTime < 8.5f) {
    drawDialogBubble("SARI", "Nggak, Bu. Lagi mikir.");
  }
}

// Fungsi pembantu internal jaminan stabilitas rendering S06
void drawPeneranganKantorPalsu() {
  noStroke(); fill(255, 255, 255, 40); rect(0f, 0f, (float)width, 525f);
}

// =================================================================
// SISA TEMPLATE SCRIPT BACKGROUND & ARSITEKTUR JOGLO ASLI DARI S6
// =================================================================
void drawClouds() {
  noStroke(); fill(240, 248, 255, 220);
  ellipse(150f, 150f, 180f, 50f); ellipse(220f, 130f, 140f, 60f); ellipse(300f, 160f, 160f, 40f);
  ellipse(850f, 180f, 200f, 50f); ellipse(920f, 160f, 150f, 60f); ellipse(1050f, 120f, 180f, 45f);
}
void drawGround() { noStroke(); fill(210, 210, 205); rect(0f, 525f, (float)width, height - 525f); } // nutup pas ke bawah kanvas
void drawCourtyard() {
  stroke(165, 165, 160); strokeWeight(1.5f);
  for (int y : new int[]{532, 542, 554, 568, 585, 605, 630, 660, 695}) line(0f, (float)y, (float)width, (float)y);
  for (int xOffset = -4000; xOffset <= 4000; xOffset += 65) line(map(525f, 460f, 700f, 600f, 600f + xOffset), 525f, 600f + xOffset, 700f);
  noStroke();
}
void drawGardenBeds() {
  noStroke(); fill(130, 135, 130); beginShape(); vertex(0f, 640f); vertex(380f, 700f); vertex(0f, 700f); endShape(CLOSE);
  fill(120, 175, 70); beginShape(); vertex(0f, 646f); vertex(360f, 700f); vertex(0f, 700f); endShape(CLOSE);
  fill(130, 135, 130); beginShape(); vertex(1200f, 640f); vertex(820f, 700f); vertex(1200f, 700f); endShape(CLOSE);
  fill(120, 175, 70); beginShape(); vertex(1200f, 646f); vertex(840f, 700f); vertex(1200f, 700f); endShape(CLOSE);
  fill(130, 135, 130); quad(140f, 565f, 500f, 565f, 480f, 532f, 160f, 532f); fill(120, 175, 70); quad(145f, 562f, 495f, 562f, 477f, 535f, 163f, 535f);
  fill(130, 135, 130); quad(1060f, 565f, 700f, 565f, 720f, 532f, 1040f, 532f); fill(120, 175, 70); quad(1055f, 562f, 705f, 562f, 723f, 535f, 1037f, 535f);
}
void drawTree(float x, float y, float s) {
  pushMatrix(); translate(x, y); scale(s); noStroke(); 
  fill(0, 40); ellipse(0f, 105f, 110f, 25f); fill(110, 70, 40); rect(-12f, 0f, 24f, 100f, 4f);
  fill(90, 55, 30); rect(-6f, 10f, 4f, 85f); rect(3f, 5f, 4f, 90f);
  stroke(95, 60, 35); strokeWeight(6f); line(0f, 25f, -25f, -5f); line(0f, 35f, 28f, 0f); line(0f, 50f, -20f, 20f); line(0f, 55f, 22f, 28f);
  strokeWeight(4f); line(-25f, -5f, -40f, -18f); line(28f, 0f, 42f, -18f); noStroke();
  fill(45, 110, 45); ellipse(-35f, -20f, 55f, 55f); ellipse(35f, -20f, 55f, 55f); ellipse(0f, -45f, 70f, 70f); ellipse(0f, -10f, 75f, 65f);
  fill(60, 135, 60); ellipse(-55f, -5f, 55f, 55f); ellipse(55f, -5f, 55f, 55f); ellipse(-25f, -55f, 60f, 60f); ellipse(25f, -55f, 60f, 60f); ellipse(0f, -75f, 60f, 60f); ellipse(-10f, -25f, 70f, 60f); ellipse(20f, -20f, 65f, 60f);
  fill(80, 165, 80); ellipse(-45f, -40f, 45f, 45f); ellipse(45f, -40f, 45f, 45f); ellipse(0f, -55f, 40f, 40f); ellipse(-20f, -5f, 50f, 45f); ellipse(22f, -5f, 50f, 45f);
  fill(120, 210, 120, 120); ellipse(-30f, -45f, 18f, 18f); ellipse(18f, -55f, 15f, 15f); ellipse(42f, -20f, 15f, 15f);
  popMatrix();
}
void drawTrees() { drawTree(100f, 530f, 1.4f); drawTree(1100f, 530f, 1.4f); drawTree(320f, 460f, 0.9f); drawTree(880f, 460f, 0.9f); }
void drawFlag(float x, float y) {
  pushMatrix(); translate(x, y); noStroke(); 
  fill(120); rect(-25f, 588f, 50f, 12f); fill(145); rect(-18f, 580f, 36f, 8f); fill(170); rect(-12f, 570f, 24f, 10f);
  stroke(210); strokeWeight(5f); line(0f, 0f, 0f, 570f); strokeWeight(3f); line(0f, 220f, 0f, 260f); noStroke(); fill(200); ellipse(0f, -5f, 10f, 10f);
  stroke(180); strokeWeight(2f); line(0f, 5f, 10f, 8f); noStroke();
  fill(210, 30, 40); beginShape(); vertex(2f, 8f); vertex(30f, 5f); vertex(55f, 8f); vertex(78f, 4f); vertex(102f, 6f); vertex(118f, 7f); vertex(118f, 35f); vertex(100f, 34f); vertex(76f, 37f); vertex(54f, 34f); vertex(30f, 36f); vertex(2f, 34f); endShape(CLOSE);
  fill(250); beginShape(); vertex(2f, 34f); vertex(30f, 36f); vertex(54f, 34f); vertex(76f, 37f); vertex(100f, 34f); vertex(118f, 35f); vertex(118f, 64f); vertex(98f, 63f); vertex(76f, 67f); vertex(52f, 63f); vertex(28f, 66f); vertex(2f, 62f); endShape(CLOSE);
  popMatrix();
}
void drawKarsoWithPodium(float x, float y, float s) {
  pushMatrix(); translate(x, y); scale(s); translate(-400f, -993f); stroke(38, 38, 46); strokeWeight(6f); fill(168, 163, 153); rect(285f, 755f, 230f, 238f, 10f, 10f, 0f, 0f); drawKarso(400f, 736f, 1.28f); popMatrix();
}
void drawKarso(float x, float y, float s) {
  pushMatrix(); translate(x, y); scale(s); translate(-194f, -672f); stroke(38, 38, 46); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(120f, 285f); rotate(radians(45f)); fill(141, 131, 120); rect(-16f, 0f, 32f, 80f, 12f); translate(0f, 75f); rotate(radians(-100f)); rect(-14f, 0f, 28f, 70f, 12f); fill(185, 182, 173); ellipse(0f, 70f, 26f, 26f); popMatrix();
  stroke(38, 38, 46); strokeWeight(6f);
  pushMatrix(); translate(168f, 415f); fill(141, 131, 120); rect(-26f, 0f, 52f, 235f); fill(240, 240, 238); rect(-18f, 235f, 34f, 15f); fill(84, 79, 62); rect(-43f, 247f, 62f, 25f, 8f, 8f, 2f, 2f); popMatrix();
  pushMatrix(); translate(220f, 415f); fill(141, 131, 120); rect(-26f, 0f, 52f, 235f); fill(240, 240, 238); rect(-18f, 235f, 34f, 15f); fill(84, 79, 62); rect(-42f, 250f, 65f, 26f, 8f, 8f, 2f, 2f); popMatrix();
  fill(185, 182, 173); rect(132f, 160f, 116f, 135f, 45f); ellipse(245f, 225f, 25f, 35f); fill(84, 79, 62); rect(228f, 165f, 20f, 37f, 5f); rect(128f, 110f, 120f, 60f, 10f, 10f, 0f, 0f); 
  fill(218, 181, 60); noStroke(); for(int i=0; i<6; i++) rect(140f + i*16f, 135f, 10f, 4f, 2f);
  fill(38, 38, 46); stroke(38, 38, 46); strokeWeight(6f); ellipse(160f, 215f, 14f, 14f); ellipse(195f, 215f, 14f, 14f);
  fill(38, 38, 46); beginShape(); vertex(142f, 242f); bezierVertex(142f, 230f, 210f, 230f, 210f, 242f); bezierVertex(210f, 265f, 185f, 270f, 176f, 252f); bezierVertex(165f, 270f, 142f, 265f, 142f, 242f); endShape(CLOSE);
  fill(141, 131, 120); rect(124f, 280f, 132f, 150f); fill(240, 240, 238); triangle(145f, 280f, 185f, 280f, 165f, 335f);
  fill(84, 79, 62); beginShape(); vertex(155f, 295f); vertex(175f, 295f); vertex(180f, 395f); vertex(165f, 415f); vertex(150f, 395f); endShape(CLOSE);
  stroke(218, 181, 60); strokeWeight(3f); line(158f, 330f, 172f, 320f); line(156f, 360f, 172f, 345f); line(154f, 390f, 178f, 370f); stroke(38, 38, 46); strokeWeight(6f);
  pushMatrix(); translate(256f, 285f); rotate(radians(450f)); fill(141, 131, 120); rect(-18f, 0f, 36f, 85f, 12f); translate(0f, 80f); rotate(radians(105f)); rect(-16f, 0f, 32f, 75f, 12f); fill(185, 182, 173); ellipse(0f, 75f, 28f, 28f); popMatrix();
  popMatrix(); 
}

// =================================================================
// FIXED JOGLO DETAILED FUNCTIONS
// =================================================================
void curvedRoof(float blx, float bly, float brx, float bry, float trx, float tr_y, float tlx, float tly, float sag) {
  beginShape(); vertex(blx, bly); bezierVertex(lerp(blx, brx, 0.33f), bly + sag, lerp(blx, brx, 0.66f), bry + sag, brx, bry); vertex(trx, tr_y); vertex(tlx, tly); endShape(CLOSE);
}
void roofTileLines(float blx, float bly, float brx, float bry, float trx, float tr_y, float tlx, float tly, int step) {
  stroke(145, 75, 40); for (float y = tly + (float)step; y < bly; y += (float)step) line(map(y, bly, tly, blx, tlx), y, map(y, bry, tr_y, brx, trx), y); noStroke();
}
void drawJoglo() {
  drawFrontBase(); drawBuildingExtensions();
  fill(122, 76, 42); rect(200f, 360f, 800f, 170f);
  stroke(145, 95, 55); for (int i = 0; i < 32; i++) line(220f + (float)i * 24f, 360f, 220f + (float)i * 24f, 530f); noStroke();
  fill(95, 60, 35); rect(200f, 350f, 800f, 10f); rect(200f, 530f, 800f, 10f);
  fill(75, 45, 25); for (int i = 0; i < 8; i++) { if (i == 3 || i == 4) continue; rect(215f + (float)i * 110f, 330f, 18f, 30f); }
  drawWindow(330f, 390f); drawWindow(760f, 390f);
  fill(70, 40, 20); rect(545f, 360f, 110f, 170f); fill(90, 55, 30); rect(552f, 366f, 45f, 158f); rect(603f, 366f, 45f, 158f);
  drawJogloWallDetails();
  fill(192, 102, 60); curvedRoof(120f, 360f, 1080f, 360f, 930f, 240f, 270f, 240f, 10f); roofTileLines(120f, 360f, 1080f, 360f, 930f, 240f, 270f, 240f, 8);
  fill(176, 90, 52); curvedRoof(340f, 240f, 860f, 240f, 760f, 165f, 440f, 165f, 6f); roofTileLines(340f, 240f, 860f, 240f, 760f, 165f, 440f, 165f, 7);
  fill(160, 82, 45); curvedRoof(470f, 165f, 730f, 165f, 655f, 90f, 545f, 90f, 4f); roofTileLines(470f, 165f, 730f, 165f, 655f, 90f, 545f, 90f, 6);
  drawColumnsFront(); drawFrontRoof();
  fill(95, 50, 30); rect(588f, 75f, 24f, 15f); fill(210, 180, 60); ellipse(600f, 82f, 12f, 12f);
}
void drawColumn(float x) { fill(88, 55, 34); rect(x, 355f, 26f, 175f); }
void drawWindow(float x, float y) {
  fill(70, 45, 25); rect(x - 8f, y - 8f, 96f, 86f); fill(205, 220, 215); rect(x, y, 80f, 70f);
  stroke(80); line(x + 40f, y, x + 40f, y + 70f); line(x, y + 35f, x + 80f, y + 35f); noStroke();
}
void drawFrontBase() { fill(100, 95, 85); rect(180f, 495f, 840f, 35f); fill(220); rect(535f, 495f, 130f, 15f); rect(525f, 510f, 150f, 15f); rect(515f, 525f, 170f, 15f); }
void drawFrontRoof() { fill(170, 95, 55); quad(200f, 355f, 1030f, 355f, 940f, 315f, 260f, 315f); stroke(140, 75, 45); for (float y = 315f; y <= 355f; y += 5f) line(map(y, 315f, 355f, 260f, 200f), y, map(y, 315f, 355f, 940f, 1030f), y); noStroke(); }
void drawJogloWallDetails() { fill(0, 40); quad(210f, 365f, 990f, 365f, 920f, 390f, 280f, 390f); fill(110, 65, 35); rect(200f, 355f, 800f, 6f); fill(170, 210, 235, 180); rect(563f, 380f, 24f, 55f, 4f); rect(613f, 380f, 24f, 55f, 4f); drawSmallWindow(240f, 390f); drawSmallWindow(880f, 390f); }
void drawSmallWindow(float x, float y) { fill(70, 45, 25); rect(x, y, 55f, 70f); fill(180, 220, 230); rect(x + 5f, y + 5f, 45f, 60f); }
void drawBuildingExtensions() {
  fill(120, 75, 45); rect(80f, 385f, 140f, 145f); rect(980f, 385f, 140f, 145f); drawWingWindow(105f, 415f); drawWingWindow(1025f, 415f);
  fill(185, 100, 60); quad(60f, 385f, 240f, 385f, 215f, 345f, 85f, 345f); stroke(140, 75, 45); for (float y = 345f; y <= 385f; y += 4f) line(map(y, 385f, 345f, 60f, 85f), y, map(y, 385f, 345f, 240f, 215f), y); noStroke();
  fill(185, 100, 60); quad(960f, 385f, 1140f, 385f, 1115f, 345f, 985f, 345f); stroke(140, 75, 45); for (float y = 345f; y <= 385f; y += 4f) line(map(y, 385f, 345f, 960f, 985f), y, map(y, 385f, 345f, 1140f, 1115f), y); noStroke();
  fill(185, 100, 60); quad(960f, 385f, 1140f, 385f, 1115f, 345f, 985f, 345f); stroke(140, 75, 45); for (float y = 345f; y <= 385f; y += 4f) line(map(y, 385f, 345f, 960f, 985f), y, map(y, 385f, 345f, 1140f, 1115f), y); noStroke();
}
void drawWingWindow(float x, float y) { fill(70, 40, 20); rect(x, y, 70f, 80f); fill(180, 220, 235); rect(x + 5f, y + 5f, 60f, 70f); }
void drawColumnsFront() { for (int i = 0; i < 8; i++) { if (i == 3 || i == 4) continue; float x = 215f + (float)i * 110f; drawColumn(x); fill(65, 40, 22); rect(x - 4f, 350f, 34f, 12f); rect(x - 4f, 525f, 34f, 12f); } }
