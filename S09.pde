// =========================================================
// S09.pde (6 dtk)
// Kembali ke wide shot Scene 7, Sari mengangkat tangan pelan.
//
// 0.0 - 2.0 dtk : Pak Karso berbicara menutup rapat. Sari diam.
// 2.0 - 3.5 dtk : Hening (BEAT). Tangan Sari terangkat pelan.
// 3.5 - 6.0 dtk : Pak Karso menyadari dan mempersilakan Sari bertanya.
// =========================================================

void sceneS09(float localTime) {
  // 1. Gambar background bersama balai desa
  image(bgS07toS12, 0, 0, width, height); //

  // 2. Tentukan status Karso (Bicara/Pidato vs Idle) berdasarkan lini masa
  if (localTime < 3.3 || localTime >= 4.8) {
    placeActor(width / 2.0, 580, S07_CHAR_SCALE, "karsoPidato"); //
  } else {
    placeActor(width / 2.0, 580, S07_CHAR_SCALE, "karsoIdle"); //[cite: 1]
  }

  // 3. Warga di karpet kiri mendengarkan (Pak Dolf & Bu Rahma diam)
  placeActor(320, 600, S07_CHAR_SCALE, "dolfIdle"); //[cite: 1]
  placeActor(400, 600, S07_CHAR_SCALE, "rahmaIdle"); //[cite: 1]

  // 4. Warga di karpet kanan mendengarkan (Bu Darmi & Ibu Sari diam)
  placeActor(960, 600, S07_CHAR_SCALE, "buDarmiIdle"); //[cite: 1]
  placeActor(1040, 600, S07_CHAR_SCALE, "buSariIdle"); //[cite: 1]

  // 5. Animasi interpolasi tangan kanan Sari (pivot 136, kosong tanpa buku)
  float armAngle = 0.0;
  if (localTime >= 3.3 && localTime < 4.8) {
    // KOREKSI: Arah putaran dibalik menjadi positif (searah jarum jam)
    float t = (localTime - 3.3) / 1.5;
    armAngle = t * 140.0; 
  } else if (localTime >= 4.8) {
    // Tangan tetap bertahan tegak di atas setelah detik 3.5
    armAngle = 140.0;
  }

  // 6. Gambar Sari dengan posisi angkat tangan kustom menggunakan helper lokal
  placeSariAngkatTangan(880, 600, S07_CHAR_SCALE, armAngle); //[cite: 1]

  // 7. Pengondisian dialog bubble dan teks naskah bawah layar
  if (localTime < 3.3) {
    drawDialogBubble("PAK KARSO", "Baik, kalau tidak ada pertanyaan, kita tutup—"); //[cite: 1]
  } else if (localTime >= 4.8) {
    drawDialogBubble("PAK KARSO", "Oh— ada pertanyaan? Silakan, neng. Neng ini baru ya?"); //[cite: 1]
  }
}

// =========================================================
// HELPER LOKAL: Menggambar Sari dengan rotasi tangan kanan kustom
// =========================================================
void placeSariAngkatTangan(float worldX, float worldY, float scale, float angle) {
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

  // LENGAN KANAN SARI (Pivot 136) — Dirotasi naik ke atas luar torso
  pushMatrix();
  translate(136, 280 + bobbing); //[cite: 1]
  rotate(radians(angle));
  fill(162, 122, 233); //[cite: 1]
  rect(-21, 0, 42, 160, 12); //[cite: 1]
  fill(253, 197, 155); //[cite: 1]
  ellipse(0, 160, 32, 32); //[cite: 1]
  popMatrix();

  stroke(40, 38, 48); //[cite: 1]
  strokeWeight(6); //[cite: 1]

  // Rok ungu tua
  fill(102, 78, 158); //[cite: 1]
  beginShape(); //[cite: 1]
  vertex(142, 415); //[cite: 1]
  vertex(246, 415); //[cite: 1]
  vertex(260, 662); //[cite: 1]
  vertex(128, 662); //[cite: 1]
  endShape(CLOSE); //[cite: 1]

  // Sepatu hitam
  fill(55, 53, 65); //[cite: 1]
  rect(125, 662, 62, 25, 8, 8, 2, 2); //[cite: 1]
  rect(178, 665, 65, 26, 8, 8, 2, 2); //[cite: 1]

  // Rambut belakang oval
  fill(55, 53, 65); //[cite: 1]
  rect(124, 150 + bobbing, 138, 142, 65, 65, 35, 35); //[cite: 1]

  // Kepala oval
  fill(253, 197, 155); //[cite: 1]
  rect(132, 160 + bobbing, 116, 120, 48); //[cite: 1]

  // Telinga kanan
  ellipse(246, 222 + bobbing, 20, 28); //[cite: 1]
  noFill(); //[cite: 1]
  strokeWeight(3); //[cite: 1]
  arc(244, 222 + bobbing, 8, 10, -HALF_PI, HALF_PI); //[cite: 1]
  strokeWeight(6); //[cite: 1]

  // Rambut depan/poni
  fill(55, 53, 65); //[cite: 1]
  arc(190, 182 + bobbing, 118, 52, PI, TWO_PI); //[cite: 1]

  stroke(40, 38, 48); //[cite: 1]
  line(165, 158 + bobbing, 172, 172 + bobbing); //[cite: 1]
  line(210, 156 + bobbing, 206, 170 + bobbing); //[cite: 1]

  // Pita rambut merah muda
  fill(243, 143, 153); //[cite: 1]
  pushMatrix(); //[cite: 1]
  translate(144, 158 + bobbing); //[cite: 1]
  rotate(radians(-15)); //[cite: 1]
  triangle(0, 0, -13, -8, -13, 8); //[cite: 1]
  triangle(0, 0, 13, -8, 13, 8); //[cite: 1]
  fill(255, 190, 200); //[cite: 1]
  ellipse(0, 0, 6, 6); //[cite: 1]
  popMatrix(); //[cite: 1]

  // Mata bulat hitam
  fill(55, 53, 65); //[cite: 1]
  noStroke(); //[cite: 1]
  ellipse(164, 218 + bobbing, 13, 13); //[cite: 1]
  ellipse(199, 218 + bobbing, 13, 13); //[cite: 1]

  // Alis mata
  stroke(55, 53, 65); //[cite: 1]
  strokeWeight(3); //[cite: 1]
  line(157, 214 + bobbing, 151, 210 + bobbing); //[cite: 1]
  line(156, 220 + bobbing, 150, 218 + bobbing); //[cite: 1]
  line(205, 214 + bobbing, 211, 210 + bobbing); //[cite: 1]
  line(204, 220 + bobbing, 210, 218 + bobbing); //[cite: 1]

  stroke(40, 38, 48); //[cite: 1]
  strokeWeight(6); //[cite: 1]

  // Mulut melengkung
  noFill(); //[cite: 1]
  arc(181, 238 + bobbing, 22, 13, 0, PI); //[cite: 1]

  // Baju ungu cerah
  fill(162, 122, 233); //[cite: 1]
  rect(130, 280 + bobbing, 120, 175, 15, 15, 0, 0); //[cite: 1]

  // Kerah baju
  noFill(); //[cite: 1]
  arc(190, 280 + bobbing, 36, 16, 0, PI); //[cite: 1]

  // Detil lipatan baju tipis
  stroke(40, 38, 48, 60); //[cite: 1]
  strokeWeight(3); //[cite: 1]
  line(146, 340 + bobbing, 146, 420 + bobbing); //[cite: 1]
  line(234, 340 + bobbing, 234, 420 + bobbing); //[cite: 1]

  stroke(40, 38, 48); //[cite: 1]
  strokeWeight(6); //[cite: 1]

  // LENGAN KIRI SARI (Pivot 231) — Diam ke bawah memegang buku catatan
  pushMatrix();
  translate(231, 280 + bobbing); //[cite: 1]
  fill(162, 122, 233); //[cite: 1]
  rect(-21, 0, 42, 160, 12); //[cite: 1]
  fill(253, 197, 155); //[cite: 1]
  ellipse(0, 160, 32, 32); //[cite: 1]
  popMatrix();

  // Buku catatan + pensil nempel di tangan kiri yang menggantung bawah
  pushMatrix();
  translate(231, 280 + bobbing + 160); //[cite: 1]
  rotate(radians(-10)); //[cite: 1]

  fill(250, 245, 225); //[cite: 1]
  stroke(40, 38, 48); //[cite: 1]
  strokeWeight(3); //[cite: 1]
  rect(-20, -14, 40, 30, 3); //[cite: 1]
  fill(200, 60, 60); //[cite: 1]
  noStroke(); //[cite: 1]
  rect(-20, -14, 5, 30); //[cite: 1]

  stroke(150); //[cite: 1]
  strokeWeight(1.5); //[cite: 1]
  line(-12, -6, 14, -6); //[cite: 1]
  line(-12, 0, 14, 0); //[cite: 1]
  line(-12, 6, 14, 6); //[cite: 1]

  pushMatrix(); //[cite: 1]
  translate(16, -10); //[cite: 1]
  rotate(radians(20)); //[cite: 1]
  noStroke(); //[cite: 1]
  fill(230, 190, 80); //[cite: 1]
  rect(-2.5, -11, 5, 22); //[cite: 1]
  fill(60); //[cite: 1]
  triangle(-2.5, -11, 2.5, -11, 0, -16); //[cite: 1]
  popMatrix(); //[cite: 1]

  popMatrix();
  popMatrix();
}
