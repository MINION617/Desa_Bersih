// =========================================================
// S16.pde — Scene 16 (22.5 detik)
// Interior. Bu Darmi menyerahkan map ke Sari. Sari membuka & membaca berkas.
// KOREKSI: Sinkronisasi mutlak posisi map terikat pada telapak tangan Bu Darmi,
// dan pembersihan bocoran kode garis senyum pada wajah syok Sari.
//
// Fase waktu (detik lokal):
//   0.0 - 1.0 : Bu Darmi meletakkan map ke meja (Tangan & Map bergerak turun bersama)
//   1.0 - 5.0 : Bu Darmi bicara "Ibu simpan ini..." (4s)
//   5.0 - 7.0 : Sari membuka lembaran, ekspresi berubah kaget & mata membaca cepat (2s)
//   7.0 - 14.5: Bu Darmi bicara "Catatan laporan anggaran..." (7.5s)
//   14.5- 15.5: Hening/Jeda (1s)
//   15.5- 22.5: Bu Darmi bicara "Ibu tidak tahu..." (7s)
// =========================================================

void sceneS16(float localTime) {
  // Hitung kedipan lampu minyak (menggunakan noise agar jalannya natural)
  float flicker = map(noise(frameCount * 0.12), 0, 1, 0.94, 1.06); //[cite: 6]

  // 1. GAMBAR LAYER BACKGROUND BELAKANG (Dinding, Lantai, Pintu)
  drawBgS16Belakang(flicker); //[cite: 6]

  // 2. GAMBAR AKTOR (Berdiri di belakang meja dengan kedalaman layer yang pas)
  
  // BU DARMI (Di sebelah kiri, di-flip horizontal menatap ke arah Sari)
  pushMatrix();
  translate(500, 620);
  scale(-0.85, 0.85); //[cite: 5]
  drawBuDarmiBicaraS16(0, 0, localTime);
  popMatrix();

  // SARI (Di sebelah kanan, menggunakan skala asli menghadap ke kiri meja)
  pushMatrix();
  translate(950, 600);
  scale(0.85); //[cite: 5]
  drawSariMembacaS16(0, 0, localTime);
  popMatrix();

  // 3. GAMBAR LAYER FOREGROUND DEPAN (Meja, Lampu, dan Berkas Anggaran Dinamis)
  drawBgS16MejaDepan(flicker, localTime); //[cite: 6]

  // 4. SINKRONISASI BUBBLE DIALOG
  if (localTime >= 1.0 && localTime < 5.0) {
    drawDialogBubble("BU DARMI", "Ibu simpan ini sejak tiga tahun lalu.");
  } 
  else if (localTime >= 7.0 && localTime < 14.5) {
    drawDialogBubble("BU DARMI", "Catatan laporan anggaran. Yang asli,\nbukan yang ditempel di papan. Ibu dapat dari...\ntidak penting dari mana.");
  } 
  else if (localTime >= 15.5 && localTime < 22.5) {
    drawDialogBubble("BU DARMI", "Ibu tidak tahu harus bagaimana.\nTidak ada yang mau dengar. Dan ibu... takut.");
  }
}

// =========================================================
// BACKGROUND S15/S16 — bagian BELAKANG (langit s/d interior)
// =========================================================
void drawBgS16Belakang(float flicker) {
  pushMatrix();
  scale(1.6); //[cite: 6]

  background(61, 41, 27); //[cite: 6]
  
  stroke(40, 25, 15); strokeWeight(2.5);
  for (int x = 150; x < 800; x += 40) { line(x, 0, x, 220); } //[cite: 6]
  
  fill(46, 30, 18); noStroke(); rect(0, 220, 800, 230); //[cite: 6]
  
  stroke(35, 22, 12); strokeWeight(1.5);
  line(200, 220, 100, 450); line(350, 220, 300, 450); line(500, 220, 550, 450); line(650, 220, 750, 450); //[cite: 6]
  
  stroke(35, 20, 10); strokeWeight(4); line(150, 220, 800, 220); //[cite: 6]

  // Pintu Terbuka Kiri
  noStroke(); fill(15, 22, 38); rect(65, 40, 85, 410); //[cite: 6]
  fill(10, 15, 28); quad(65, 250, 150, 230, 150, 450, 65, 450); //[cite: 6]
  fill(255, 100, 100); ellipse(95, 170, 5, 5); fill(120, 255, 120); ellipse(110, 168, 4, 4); fill(255, 230, 100); ellipse(125, 175, 5, 5); //[cite: 6]

  fill(61, 41, 27); stroke(40, 25, 15); strokeWeight(2.5); rect(-5, -5, 70, 460); line(30, 0, 30, 450); //[cite: 6]
  stroke(35, 20, 10); strokeWeight(4); fill(50, 33, 22); rect(60, 0, 95, 40); //[cite: 6]
  line(65, 40, 65, 450); line(150, 0, 150, 450); //[cite: 6]

  // Jendela Belakang
  stroke(40, 25, 15); strokeWeight(4); fill(51, 34, 22); rect(410, 30, 110, 120); fill(12, 18, 32); rect(420, 40, 90, 100); //[cite: 6]
  noStroke(); fill(20, 25, 40); rect(430, 110, 30, 30); triangle(430, 110, 445, 95, 460, 110); rect(475, 115, 35, 25); triangle(475, 115, 492, 102, 510, 115); //[cite: 6]
  fill(255, 210, 100); rect(440, 118, 6, 6); rect(485, 122, 8, 6); //[cite: 6]

  // Meja Dapur Latar Belakang
  stroke(35, 25, 18); strokeWeight(2); fill(100, 102, 105); rect(210, 200, 110, 110); fill(75, 77, 80); rect(210, 200, 110, 12); stroke(50); line(230, 225, 260, 225); //[cite: 6]
  stroke(35, 20, 10); fill(79, 53, 34); rect(320, 215, 330, 15); rect(330, 230, 12, 100); rect(630, 230, 12, 100); //[cite: 6]
  noStroke(); fill(140, 70, 45); ellipse(370, 208, 28, 18); fill(80, 85, 90); rect(230, 188, 32, 12); fill(160, 140, 110); rect(470, 192, 18, 23); //[cite: 6]

  // Tikar Tatami
  stroke(55, 45, 30); strokeWeight(1.5); fill(92, 84, 65); //[cite: 6]
  quad(180, 320, 310, 320, 280, 290, 170, 290); quad(520, 320, 690, 320, 640, 290, 490, 290); quad(110, 450, 320, 450, 290, 390, 120, 390); quad(510, 450, 740, 450, 670, 390, 480, 390); //[cite: 6]

  popMatrix();
}

// =========================================================
// HELPER LOKAL: Foreground Meja Utama & Tracking Posisi Map
// =========================================================
void drawBgS16MejaDepan(float flicker, float localTime) {
  float mapProgress = constrain(localTime / 1.0, 0, 1);
  float armAngle = lerp(radians(-45), radians(20), mapProgress);
  float bobbing = sin(frameCount * 0.04) * 2.0;

  // KOREKSI MATEMATIKA: Menggunakan (-) sin rotasi untuk melacak koordinat tangan kanan Bu Darmi
  float handX_local = 37 - 150 * sin(armAngle);
  float handY_local = -362 + bobbing + 150 * cos(armAngle);
  
  float handX_screen = 500 - 0.85 * handX_local;
  float handY_screen = 620 + 0.85 * handY_local;

  pushMatrix();
  scale(1.6); //[cite: 6]

  // Kaki belakang meja
  stroke(30, 15, 5); strokeWeight(2); fill(54, 34, 18); rect(310, 290, 16, 70); rect(474, 290, 16, 70); //[cite: 6]

  // Permukaan papan utama meja
  stroke(35, 18, 5); strokeWeight(3); fill(115, 76, 46); quad(280, 290, 520, 290, 600, 390, 200, 390); //[cite: 6]
  fill(84, 54, 31); quad(200, 390, 600, 390, 600, 408, 200, 408); //[cite: 6]
  fill(71, 44, 24); rect(220, 408, 24, 42); rect(556, 408, 24, 42); //[cite: 6]
  stroke(95, 60, 35); strokeWeight(1.5); line(330, 290, 280, 390); line(400, 290, 400, 390); line(470, 290, 520, 390); //[cite: 6]

  // Pantulan cahaya lampu minyak
  noStroke();
  for (int r = 220; r > 0; r -= 10) { float alpha = map(r, 0, 220, 70, 0); fill(255, 190, 65, alpha * flicker); ellipse(400, 335, r * 1.6, r * 0.6); } //[cite: 6]
  for (int r = 380; r > 0; r -= 15) { float alpha = map(r, 0, 380, 50, 0); fill(255, 165, 45, alpha * flicker); ellipse(400, 230, r * 1.4, r); } //[cite: 6]

  // KOREKSI PELETAKAN: Map diturunkan presisi mengikuti tangan, lalu dikunci permanen di koordinat lantai meja setelah t >= 1.0s
  float mapX, mapY, mapRot;
  if (localTime < 1.0) {
    mapX = handX_screen / 1.6;
    mapY = (handY_screen + 35) / 1.6; // Offset 35px pas di bawah telapak genggaman
    mapRot = lerp(radians(15), radians(-8), mapProgress);
  } else {
    // Kunci mati koordinat pendaratan t=1.0s agar tidak ikut bergoyang napas (bobbing)
    float fixedBobbing = sin((frameCount - (localTime - 1.0) * 24) * 0.04) * 2.0;
    float fixedHandY_local = -362 + fixedBobbing + 150 * cos(radians(20));
    
    mapX = (500 - 0.85 * (37 - 150 * sin(radians(20)))) / 1.6;
    mapY = ((620 + 0.85 * fixedHandY_local) + 35) / 1.6;
    mapRot = radians(-8);
  }

  pushMatrix();
  translate(mapX, mapY); 
  rotate(mapRot);
  fill(220, 215, 200); rect(-30, -20, 60, 40, 2); 
  fill(240, 235, 220); rect(-25, -25, 60, 40, 2); 
  stroke(150, 140, 130); strokeWeight(1);
  line(-15, -15, 20, -15); line(-15, -10, 25, -10); line(-15, -5, 15, -5); line(-15, 0, 25, 0);
  popMatrix();

  // Lampu Minyak
  int lx = 400; int ly = 295; //[cite: 6]
  stroke(30); strokeWeight(2); fill(65, 55, 45); ellipse(lx, ly, 40, 12); rect(lx-16, ly-16, 32, 16); ellipse(lx, ly-16, 32, 8); //[cite: 6]
  fill(100, 90, 80); rect(lx-10, ly-22, 20, 6); //[cite: 6]
  stroke(240, 240, 255, 140); fill(255, 255, 255, 20); ellipse(lx, ly-42, 34, 34); rect(lx-8, ly-75, 16, 35); ellipse(lx, ly-75, 16, 4); //[cite: 6]
  noStroke(); fill(255, 120, 20, 200); ellipse(lx, ly-42, 14 * flicker, 26 * flicker); fill(255, 255, 220, 255); ellipse(lx, ly-40, 8 * flicker, 16 * flicker); //[cite: 6]

  popMatrix();
}

// =========================================================
// HELPER LOKAL: Bu Darmi Menyerahkan Berkas Kertas
// =========================================================
void drawBuDarmiBicaraS16(float x, float y, float localTime) {
  pushMatrix();
  translate(x, y);
  translate(-194, -672); //[cite: 3]

  float bobbing = sin(frameCount * 0.04) * 2.0;
  boolean isTalking = (localTime >= 1.0 && localTime < 5.0) || (localTime >= 7.0 && localTime < 14.5) || (localTime >= 15.5 && localTime < 22.5);

  float mapProgress = constrain(localTime / 1.0, 0, 1);
  float armAngle = lerp(radians(-45), radians(20), mapProgress); 

  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(136, 310 + bobbing); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix();
  pushMatrix(); translate(168, 430); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-28, 215, 55, 25, 8, 8, 2, 2); popMatrix();
  pushMatrix(); translate(220, 430); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-30, 215, 55, 25, 8, 8, 2, 2); popMatrix();

  fill(110, 85, 60); beginShape(); vertex(134, 430); vertex(246, 430); vertex(260, 645); vertex(120, 645); endShape(CLOSE);

  fill(165, 167, 172); ellipse(222, 162 + bobbing, 40, 40); fill(245, 185, 140); rect(132, 190 + bobbing, 116, 135, 50);
  fill(165, 167, 172); beginShape(); vertex(132, 220 + bobbing); bezierVertex(132, 140 + bobbing, 248, 140 + bobbing, 248, 220 + bobbing); bezierVertex(248, 232 + bobbing, 229, 232 + bobbing, 229, 220 + bobbing); bezierVertex(229, 232 + bobbing, 210, 232 + bobbing, 210, 220 + bobbing); bezierVertex(210, 232 + bobbing, 190, 232 + bobbing, 190, 220 + bobbing); bezierVertex(190, 232 + bobbing, 171, 232 + bobbing, 171, 220 + bobbing); bezierVertex(171, 232 + bobbing, 152, 232 + bobbing, 152, 220 + bobbing); bezierVertex(152, 232 + bobbing, 132, 232 + bobbing, 132, 220 + bobbing); endShape(CLOSE);
  
  noFill(); stroke(190, 130, 100); strokeWeight(3); arc(172, 242 + bobbing, 24, 6, PI, TWO_PI); arc(172, 250 + bobbing, 16, 4, PI, TWO_PI);
  fill(40, 38, 48); noStroke(); ellipse(152, 265 + bobbing, 12, 12); ellipse(192, 265 + bobbing, 12, 12);
  
  stroke(40, 38, 48); strokeWeight(4);
  line(148, 258 + bobbing, 142, 262 + bobbing); line(196, 258 + bobbing, 202, 262 + bobbing); 

  if (isTalking) {
    float mc = (sin(frameCount * 0.3) + 1.0) / 2.0; float mo = mc * mc;
    noStroke(); fill(90, 30, 25); float mh = 3 + mo * 12; ellipse(172, 284 + bobbing, 18, mh);
  } else {
    noFill(); stroke(40, 38, 48); strokeWeight(5); arc(172, 284 + bobbing, 18, 8, PI, TWO_PI);
  }

  fill(160, 125, 90); stroke(40, 38, 48); strokeWeight(6); rect(130, 310 + bobbing, 120, 150); line(172, 325 + bobbing, 172, 460 + bobbing);
  fill(160, 125, 90); arc(152, 310 + bobbing, 45, 35, 0, PI); arc(202, 310 + bobbing, 45, 35, 0, PI);
  
  // Tangan dinamis menurunkan berkas kearah permukaan meja
  pushMatrix(); translate(231, 310 + bobbing); rotate(armAngle); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix();

  popMatrix();
}

// =========================================================
// HELPER LOKAL: Sari Membuka & Ekspresi Syok Melongo (Bersih)
// =========================================================
void drawSariMembacaS16(float x, float y, float localTime) {
  pushMatrix();
  translate(x, y);
  translate(-194, -672); //[cite: 3]

  float bobbing = sin(frameCount * 0.05) * 2.0;

  // Lengan Kiri
  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(136, 280 + bobbing); fill(162, 122, 233); rect(-21, 0, 42, 160, 12); fill(253, 197, 155); ellipse(0, 160, 32, 32); popMatrix();

  fill(102, 78, 158); beginShape(); vertex(142, 415); vertex(246, 415); vertex(260, 662); vertex(128, 662); endShape(CLOSE);
  fill(55, 53, 65); rect(125, 662, 62, 25, 8, 8, 2, 2); rect(178, 665, 65, 26, 8, 8, 2, 2);

  pushMatrix(); translate(0, 15); // Kepala menunduk serius

  fill(55, 53, 65); rect(124, 150 + bobbing, 138, 142, 65, 65, 35, 35); 
  fill(253, 197, 155); rect(132, 160 + bobbing, 116, 120, 48);
  ellipse(246, 222 + bobbing, 20, 28); noFill(); strokeWeight(3); arc(244, 222 + bobbing, 8, 10, -HALF_PI, HALF_PI); strokeWeight(6);
  fill(55, 53, 65); arc(190, 182 + bobbing, 118, 52, PI, TWO_PI); stroke(40, 38, 48); line(165, 158 + bobbing, 172, 172 + bobbing); line(210, 156 + bobbing, 206, 170 + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144, 158 + bobbing); rotate(radians(-15)); triangle(0, 0, -13, -8, -13, 8); triangle(0, 0, 13, -8, 13, 8); fill(255, 190, 200); ellipse(0, 0, 6, 6); popMatrix();

  // Animasi membaca cepat (5.0s - 7.0s)
  float mataX = 0;
  if (localTime >= 5.0 && localTime <= 7.0) {
    mataX = sin(localTime * 30) * 3.5; 
  }
  fill(55, 53, 65); noStroke(); 
  ellipse(164 + mataX, 222 + bobbing, 13, 13); ellipse(199 + mataX, 222 + bobbing, 13, 13);
  
  stroke(55, 53, 65); strokeWeight(3); 
  line(157, 212 + bobbing, 151, 208 + bobbing); line(156, 218 + bobbing, 150, 216 + bobbing); 
  line(205, 212 + bobbing, 211, 208 + bobbing); line(204, 218 + bobbing, 210, 216 + bobbing); 
  
  // KOREKSI TOTAL MULUT: Menggunakan bentuk melongo lebar pudar murni tanpa gangguan smile-arc bocor bawah[cite: 5]
  if (localTime >= 5.0) {
    fill(90, 30, 25); stroke(40, 38, 48); strokeWeight(4);
    ellipse(181, 244 + bobbing, 14, 22); 
  } else {
    noFill(); stroke(40, 38, 48); strokeWeight(4);
    line(173, 242 + bobbing, 189, 242 + bobbing); 
  }
  strokeWeight(6);
  popMatrix(); 

  fill(162, 122, 233); rect(130, 280 + bobbing, 120, 175, 15, 15, 0, 0); noFill(); arc(190, 280 + bobbing, 36, 16, 0, PI); stroke(40, 38, 48, 60); strokeWeight(3); line(146, 340 + bobbing, 146, 420 + bobbing); line(234, 340 + bobbing, 234, 420 + bobbing); stroke(40, 38, 48); strokeWeight(6);

  // Lengan Kanan membuka dokumen lembaran pertama (4.5s - 5s)
  float sariArmAngle = 0;
  if (localTime >= 4.5 && localTime < 5.0) {
    sariArmAngle = lerp(0, radians(-30), (localTime - 4.5) / 0.5);
  } else if (localTime >= 5.0) {
    sariArmAngle = radians(-30);
  }
  
  pushMatrix(); translate(231, 280 + bobbing); rotate(sariArmAngle); fill(162, 122, 233); rect(-21, 0, 42, 160, 12); fill(253, 197, 155); ellipse(0, 160, 32, 32); popMatrix();

  popMatrix();
}
