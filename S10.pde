// =========================================================
// S10.pde (46.2 dtk)
// Rangkaian close-up bergantian antara Sari dan Pak Karso.
// Sari menurunkan tangannya ke posisi normal menggantung memegang buku.
// Pak Karso mengalami smileTension (senyum makin kaku & bergetar tegang).
// =========================================================

void sceneS10(float localTime) {
  background(0); //[cite: 1]

  float focusX, focusY, zoom;
  
  // Penanda Mode: 0 = Sari Closeup, 1 = Karso Closeup Normal, 2 = Karso Closeup Kaku, 3 = Karso Closeup Teperdaya/Tegang
  int viewMode = 0; 
  boolean isKarsoTalking = false;
  boolean isSariTalking = false;
  int karsoTension = 0;
  float karsoXOffset = 0;

  // ---- Pengondisian Waktu, Kamera, & Status Berbicara Karakter ----
  if (localTime < 13.0) {
    // 1. SARI (13 dtk): "Iya, Pak. Saya Sari, baru pindah..."
    viewMode = 0;
    isSariTalking = true;
    isKarsoTalking = false;
  } 
  else if (localTime >= 13.0 && localTime < 16.5) {
    // 2. KARSO (3.5 dtk): "Betul, betul." (Senyum terjaga)
    viewMode = 1;
    isSariTalking = false;
    isKarsoTalking = true;
    karsoTension = 0;
  } 
  else if (localTime >= 16.5 && localTime < 22.1) {
    // 3. SARI (5.6 dtk): "Tapi jalan di depan kantor masih berlubang..."
    viewMode = 0;
    isSariTalking = true;
    isKarsoTalking = false;
  } 
  else if (localTime >= 22.1 && localTime < 29.7) {
    // 4. KARSO (7.6 dtk): "Nah, itu... sudah ada prosesnya..." (Senyum mulai kaku)
    viewMode = 2;
    isSariTalking = false;
    isKarsoTalking = true;
    karsoTension = 1;
  } 
  else if (localTime >= 29.7 && localTime < 37.4) {
    // 5. SARI (7.7 dtk): "Proses tendernya sudah sejak kapan, Pak?..."
    viewMode = 0;
    isSariTalking = true;
    isKarsoTalking = false;
  } 
  else if (localTime >= 37.4 && localTime < 42.2) {
    // 6. KARSO (4.8 dtk): BEAT (0-1.6s) + Jalan Bergeser + Bicara "Itu ada mekanismenya..."
    viewMode = 3;
    isSariTalking = false;
    karsoTension = 2;
    
    float beatDuration = 1.6;
    if ((localTime - 37.4) < beatDuration) {
      isKarsoTalking = false; // Sunyi/BEAT sejenak
      float t = (localTime - 37.4) / beatDuration;
      karsoXOffset = t * -25.0; // Geser perlahan ke kiri panggung
    } else {
      isKarsoTalking = true; // Mulai bersuara tinggi tegang
      karsoXOffset = -25.0;
    }
  } 
  else {
    // 7. SARI (4 dtk): "Saya mengerti, Pak. Saya hanya ingin tahu..."
    viewMode = 0;
    isSariTalking = true;
    isKarsoTalking = false;
  }

  // ---- Setup Kamera Close-up Manual ----
  if (viewMode == 0) {
    focusX = 815;
    focusY = 500;
    zoom = 2.8; //[cite: 3]
  } else {
    focusX = 640;
    focusY = 465;
    zoom = 2.6;
  }

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  scale(zoom);
  translate(-focusX, -focusY);

  // Gambar background balai desa bersama
  image(bgS07toS12, 0, 0, width, height); //[cite: 1]

  // Gambar Warga Berdiri Pasif di Samping
  placeActor(320, 600, S07_CHAR_SCALE, "dolfIdle"); //[cite: 1]
  placeActor(400, 600, S07_CHAR_SCALE, "rahmaIdle"); //[cite: 1]
  placeActor(960, 600, S07_CHAR_SCALE, "buDarmiIdle"); //[cite: 1]
  placeActor(1040, 600, S07_CHAR_SCALE, "buSariIdle"); //[cite: 1]

  // Gambar Sari menggunakan Helper khusus S10 (tangan di bawah + animasi mulut)
  placeSariS10(880, 600, S07_CHAR_SCALE, isSariTalking); //[cite: 1]

  // Gambar Pak Karso menggunakan Helper smileTension Lokal
  placeKarsoSmileTension(width / 2.0 + karsoXOffset, 580, S07_CHAR_SCALE, isKarsoTalking, karsoTension);

  popMatrix();

  // ---- Tampilkan Dialog Bubble Bergantian Bawah Layar ----
  if (localTime < 14.0) {
    drawDialogBubble("SARI", "Iya, Pak. Saya Sari, baru pindah minggu lalu. Tadi Pak Karso bilang dana infrastruktur sudah diproses. Di papan anggaran yang di luar, tertulis jalan desa dapat alokasi delapan puluh juta rupiah tahun ini.");
  } 
  else if (localTime >= 14.0 && localTime < 15.8) {
    drawDialogBubble("PAK KARSO", "Betul, betul.");
  } 
  else if (localTime >= 15.8 && localTime < 22.3) {
    drawDialogBubble("SARI", "Tapi jalan di depan kantor masih berlubang, Pak. Yang tadi saya lewati. Lubangnya cukup besar.");
  } 
  else if (localTime >= 22.3 && localTime < 28.9) {
    drawDialogBubble("PAK KARSO", "Nah, itu... sudah ada prosesnya, neng. Tender, administrasi, macam-macam. Tidak bisa langsung.");
  } 
  else if (localTime >= 28.9 && localTime < 37.1) {
    drawDialogBubble("SARI", "Proses tendernya sudah sejak kapan, Pak? Karena anggaran ini sudah dialokasikan sejak Januari. Sekarang sudah Agustus.");
  } 
  else if (localTime >= 37.1 && localTime < 41.5) {
    if ((localTime - 37.1) >= 1.6) {
      drawDialogBubble("PAK KARSO", "Itu ada mekanismenya, neng. Nanti diurus sama yang berwenang—");
    }
  } 
  else if (localTime >= 41.5 && localTime < 46.2) {
    drawDialogBubble("SARI", "Saya mengerti, Pak. Saya hanya ingin tahu. Karena...");
  }
}

// =========================================================
// HELPER LOKAL S10: Menggambar Sari (Tangan Bawah + Mulut Berbicara)
// =========================================================
void placeSariS10(float worldX, float worldY, float scale, boolean isTalking) {
  pushMatrix();
  translate(worldX, worldY);
  scale(scale);
  translate(-194, -672); //[cite: 1]

  float waktu = frameCount * 0.05; //[cite: 2]
  float bobbing = sin(waktu) * 2.5; //[cite: 2]

  stroke(40, 38, 48); //[cite: 2]
  strokeWeight(6); //[cite: 2]
  strokeJoin(ROUND); //[cite: 2]
  strokeCap(ROUND); //[cite: 2]

  // Lengan Kanan (Statis di slot awal, menggantung normal ke bawah)
  pushMatrix();
  translate(136, 280 + bobbing); //[cite: 2]
  fill(162, 122, 233); //[cite: 2]
  rect(-21, 0, 42, 160, 12); //[cite: 2]
  fill(253, 197, 155); //[cite: 2]
  ellipse(0, 160, 32, 32); //[cite: 2]
  popMatrix();

  stroke(40, 38, 48); //[cite: 2]
  strokeWeight(6); //[cite: 2]

  // Tubuh bagian bawah (Rok & Sepatu)
  fill(102, 78, 158); beginShape(); vertex(142, 415); vertex(246, 415); vertex(260, 662); vertex(128, 662); endShape(CLOSE); //[cite: 2]
  fill(55, 53, 65); rect(125, 662, 62, 25, 8, 8, 2, 2); rect(178, 665, 65, 26, 8, 8, 2, 2); //[cite: 2]

  // Kepala & Rambut
  fill(55, 53, 65); rect(124, 150 + bobbing, 138, 142, 65, 65, 35, 35); //[cite: 2]
  fill(253, 197, 155); rect(132, 160 + bobbing, 116, 120, 48); //[cite: 2]
  ellipse(246, 222 + bobbing, 20, 28); noFill(); strokeWeight(3); arc(244, 222 + bobbing, 8, 10, -HALF_PI, HALF_PI); strokeWeight(6); //[cite: 2]
  fill(55, 53, 65); arc(190, 182 + bobbing, 118, 52, PI, TWO_PI); stroke(40, 38, 48); line(165, 158 + bobbing, 172, 172 + bobbing); line(210, 156 + bobbing, 206, 170 + bobbing); //[cite: 2]
  fill(243, 143, 153); pushMatrix(); translate(144, 158 + bobbing); rotate(radians(-15)); triangle(0, 0, -13, -8, -13, 8); triangle(0, 0, 13, -8, 13, 8); fill(255, 190, 200); ellipse(0, 0, 6, 6); popMatrix(); //[cite: 2]

  // Wajah & Mata
  fill(55, 53, 65); noStroke(); ellipse(164, 218 + bobbing, 13, 13); ellipse(199, 218 + bobbing, 13, 13); //[cite: 2]
  stroke(55, 53, 65); strokeWeight(3); line(157, 214 + bobbing, 151, 210 + bobbing); line(156, 220 + bobbing, 150, 218 + bobbing); line(205, 214 + bobbing, 211, 210 + bobbing); line(204, 220 + bobbing, 210, 218 + bobbing); //[cite: 2]
  stroke(40, 38, 48); strokeWeight(6); //[cite: 2]

  // ---- ANIMASI MULUT SARI (Berbicara hanya saat gilirannya) ----
  if (isTalking) {
    float mouthCycle = (sin(waktu * 7.0) + 1.0) / 2.0;
    float mouthOpen = mouthCycle * mouthCycle;
    noStroke();
    fill(90, 30, 25); // Warna rongga dalam mulut
    float sariMouthH = 3 + mouthOpen * 11;
    ellipse(181, 242 + bobbing, 16, sariMouthH);
    if (mouthOpen > 0.35) {
      fill(255, 190, 200); // Detail lidah dalam mulut
      ellipse(181, 242 + bobbing + sariMouthH * 0.15, 10, sariMouthH * 0.4);
    }
    stroke(40, 38, 48);
    strokeWeight(6);
  } else {
    noFill();
    arc(181, 238 + bobbing, 22, 13, 0, PI); // Kembali melengkung biasa[cite: 2]
  }

  // Baju Atas
  fill(162, 122, 233); rect(130, 280 + bobbing, 120, 175, 15, 15, 0, 0); noFill(); arc(190, 280 + bobbing, 36, 16, 0, PI); stroke(40, 38, 48, 60); strokeWeight(3); line(146, 340 + bobbing, 146, 420 + bobbing); line(234, 340 + bobbing, 234, 420 + bobbing); stroke(40, 38, 48); strokeWeight(6); //[cite: 2]

  // Lengan Kiri (Membawa Buku Catatan di Bawah Layar)
  pushMatrix(); translate(231, 280 + bobbing); fill(162, 122, 233); rect(-21, 0, 42, 160, 12); fill(253, 197, 155); ellipse(0, 160, 32, 32); popMatrix(); //[cite: 2]
  pushMatrix(); translate(231, 280 + bobbing + 160); rotate(radians(-10)); fill(250, 245, 225); stroke(40, 38, 48); strokeWeight(3); rect(-20, -14, 40, 30, 3); fill(200, 60, 60); noStroke(); rect(-20, -14, 5, 30); stroke(150); strokeWeight(1.5); line(-12, -6, 14, -6); line(-12, 0, 14, 0); line(-12, 6, 14, 6); pushMatrix(); translate(16, -10); rotate(radians(20)); noStroke(); fill(230, 190, 80); rect(-2.5, -11, 5, 22); fill(60); triangle(-2.5, -11, 2.5, -11, 0, -16); popMatrix(); popMatrix(); //[cite: 2]

  popMatrix();
}

// =========================================================
// HELPER LOKAL S10: Menggambar Karso dengan smileTension bertingkat
// =========================================================
void placeKarsoSmileTension(float worldX, float worldY, float scale, boolean isTalking, int tensionLevel) {
  pushMatrix();
  translate(worldX, worldY);
  scale(scale);
  translate(-194, -672); //[cite: 1]

  float waktu = frameCount * 0.05; //[cite: 1]
  float bobbing = sin(waktu) * 2.5; //[cite: 1]

  stroke(40, 38, 48); //[cite: 1]
  strokeWeight(6); //[cite: 1]
  strokeJoin(ROUND); //[cite: 1]
  strokeCap(ROUND); //[cite: 1]

  // Lengan Kanan Gestur
  pushMatrix(); translate(136, 280 + bobbing); rotate(radians(80 + sin(waktu)*5)); fill(175, 140, 95); rect(-21, 0, 42, 150, 12); fill(235, 155, 120); ellipse(0, 150, 32, 32); popMatrix(); //[cite: 1]

  // Kaki Kiri & Kanan
  pushMatrix(); translate(168, 415); fill(175, 140, 95); rect(-26, 0, 52, 235); fill(240, 240, 230); rect(-18, 235, 34, 15); fill(55, 53, 65); rect(-43, 247, 62, 25, 8, 8, 2, 2); popMatrix(); //[cite: 1]
  pushMatrix(); translate(220, 415); fill(175, 140, 95); rect(-26, 0, 52, 235); fill(240, 240, 230); rect(-18, 235, 34, 15); fill(55, 53, 65); rect(-42, 250, 65, 26, 8, 8, 2, 2); popMatrix(); //[cite: 1]

  // Wajah & Kopiah
  fill(235, 155, 120); rect(132, 160 + bobbing, 116, 135, 45); ellipse(245, 225 + bobbing, 25, 35); fill(40, 38, 48); rect(228, 165 + bobbing, 20, 37, 5); rect(128, 110 + bobbing, 120, 60, 10, 10, 0, 0); fill(240, 200, 50); noStroke(); rect(140, 135 + bobbing, 10, 4, 2); rect(156, 135 + bobbing, 10, 4, 2); rect(172, 135 + bobbing, 10, 4, 2); rect(188, 135 + bobbing, 10, 4, 2); rect(204, 135 + bobbing, 10, 4, 2); rect(220, 135 + bobbing, 10, 4, 2); //[cite: 1]
  fill(55, 53, 65); stroke(40, 38, 48); strokeWeight(6); ellipse(160, 215 + bobbing, 14, 14); ellipse(195, 215 + bobbing, 14, 14); //[cite: 1]

  // Kumis Statis Pak Karso
  fill(55, 53, 65); beginShape(); vertex(142, 242 + bobbing); bezierVertex(142, 230 + bobbing, 210, 230 + bobbing, 210, 242 + bobbing); bezierVertex(210, 265 + bobbing, 185, 270 + bobbing, 176, 252 + bobbing); bezierVertex(165, 270 + bobbing, 142, 265 + bobbing, 142, 242 + bobbing); endShape(CLOSE); //[cite: 1]

  // ---- INTEGRASI LOGIKA ANIMASI SMILE TENSION PADA AREA MULUT ----
  float mouthCycle = (sin(waktu * 7.5) + 1.0) / 2.0;
  float mouthOpen = mouthCycle * mouthCycle;

  if (tensionLevel == 0) {
    // Level 0: Senyum terjaga normal melingkar
    if (isTalking) {
      noStroke(); fill(90, 30, 25);
      float mouthH = 4 + mouthOpen * 12;
      ellipse(176, 258 + bobbing, 24, mouthH);
    } else {
      noFill(); stroke(40, 38, 48); strokeWeight(4);
      arc(176, 254 + bobbing, 22, 8, 0, PI);
    }
  } 
  else if (tensionLevel == 1) {
    // Level 1: Senyum horizontal pipih menahan gigi kaku
    stroke(40, 38, 48); strokeWeight(4);
    fill(255); 
    rect(162, 253 + bobbing, 28, 6, 2);
    if (isTalking) {
      fill(90, 30, 25);
      rect(162, 259 + bobbing, 28, 2 + mouthOpen * 6);
    }
  } 
  else if (tensionLevel == 2) {
    // Level 2: Nada tinggi stres & gemetar. Ditambahkan getaran mikro (jitter)
    float jitterX = random(-1.2, 1.2);
    float jitterY = random(-1.2, 1.2);
    translate(jitterX, jitterY);

    stroke(40, 38, 48); strokeWeight(5);
    fill(100, 32, 28); 
    // PERBAIKAN: Tinggi kotak rongga mulut bergerak elastis naik-turun jika isTalking == true
    float h2 = 8 + (isTalking ? mouthOpen * 12 : 0);
    rect(158, 252 + bobbing, 36, h2, 3);
    fill(255); // Kunci baris gigi atas agar tetap kokoh
    rect(158, 252 + bobbing, 36, 4);
  }

  stroke(40, 38, 48); strokeWeight(6);

  // Badan Jas & Dasi
  fill(175, 140, 95); rect(130, 280 + bobbing, 120, 150); fill(255); triangle(145, 280 + bobbing, 185, 280 + bobbing, 165, 335 + bobbing); fill(40, 38, 48); beginShape(); vertex(155, 295 + bobbing); vertex(175, 295 + bobbing); vertex(180, 395 + bobbing); vertex(165, 415 + bobbing); vertex(150, 395 + bobbing); endShape(CLOSE); stroke(240, 200, 50); strokeWeight(3); line(158, 330 + bobbing, 172, 320 + bobbing); line(156, 360 + bobbing, 175, 345 + bobbing); line(154, 390 + bobbing, 178, 370 + bobbing); stroke(40, 38, 48); strokeWeight(6); //[cite: 1]

  // Lengan Kiri Statis
  pushMatrix(); translate(231, 280 + bobbing); fill(175, 140, 95); rect(-21, 0, 42, 150, 12); fill(235, 155, 120); ellipse(0, 150, 32, 32); popMatrix(); //[cite: 1]

  popMatrix();
}
