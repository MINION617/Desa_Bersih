// =========================================================
// S17.pde — Scene 17 (15.0 detik)
// Interior. Sari berjalan mendekat, bicara, lalu mengambil map.
// KOREKSI: Setelah ambil map (t >= 3.5), Sari melangkah mundur ke x=720
// agar postur tubuhnya tidak bertubrukan/menimpa Bu Darmi.
//
// Fase waktu (detik lokal):
//   0.0 - 2.5 : SARI berjalan mendekat dari x=950 ke x=600 sambil bertanya.
//   2.5 - 3.5 : SARI diam di x=600, tangan kanan menjangkau & mengambil map di meja (t=3.0s).
//   3.5 - 5.0 : SARI melangkah mundur dari x=600 ke x=720 agar mendapat jarak aman.
//   5.0 - 9.5 : BU DARMI bicara "Ibu pikir...". Mengangguk kecil. Sari diam menyimak.
//   9.5 - 13.0: SARI bicara "Sekarang ada dua." (Pelan dari jarak aman x=720).
//   13.0- 15.0: Bu Darmi tersenyum bangga, postur tegak (postureLerp naik).
// =========================================================

void sceneS17(float localTime) {
  float flicker = map(noise(frameCount * 0.12), 0, 1, 0.94, 1.06);

  // 1. BACKGROUND BELAKANG (Daur ulang fungsi S16 agar memori kompilasi efisien)
  drawBgS16Belakang(flicker);

  // 2. KOREKSI BLOCKING: Logika posisi horizontal dan status langkah kaki Sari
  float sariX;
  boolean sariWalking;
  
  if (localTime < 2.5) {
    sariX = lerp(950, 600, localTime / 2.5);
    sariWalking = true;
  } else if (localTime < 3.5) {
    sariX = 600;
    sariWalking = false;
  } else if (localTime < 5.0) {
    // Sari melangkah mundur sejauh 120 piksel selama 1.5 detik
    sariX = lerp(600, 720, (localTime - 3.5) / 1.5);
    sariWalking = true; // Aktifkan ayunan kaki kembali saat melangkah mundur
  } else {
    sariX = 720; // Mengunci posisi berdiri tetap di jarak aman
    sariWalking = false;
  }

  // 3. AKTOR BU DARMI (Menetap di x=500 menghadap ke kanan)
  pushMatrix();
  translate(500, 620);
  scale(-0.85, 0.85); 
  drawBuDarmiS17(0, 0, localTime);
  popMatrix();

  // 4. AKTOR SARI (Menatap kiri, posisi dinamis mengikuti kalkulasi sariX)
  pushMatrix();
  translate(sariX, 600);
  scale(0.85); 
  drawSariS17(0, 0, localTime, sariWalking);
  popMatrix();

  // 5. FOREGROUND & MAP DI MEJA (Map otomatis hilang dari meja setelah t=3.0s karena berpindah ke tangan Sari)
  drawBgS17MejaDepan(flicker, localTime);

  // 6. SINKRONISASI BUBBLE DIALOG
  if (localTime >= 0.0 && localTime < 3.5) {
    drawDialogBubble("SARI", "Ibu simpan ini tiga tahun?");
  } 
  else if (localTime >= 3.5 && localTime < 9.5) {
    drawDialogBubble("BU DARMI", "Ibu pikir, nanti ada yang lebih berani dari ibu.\nNanti ada yang bisa.");
  } 
  else if (localTime >= 9.5 && localTime < 13.0) {
    drawDialogBubble("SARI", "Sekarang ada dua.");
  }
}

// =========================================================
// HELPER LOKAL: Background Meja Foreground S17
// =========================================================
void drawBgS17MejaDepan(float flicker, float localTime) {
  pushMatrix();
  scale(1.6);

  stroke(30, 15, 5); strokeWeight(2); fill(54, 34, 18); rect(310, 290, 16, 70); rect(474, 290, 16, 70);
  stroke(35, 18, 5); strokeWeight(3); fill(115, 76, 46); quad(280, 290, 520, 290, 600, 390, 200, 390);
  fill(84, 54, 31); quad(200, 390, 600, 390, 600, 408, 200, 408);
  fill(71, 44, 24); rect(220, 408, 24, 42); rect(556, 408, 24, 42);
  stroke(95, 60, 35); strokeWeight(1.5); line(330, 290, 280, 390); line(400, 290, 400, 390); line(470, 290, 520, 390);

  noStroke();
  for (int r = 220; r > 0; r -= 10) { float alpha = map(r, 0, 220, 70, 0); fill(255, 190, 65, alpha * flicker); ellipse(400, 335, r * 1.6, r * 0.6); }
  for (int r = 380; r > 0; r -= 15) { float alpha = map(r, 0, 380, 50, 0); fill(255, 165, 45, alpha * flicker); ellipse(400, 230, r * 1.4, r); }

  // Berkas map hanya tergeletak di atas kayu meja sebelum localTime menginjak detik ke-3.0
  if (localTime < 3.0) {
    float mapX = (500 - 0.85 * (37 - 150 * sin(radians(20)))) / 1.6;
    float mapY = ((620 + 0.85 * (-362 + 150 * cos(radians(20))))) / 1.6 + 22; 
    
    pushMatrix();
    translate(mapX, mapY); 
    rotate(radians(-8));
    fill(220, 215, 200); rect(-30, -20, 60, 40, 2); 
    fill(240, 235, 220); rect(-25, -25, 60, 40, 2); 
    stroke(150, 140, 130); strokeWeight(1);
    line(-15, -15, 20, -15); line(-15, -10, 25, -10); line(-15, -5, 15, -5); line(-15, 0, 25, 0);
    popMatrix();
  }

  int lx = 400; int ly = 295;
  stroke(30); strokeWeight(2); fill(65, 55, 45); ellipse(lx, ly, 40, 12); rect(lx-16, ly-16, 32, 16); ellipse(lx, ly-16, 32, 8);
  fill(100, 90, 80); rect(lx-10, ly-22, 20, 6);
  stroke(240, 240, 255, 140); fill(255, 255, 255, 20); ellipse(lx, ly-42, 34, 34); rect(lx-8, ly-75, 16, 35); ellipse(lx, ly-75, 16, 4);
  noStroke(); fill(255, 120, 20, 200); ellipse(lx, ly-42, 14 * flicker, 26 * flicker); fill(255, 255, 220, 255); ellipse(lx, ly-40, 8 * flicker, 16 * flicker);

  popMatrix();
}

// =========================================================
// HELPER LOKAL: Bu Darmi Mengangguk & Rileks Tegak Tersenyum
// =========================================================
void drawBuDarmiS17(float x, float y, float localTime) {
  pushMatrix();
  translate(x, y);
  translate(-194, -672);

  boolean isTalking = (localTime >= 3.5 && localTime < 9.5);
  
  float postureLerp = constrain((localTime - 13.0) / 2.0, 0, 1);
  float postureOffsetY = lerp(0, -15, postureLerp); 

  float nod = isTalking ? sin(localTime * 4) * radians(3) : 0;
  float bobbing = sin(frameCount * 0.04) * 2.0 + postureOffsetY;

  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(136, 310 + bobbing); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix();
  pushMatrix(); translate(168, 430); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-28, 215, 55, 25, 8, 8, 2, 2); popMatrix();
  pushMatrix(); translate(220, 430); fill(245, 185, 140); rect(-10, 0, 20, 220); fill(55, 53, 65); rect(-30, 215, 55, 25, 8, 8, 2, 2); popMatrix();

  fill(110, 85, 60); beginShape(); vertex(134, 430); vertex(246, 430); vertex(260, 645); vertex(120, 645); endShape(CLOSE);

  pushMatrix();
  translate(190, 220 + bobbing); rotate(nod); translate(-190, -(220 + bobbing));

  fill(165, 167, 172); ellipse(222, 162 + bobbing, 40, 40); fill(245, 185, 140); rect(132, 190 + bobbing, 116, 135, 50);
  fill(165, 167, 172); beginShape(); vertex(132, 220 + bobbing); bezierVertex(132, 140 + bobbing, 248, 140 + bobbing, 248, 220 + bobbing); bezierVertex(248, 232 + bobbing, 229, 232 + bobbing, 229, 220 + bobbing); bezierVertex(229, 232 + bobbing, 210, 232 + bobbing, 210, 220 + bobbing); bezierVertex(210, 232 + bobbing, 190, 232 + bobbing, 190, 220 + bobbing); bezierVertex(190, 232 + bobbing, 171, 232 + bobbing, 171, 220 + bobbing); bezierVertex(171, 232 + bobbing, 152, 232 + bobbing, 152, 220 + bobbing); bezierVertex(152, 232 + bobbing, 132, 232 + bobbing, 132, 220 + bobbing); endShape(CLOSE);
  
  noFill(); stroke(190, 130, 100); strokeWeight(3); arc(172, 242 + bobbing, 24, 6, PI, TWO_PI); arc(172, 250 + bobbing, 16, 4, PI, TWO_PI);
  fill(40, 38, 48); noStroke(); ellipse(152, 265 + bobbing, 12, 12); ellipse(192, 265 + bobbing, 12, 12);
  
  stroke(40, 38, 48); strokeWeight(4);
  float browLerp = lerp(4, 0, postureLerp);
  line(148, 258 + bobbing, 142, 258 + bobbing + browLerp); line(196, 258 + bobbing, 202, 258 + bobbing + browLerp); 

  if (isTalking) {
    float mc = (sin(frameCount * 0.3) + 1.0) / 2.0; float mo = mc * mc;
    noStroke(); fill(90, 30, 25); float mh = 3 + mo * 12; ellipse(172, 284 + bobbing, 18, mh);
  } else {
    noFill(); stroke(40, 38, 48); strokeWeight(5); 
    if (localTime >= 13.0) { arc(172, 282 + bobbing, 20, 12, 0, PI); } 
    else { arc(172, 284 + bobbing, 18, 8, PI, TWO_PI); }
  }
  popMatrix();

  fill(160, 125, 90); stroke(40, 38, 48); strokeWeight(6); rect(130, 310 + bobbing, 120, 150); line(172, 325 + bobbing, 172, 460 + bobbing);
  fill(160, 125, 90); arc(152, 310 + bobbing, 45, 35, 0, PI); arc(202, 310 + bobbing, 45, 35, 0, PI);
  
  pushMatrix(); translate(231, 310 + bobbing); rotate(radians(20)); fill(160, 125, 90); rect(-21, 0, 42, 150, 12); fill(245, 185, 140); ellipse(0, 150, 32, 32); popMatrix();

  popMatrix();
}

// =========================================================
// HELPER LOKAL: Sari Berjalan Maju/Mundur & Menggenggam Map
// =========================================================
void drawSariS17(float x, float y, float localTime, boolean isWalking) {
  pushMatrix();
  translate(x, y);
  translate(-194, -672);

  boolean isTalking = (localTime < 3.5) || (localTime >= 9.5 && localTime < 13.0);
  
  float waktuJalan = frameCount * 0.15;
  float ayunanJalan = isWalking ? (sin(waktuJalan) * 0.25) : 0;
  float bobbing = isWalking ? (cos(waktuJalan * 2) * 2.0) : (sin(frameCount * 0.05) * 2.0);

  // Mekanisme tangan memanjang (t: 2.0s - 3.0s memanjang, 3.0s - 3.5s menarik map ke dada)
  float reach = 0;
  if (localTime > 2.0 && localTime <= 3.0) reach = map(localTime, 2.0, 3.0, 0, 1);
  else if (localTime > 3.0 && localTime <= 3.5) reach = map(localTime, 3.0, 3.5, 1, 0);
  
  // Jika sedang berjalan mundur (t > 3.5s), tangan kanan otomatis turun ikut mengayun rileks
  float armAngle = (localTime > 3.5) ? (-ayunanJalan) : lerp(0, radians(45), reach);

  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(136, 280 + bobbing); rotate(ayunanJalan); fill(162, 122, 233); rect(-21, 0, 42, 160, 12); fill(253, 197, 155); ellipse(0, 160, 32, 32); popMatrix();

  pushMatrix(); translate(150, 415 + bobbing); rotate(-ayunanJalan); fill(102, 78, 158); rect(-20, 0, 40, 240); fill(55, 53, 65); rect(-25, 230, 62, 25, 8, 8, 2, 2); popMatrix();
  pushMatrix(); translate(210, 415 + bobbing); rotate(ayunanJalan); fill(102, 78, 158); rect(-20, 0, 40, 240); fill(55, 53, 65); rect(-25, 230, 65, 26, 8, 8, 2, 2); popMatrix();

  fill(102, 78, 158); beginShape(); vertex(142, 415 + bobbing); vertex(246, 415 + bobbing); vertex(246, 460 + bobbing); vertex(142, 460 + bobbing); endShape(CLOSE);

  pushMatrix(); translate(0, 5); 
  fill(55, 53, 65); rect(124, 150 + bobbing, 138, 142, 65, 65, 35, 35); 
  fill(253, 197, 155); rect(132, 160 + bobbing, 116, 120, 48);
  ellipse(246, 222 + bobbing, 20, 28); noFill(); strokeWeight(3); arc(244, 222 + bobbing, 8, 10, -HALF_PI, HALF_PI); strokeWeight(6);
  fill(55, 53, 65); arc(190, 182 + bobbing, 118, 52, PI, TWO_PI); stroke(40, 38, 48); line(165, 158 + bobbing, 172, 172 + bobbing); line(210, 156 + bobbing, 206, 170 + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144, 158 + bobbing); rotate(radians(-15)); triangle(0, 0, -13, -8, -13, 8); triangle(0, 0, 13, -8, 13, 8); fill(255, 190, 200); ellipse(0, 0, 6, 6); popMatrix();

  fill(55, 53, 65); noStroke(); ellipse(164, 218 + bobbing, 13, 13); ellipse(199, 218 + bobbing, 13, 13);
  stroke(55, 53, 65); strokeWeight(3); line(157, 212 + bobbing, 151, 208 + bobbing); line(156, 218 + bobbing, 150, 216 + bobbing); line(205, 212 + bobbing, 211, 208 + bobbing); line(204, 218 + bobbing, 210, 216 + bobbing); 
  
  if (isTalking) {
    float mc = (sin(frameCount * 0.5) + 1.0) / 2.0; float mo = mc * mc;
    noStroke(); fill(90, 30, 25); float mh = 3 + mo * 12; ellipse(181, 240 + bobbing, 16, mh);
  } else {
    noFill(); stroke(40, 38, 48); strokeWeight(4); line(173, 240 + bobbing, 189, 240 + bobbing);
  }
  strokeWeight(6);
  popMatrix(); 

  fill(162, 122, 233); rect(130, 280 + bobbing, 120, 175, 15, 15, 0, 0); noFill(); arc(190, 280 + bobbing, 36, 16, 0, PI); stroke(40, 38, 48, 60); strokeWeight(3); line(146, 340 + bobbing, 146, 420 + bobbing); line(234, 340 + bobbing, 234, 420 + bobbing); stroke(40, 38, 48); strokeWeight(6);

  // Lengan Kanan (Memegang map terikat secara absolut pada koordinat Sari)
  pushMatrix(); 
  translate(231, 280 + bobbing); 
  rotate(armAngle); 
  fill(162, 122, 233); rect(-21, 0, 42, 160, 12); fill(253, 197, 155); ellipse(0, 160, 32, 32); 

  // Gambar map ikut bergeser mundur melekat manis di tangan kanan Sari setelah diambil (t >= 3.0s)
  if (localTime >= 3.0) {
    pushMatrix();
    translate(0, 160);
    rotate(radians(60));
    fill(220, 215, 200); rect(-30, -20, 60, 40, 2); 
    fill(240, 235, 220); rect(-25, -25, 60, 40, 2); 
    stroke(150, 140, 130); strokeWeight(1);
    line(-15, -15, 20, -15); line(-15, -10, 25, -10); line(-15, -5, 15, -5); line(-15, 0, 25, 0);
    popMatrix();
  }
  
  popMatrix();
  popMatrix();
}
