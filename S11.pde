// =========================================================
// S11.pde (9.0 dtk)
// Rangkaian close-up reaksi warga setelah pertanyaan telak dari Sari.
// KOREKSI: Skala keempat warga sudah diperbaiki agar tidak menjadi raksasa.
//
// 0.0 - 3.0 dtk : Close-up Sari berbicara "...itu kan uang kita semua?"
// 3.0 - 4.5 dtk : Close-up Bu Darmi (Gemetar mikro/panik menatap lantai).
// 4.5 - 6.0 dtk : Close-up Ibu Sari (Gemetar tegang menggenggam tas erat).
// 6.0 - 7.5 dtk : Close-up Pak Dolf (Tertunduk cemas di bawah kumis).
// 7.5 - 9.0 dtk : Close-up Bu Rahma (Syok, alis cemas dan mulut melengkung ke bawah).
// =========================================================

void sceneS11(float localTime) {
  background(0); 

  float focusX, focusY, zoom;
  String activeActorKey = "";
  float jitterX = 0;
  float jitterY = 0;

  // ---- Pengondisian Kamera & Efek Gemetar Mikro (Micro-Jitter) ----
  if (localTime < 3.0) {
    // 1. SARI CLOSE-UP (3.0 dtk)
    focusX = 815; focusY = 500; zoom = 2.8; //[cite: 3]
    activeActorKey = "sariBicaraS11"; 
  } 
  else if (localTime >= 3.0 && localTime < 4.5) {
    // 2. BU DARMI CLOSE-UP (1.5 dtk)
    focusX = 960; focusY = 480; zoom = 3.2;
    activeActorKey = "buDarmiPanik";
    
    if ((localTime - 3.0) > 0.2) {
      jitterX = random(-1.2, 1.2);
      jitterY = random(-0.6, 0.6);
    }
  } 
  else if (localTime >= 4.5 && localTime < 6.0) {
    // 3. IBU SARI CLOSE-UP (1.5 dtk)
    focusX = 1040; focusY = 480; zoom = 3.2;
    activeActorKey = "buSariPanik";
    
    if ((localTime - 4.5) > 0.2) {
      jitterX = random(-1.5, 1.5);
      jitterY = random(-0.8, 0.8);
    }
  } 
  else if (localTime >= 6.0 && localTime < 7.5) {
    // 4. PAK DOLF CLOSE-UP (1.5 dtk)
    focusX = 320; focusY = 450; zoom = 3.0;
    activeActorKey = "dolfPanik";
    
    if ((localTime - 6.0) > 0.2) {
      jitterX = random(-1.0, 1.0);
      jitterY = random(-1.2, 1.2);
    }
  } 
  else {
    // 5. BU RAHMA CLOSE-UP (1.5 dtk)
    focusX = 400; focusY = 480; zoom = 3.2;
    activeActorKey = "rahmaPanik";
    
    if ((localTime - 7.5) > 0.2) {
      jitterX = random(-1.3, 1.3);
      jitterY = random(-0.7, 0.7);
    }
  }

  // ---- Penerapan Transformasi Kamera & Jitter Gelisah ----
  pushMatrix();
  translate(width / 2.0, height / 2.0);
  scale(zoom);
  translate(-focusX + jitterX, -focusY + jitterY);

  // Gambar background bersama
  image(bgS07toS12, 0, 0, width, height); //

  // Gambar Karso Pasif Bingung di Tengah
  placeActor(width / 2.0, 580, S07_CHAR_SCALE, "karsoIdle"); //[cite: 1, 2]

  // Gambar Warga Kiri (Pak Dolf & Bu Rahma) dengan Skala Normal S07_CHAR_SCALE
  placeDolfPanik(320, 600, S07_CHAR_SCALE); //
  placeRahmaPanik(400, 600, S07_CHAR_SCALE); //

  // Gambar Warga Kanan (Bu Darmi & Ibu Sari) dengan Skala Normal S07_CHAR_SCALE
  placeBuDarmiPanik(960, 600, S07_CHAR_SCALE); //[cite: 1]
  placeBuSariPanik(1040, 600, S07_CHAR_SCALE); //[cite: 1]

  // Kondisi mulut Sari berbicara kustom atau kembali diam normal
  if (activeActorKey.equals("sariBicaraS11")) {
    placeSariBicaraS11(880, 600, S07_CHAR_SCALE);
  } else {
    placeActor(880, 600, S07_CHAR_SCALE, "sariNotebook"); //[cite: 1, 2]
  }

  popMatrix();

  // ---- Dialog Bubble Bawah Layar ----
  if (localTime < 3.0) {
    drawDialogBubble("SARI", "...itu kan uang kita semua?"); //[cite: 8]
  }
}

// =========================================================
// HELPER LOKAL: Menggambar Pak Dolf dengan Muka Panik & Skala Benar
// =========================================================
void placeDolfPanik(float worldX, float worldY, float scale) {
  float bobbingJalan = 0;
  pushMatrix();
  // KOREKSI: Gunakan scale transformasi agar ukuran Dolf proporsional
  translate(worldX, worldY);
  scale(scale);
  translate(45, 0);
  scale(-1, 1); //[cite: 2]

  stroke(0); strokeWeight(5); strokeJoin(ROUND); strokeCap(ROUND); //[cite: 2]

  // Lengan Belakang
  fill(65, 67, 71); rect(20, -425 + bobbingJalan, 32, 130, 8); fill(210, 180, 155); ellipse(36, -295 + bobbingJalan, 26, 26); //[cite: 2]
  // Kaki Belakang & Depan
  fill(140); rect(33, -250 + bobbingJalan, 44, 210); fill(220, 190, 165); rect(38, -40 + bobbingJalan, 34, 15); fill(220); rect(15, -25 + bobbingJalan, 65, 10, 3); //[cite: 2]
  fill(173, 177, 182); rect(18, -250 + bobbingJalan, 44, 210); fill(240, 210, 185); rect(23, -40 + bobbingJalan, 34, 15); fill(255); rect(0, -25 + bobbingJalan, 65, 10, 3); //[cite: 2]

  // Badan
  fill(85, 87, 91); rect(-5, -450 + bobbingJalan, 110, 205, 5); fill(240, 210, 185); noStroke(); arc(18, -450 + bobbingJalan, 45, 50, 0, PI); stroke(0); noFill(); arc(18, -450 + bobbingJalan, 45, 50, 0, PI); //[cite: 2]
  // Lengan Depan
  fill(85, 87, 91); rect(52, -425 + bobbingJalan, 36, 135, 8); fill(240, 210, 185); ellipse(70, -290 + bobbingJalan, 28, 28); //[cite: 2]

  // Kepala & Rambut
  fill(240, 210, 185); rect(-2, -580 + bobbingJalan, 105, 132, 25); ellipse(98, -515 + bobbingJalan, 22, 28); //[cite: 2]
  fill(40); arc(50, -572 + bobbingJalan, 110, 90, PI, TWO_PI); rect(78, -572 + bobbingJalan, 25, 55); noStroke(); rect(40, -575 + bobbingJalan, 45, 10); stroke(0); line(63, -572 + bobbingJalan, 78, -545 + bobbingJalan); line(78, -517 + bobbingJalan, 103, -517 + bobbingJalan); line(103, -517 + bobbingJalan, 103, -572 + bobbingJalan); //[cite: 2]

  // Mata
  fill(0); ellipse(15, -515 + bobbingJalan, 14, 14); ellipse(45, -515 + bobbingJalan, 14, 14); //[cite: 2]

  // Kumis Statis
  rect(15, -492 + bobbingJalan, 20, 20); //[cite: 2]

  // MODIFIKASI PANIK: Alis miring cemas + mulut kecil tegang
  stroke(0); strokeWeight(4);
  line(10, -526, 22, -520); 
  line(50, -526, 38, -520); 
  noStroke(); fill(90, 30, 25);
  ellipse(25, -464 + bobbingJalan, 15, 8); 

  popMatrix();
}

// =========================================================
// HELPER LOKAL: Menggambar Bu Rahma dengan Muka Panik & Skala Benar
// =========================================================
void placeRahmaPanik(float worldX, float worldY, float scale) {
  float waktu  = frameCount * 0.05;
  float bobbing = sin(waktu) * 2.5;

  pushMatrix(); 
  // KOREKSI: Tambahkan penanganan skala pembungkus utama
  translate(worldX, worldY);
  scale(scale);
  translate(-195, -660); //[cite: 2]
  stroke(20); strokeWeight(4); strokeJoin(ROUND); strokeCap(ROUND); //[cite: 2]

  // Tangan & Kaki
  pushMatrix(); translate(190, 270 + bobbing); fill(198, 75, 59); rect(-14, 0, 28, 130, 12); fill(200, 139, 94); ellipse(0, 130, 30, 30); popMatrix(); //[cite: 2]
  pushMatrix(); translate(175, 395); fill(245, 245, 245); rect(-15, 0, 30, 235); fill(200, 139, 94); rect(-15, 235, 42, 15, 2, 8, 2, 2); fill(35, 125, 49); rect(-18, 250, 48, 8, 4);  strokeWeight(3); line(10, 250, 0, 239); strokeWeight(4); popMatrix(); //[cite: 2]
  pushMatrix(); translate(205, 395); fill(245, 245, 245); rect(-15, 0, 30, 235); fill(200, 139, 94); rect(-15, 235, 42, 15, 2, 8, 2, 2); fill(35, 125, 49); rect(-18, 250, 48, 8, 4);  strokeWeight(3); line(10, 250, 0, 239); strokeWeight(4); popMatrix(); //[cite: 2]

  // Badan & Kepala dasar
  fill(198, 75, 59); rect(155, 260 + bobbing, 80, 150, 10); fill(200, 139, 94); arc(200, 260 + bobbing, 40, 25, 0, PI); //[cite: 2]
  fill(44, 44, 44); ellipse(142, 195 + bobbing, 36, 46); fill(200, 139, 94); rect(155, 145 + bobbing, 90, 115, 45); //[cite: 2]
  fill(44, 44, 44); beginShape(); vertex(155, 210 + bobbing); bezierVertex(140, 130 + bobbing, 250, 130 + bobbing, 248, 190 + bobbing); bezierVertex(235, 160 + bobbing, 185, 160 + bobbing, 155, 210 + bobbing); endShape(CLOSE); //[cite: 2]
  fill(200, 139, 94); ellipse(162, 205 + bobbing, 20, 25); noFill(); strokeWeight(2); arc(159, 205 + bobbing, 10, 12, HALF_PI, PI + HALF_PI); strokeWeight(4); //[cite: 2]

  // Mata
  fill(20); noStroke(); ellipse(208, 195 + bobbing, 14, 14); ellipse(235, 195 + bobbing, 14, 14); //[cite: 2]

  // MODIFIKASI PANIK: Alis cemas + mulut melengkung ke bawah tegang
  stroke(20); strokeWeight(3);
  line(202, 183 + bobbing, 212, 187 + bobbing); 
  line(241, 183 + bobbing, 231, 187 + bobbing); 
  noFill(); stroke(20); strokeWeight(4);
  arc(224, 226 + bobbing, 14, 8, PI, TWO_PI); 

  pushMatrix(); translate(190, 270 + bobbing); fill(198, 75, 59); rect(-14, 0, 28, 130, 12); fill(200, 139, 94); ellipse(0, 130, 30, 30); popMatrix(); //[cite: 2]
  popMatrix();
}

// =========================================================
// HELPER LOKAL: Menggambar Bu Darmi dengan Muka Panik & Skala Benar
// =========================================================
void placeBuDarmiPanik(float worldX, float worldY, float scale) {
  pushMatrix(); 
  // KOREKSI: Tambahkan penanganan skala pembungkus utama
  translate(worldX, worldY);
  scale(scale);
  translate(-194, -672); //[cite: 2]
  float waktu = frameCount * 0.05; float bobbing = sin(waktu) * 2.5; //[cite: 2]
  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND); //[cite: 2]

  // Anatomi dasar tubuh
  pushMatrix(); translate(136, 310 + bobbing); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix(); //[cite: 2]
  pushMatrix(); translate(168, 430); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-28, 215, 55, 25, 8, 8, 2, 2); popMatrix(); //[cite: 2]
  pushMatrix(); translate(220, 430); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-30, 215, 55, 25, 8, 8, 2, 2); popMatrix(); //[cite: 2]
  fill(110, 85, 60); beginShape(); vertex(134, 430); vertex(246, 430); vertex(260, 645); vertex(128, 645); endShape(CLOSE); //[cite: 2]
  fill(165, 167, 172); ellipse(222, 162 + bobbing, 40, 40); fill(245, 185, 140); rect(132, 190 + bobbing, 116, 135, 50); //[cite: 2]
  fill(165, 167, 172); beginShape(); vertex(132, 220 + bobbing); bezierVertex(132, 140 + bobbing, 248, 140 + bobbing, 248, 220 + bobbing); bezierVertex(248, 232 + bobbing, 229, 232 + bobbing, 229, 220 + bobbing); bezierVertex(229, 232 + bobbing, 210, 232 + bobbing, 210, 220 + bobbing); bezierVertex(210, 232 + bobbing, 190, 232 + bobbing, 190, 220 + bobbing); bezierVertex(190, 232 + bobbing, 171, 232 + bobbing, 171, 220 + bobbing); bezierVertex(171, 232 + bobbing, 152, 232 + bobbing, 152, 220 + bobbing); bezierVertex(152, 232 + bobbing, 132, 232 + bobbing, 132, 220 + bobbing); endShape(CLOSE); //[cite: 2]
  noFill(); stroke(190, 130, 100); strokeWeight(3); arc(172, 242 + bobbing, 24, 6, PI, TWO_PI); arc(172, 250 + bobbing, 16, 4, PI, TWO_PI); //[cite: 2]
  fill(40, 38, 48); noStroke(); ellipse(152, 265 + bobbing, 12, 12); ellipse(192, 265 + bobbing, 12, 12); //[cite: 2]
  stroke(40, 38, 48); strokeWeight(4); line(148, 262 + bobbing, 142, 255 + bobbing); line(153, 259 + bobbing, 149, 251 + bobbing); line(189, 259 + bobbing, 193, 251 + bobbing); line(194, 262 + bobbing, 200, 255 + bobbing); //[cite: 2]

  // MODIFIKASI PANIK: Mulut melengkung ke bawah cemas
  noFill(); strokeWeight(5);
  arc(172, 292 + bobbing, 20, 10, PI, TWO_PI);

  fill(160, 125, 90); strokeWeight(6); rect(130, 310 + bobbing, 120, 150); line(172, 325 + bobbing, 172, 460 + bobbing); fill(160, 125, 90); arc(152, 310 + bobbing, 45, 35, 0, PI); arc(202, 310 + bobbing, 45, 35, 0, PI); pushMatrix(); translate(231, 310 + bobbing); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix(); //[cite: 2]
  popMatrix();
}

// =========================================================
// HELPER LOKAL: Menggambar Ibu Sari dengan Muka Panik & Skala Benar
// =========================================================
void placeBuSariPanik(float worldX, float worldY, float scale) {
  pushMatrix(); 
  // KOREKSI: Tambahkan penanganan skala pembungkus utama
  translate(worldX, worldY);
  scale(scale);
  translate(-194, -672); //[cite: 2]
  float waktu = frameCount * 0.05; float bobbing = sin(waktu) * 2.5; //[cite: 2]
  color warnaKulit = color(253, 199, 161); color warnaBaju = color(146, 120, 187); color warnaRok = color(104, 73, 124); color warnaJilbab = color(118, 99, 166); color warnaSepatu = color(70, 68, 76); color warnaGaris = color(40, 38, 48); //[cite: 2]
  stroke(warnaGaris); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND); //[cite: 2]

  // Anatomi jilbab dan tubuh dasar
  pushMatrix(); translate(140, 290 + bobbing); fill(warnaKulit); ellipse(0, 130, 25, 25); fill(warnaBaju); rect(-15, 0, 30, 120, 15); popMatrix(); //[cite: 2]
  pushMatrix(); translate(194, 415); fill(warnaRok); rect(-45, 0, 90, 240, 5); fill(warnaSepatu); rect(-50, 235, 48, 25, 10, 10, 5, 5); rect(2, 235, 48, 25, 10, 10, 5, 5); popMatrix(); //[cite: 2]
  pushMatrix(); translate(194, 280 + bobbing); fill(warnaBaju); rect(-50, 0, 100, 140, 20, 20, 5, 5); fill(warnaKulit); arc(0, 0, 30, 20, 0, PI); popMatrix(); //[cite: 2]
  pushMatrix(); translate(194, 210 + bobbing); fill(warnaJilbab); ellipse(5, 0, 135, 155); fill(warnaKulit); ellipse(-5, 0, 110, 110); //[cite: 2]
  fill(warnaGaris); noStroke(); ellipse(-25, -5, 14, 14); ellipse(25, -5, 14, 14); //[cite: 2]
  stroke(warnaGaris); strokeWeight(3); line(-37, -12, -32, -7); line(-33, -17, -28, -12); line(37, -12, 32, -7); line(33, -17, 28, -12); //[cite: 2]

  // MODIFIKASI PANIK: Alis miring cemas + mulut melengkung ke bawah tegang
  stroke(warnaGaris); strokeWeight(3);
  line(-20, -18, -10, -14); 
  line(15, -18, 5, -14);   
  strokeWeight(4);
  arc(-5, 26, 22, 10, PI, TWO_PI); 

  popMatrix();
  strokeWeight(6); pushMatrix(); translate(248, 290 + bobbing); fill(warnaKulit); ellipse(0, 130, 25, 25); fill(warnaBaju); rect(-15, 0, 30, 120, 15); popMatrix(); //[cite: 2]
  popMatrix();
}

// =========================================================
// HELPER LOKAL: Menggambar Sari dengan mulut komat-kamit di S11
// =========================================================
void placeSariBicaraS11(float worldX, float worldY, float scale) {
  pushMatrix(); translate(worldX, worldY); scale(scale); translate(-194, -672); //[cite: 2]
  float waktu = frameCount * 0.05; float bobbing = sin(waktu) * 2.5; //[cite: 2]
  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND); //[cite: 2]
  pushMatrix(); translate(136, 280 + bobbing); fill(162, 122, 233); rect(-21, 0, 42, 160, 12); fill(253, 197, 155); ellipse(0, 160, 32, 32); popMatrix(); //[cite: 2]
  fill(102, 78, 158); beginShape(); vertex(142, 415); vertex(246, 415); vertex(260, 662); vertex(128, 662); endShape(CLOSE); //[cite: 2]
  fill(55, 53, 65); rect(125, 662, 62, 25, 8, 8, 2, 2); rect(178, 665, 65, 26, 8, 8, 2, 2); //[cite: 2]
  fill(55, 53, 65); rect(124, 150 + bobbing, 138, 142, 65, 65, 35, 35); fill(253, 197, 155); rect(132, 160 + bobbing, 116, 120, 48); //[cite: 2]
  ellipse(246, 222 + bobbing, 20, 28); noFill(); strokeWeight(3); arc(244, 222 + bobbing, 8, 10, -HALF_PI, HALF_PI); strokeWeight(6); //[cite: 2]
  fill(55, 53, 65); arc(190, 182 + bobbing, 118, 52, PI, TWO_PI); stroke(40, 38, 48); line(165, 158 + bobbing, 172, 172 + bobbing); line(210, 156 + bobbing, 206, 170 + bobbing); //[cite: 2]
  fill(243, 143, 153); pushMatrix(); translate(144, 158 + bobbing); rotate(radians(-15)); triangle(0, 0, -13, -8, -13, 8); triangle(0, 0, 13, -8, 13, 8); fill(255, 190, 200); ellipse(0, 0, 6, 6); popMatrix(); //[cite: 2]
  fill(55, 53, 65); noStroke(); ellipse(164, 218 + bobbing, 13, 13); ellipse(199, 218 + bobbing, 13, 13); //[cite: 2]
  stroke(55, 53, 65); strokeWeight(3); line(157, 214 + bobbing, 151, 210 + bobbing); line(156, 220 + bobbing, 150, 218 + bobbing); line(205, 214 + bobbing, 211, 210 + bobbing); line(204, 220 + bobbing, 210, 218 + bobbing); stroke(40, 38, 48); strokeWeight(6); //[cite: 2]

  // Mulut komat-kamit Sari
  float mouthCycle = (sin(waktu * 7.0) + 1.0) / 2.0; float mouthOpen = mouthCycle * mouthCycle; //[cite: 2]
  noStroke(); fill(90, 30, 25); float sariMouthH = 3 + mouthOpen * 11; ellipse(181, 242 + bobbing, 16, sariMouthH); stroke(40, 38, 48); strokeWeight(6);

  fill(162, 122, 233); rect(130, 280 + bobbing, 120, 175, 15, 15, 0, 0); noFill(); arc(190, 280 + bobbing, 36, 16, 0, PI); stroke(40, 38, 48, 60); strokeWeight(3); line(146, 340 + bobbing, 146, 420 + bobbing); line(234, 340 + bobbing, 234, 420 + bobbing); stroke(40, 38, 48); strokeWeight(6); //[cite: 2]
  pushMatrix(); translate(231, 280 + bobbing); fill(162, 122, 233); rect(-21, 0, 42, 160, 12); fill(253, 197, 155); ellipse(0, 160, 32, 32); popMatrix(); //[cite: 2]
  pushMatrix(); translate(231, 280 + bobbing + 160); rotate(radians(-10)); fill(250, 245, 225); stroke(40, 38, 48); strokeWeight(3); rect(-20, -14, 40, 30, 3); fill(200, 60, 60); noStroke(); rect(-20, -14, 5, 30); stroke(150); strokeWeight(1.5); line(-12, -6, 14, -6); line(-12, 0, 14, 0); line(-12, 6, 14, 6); pushMatrix(); translate(16, -10); rotate(radians(20)); noStroke(); fill(230, 190, 80); rect(-2.5, -11, 5, 22); fill(60); triangle(-2.5, -11, 2.5, -11, 0, -16); popMatrix(); popMatrix(); //[cite: 2]
  popMatrix();
}
