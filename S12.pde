// =========================================================
// S12.pde (9.5 dtk)
// Penutup babak ketegangan rapat balai desa oleh Pak Karso.
// 
// 0.0 - 7.5 dtk : Close-up Pak Karso, wajah dipaksa santai tapi mulai marah/maksa.
// 7.5 - 9.5 dtk : Potong kembali ke Wide Shot Rapat (Perspektif No 7) tanpa bubble.
// =========================================================

void sceneS12(float localTime) {
  background(0); //

  float focusX, focusY, zoom;
  boolean isWideShot = (localTime >= 7.5);
  boolean isKarsoTalking = (localTime < 7.5);

  // ---- Pengaturan Kamera Close-up vs Wide Perspektif No 7 ----
  if (!isWideShot) {
    // Kamera fokus memotong dekat ke wajah Pak Karso (seperti standar S10)
    focusX = 640;
    focusY = 465;
    zoom = 2.6;
  } else {
    // Kamera normal wide shot kembali ke panggung awal tanpa transformasi zoom
    focusX = width / 2.0;
    focusY = height / 2.0;
    zoom = 1.0;
  }

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  scale(zoom);
  if (!isWideShot) {
    translate(-focusX, -focusY);
  } else {
    translate(-focusX, -focusY);
  }

  // Gambar background bersama balai desa
  image(bgS07toS12, 0, 0, width, height); //

  // Gambar Susunan Warga Sesuai Posisi Perspektif No 7
  placeActor(320, 600, S07_CHAR_SCALE, "dolfIdle"); //[cite: 1]
  placeActor(400, 600, S07_CHAR_SCALE, "rahmaIdle"); //[cite: 1]
  placeActor(880, 600, S07_CHAR_SCALE, "sariNotebook"); //[cite: 1]
  placeActor(960, 600, S07_CHAR_SCALE, "buDarmiIdle"); //[cite: 1]
  placeActor(1040, 600, S07_CHAR_SCALE, "buSariIdle"); //[cite: 1]

  // Kondisi Pak Karso: Closeup Marsh/Maksa vs Kembali Wide Diam Canggung
  if (!isWideShot) {
    placeKarsoMarahMaksa(width / 2.0, 580, S07_CHAR_SCALE, isKarsoTalking);
  } else {
    placeActor(width / 2.0, 580, S07_CHAR_SCALE, "karsoIdle"); //[cite: 1]
  }

  popMatrix();

  // ---- Pengondisian Dialog Bubble Bawah Layar ----
  if (localTime < 7.5) {
    drawDialogBubble("PAK KARSO", "Ya... tentu saja. Dan sudah dikelola dengan baik. Kalau ada pertanyaan lebih lanjut, bisa datang ke kantor.");
  }
  // Detik 7.5 - 9.5 dikosongkan tanpa bubble untuk transisi canggung wide shot menutup rapat
}

// =========================================================
// HELPER LOKAL: Menggambar Pak Karso Ekspresi Marah/Memaksakan Santai
// =========================================================
void placeKarsoMarahMaksa(float worldX, float worldY, float scale, boolean isTalking) {
  pushMatrix();
  translate(worldX, worldY);
  scale(scale);
  translate(-194, -672); //[cite: 1]

  float waktu = frameCount * 0.05; //[cite: 1]
  float bobbing = sin(waktu) * 2.5; //[cite: 1]

  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);

  // Lengan Kanan diturunkan kaku ke bawah badan karena kesal
  pushMatrix();
  translate(136, 280 + bobbing);
  rotate(radians(40 + sin(waktu)*3));
  fill(175, 140, 95); rect(-21, 0, 42, 150, 12); fill(235, 155, 120); ellipse(0, 150, 32, 32);
  popMatrix();

  // Kaki Kiri & Kanan
  pushMatrix(); translate(168, 415); fill(175, 140, 95); rect(-26, 0, 52, 235); fill(240, 240, 230); rect(-18, 235, 34, 15); fill(55, 53, 65); rect(-43, 247, 62, 25, 8, 8, 2, 2); popMatrix();
  pushMatrix(); translate(220, 415); fill(175, 140, 95); rect(-26, 0, 52, 235); fill(240, 240, 230); rect(-18, 235, 34, 15); fill(55, 53, 65); rect(-42, 250, 65, 26, 8, 8, 2, 2); popMatrix();

  // Wajah & Kopiah dasar
  fill(235, 155, 120); rect(132, 160 + bobbing, 116, 135, 45); ellipse(245, 225 + bobbing, 25, 35); fill(40, 38, 48); rect(228, 165 + bobbing, 20, 37, 5); rect(128, 110 + bobbing, 120, 60, 10, 10, 0, 0); fill(240, 200, 50); noStroke(); rect(140, 135 + bobbing, 10, 4, 2); rect(156, 135 + bobbing, 10, 4, 2); rect(172, 135 + bobbing, 10, 4, 2); rect(188, 135 + bobbing, 10, 4, 2); rect(204, 135 + bobbing, 10, 4, 2); rect(220, 135 + bobbing, 10, 4, 2);
  fill(55, 53, 65); stroke(40, 38, 48); strokeWeight(6); ellipse(160, 215 + bobbing, 14, 14); ellipse(195, 215 + bobbing, 14, 14);

  // Kumis Statis Pak Karso
  fill(55, 53, 65); beginShape(); vertex(142, 242 + bobbing); bezierVertex(142, 230 + bobbing, 210, 230 + bobbing, 210, 242 + bobbing); bezierVertex(210, 265 + bobbing, 185, 270 + bobbing, 176, 252 + bobbing); bezierVertex(165, 270 + bobbing, 142, 265 + bobbing, 142, 242 + bobbing); endShape(CLOSE);

  // MODIFIKASI MARAH: Alis tebal mengerut tajam ke dalam bawah
  stroke(40, 38, 48); strokeWeight(5);
  line(152, 201 + bobbing, 166, 208 + bobbing); 
  line(202, 201 + bobbing, 188, 208 + bobbing); 

  // MODIFIKASI MULUT: Dipaksa senyum horizontal tapi terbuka menggeram kaku
  stroke(40, 38, 48); strokeWeight(4);
  fill(255); // Garis gigi mengunci rapat menahan emosi
  rect(160, 251 + bobbing, 32, 5, 1);
  if (isTalking) {
    float mouthCycle = (sin(waktu * 7.0) + 1.0) / 2.0;
    float mouthOpen = mouthCycle * mouthCycle;
    fill(90, 30, 25);
    rect(160, 256 + bobbing, 32, 2 + mouthOpen * 8, 1);
  }
  stroke(40, 38, 48); strokeWeight(6);

  // Jas & Dasi
  fill(175, 140, 95); rect(130, 280 + bobbing, 120, 150); fill(255); triangle(145, 280 + bobbing, 185, 280 + bobbing, 165, 335 + bobbing); fill(40, 38, 48); beginShape(); vertex(155, 295 + bobbing); vertex(175, 295 + bobbing); vertex(180, 395 + bobbing); vertex(165, 415 + bobbing); vertex(150, 395 + bobbing); endShape(CLOSE); stroke(240, 200, 50); strokeWeight(3); line(158, 330 + bobbing, 172, 320 + bobbing); line(156, 360 + bobbing, 175, 345 + bobbing); line(154, 390 + bobbing, 178, 370 + bobbing); stroke(40, 38, 48); strokeWeight(6);

  // Lengan Kiri menggantung kaku
  pushMatrix(); translate(231, 280 + bobbing); fill(175, 140, 95); rect(-21, 0, 42, 150, 12); fill(235, 155, 120); ellipse(0, 150, 32, 32); popMatrix();

  popMatrix();
}
