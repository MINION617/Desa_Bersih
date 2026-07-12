// =========================================================
// S03.pde (8.0 dtk)
// Karso berdiri bangga di tengah halaman depan balai desa.
// Terdapat patung perunggu dirinya di atas podium kiri, 
// serta papan anggaran berdebu kusam di pojok kanan taman.
// Tanpa dialog — visual dan musik latar saja.
// =========================================================

void sceneS03(float localTime) {
  // 1. Transformasi Skala Global agar aset 1200x700 temanmu pas mengisi resolusi 1280x720 kita
  pushMatrix();
  scale(1.0666, 1.0285); //[cite: 4, 10]

  // Latar Belakang langit biru cerah
  background(150, 205, 255); //[cite: 10]
  
  // 2. Gambar Lapisan Elemen Latar Belakang Balai Desa
  drawS03Clouds(); //[cite: 10]
  drawS03Ground(); //[cite: 10]
  drawS03Courtyard(); //[cite: 10]
  drawS03GardenBeds(); //[cite: 10]
  drawS03Joglo(); //[cite: 10]
  drawS03Trees(); //[cite: 10]
  
  // 3. Gambar Bendera Berkibar di tengah depan joglo
  drawS03Flag(600, 100); //[cite: 10]
  
  // 4. Gambar Patung Karso Perunggu Statis di atas podium sebelah kiri bendera
  drawS03StatueWithPodium(430, 700, 0.45); //[cite: 10]

  // 5. Gambar Kontras Ironis: Papan Anggaran Berdebu & Diabaikan di pojok kanan taman
  drawS03PapanAnggaranBerdebu(1000, 560); //

  // 6. Gambar PAK KARSO ASLI berdiri bangga di tengah halaman depan balai desa
  // Menggunakan pose bertolak pinggang yang sama dengan patung, namun dengan warna kulit/jas asli
  drawKarsoRealBangga(640, 680, 0.42); //[cite: 10]

  popMatrix();
}

// =========================================================
// FUNGSI AKTOR: Karso Berdiri Bangga Bertolak Pinggang (Warna Asli)
// =========================================================
void drawKarsoRealBangga(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  translate(-194, -672); // Reset origin lokal ke tengah-bawah lantai kaki[cite: 3]

  float waktu = frameCount * 0.05; //[cite: 2]
  float bobbing = sin(waktu) * 2.0; // Bobbing napas halus khas karakter hidup[cite: 2]

  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND); //[cite: 2]

  // 1. LENGAN BELAKANG KIRI (Bertolak pinggang)
  pushMatrix();
  translate(120, 285 + bobbing); //[cite: 10]
  rotate(radians(45));           
  fill(175, 140, 95); rect(-16, 0, 32, 80, 12); // Warna Jas Asli[cite: 2]
  translate(0, 75); rotate(radians(-100));          
  fill(175, 140, 95); rect(-14, 0, 28, 70, 12);       
  fill(235, 155, 120); ellipse(0, 70, 26, 26); // Warna Kulit Asli[cite: 2]
  popMatrix();

  // 2. KAKI BELAKANG
  pushMatrix();
  translate(168, 415);
  fill(175, 140, 95); rect(-26, 0, 52, 235); // Celana jas[cite: 2]
  fill(240, 240, 230); rect(-18, 235, 34, 15); // Kaos kaki
  fill(55, 53, 65); rect(-43, 247, 62, 25, 8, 8, 2, 2); // Sepatu hitam[cite: 2]
  popMatrix();

  // 3. KAKI DEPAN
  pushMatrix();
  translate(220, 415);
  fill(175, 140, 95); rect(-26, 0, 52, 235);
  fill(240, 240, 230); rect(-18, 235, 34, 15);
  fill(55, 53, 65); rect(-42, 250, 65, 26, 8, 8, 2, 2);
  popMatrix();

  // 4. KEPALA, MATA, & PECAI/KOPIAH
  fill(235, 155, 120); rect(132, 160 + bobbing, 116, 135, 45); // Kepala kulit[cite: 2]
  ellipse(245, 225 + bobbing, 25, 35);      
  fill(40, 38, 48); rect(228, 165 + bobbing, 20, 37, 5); rect(128, 110 + bobbing, 120, 60, 10, 10, 0, 0); // Kopiah hitam[cite: 2]
  fill(240, 200, 50); noStroke(); // Detil emas kopiah[cite: 2]
  rect(140, 135 + bobbing, 10, 4, 2); rect(156, 135 + bobbing, 10, 4, 2); rect(172, 135 + bobbing, 10, 4, 2); rect(188, 135 + bobbing, 10, 4, 2); rect(204, 135 + bobbing, 10, 4, 2); rect(220, 135 + bobbing, 10, 4, 2);
  
  fill(55, 53, 65); stroke(40, 38, 48); strokeWeight(6);
  ellipse(160, 215 + bobbing, 14, 14); ellipse(195, 215 + bobbing, 14, 14); // Mata[cite: 2]

  // Kumis Tebal
  fill(55, 53, 65); beginShape(); vertex(142, 242 + bobbing); bezierVertex(142, 230 + bobbing, 210, 230 + bobbing, 210, 242 + bobbing); bezierVertex(210, 265 + bobbing, 185, 270 + bobbing, 176, 252 + bobbing); bezierVertex(165, 270 + bobbing, 142, 265 + bobbing, 142, 242 + bobbing); endShape(CLOSE); //[cite: 2]

  // 5. BADAN JAS UTAMA & DASI
  fill(175, 140, 95); rect(124, 280 + bobbing, 132, 150); //[cite: 2]
  fill(255); triangle(145, 280 + bobbing, 185, 280 + bobbing, 165, 335 + bobbing); // Kemeja putih[cite: 2]
  fill(40, 38, 48); beginShape(); vertex(155, 295 + bobbing); vertex(175, 295 + bobbing); vertex(180, 395 + bobbing); vertex(165, 415 + bobbing); vertex(150, 395 + bobbing); endShape(CLOSE); // Dasi hitam[cite: 2]
  stroke(240, 200, 50); strokeWeight(3); line(158, 330 + bobbing, 172, 320 + bobbing); line(156, 360 + bobbing, 175, 345 + bobbing); line(154, 390 + bobbing, 178, 370 + bobbing); // Garis dasi[cite: 2]

  // 6. LENGAN DEPAN KANAN (Bertolak pinggang luar)
  stroke(40, 38, 48); strokeWeight(6);
  pushMatrix();
  translate(256, 285 + bobbing); //[cite: 10]
  rotate(radians(-45));           
  fill(175, 140, 95); rect(-18, 0, 36, 85, 12);       
  translate(0, 80); rotate(radians(105));           
  fill(175, 140, 95); rect(-16, 0, 32, 75, 12);       
  fill(235, 155, 120); ellipse(0, 75, 28, 28);         
  popMatrix();

  popMatrix(); 
}

// =========================================================
// PROPS LOKAL: Papan Anggaran Desa Kusam, Berdebu & Berlumut
// =========================================================
void drawS03PapanAnggaranBerdebu(float x, float y) {
  pushMatrix();
  translate(x, y);
  stroke(40, 38, 48); strokeWeight(4);

  // Tiang kayu penyangga papan anggaran kusam
  fill(100, 90, 85);
  rect(-40, 0, 10, 120);
  rect(40, 0, 10, 120);

  // Papan info kayu kusam
  fill(155, 150, 142); // Warna papan abu-abu berdebu kontras kusam
  rect(-65, -80, 140, 80, 4);

  // Corak noda debu tipis di atas permukaan papan
  noStroke(); fill(130, 125, 120, 150);
  rect(-60, -75, 130, 15);
  rect(-60, -45, 80, 10);

  // Garis-garis tulisan anggaran yang pudar/luntur terkelupas
  stroke(110, 105, 100); strokeWeight(2.5);
  line(-50, -70, 40, -70);
  line(-50, -55, 20, -55);
  line(-50, -40, 50, -40);
  line(-50, -25, -10, -25);

  // Serat sarang laba-laba/debu di pojok kayu penanda ironis
  stroke(180, 180, 180, 180); strokeWeight(1.5);
  line(55, -20, 75, 0);
  line(60, -10, 75, -20);
  line(45, -5, 75, -5);

  popMatrix();
}

// =========================================================
// ASET VEKTOR LOKAL (DIPINDAHKAN UTUH DARI KODE TEMANMU)
// =========================================================
void drawS03Clouds() {
  noStroke(); fill(240, 248, 255, 220); //[cite: 10]
  ellipse(150, 150, 180, 50); ellipse(220, 130, 140, 60); ellipse(300, 160, 160, 40); //[cite: 10]
  ellipse(850, 180, 200, 50); ellipse(920, 160, 150, 60); ellipse(1050, 120, 180, 45); //[cite: 10]
}

void drawS03Ground() {
  noStroke(); fill(210, 210, 205); rect(0, 525, width, 175); //[cite: 10]
}

void drawS03Courtyard() {
  stroke(165, 165, 160); strokeWeight(1.5); //[cite: 10]
  line(0, 532, width, 532); line(0, 542, width, 542); line(0, 554, width, 554); line(0, 568, width, 568); line(0, 585, width, 585); line(0, 605, width, 605); line(0, 630, width, 630); line(0, 660, width, 660); line(0, 695, width, 695); //[cite: 10]
  float vpX = 600; float vpY = 460; //[cite: 10]
  for (int xOffset = -4000; xOffset <= 4000; xOffset += 65) {
    float xTop = map(525, vpY, 700, vpX, vpX + xOffset); float xBottom = vpX + xOffset;
    line(xTop, 525, xBottom, 700); //[cite: 10]
  }
  noStroke();
}

void drawS03GardenBeds() {
  noStroke(); fill(130, 135, 130); //[cite: 10]
  beginShape(); vertex(0, 640); vertex(380, 700); vertex(0, 700); endShape(CLOSE); //[cite: 10]
  fill(120, 175, 70); beginShape(); vertex(0, 646); vertex(360, 700); vertex(0, 700); endShape(CLOSE); //[cite: 10]
  fill(130, 135, 130); beginShape(); vertex(1200, 640); vertex(820, 700); vertex(1200, 700); endShape(CLOSE); //[cite: 10]
  fill(120, 175, 70); beginShape(); vertex(1200, 646); vertex(840, 700); vertex(1200, 700); endShape(CLOSE); //[cite: 10]
  fill(130, 135, 130); quad(140, 565, 500, 565, 480, 532, 160, 532); fill(120, 175, 70); quad(145, 562, 495, 562, 477, 535, 163, 535); //[cite: 10]
  fill(130, 135, 130); quad(1060, 565, 700, 565, 720, 532, 1040, 532); fill(120, 175, 70); quad(1055, 562, 705, 562, 723, 535, 1037, 535); //[cite: 10]
}

void drawS03SizingTree(float x, float y, float s) {
  pushMatrix(); translate(x, y); scale(s); noStroke(); //[cite: 10]
  fill(0, 40); ellipse(0, 105, 110, 25); fill(110, 70, 40); rect(-12, 0, 24, 100, 4); fill(90, 55, 30); rect(-6, 10, 4, 85); rect(3, 5, 4, 90); //[cite: 10]
  stroke(95, 60, 35); strokeWeight(6); line(0, 25, -25, -5); line(0, 35, 28, 0); line(0, 50, -20, 20); line(0, 55, 22, 28); strokeWeight(4); line(-25, -5, -40, -18); line(28, 0, 42, -18); noStroke(); //[cite: 10]
  fill(45, 110, 45); ellipse(-35, -20, 55, 55); ellipse(35, -20, 55, 55); ellipse(0, -45, 70, 70); ellipse(0, -10, 75, 65); //[cite: 10]
  fill(60, 135, 60); ellipse(-55, -5, 55, 55); ellipse(55, -5, 55, 55); ellipse(-25, -55, 60, 60); ellipse(25, -55, 60, 60); ellipse(0, -75, 60, 60); ellipse(-10, -25, 70, 60); ellipse(20, -20, 65, 60); //[cite: 10]
  fill(80, 165, 80); ellipse(-45, -40, 45, 45); ellipse(45, -40, 45, 45); ellipse(0, -55, 40, 40); ellipse(-20, -5, 50, 45); ellipse(22, -5, 50, 45); //[cite: 10]
  fill(120, 210, 120, 120); ellipse(-30, -45, 18, 18); ellipse(18, -55, 15, 15); ellipse(42, -20, 15, 15); popMatrix(); //[cite: 10]
}

void drawS03Trees() {
  drawS03SizingTree(100, 530, 1.4); drawS03SizingTree(1100, 530, 1.4); //[cite: 10]
  drawS03SizingTree(320, 460, 0.9); drawS03SizingTree(880, 460, 0.9); //[cite: 10]
}

void drawS03Flag(float x, float y) {
  pushMatrix(); translate(x, y); noStroke(); fill(120); rect(-25, 588, 50, 12); fill(145); rect(-18, 580, 36, 8); fill(170); rect(-12, 570, 24, 10); //[cite: 10]
  stroke(210); strokeWeight(5); line(0, 0, 0, 570); strokeWeight(3); line(0, 220, 0, 260); noStroke(); fill(200); ellipse(0, -5, 10, 10); stroke(180); strokeWeight(2); line(0, 5, 10, 8); noStroke(); //[cite: 10]
  fill(210, 30, 40); beginShape(); vertex(2, 8); vertex(30, 5); vertex(55, 8); vertex(78, 4); vertex(102, 6); vertex(118, 7); vertex(118, 35); vertex(100, 34); vertex(76, 37); vertex(54, 34); vertex(30, 36); vertex(2, 34); endShape(CLOSE); //[cite: 10]
  fill(250); beginShape(); vertex(2, 34); vertex(30, 36); vertex(54, 34); vertex(76, 37); vertex(100, 34); vertex(118, 35); vertex(118, 64); vertex(98, 63); vertex(76, 67); vertex(52, 63); vertex(28, 66); vertex(2, 62); endShape(CLOSE); popMatrix(); //[cite: 10]
}

void drawS03StatueWithPodium(float x, float y, float s) {
  pushMatrix(); translate(x, y); scale(s); translate(-400, -993); //[cite: 10]
  stroke(38, 38, 46); strokeWeight(6); fill(168, 163, 153); rect(285, 755, 230, 238, 10, 10, 0, 0); //[cite: 10]
  drawS03BronzeStatue(400, 736, 1.28); popMatrix(); //[cite: 10]
}

void drawS03BronzeStatue(float x, float y, float s) {
  pushMatrix(); translate(x, y); scale(s); translate(-194, -672); stroke(38, 38, 46); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND); //[cite: 10]
  pushMatrix(); translate(120, 285); rotate(radians(45)); fill(141, 131, 120); rect(-16, 0, 32, 80, 12); translate(0, 75); rotate(radians(-100)); rect(-14, 0, 28, 70, 12); fill(185, 182, 173); ellipse(0, 70, 26, 26); popMatrix(); stroke(38, 38, 46); strokeWeight(6); //[cite: 10]
  pushMatrix(); translate(168, 415); fill(141, 131, 120); rect(-26, 0, 52, 235); fill(240, 240, 238); rect(-18, 235, 34, 15); fill(84, 79, 62); rect(-43, 247, 62, 25, 8, 8, 2, 2); popMatrix(); //[cite: 10]
  pushMatrix(); translate(220, 415); fill(141, 131, 120); rect(-26, 0, 52, 235); fill(240, 240, 238); rect(-18, 235, 34, 15); fill(84, 79, 62); rect(-42, 250, 65, 26, 8, 8, 2, 2); popMatrix(); //[cite: 10]
  fill(185, 182, 173); rect(132, 160, 116, 135, 45); ellipse(245, 225, 25, 35); fill(84, 79, 62); rect(228, 165, 20, 37, 5); rect(128, 110, 120, 60, 10, 10, 0, 0); fill(218, 181, 60); noStroke(); rect(140, 135, 10, 4, 2); rect(156, 135, 10, 4, 2); rect(172, 135, 10, 4, 2); rect(188, 135, 10, 4, 2); rect(204, 135, 10, 4, 2); rect(220, 135, 10, 4, 2); fill(38, 38, 46); stroke(38, 38, 46); strokeWeight(6); ellipse(160, 215, 14, 14); ellipse(195, 215, 14, 14); fill(38, 38, 46); beginShape(); vertex(142, 242); bezierVertex(142, 230, 210, 230, 210, 242); bezierVertex(210, 265, 185, 270, 176, 252); bezierVertex(165, 270, 142, 265, 142, 242); endShape(CLOSE); //[cite: 10]
  fill(141, 131, 120); rect(124, 280, 132, 150); fill(240, 240, 238); triangle(145, 280, 185, 280, 165, 335); fill(84, 79, 62); beginShape(); vertex(155, 295); vertex(175, 295); vertex(180, 395); vertex(165, 415); vertex(150, 395); endShape(CLOSE); stroke(218, 181, 60); strokeWeight(3); line(158, 330, 172, 320); line(156, 360, 175, 345); line(154, 390, 178, 370); stroke(38, 38, 46); strokeWeight(6); //[cite: 10]
  pushMatrix(); translate(256, 285); rotate(radians(-45)); fill(141, 131, 120); rect(-18, 0, 36, 85, 12); translate(0, 80); rotate(radians(105)); rect(-16, 0, 32, 75, 12); fill(185, 182, 173); ellipse(0, 75, 28, 28); popMatrix(); popMatrix(); //[cite: 10]
}

void drawS03CurvedRoof(float blx, float bly, float brx, float bry, float trx, float tr_y, float tlx, float tly, float sag) {
  beginShape(); vertex(blx, bly); bezierVertex(lerp(blx, brx, 0.33), bly + sag, lerp(blx, brx, 0.66), bry + sag, brx, bry); vertex(trx, tr_y); vertex(tlx, tly); endShape(CLOSE); //[cite: 10]
}

void drawS03RoofLines(float blx, float bly, float brx, float bry, float trx, float tr_y, float tlx, float tly, int step) {
  stroke(145, 75, 40); for (float y = tly + step; y < bly; y += step) { float leftX = map(y, bly, tly, blx, tlx); float rightX = map(y, bry, tr_y, brx, trx); line(leftX, y, rightX, y); } noStroke(); //[cite: 10]
}

void drawS03Joglo() {
  fill(100, 95, 85); rect(180, 495, 840, 35); fill(220); rect(535, 495, 130, 15); rect(525, 510, 150, 15); rect(515, 525, 170, 15); //[cite: 10]
  fill(120, 75, 45); rect(80, 385, 140, 145); rect(980, 385, 140, 145); fill(70, 40, 20); rect(105, 415, 70, 80); rect(1025, 415, 70, 80); fill(180, 220, 235); rect(110, 420, 60, 70); rect(1030, 420, 60, 70); //[cite: 10]
  fill(185, 100, 60); quad(60, 385, 240, 385, 215, 345, 85, 345); stroke(140, 75, 45); for (float y = 345; y <= 385; y += 4) { line(map(y, 385, 345, 60, 85), y, map(y, 385, 345, 240, 215), y); } noStroke(); //[cite: 10]
  fill(185, 100, 60); quad(960, 385, 1140, 385, 1115, 345, 985, 345); stroke(140, 75, 45); for (float y = 345; y <= 385; y += 4) { line(map(y, 385, 345, 960, 985), y, map(y, 385, 345, 1140, 1115), y); } noStroke(); //[cite: 10]
  fill(122, 76, 42); rect(200, 360, 800, 170); stroke(145, 95, 55); for (int i = 0; i < 32; i++) { line(220 + i * 24, 360, 220 + i * 24, 530); } noStroke(); //[cite: 10]
  fill(95, 60, 35); rect(200, 350, 800, 10); rect(200, 530, 800, 10); fill(75, 45, 25); for (int i = 0; i < 8; i++) { if (i == 3 || i == 4) continue; rect(215 + i * 110, 330, 18, 30); } //[cite: 10]
  fill(70, 45, 25); rect(322, 382, 96, 86); rect(752, 382, 96, 86); fill(205, 220, 215); rect(330, 390, 80, 70); rect(760, 390, 80, 70); stroke(80); line(370, 390, 370, 460); line(330, 425, 410, 425); line(800, 390, 800, 460); line(760, 425, 840, 425); noStroke(); //[cite: 10]
  fill(70, 40, 20); rect(545, 360, 110, 170); fill(90, 55, 30); rect(552, 366, 45, 158); rect(603, 366, 45, 158); fill(0, 40); quad(210, 365, 990, 365, 920, 390, 280, 390); fill(110, 65, 35); rect(200, 355, 800, 6); fill(170, 210, 235, 180); rect(563, 380, 24, 55, 4); rect(613, 380, 24, 55, 4); fill(70, 45, 25); rect(240, 390, 55, 70); rect(880, 390, 55, 70); fill(180, 220, 230); rect(245, 395, 45, 60); rect(885, 395, 45, 60); //[cite: 10]
  fill(192, 102, 60); drawS03CurvedRoof(120, 360, 1080, 360, 930, 240, 270, 240, 10); drawS03RoofLines(120, 360, 1080, 360, 930, 240, 270, 240, 8); //[cite: 10]
  fill(176, 90, 52); drawS03CurvedRoof(340, 240, 860, 240, 760, 165, 440, 165, 6); drawS03RoofLines(340, 240, 860, 240, 760, 165, 440, 165, 7); //[cite: 10]
  fill(160, 82, 45); drawS03CurvedRoof(470, 165, 730, 165, 655, 90, 545, 90, 4); drawS03RoofLines(470, 165, 730, 165, 655, 90, 545, 90, 6); //[cite: 10]
  fill(170, 95, 55); quad(200, 355, 1030, 355, 940, 315, 260, 315); stroke(140, 75, 45); for (float y = 315; y <= 355; y += 5) { line(map(y, 315, 355, 260, 200), y, map(y, 315, 355, 940, 1030), y); } noStroke(); //[cite: 10]
  for (int i = 0; i < 8; i++) { if (i == 3 || i == 4) continue; float colX = 215 + i * 110; fill(88, 55, 34); rect(colX, 355, 26, 175); fill(65, 40, 22); rect(colX - 4, 350, 34, 12); rect(colX - 4, 525, 34, 12); } //[cite: 10]
  fill(95, 50, 30); rect(588, 75, 24, 15); fill(210, 180, 60); ellipse(600, 82, 12, 12); //[cite: 10]
}
