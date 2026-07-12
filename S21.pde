/**
 * ============================================================
 * S21 (REBUILD) — PAGI: KARSO MENATAP KERUMUNAN DARI JAUH
 * ============================================================
 * Struktur data: Menggunakan localTime (detik).
 * Sinkronisasi: Memetakan kerumunan S20 secara kontinu di ujung jalan.
 * Revisi Aset: Menambahkan strip-strip emas dekoratif pada peci Karso[cite: 5].
 */

// ---------- pseudo-random deterministik (anti kelip antar frame) ----------
float rndS21(float i) {
  float v = sin(i * 127.1 + 0.7) * 43758.5453;
  return v - floor(v);
}

// ---------- geometri jalan (kurva kuadratik, dipakai bersama) ----------
// Tepi kiri:  A(180,720)  C(500,520)  B(748,358)
// Tepi kanan: A(1105,720) C(940,520)  B(852,358)
float s21_qxL(float t) { float u = 1 - t; return u*u*180 + 2*u*t*500 + t*t*748; }
float s21_qxR(float t) { float u = 1 - t; return u*u*1105 + 2*u*t*940 + t*t*852; }
float s21_qy(float t)  { float u = 1 - t; return u*u*720 + 2*u*t*520 + t*t*358; }
float s21_tOfY(float y) { // invers s21_qy: 38t^2 - 400t + (720-y) = 0
  return (400 - sqrt(160000 - 152 * (720 - y))) / 76.0;
}

// ---------- elemen latar ----------
void s21_drawAwan(float cx, float cy, float s, float a) {
  noStroke(); fill(252, 240, 222, a);
  ellipse(cx, cy, 150*s, 40*s);
  ellipse(cx - 50*s, cy + 6*s, 90*s, 30*s);
  ellipse(cx + 45*s, cy - 10*s, 95*s, 34*s);
  ellipse(cx + 5*s, cy - 16*s, 80*s, 30*s);
}

void s21_drawRumahKecil(float x, float y, float w, float h) {
  noStroke();
  fill(198, 162, 124); rect(x, y, w, h);
  fill(120, 70, 40);   triangle(x - 4, y, x + w + 4, y, x + w/2, y - h*0.85);
  fill(90, 64, 44);    rect(x + w*0.38, y + h*0.35, w*0.24, h*0.65);
}

void s21_tuftPadi(float x, float y, float s) {
  line(x, y, x - 4*s, y - 10*s);
  line(x, y, x, y - 13*s);
  line(x, y, x + 4*s, y - 10*s);
}

void s21_tuftRumput(float x, float y, float s) {
  line(x, y, x - 3*s, y - 8*s);
  line(x, y, x + 1*s, y - 10*s);
  line(x, y, x + 4*s, y - 7*s);
}

// ---------- warga generik tampak BELAKANG (pengisi kerumunan) ----------
void s21_drawWargaBelakang(float x, float y, float s,
                           color baju, color bawah,
                           boolean pakaiKerudung, color warnaKerudung,
                           boolean rok, boolean peci) {
  float waktu = frameCount * 0.05;
  float bob = sin(waktu + x * 0.13) * 2.0;
  pushMatrix();
  translate(x, y);
  scale(s);
  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);

  // bawahan
  if (rok) {
    fill(bawah);
    quad(-40, -232, 40, -232, 50, -4, -50, -4);
  } else {
    fill(bawah);
    rect(-36, -232, 32, 226);
    rect(4, -232, 32, 226);
  }
  fill(55, 53, 65);
  rect(-44, -10, 38, 16, 4);
  rect(6, -10, 38, 16, 4);

  // lengan
  fill(baju);
  rect(-64, -408 + bob, 20, 150, 9);
  rect(44, -408 + bob, 20, 150, 9);

  // torso
  fill(baju);
  rect(-46, -420 + bob, 92, 200, 14);

  // kepala (belakang)
  if (pakaiKerudung) {
    fill(warnaKerudung);
    ellipse(0, -462 + bob, 106, 118);
  } else {
    fill(235, 180, 140);
    ellipse(0, -456 + bob, 88, 96);
    fill(45, 40, 48);
    ellipse(0, -464 + bob, 92, 92); 
  }
  if (peci) {
    fill(30, 30, 38);
    rect(-40, -516 + bob, 80, 34, 8);
  }
  popMatrix();
}

/* ============================================================
 * MAIN RENDER SCENE S21
 * ============================================================ */
void sceneS21(float localTime) {

  // ---- 1. LANGIT GOLDEN HOUR ----
  for (int i = 0; i < 340; i++) {
    float t = i / 340.0;
    stroke(lerpColor(color(206, 188, 185), color(253, 213, 157), t));
    strokeWeight(1);
    line(0, i, width, i);
  }
  noStroke();
  fill(255, 214, 150, 36); ellipse(1000, 262, 760, 420);
  fill(255, 222, 160, 40); ellipse(1000, 258, 480, 280);

  // ---- 2. AWAN LEMBUT ----
  float dr = (localTime * 4) % 200 - 100;
  s21_drawAwan(205 + dr*0.4, 98, 1.25, 220);
  s21_drawAwan(575 + dr*0.25, 58, 0.85, 190);
  s21_drawAwan(965 + dr*0.15, 112, 0.75, 165);

  // ---- 3. PEGUNUNGAN BERLAPIS ----
  noStroke();
  fill(146, 156, 138); 
  triangle(430, 338, 640, 204, 850, 338);
  triangle(770, 338, 962, 236, 1150, 338);
  triangle(1060, 338, 1190, 272, 1310, 338);
  fill(108, 126, 106); 
  triangle(-70, 338, 145, 205, 385, 338);
  triangle(175, 338, 425, 152, 705, 338);

  // ---- 4. MATAHARI PAGI DI KANAN ----
  fill(255, 212, 140, 60);  ellipse(985, 242, 330, 330);
  fill(255, 220, 150, 110); ellipse(985, 242, 205, 205);
  fill(255, 230, 165, 200); ellipse(985, 242, 122, 122);
  fill(255, 236, 178);      ellipse(985, 242, 76, 76);
  fill(255, 247, 208);      ellipse(985, 242, 48, 48);

  // kabut hangat di kaki gunung
  for (int i = 0; i < 56; i++) {
    stroke(255, 236, 205, 4);
    line(0, 282 + i, width, 282 + i);
  }
  noStroke();

  // ---- 5. DASAR SAWAH / LAPANGAN ----
  fill(122, 142, 66);
  rect(0, 330, width, 390);
  fill(255, 220, 160, 26); ellipse(1055, 335, 520, 80);

  // ---- 6. BARISAN POHON HORIZON ----
  noStroke();
  for (int i = 0; i < 26; i++) {
    float x = i * 52 + ((i % 2) * 14);
    if (x > 700 && x < 980) continue; 
    fill(64, 90, 52); ellipse(x, 322 + ((i % 3) - 1) * 4, 74, 36);
  }
  for (int i = 0; i < 26; i++) {
    float x = i * 52 + 26;
    if (x > 690 && x < 990) continue;
    fill(54, 78, 46); ellipse(x, 332, 58, 22);
  }

  // ---- 7. RUMAH-RUMAH DESA DI HORIZON ----
  s21_drawRumahKecil(52, 312, 40, 22);
  s21_drawRumahKecil(160, 308, 34, 20);
  s21_drawRumahKecil(268, 314, 30, 17);
  s21_drawRumahKecil(410, 308, 36, 21);
  s21_drawRumahKecil(524, 316, 28, 16);
  s21_drawRumahKecil(962, 318, 30, 17);
  s21_drawRumahKecil(1036, 322, 24, 14);

  // ---- 8. DETAIL SAWAH KIRI (Menghitung kurva pembatas luar jalan) ----
  stroke(102, 124, 46, 120); strokeWeight(1.5);
  float[] fanBx = {-150, -70, 10, 95, 175};
  for (int k = 0; k < 5; k++) {
    line(742 - k*3, 378, fanBx[k], 720);
  }
  for (int r = 0; r < 7; r++) {
    float yb = 386 + r * 50;
    float tR = s21_tOfY(yb);
    float xl = s21_qxL(tR);
    stroke(104, 126, 50, 110); strokeWeight(1.5);
    line(0, yb, xl - 14, yb);
    stroke(58, 96, 30);
    for (float x = 10; x < xl - 20; x += 34) {
      float j = rndS21(x * 7 + r * 31);
      strokeWeight(1.6);
      s21_tuftPadi(x + j*10, yb + j*6 - 3, map(yb, 386, 700, 0.5, 1.35));
    }
  }
  // rumput lapangan kanan
  stroke(78, 112, 40);
  for (int i = 0; i < 90; i++) {
    float gx = 880 + rndS21(i*3 + 1) * 400;
    float gy = 352 + rndS21(i*3 + 2) * 330;
    float tG = s21_tOfY(min(gy, 700));
    if (gx > s21_qxR(tG) + 8) {
      strokeWeight(1.4);
      s21_tuftRumput(gx, gy, map(gy, 352, 700, 0.5, 1.5));
    }
  }
  noStroke();
  fill(70, 102, 48); ellipse(892, 348, 40, 20); ellipse(1008, 356, 32, 16); ellipse(1128, 396, 44, 22);
  fill(60, 92, 44);  ellipse(918, 352, 26, 13); ellipse(1150, 400, 26, 14);

  // ---- 9. JALAN TANAH LURUS BERPERSPEKTIF ----
  noStroke(); fill(172, 116, 68);
  beginShape();
  vertex(180, 720);
  quadraticVertex(500, 520, 748, 358);
  vertex(852, 358);
  quadraticVertex(940, 520, 1105, 720);
  endShape(CLOSE);
  
  fill(165, 110, 64, 55);
  beginShape();
  vertex(340, 720); quadraticVertex(590, 530, 770, 368);
  vertex(800, 368); quadraticVertex(660, 530, 470, 720);
  endShape(CLOSE);
  beginShape();
  vertex(830, 720); quadraticVertex(880, 530, 832, 368);
  vertex(806, 368); quadraticVertex(790, 530, 700, 720);
  endShape(CLOSE);

  // bintik tanah deterministik
  for (int i = 0; i < 300; i++) {
    float t = pow(rndS21(i*2 + 5), 1.5) * 0.94;
    float x = lerp(s21_qxL(t) + 8, s21_qxR(t) - 8, rndS21(i*2 + 6));
    stroke(146, 98, 56, 80); strokeWeight(lerp(2.4, 0.8, t));
    point(x, s21_qy(t));
  }
  // kerikil
  noStroke();
  for (int i = 0; i < 16; i++) {
    float t = rndS21(i*5 + 11) * 0.72;
    float x = lerp(s21_qxL(t) + 14, s21_qxR(t) - 14, rndS21(i*5 + 12));
    float s = lerp(9, 2.5, t) * (0.6 + 0.8 * rndS21(i*5 + 13));
    fill(128, 90, 56);  ellipse(x, s21_qy(t), s, s*0.7);
    fill(150, 110, 70); ellipse(x - s*0.15, s21_qy(t) - s*0.12, s*0.5, s*0.3);
  }
  fill(104, 74, 46); ellipse(455, 652, 15, 10); ellipse(700, 692, 12, 8); ellipse(948, 608, 10, 7); ellipse(382, 556, 9, 6); ellipse(862, 672, 13, 9);

  stroke(70, 105, 35);
  for (int i = 0; i < 34; i++) {
    float t = i / 34.0;
    strokeWeight(lerp(1.8, 0.7, t));
    s21_tuftRumput(s21_qxL(t) - 5 + rndS21(i) * 4, s21_qy(t) + 2, lerp(1.4, 0.4, t));
    s21_tuftRumput(s21_qxR(t) + 5 - rndS21(i + 40) * 4, s21_qy(t) + 2, lerp(1.4, 0.4, t));
  }

  // ---- 10. PAGAR BAMBU SILANG ----
  int nPagar = 12;
  for (int i = 0; i < nPagar; i++) {
    float t = 0.03 + (i / float(nPagar - 1)) * 0.88;
    float px = s21_qxL(pow(t, 0.94)) - 16 - (1 - t) * 26;
    float py = s21_qy(t) + 2;
    float h = lerp(52, 15, t);
    stroke(138, 102, 60); strokeWeight(lerp(5, 2, t));
    line(px, py, px, py - h);
    if (i < nPagar - 1) {
      float t2 = 0.03 + ((i + 1) / float(nPagar - 1)) * 0.88;
      float px2 = s21_qxL(pow(t2, 0.94)) - 16 - (1 - t2) * 26;
      float py2 = s21_qy(t2) + 2;
      float h2 = lerp(52, 15, t2);
      stroke(148, 112, 68); strokeWeight(lerp(3.2, 1.5, t));
      line(px, py - h*0.85, px2, py2 - h2*0.12);
      line(px, py - h*0.12, px2, py2 - h2*0.85);
    }
  }
  noStroke();

  // ---- 11. POHON BERINGIN + PAPAN + KERUMUNAN ASLI ----
  fill(96, 66, 38);
  quad(786, 362, 814, 362, 808, 238, 792, 238);
  triangle(778, 362, 796, 362, 792, 330); triangle(804, 362, 824, 362, 810, 332);
  stroke(96, 66, 38); strokeWeight(5); line(800, 252, 742, 208); line(800, 248, 858, 204); line(800, 244, 800, 186);
  noStroke();

  fill(40, 26, 12, 45); ellipse(800, 358, 210, 14); // Bayangan lantai jauh

  // INTEGRASI: Anchor pemetaan grid S20 asli[cite: 5]
  pushMatrix();
  translate(800, 356);
  scale(0.20);
  translate(-640, -700);

  drawPapanInformasi();

  // Siluet warga generik tampak belakang pengisi kedalaman[cite: 5]
  s21_drawWargaBelakang(60, 688, 0.70, color(152,152,158), color(92,92,102), true,  color(178,178,184), true,  false);
  s21_drawWargaBelakang(350, 690, 0.67, color(236,232,224), color(104,84,64),  false, color(0),           false, false);
  s21_drawWargaBelakang(505, 686, 0.69, color(74,74,90),    color(54,54,66),   false, color(0),           false, true);
  s21_drawWargaBelakang(760, 692, 0.68, color(132,110,152), color(86,68,102),  true,  color(148,126,168), true,  false);
  s21_drawWargaBelakang(845, 687, 0.65, color(142,102,72),  color(74,58,44),   false, color(0),           false, true);
  s21_drawWargaBelakang(925, 690, 0.70, color(154,132,176), color(100,80,120), true,  color(168,148,192), true,  false);
  s21_drawWargaBelakang(1005, 688, 0.66, color(150,150,156), color(90,90,100), false, color(0),           false, false);

  // Lima tokoh utama dari data tab kita[cite: 5]
  pushMatrix(); translate(170, 688); scale(-1, 1); scale(0.50); drawBuDarmiIdle(0, 0); popMatrix();
  pushMatrix(); translate(250, 684); scale(-1, 1); scale(0.51); drawSariIdle(0, 0); popMatrix();
  pushMatrix(); translate(430, 685); scale(0.50); drawWargaPerempuanIdle(0, 0); popMatrix();
  pushMatrix(); translate(580, 685); scale(0.50); drawDolfIdle(0, 0); popMatrix();
  pushMatrix(); translate(680, 688); scale(-1, 1); scale(0.49); drawBuSariIdle(0, 0); popMatrix();

  popMatrix(); // Lepas matriks jauh[cite: 5]

  // Rumpun daun rindang beringin jauh
  pushMatrix();
  translate(838, 200); rotate(sin(localTime * 0.6) * 0.006); translate(-838, -200);
  fill(74, 106, 58);   ellipse(838, 206, 300, 118); ellipse(712, 230, 124, 66); ellipse(962, 228, 134, 70);
  fill(88, 120, 66);   ellipse(796, 192, 164, 82); ellipse(894, 184, 170, 86);
  fill(102, 134, 74);  ellipse(844, 162, 180, 72); ellipse(764, 176, 108, 50);
  fill(80, 112, 62);   ellipse(748, 252, 56, 26); ellipse(918, 250, 62, 28); ellipse(838, 248, 52, 24);
  popMatrix();

  // ---- 12. RUMAH WARGA DI KANAN ----
  fill(40, 26, 12, 50); ellipse(1190, 372, 260, 20); 
  fill(216, 196, 164); rect(1088, 240, 200, 125);    
  fill(200, 178, 142); rect(1088, 240, 200, 26);     
  fill(196, 172, 134); rect(1088, 332, 200, 10);     
  fill(70, 48, 32);    rect(1140, 290, 44, 75, 3, 3, 0, 0); 
  fill(52, 60, 66);    rect(1215, 272, 46, 38);      
  stroke(226, 208, 178); strokeWeight(3); line(1238, 272, 1238, 310); line(1215, 291, 1261, 291);
  noStroke(); fill(158, 94, 52); quad(1052, 246, 1296, 246, 1246, 152, 1128, 152);
  fill(134, 76, 42); quad(1052, 246, 1296, 246, 1288, 234, 1060, 234);
  stroke(120, 66, 36); strokeWeight(2);
  for (int i = 0; i < 9; i++) { line(1078 + i*26, 234, 1136 + i*14, 156); }
  noStroke(); fill(174, 150, 120); rect(1088, 357, 200, 10); 
  stroke(96, 128, 48); strokeWeight(1.6);
  for (int i = 0; i < 26; i++) { s21_tuftRumput(1080 + rndS21(i*7) * 200, 372 + rndS21(i*7 + 1) * 70, 0.9 + rndS21(i*7 + 2) * 0.8); }
  noStroke();

  // ---- 13. BATU BESAR KANAN BAWAH ----
  fill(40, 26, 12, 55); ellipse(1235, 706, 180, 26);
  fill(118, 108, 94); beginShape(); vertex(1160, 706); bezierVertex(1158, 650, 1200, 616, 1250, 620); bezierVertex(1300, 624, 1310, 668, 1308, 706); endShape(CLOSE);
  fill(140, 130, 112); ellipse(1222, 650, 70, 40);
  fill(96, 88, 76); ellipse(1268, 684, 80, 34);

  // ---- 14. KARSO BACK-VIEW WITH GOLD STRIPES OVERLAY ----
  float karsoX = 345, karsoY = 612;
  pushMatrix();
  translate(karsoX, karsoY);
  scale(0.54);
  
  // bayangan miring panjang ke kiri bawah
  noStroke(); fill(35, 22, 10, 62);
  beginShape(); vertex(-20, -6); vertex(28, -6); vertex(-230, 78); vertex(-278, 62); endShape(CLOSE);
  
  // Render tubuh utama Karso dari belakang[cite: 5]
  drawKarsoBackView(0, 0);
  
  // REVISI: Modifikasi strip-strip emas melengkung tipis pada peci Karso[cite: 5]
  float b_K = sin(frameCount * 0.05) * 2.0; // Ambil bobbing sinkronisasi nafas[cite: 5]
  pushMatrix();
  translate(-194, -672); // Tumpuan lokal origin kaki Karso[cite: 5]
  stroke(40, 38, 48); strokeWeight(4); // Outline tebal hitam khas Tekotok[cite: 5]
  fill(240, 200, 50); // Emas solid kemilau[cite: 5]
  // Membuat dua garis strip melengkung horizontal di peci Karso
  rect(134, 162 + b_K, 108, 7, 3);
  rect(130, 180 + b_K, 116, 7, 3);
  popMatrix();
  
  popMatrix();

  // ---- 15. DAHAN POHON FOREGROUND KANAN-ATAS ----
  pushMatrix();
  translate(1280, 0); rotate(sin(localTime * 0.5) * 0.008);
  stroke(58, 44, 30); strokeWeight(13); strokeCap(ROUND); line(30, 20, -160, 66);
  strokeWeight(7); line(-160, 66, -268, 52); line(-130, 62, -226, 122);
  strokeWeight(5); line(-268, 52, -330, 80); line(-226, 122, -286, 152);
  noStroke();
  float[][] daun = {{-118, 34, 108}, {-198, 66, 124}, {-282, 52, 108}, {-236, 118, 98}, {-312, 108, 86}, {-76, 80, 82}, {-334, 32, 74}};
  for (int i = 0; i < daun.length; i++) {
    float dx = daun[i][0], dy = daun[i][1], ds = daun[i][2];
    fill(45, 76, 38);  ellipse(dx + 7, dy + 9, ds, ds*0.62);
    fill(58, 92, 46);  ellipse(dx, dy, ds*0.92, ds*0.58);
    fill(70, 108, 54); ellipse(dx - 8, dy - 10, ds*0.6, ds*0.4);
  }
  popMatrix();

  // ---- 16. GRADING: SAPUAN HANGAT + VIGNETTE ----
  noStroke(); fill(255, 186, 120, 16); rect(0, 0, width, height);
  for (int i = 0; i < 110; i++) {
    stroke(0, 0, 0, 1); noFill(); rect(-i, -i, width + i*2, height + i*2);
  }
  noStroke();
}
