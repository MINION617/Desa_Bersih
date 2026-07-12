  // ====================================================================
// S01.pde (8.0 dtk)
// Semua Karakter Berjalan ke Kiri & Berhenti Beriringan di Sawah
// Korespondensi koordinat dihitung ulang dari 960x540 ke 1280x720 (Skala 1.333)
// ====================================================================

void sceneS01(float localTime) {
  // 1. Gambar background S01 yang sudah disesuaikan ukurannya
  image(bgS01, 0, 0, width, height);

  // 2. Konversi Kecepatan Jalan dari per-frame ke per-detik (0.8 frame * 24 fps * 1.333 skala = 25.6)
  float speedPerSecond = 25.6;
  float distanceMoved = localTime * speedPerSecond;

  // 3. Hitung Posisi Dinamis X Karakter Berdasarkan Waktu (Nilai Awal * 1.333)
  float startXWanita = (width / 2.0) + 66.6; 
  float startXDolf   = (width / 2.0) + 240.0;
  float startXNenek  = (width / 2.0) + 400.0;

  float posX_Wanita = startXWanita - distanceMoved;
  float posX_Dolf   = startXDolf - distanceMoved;
  float posX_Nenek  = startXNenek - distanceMoved;

  // 4. Batas Batas Berhenti Karakter (Nilai Batas Asli * 1.333)
  float stopWanita = 466.6;
  float stopDolf   = 573.3;
  float stopNenek  = 680.0;

  // 5. Tentukan Status Berjalan vs Berhenti
  boolean wanitaBerjalan = true;
  if (posX_Wanita < stopWanita) {
    posX_Wanita = stopWanita;
    wanitaBerjalan = false;
  }

  boolean dolfBerjalan = true;
  if (posX_Dolf < stopDolf) {
    posX_Dolf = stopDolf;
    dolfBerjalan = false;
  }

  boolean nenekBerjalan = true;
  if (posX_Nenek < stopNenek) {
    posX_Nenek = stopNenek;
    nenekBerjalan = false;
  }

  // 6. Gambar Karakter Mengikuti Layer Kedalaman (Nilai Y Asli * 1.333)
  drawNenekS01(posX_Nenek, 646.6, nenekBerjalan); 
  drawDolfS01(posX_Dolf, 640.0, dolfBerjalan); 
  drawWargaPerempuanS01(posX_Wanita, 653.3, wanitaBerjalan); 
}

// ====================================================================
// HELPER LOKAL SCENE 1: Agar tidak bentrok dengan tab Actors.pde
// ====================================================================

void drawNenekS01(float x, float y, boolean isWalking) {
  float waktu = frameCount * 0.1; 
  float ayunan = isWalking ? sin(waktu) * 0.15 : 0; 
  float bobbing = isWalking ? cos(waktu * 2) * 1.5 : sin(frameCount * 0.1) * 1.0;   

  pushMatrix();
  translate(x, y); 
  scale(0.293, 0.293); // Skala disesuaikan (0.22 * 1.333)
  translate(-190, -660); 

  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(136, 310 + bobbing); rotate(ayunan); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix();
  stroke(40, 38, 48); strokeWeight(6);
  pushMatrix(); translate(168, 430 + bobbing); rotate(-ayunan); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-28, 215, 55, 25, 8, 8, 2, 2); popMatrix();
  pushMatrix(); translate(220, 430 + bobbing); rotate(ayunan); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-30, 215, 55, 25, 8, 8, 2, 2); popMatrix();

  fill(110, 85, 60); beginShape(); vertex(134, 430 + bobbing); vertex(246, 430 + bobbing); vertex(260, 645 + bobbing); vertex(128, 645 + bobbing); endShape(CLOSE);
  fill(165, 167, 172); ellipse(222, 162 + bobbing, 40, 40); fill(245, 185, 140); rect(132, 190 + bobbing, 116, 135, 50);

  fill(165, 167, 172); beginShape(); vertex(132, 220 + bobbing); bezierVertex(132, 140 + bobbing, 248, 140 + bobbing, 248, 220 + bobbing); bezierVertex(248, 232 + bobbing, 229, 232 + bobbing, 229, 220 + bobbing); bezierVertex(229, 232 + bobbing, 210, 232 + bobbing, 210, 220 + bobbing); bezierVertex(210, 232 + bobbing, 190, 232 + bobbing, 190, 220 + bobbing); bezierVertex(190, 232 + bobbing, 171, 232 + bobbing, 171, 220 + bobbing); bezierVertex(171, 232 + bobbing, 152, 232 + bobbing, 152, 220 + bobbing); bezierVertex(152, 232 + bobbing, 132, 232 + bobbing, 132, 220 + bobbing); endShape(CLOSE);
  noFill(); stroke(190, 130, 100); strokeWeight(3); arc(172, 242 + bobbing, 24, 6, PI, TWO_PI); arc(172, 250 + bobbing, 16, 4, PI, TWO_PI);
  fill(40, 38, 48); noStroke(); ellipse(152, 265 + bobbing, 12, 12); ellipse(192, 265 + bobbing, 12, 12);
  stroke(40, 38, 48); strokeWeight(4); line(148, 262 + bobbing, 142, 255 + bobbing); line(153, 259 + bobbing, 149, 251 + bobbing); line(189, 259 + bobbing, 193, 251 + bobbing); line(194, 262 + bobbing, 200, 255 + bobbing);
  noFill(); strokeWeight(5); arc(172, 282 + bobbing, 20, 12, 0, PI);

  fill(160, 125, 90); strokeWeight(6); rect(130, 310 + bobbing, 120, 150); line(172, 325 + bobbing, 172, 460 + bobbing); fill(160, 125, 90); arc(152, 310 + bobbing, 45, 35, 0, PI); arc(202, 310 + bobbing, 45, 35, 0, PI);
  pushMatrix(); translate(231, 310 + bobbing); rotate(-ayunan); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix();
  popMatrix();
}

void drawWargaPerempuanS01(float x, float y, boolean isWalking) {
  float waktu  = frameCount * 0.15;
  float bobbing = isWalking ? abs(sin(waktu)) * 3.5 : sin(frameCount * 0.1) * 1.5;
  float ayunan = isWalking ? sin(waktu) * 0.35 : 0; 

  pushMatrix();
  translate(x, y - bobbing); 
  scale(-0.293, 0.293); 
  translate(-195, -660); 

  stroke(20); strokeWeight(4); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(190, 270); rotate(-ayunan); fill(198, 75, 59); rect(-14, 0, 28, 130, 12); fill(200, 139, 94); ellipse(0, 130, 30, 30); popMatrix();
  pushMatrix(); translate(175, 395); rotate(ayunan); fill(245, 245, 245); rect(-15, 0, 30, 235); fill(200, 139, 94); rect(-15, 235, 42, 15, 2, 8, 2, 2); fill(35, 125, 49); rect(-18, 250, 48, 8, 4); strokeWeight(3); line(10, 250, 0, 239); strokeWeight(4); popMatrix();
  pushMatrix(); translate(205, 395); rotate(-ayunan); fill(245, 245, 245); rect(-15, 0, 30, 235); fill(200, 139, 94); rect(-15, 235, 42, 15, 2, 8, 2, 2); fill(35, 125, 49); rect(-18, 250, 48, 8, 4); strokeWeight(3); line(10, 250, 0, 239); strokeWeight(4); popMatrix();

  fill(198, 75, 59); rect(155, 260, 80, 150, 10); fill(200, 139, 94); arc(200, 260, 40, 25, 0, PI);  
  fill(44, 44, 44); ellipse(142, 195, 36, 46); fill(200, 139, 94); rect(155, 145, 90, 115, 45);  
  fill(44, 44, 44); beginShape(); vertex(155, 210); bezierVertex(140, 130, 250, 130, 248, 190); bezierVertex(235, 160, 185, 160, 155, 210); endShape(CLOSE);
  fill(200, 139, 94); ellipse(162, 205, 20, 25); noFill(); strokeWeight(2); arc(159, 205, 10, 12, HALF_PI, PI + HALF_PI); strokeWeight(4);
  fill(20); noStroke(); ellipse(208, 195, 14, 14); ellipse(235, 195, 14, 14); stroke(20); noFill(); arc(224, 220, 14, 8, 0, PI);
  pushMatrix(); translate(190, 270); rotate(ayunan); fill(198, 75, 59); rect(-14, 0, 28, 130, 12); fill(200, 139, 94); ellipse(0, 130, 30, 30); popMatrix();

  popMatrix();
}

void drawDolfS01(float x, float y, boolean isWalking) {
  float waktu = frameCount * 0.15;  
  float bobbing = isWalking ? abs(sin(waktu)) * 3.5 : sin(frameCount * 0.1) * 1.5; 
  float ayunan = isWalking ? sin(waktu) * 0.35 : 0; 

  pushMatrix();
  translate(x, y - bobbing);
  scale(0.293); 

  stroke(0); strokeWeight(5); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(35, -425); rotate(-ayunan); fill(65, 67, 71); rect(-15, 0, 32, 130, 8); fill(210, 180, 155); ellipse(0, 130, 26, 26); popMatrix();
  pushMatrix(); translate(55, -250); rotate(ayunan); fill(140); rect(-22, 0, 44, 210); fill(220, 190, 165); rect(-17, 210, 34, 15); fill(220); rect(-40, 225, 65, 10, 3); popMatrix();
  pushMatrix(); translate(40, -250); rotate(-ayunan); fill(173, 177, 182); rect(-22, 0, 44, 210); fill(240, 210, 185); rect(-17, 210, 34, 15); fill(255); rect(-40, 225, 65, 10, 3); popMatrix();

  fill(85, 87, 91); rect(-5, -450, 110, 205, 5); fill(240, 210, 185); noStroke(); arc(18, -450, 45, 50, 0, PI); stroke(0); noFill(); arc(18, -450, 45, 50, 0, PI);
  pushMatrix(); translate(70, -425); rotate(ayunan); fill(85, 87, 91); rect(-18, 0, 36, 135, 8); fill(240, 210, 185); ellipse(0, 135, 28, 28); popMatrix();

  fill(240, 210, 185); rect(-2, -580, 105, 132, 25); ellipse(98, -515, 22, 28);
  fill(40); beginShape(); vertex(-5, -575); bezierVertex(-5, -625, 105, -625, 105, -575); vertex(103, -517); vertex(78, -517); vertex(78, -572); endShape(CLOSE);
  line(63, -572, 78, -545); 

  fill(0); ellipse(15, -515, 14, 14); ellipse(45, -515, 14, 14); fill(40); rect(15, -492, 20, 20);

  popMatrix(); 
}
