/**
 * ============================================================
 * S05 — SARI TURUN, AMATI LUBANG JALAN (RESCALED TO 1280x720)
 * ============================================================
 */

float[][] s05_potholes = { {140f, 110f, 14f}, {490f, 90f, 10f}, {720f, 170f, 20f} };

void sceneS05(float localTime) {
  background(178, 216, 232);
  
  // Bungkus Dunia Virtual 800x400 dengan Skala Proposional 1.6x
  pushMatrix();
  translate(0f, 80f); 
  scale(1.6f);        
  
  s05_drawCloud(210f, 100f, 65f);
  s05_drawCloud(670f, 70f, 80f);
  s05_drawMountain();
  
  noStroke(); fill(122, 74, 42); rect(0f, 210f, 800f, 65f); // Jalan tanah virtual 800f
  fill(155, 204, 112); rect(0f, 275f, 800f, 125f);       // Sawah virtual 800f
  s05_drawRiceFieldDetails();
  s05_drawPotholes();
  s05_drawJerryCan(480f, 242f);
  
  float truckX, charX;
  float wheelAngle = 0f;
  boolean sudahTurun = false;
  boolean sudahMulaiJalanLagi = false;
  
  if (localTime < 2.5f) {
    truckX = 850f - (localTime * 180f); 
    wheelAngle = truckX * -0.06f;
    charX = 490f;
  } else if (localTime >= 2.5f && localTime < 5.5f) {
    truckX = 400f; 
    charX = 490f;
    sudahTurun = true;
  } else {
    float waktuBerjalan = localTime - 5.5f;
    truckX = 400f - (waktuBerjalan * 200f);
    wheelAngle = truckX * -0.06f;
    charX = 490f - (waktuBerjalan * 45f); 
    sudahTurun = true;
    sudahMulaiJalanLagi = true;
  }
  
  float frontDip = s05_getTerrainDip(truckX + 45f);
  float backDip = s05_getTerrainDip(truckX + 145f);
  float avgDip = (frontDip + backDip) / 2.0f;
  float pitchAngle = atan2(backDip - frontDip, 100f);
  
  pushMatrix();
  translate(truckX, 175f + avgDip);
  translate(95f, 45f); rotate(pitchAngle); translate(-95f, -45f);
  fill(110, 118, 124); rect(97f, 25f, 95f, 40f);
  
  if (!sudahTurun) {
    float roadBumpy = sin(frameCount * 0.4f) * 1.0f;
    pushMatrix(); translate(120f, 50f + roadBumpy); scale(0.18f); drawBuSariDiTruk(0f, 0f); popMatrix();
    pushMatrix(); translate(160f, 42f + roadBumpy); scale(0.18f); drawSariDiTruk(0f, 0f); popMatrix();
  }
  s05_drawTruck(wheelAngle);
  popMatrix();
  
  if (sudahTurun) {
    pushMatrix(); translate(charX, 245f); scale(0.18f);
    if (!sudahMulaiJalanLagi) drawBuSariDiamDiTanah(0f, 0f); 
    else drawBuSariWalking(0f, 0f);
    popMatrix();
    
    pushMatrix(); translate(charX - 40f, 245f); scale(0.18f);
    if (!sudahMulaiJalanLagi) drawSariDiamDiTanah(0f, 0f);   
    else drawSariWalking(0f, 0f);
    popMatrix();
  }
  popMatrix(); // Tutup bungkusan matriks utama S05
  
  // Komponen bubble teks di luar matriks agar ukuran teks font caption tetap tajam & seragam
  if (localTime >= 2.5f && localTime < 5.5f) {
    drawDialogBubble("SARI", "Hm.");
  }
}

// --- helper internal lingkungan S05 ---
float s05_getTerrainDip(float wx) {
  float totalDip = 0f;
  for (int i = 0; i < s05_potholes.length; i++) {
    float pX = s05_potholes[i][0]; float pWidth = s05_potholes[i][1]; float pDepth = s05_potholes[i][2];
    float distance = abs(wx - pX);
    if (distance < pWidth / 2.0f) totalDip += pDepth * cos(map(distance, 0f, pWidth / 2.0f, 0f, HALF_PI));
  }
  return totalDip;
}
void s05_drawMountain() {
  noStroke(); fill(137, 164, 181); beginShape(); vertex(500f, 215f); vertex(680f, 135f); vertex(860f, 215f); endShape(CLOSE);
  fill(222, 234, 240); beginShape(); vertex(652f, 147f); vertex(680f, 135f); vertex(708f, 147f); vertex(698f, 158f); endShape(CLOSE);
}
void s05_drawCloud(float x, float y, float size) {
  fill(255, 255, 255, 230); noStroke(); ellipse(x, y, size * 1.5f, size * 0.8f);
}
void s05_drawPotholes() {
  stroke(94, 55, 29); strokeWeight(3f);
  for (int i = 0; i < s05_potholes.length; i++) {
    float x = s05_potholes[i][0]; float w = s05_potholes[i][1]; float d = s05_potholes[i][2];
    fill(102, 61, 34); ellipse(x, 240f, w, d * 2.5f);
    noStroke(); fill(102, 126, 143); ellipse(x, 242f, w - 8f, (d * 2.5f) - 6f);
  }
}
void s05_drawJerryCan(float x, float y) {
  pushMatrix(); translate(x, y); noStroke(); fill(62, 97, 69); rect(0f, 8f, 16f, 22f, 2f); stroke(62, 97, 69); strokeWeight(2f); noFill(); rect(3f, 3f, 10f, 5f); fill(40); noStroke(); rect(11f, 2f, 3f, 3f); popMatrix();
}
void s05_drawRiceFieldDetails() {
  stroke(129, 179, 91); strokeWeight(8f); for (int i = -200; i < 800; i += 75) line((float)i, 275f, (float)i + 150f, 400f);
}
void s05_drawTruck(float wAngle) {
  noStroke(); fill(70); rect(-4f, 60f, 12f, 7f); fill(45); rect(2f, 28f, 5f, 33f); fill(134, 142, 147); rect(7f, 25f, 40f, 40f); rect(47f, 0f, 50f, 65f); beginShape(); vertex(47f, 0f); vertex(27f, 25f); vertex(47f, 25f); endShape(CLOSE); rect(97f, 36f, 95f, 29f);
  fill(204, 222, 230); rect(66f, 6f, 25f, 20f); beginShape(); vertex(49f, 6f); vertex(63f, 6f); vertex(63f, 22f); vertex(37f, 22f); endShape(CLOSE);
  s05_drawWheel(45f, 65f, wAngle); s05_drawWheel(145f, 65f, wAngle);
}
void s05_drawWheel(float wx, float wy, float wAngle) {
  pushMatrix(); translate(wx, wy); rotate(wAngle); fill(40); noStroke(); ellipse(0f, 0f, 38f, 38f); fill(85); ellipse(0f, 0f, 24f, 24f); stroke(40); strokeWeight(3f); line(-12f, 0f, 11f, 0f); line(0f, -12f, 0f, 11f); fill(215); noStroke(); ellipse(0f, 0f, 6f, 6f); popMatrix();
}
