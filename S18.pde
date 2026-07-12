/**
 * ============================================================
 * S18 — PAGI: SARI & BU DARMI MENEMPEL KERTAS DI PAPAN
 * ============================================================
 * Struktur folder: Menggunakan localTime (detik).
 * Alur adegan:
 *   - 0.0 - 3.0s  : Bu Darmi berbisik waswas (Pose menempel/pegang kertas)
 *   - 3.0 - 10.0s : Sari menjawab kalem (Menggunakan fungsi drawSariBicara standard S20)
 *   - 10.0 - 12.0s: Selesai bicara, keduanya berjalan mundur ke samping kiri
 *   - 12.0s - end : Diam berjejer di samping kiri papan, KEDUANYA menghadap kanan (papan)
 */

PFont fJudul, fSub; 

void sceneS18(float localTime) {
  // Inisialisasi font aman
  if (fJudul == null) fJudul = createFont("Impact", 40);
  if (fSub == null)   fSub = createFont("Arial Bold", 20);

  // 1. Render Latar Belakang & Papan
  drawBackgroundPagi();
  drawPapanInformasi();
  drawDaunBeringin();

  // Properti sisa penempelan di tanah
  drawGulunganKertas(540, 703);
  drawEmberLem(622, 706);

  // 2. Logika Penentuan Posisi X & Pose Berdasarkan Waktu
  float darmiX, sariX;
  boolean isTalkingState = true;
  boolean isWalkingState = false;
  boolean isSariTalkingNow = false;

  if (localTime < 10.0) {
    // Fase Dialog (0.0 s/d 10.0 detik) — Posisi diam di depan papan saat menempel
    darmiX = 405;
    sariX = 880;
    isTalkingState = true;
    isWalkingState = false;
    
    // Tentukan waktu spesifik Sari menggerakkan mulutnya (detik 3.0 s/d 10.0)
    if (localTime >= 3.0) {
      isSariTalkingNow = true;
    }
  } else if (localTime >= 10.0 && localTime < 12.0) {
    // Fase Berjalan (10.0 s/d 12.0 detik) — Berjalan mundur bersama ke samping kiri luar tiang
    float t = (localTime - 10.0) / 2.0; // Durasi berjalan 2 detik
    darmiX = lerp(405, 170, t);
    sariX  = lerp(880, 250, t);
    isTalkingState = false;
    isWalkingState = true;
    isSariTalkingNow = false;
  } else {
    // Fase Diam Akhir (12.0 detik ke atas) — Berjejer menetap di samping kiri papan
    darmiX = 170;
    sariX = 250;
    isTalkingState = false;
    isWalkingState = false;
    isSariTalkingNow = false;
  }

  // 3. Render Bayangan Aktor (Mengikuti koordinat X dinamis)
  noStroke();
  fill(40, 26, 12, 40);
  ellipse(darmiX, 692, 130, 18);
  ellipse(sariX, 690, 132, 18);

  // 4. Render Aktor Bu Darmi
  pushMatrix();
  translate(darmiX, 688);
  
  // Jika sudah sampai di samping kiri dan diam, balik karakter agar wajah menghadap kanan (papan)
  if (!isTalkingState && !isWalkingState) {
    scale(-1, 1); 
  }
  
  scale(0.66);
  if (isTalkingState) {
    drawBuDarmiPegangKertas(0, 0); // Pose menempel bawaan awal dari Actors.pde
  } else {
    drawBuDarmiIdle(0, 0);         // Pose diam bawaan dari Actors.pde (menghadap kanan)
  }
  popMatrix();

  // 5. Render Aktor Sari
  pushMatrix();
  translate(sariX, 684);
  
  // Jika sudah sampai di samping kiri dan diam, balik karakter agar wajah menghadap kanan (papan)
  if (!isTalkingState && !isWalkingState) {
    scale(-1, 1); 
  }
  
  scale(0.68);
  if (isTalkingState) {
    if (isSariTalkingNow) {
      drawSariBicara(0, 0);        // REVISI: Memanggil fungsi mulut bergerak standard yang sama dengan S20
    } else {
      drawSariTempel(0, 0);        // Pose terangkat meratakan lem di 3 detik pertama
    }
  } else if (isWalkingState) {
    drawSariWalking(0, 0);         // Animasi berjalan melangkah ke kiri luar tiang
  } else {
    drawSariIdle(0, 0);            // Pose berdiri polos diam melihat hasil baliho di kanan
  }
  popMatrix();

  // 6. Sistem Bubble Chat Dialog (Dipanggil otomatis dari UI.pde)
  if (localTime >= 0.0 && localTime < 3.0) {
    drawDialogBubble("BU DARMI", "Kalau Pak Karso lihat ini...");
  } else if (localTime >= 3.0 && localTime < 10.7) {
    drawDialogBubble("SARI", "Kita tidak melanggar apa-apa, Bu. Ini informasi publik. Kita cuma... menempelkannya di tempat yang lebih jelas.");
  }
}

/* ============================================================
 * ASET LINGKUNGAN DAN OBJEK SEKITAR S18
 * ========================================================== */
void drawBackgroundPagi() {
  for (int i = 0; i < 420; i++) {
    float inter = i / 420.0;
    stroke(lerpColor(color(118, 176, 220), color(255, 232, 186), inter));
    line(0, i, width, i);
  }
  noStroke(); fill(255, 232, 186); rect(0, 420, width, 130);
  fill(255, 255, 255, 150);
  ellipse(80, 100, 110, 26);   ellipse(140, 92, 90, 22);   ellipse(40, 92, 70, 18);
  ellipse(1200, 78, 120, 26);  ellipse(1255, 70, 80, 20);  ellipse(1150, 70, 70, 18);
  fill(255, 244, 200, 50);  ellipse(95, 285, 190, 190);
  fill(255, 250, 215, 110); ellipse(95, 285, 120, 120);
  fill(255, 253, 235);      ellipse(95, 285, 74, 74);
  stroke(70, 80, 90); strokeWeight(2); noFill();
  line(1112, 142, 1120, 136); line(1120, 136, 1128, 142);
  line(1152, 118, 1160, 112); line(1160, 112, 1168, 118);
  line(1188, 152, 1195, 147); line(1195, 147, 1202, 152);
  noStroke(); fill(148, 168, 140);
  beginShape();
  vertex(0, 520);    vertex(180, 460);  vertex(340, 490);  vertex(480, 440);
  vertex(640, 500);  vertex(800, 430);  vertex(980, 510);  vertex(1140, 410);
  vertex(1280, 460); vertex(1280, 600); vertex(0, 600);
  endShape(CLOSE);
  fill(114, 140, 92);
  beginShape();
  vertex(680, 550);  vertex(880, 490);  vertex(1120, 530); vertex(1280, 460);
  vertex(1280, 600); vertex(680, 600);
  endShape(CLOSE);
  fill(255, 240, 208, 70); rect(0, 455, width, 70);
  fill(130, 85, 55); rect(0, 430, 110, 110);
  fill(145, 72, 43); quad(-20, 430, 125, 430, 100, 350, 0, 350);
  fill(20); rect(25, 455, 30, 40); fill(60, 90, 110); rect(28, 458, 24, 34);
  fill(96, 58, 34); rect(52, 318, 16, 36);
  for (int k = 0; k < 3; k++) {
    float t = (frameCount * 0.5 + k * 34) % 100;
    fill(250, 248, 242, map(t, 0, 100, 90, 0));
    ellipse(60 + sin(t * 0.12 + k) * 7, 314 - t * 0.75, 10 + t * 0.18, 9 + t * 0.14);
  }
  fill(115, 75, 48); rect(110, 450, 100, 90);
  fill(130, 62, 35); quad(95, 450, 225, 450, 205, 370, 115, 370);
  fill(65, 40, 20);  rect(125, 485, 22, 55);
  fill(20);          rect(165, 475, 25, 25); fill(60, 90, 110); rect(167, 477, 21, 21);
  fill(95, 65, 40);  rect(210, 470, 75, 70);
  fill(110, 55, 30); quad(200, 470, 295, 470, 280, 410, 220, 410);
  fill(50, 30, 15);  rect(225, 495, 18, 45);
  fill(20);          rect(255, 490, 20, 20); fill(60, 90, 110); rect(257, 492, 16, 16);
  fill(120, 85, 55); rect(1020, 495, 60, 45);
  fill(135, 65, 40); quad(1010, 495, 1090, 495, 1075, 460, 1025, 460);
  fill(20);          rect(1035, 510, 14, 14); fill(60, 90, 110); rect(1036, 511, 12, 12);
  fill(100, 70, 45); rect(1080, 505, 50, 35);
  fill(115, 55, 35); quad(1070, 505, 1140, 505, 1130, 475, 1085, 475);
  fill(50, 35, 20);  rect(1092, 515, 12, 25);
  fill(130, 80, 50); rect(1200, 470, 80, 100);
  fill(110, 50, 30); quad(1185, 470, 1280, 470, 1280, 400, 1200, 400);
  fill(65, 40, 20);  rect(1215, 505, 22, 65);
  fill(20);          rect(1250, 495, 22, 30); fill(60, 90, 110); rect(1252, 497, 18, 26);
  fill(60, 44, 28);
  beginShape(); vertex(450, 0); vertex(520, 150); vertex(760, 150); vertex(830, 0); endShape(CLOSE);
  fill(55, 40, 25); rect(540, 480, 200, 240);
  fill(110, 122, 42);
  beginShape(); vertex(960, 540); vertex(1280, 540); vertex(1280, 720); vertex(1100, 720); endShape(CLOSE);
  stroke(62, 52, 22); strokeWeight(3.5);
  line(960, 540, 1280, 540); line(983, 570, 1280, 570); line(1020, 615, 1280, 615); line(1060, 670, 1280, 670);
  line(1030, 540, 1175, 720); line(1150, 540, 1285, 720);
  noStroke(); fill(142, 88, 44);
  beginShape(); vertex(0, 540); vertex(960, 540); vertex(1100, 720); vertex(0, 720); endShape(CLOSE);
  fill(122, 74, 37);
  beginShape(); vertex(0, 575);  vertex(390, 555); vertex(650, 595); vertex(950, 630); vertex(1040, 720); vertex(0, 720); endShape(CLOSE);
  fill(158, 103, 58);
  beginShape(); vertex(0, 650); vertex(280, 615); vertex(470, 665); vertex(620, 720); vertex(0, 720); endShape(CLOSE);
  fill(95, 55, 25);
  ellipse(150, 590, 60, 6);  ellipse(340, 640, 80, 8); ellipse(550, 570, 50, 5);  ellipse(220, 680, 90, 10); ellipse(750, 660, 70, 7);
  fill(110, 100, 90);  ellipse(110, 660, 15, 8);  ellipse(280, 595, 10, 6);
  fill(130, 120, 110); ellipse(180, 620, 12, 7);  ellipse(610, 605, 14, 9);
  fill(90, 85, 80);    ellipse(70, 570, 9, 5);    ellipse(390, 675, 16, 10);
  fill(128, 158, 172); quad(950, 540, 968, 540, 1112, 720, 1072, 720);
  for (int k = 0; k < 6; k++) {
    float s  = 0.12 + k * 0.15; float xs = lerp(962, 1090, s); float ys = lerp(540, 720, s);
    stroke(235, 248, 252, 90 + 90 * sin(frameCount * 0.12 + k * 1.3)); strokeWeight(2.5); line(xs - 7, ys, xs + 7, ys - 2);
  }
  noStroke(); stroke(165, 150, 50); strokeWeight(2.5);
  drawRicePlant(985, 555);  drawRicePlant(1010, 555); drawRicePlant(995, 564);  drawRicePlant(1020, 564);
  drawRicePlant(1055, 555); drawRicePlant(1090, 555); drawRicePlant(1125, 555); drawRicePlant(1070, 564); drawRicePlant(1105, 564); drawRicePlant(1140, 564);
  drawRicePlant(1175, 555); drawRicePlant(1215, 555); drawRicePlant(1255, 555); drawRicePlant(1190, 564); drawRicePlant(1230, 564); drawRicePlant(1265, 564);
  drawRicePlant(1005, 588); drawRicePlant(1035, 588); drawRicePlant(1018, 604); drawRicePlant(1048, 604);
  drawRicePlant(1085, 588); drawRicePlant(1120, 588); drawRicePlant(1155, 588); drawRicePlant(1100, 604); drawRicePlant(1135, 604); drawRicePlant(1170, 604);
  drawRicePlant(1205, 588); drawRicePlant(1245, 588); drawRicePlant(1270, 588); drawRicePlant(1220, 604); drawRicePlant(1255, 604);
  drawRicePlant(1045, 633); drawRicePlant(1080, 633); drawRicePlant(1060, 656); drawRicePlant(1095, 656);
  drawRicePlant(1140, 633); drawRicePlant(1180, 633); drawRicePlant(1220, 633); drawRicePlant(1158, 656); drawRicePlant(1198, 656); drawRicePlant(1238, 656);
  drawRicePlant(1255, 633); drawRicePlant(1268, 656); drawRicePlant(1090, 688); drawRicePlant(1130, 688);
  drawRicePlant(1110, 710); drawRicePlant(1145, 710); drawRicePlant(1190, 688); drawRicePlant(1230, 688);
  drawRicePlant(1210, 710); drawRicePlant(1245, 710); drawRicePlant(1265, 688); drawRicePlant(1274, 710);
  noStroke(); fill(255, 255, 255, 45);
  ellipse(1080, 560, 340, 42); ellipse(960, 590, 240, 34); ellipse(1230, 610, 220, 34);
  fill(255, 255, 255, 30); ellipse(300, 556, 420, 34);
  drawAyamJago(140, 615);
  fill(255, 240, 190, 18); quad(40, 240, 150, 240, 470, 720, 120, 720);
  fill(255, 240, 190, 12); quad(150, 240, 230, 240, 760, 720, 470, 720);
  fill(255, 216, 150, 14); rect(0, 0, width, height);
}

void drawPapanInformasi() {
  stroke(25, 15, 5); strokeWeight(6); fill(68, 46, 26);
  rect(360, 240, 35, 400); rect(885, 240, 35, 400);
  noStroke(); fill(92, 61, 34); rect(310, 210, 660, 320); fill(122, 86, 50); rect(325, 225, 630, 290);
  stroke(80, 54, 30); strokeWeight(3);
  for (int j = 240; j <= 500; j += 30) { line(325, j, 955, j); }
  noStroke(); fill(82, 58, 34); quad(240, 210, 1040, 210, 940, 130, 340, 130);
  fill(117, 88, 53);
  beginShape(); vertex(240, 210);
  for (int xj = 240; xj <= 1040; xj += 16) {
    float hJerami = 12 + 11 * abs(sin(xj * 0.53)); vertex(xj, 210 + hJerami); vertex(xj + 8, 210);
  }
  vertex(1040, 210); vertex(940, 130); vertex(340, 130); endShape(CLOSE);
  fill(150, 118, 74, 120); quad(340, 130, 940, 130, 950, 138, 330, 138);
  stroke(30, 20, 10); strokeWeight(5);
  line(340, 265, 380, 285); line(940, 265, 900, 285); line(340, 475, 380, 455); line(940, 475, 900, 455);
  noStroke(); fill(252, 252, 248);
  beginShape(); vertex(375, 260); quadraticVertex(640, 270, 905, 260); vertex(905, 480); quadraticVertex(640, 475, 375, 480); endShape(CLOSE);
  fill(222, 222, 216);
  beginShape(); vertex(375, 455); vertex(905, 455); vertex(905, 480); quadraticVertex(640, 475, 375, 480); endShape(CLOSE);
  fill(255, 255, 255, 170); noStroke();
  pushMatrix(); translate(388, 272); rotate(radians(-40)); rect(-16, -7, 32, 14, 2); popMatrix();
  pushMatrix(); translate(892, 272); rotate(radians(40));  rect(-16, -7, 32, 14, 2); popMatrix();
  pushMatrix(); translate(388, 466); rotate(radians(40));  rect(-16, -7, 32, 14, 2); popMatrix();
  pushMatrix(); translate(892, 466); rotate(radians(-40)); rect(-16, -7, 32, 14, 2); popMatrix();
  textAlign(CENTER, CENTER); fill(196, 32, 26); textFont(fJudul); text("ANGGARAN DESA KARANG JAYA", 640, 300);
  fill(30, 40, 50); textFont(fSub); text("MARI KITA CEK BERSAMA!", 640, 336);
  stroke(70, 70, 70); strokeWeight(2.5); line(430, 358, 850, 358);
  stroke(70, 80, 100, 60); strokeWeight(1.5); line(660, 372, 660, 452); line(806, 372, 806, 452);
  for (int r = 0; r < 4; r++) {
    float yb = 382 + r * 22; coretanTeks(412, yb, 228); coretanTeks(676, yb, 112); coretanTeks(822, yb, 52);
  }
  stroke(178, 52, 44, 130); strokeWeight(3); noFill(); ellipse(858, 434, 62, 62); ellipse(858, 434, 44, 44); noStroke();
}

void coretanTeks(float x, float y, float w) {
  stroke(74, 84, 100, 200); strokeWeight(2); float i = 0;
  while (i < w - 6) {
    float kata = 15 + 13 * abs(sin((x + i) * 0.71 + y * 0.37)); kata = min(kata, w - i);
    for (float j = 0; j < kata - 3; j += 3.2) {
      float y1 = sin((x + i + j) * 1.7 + y) * 2.6; float y2 = sin((x + i + j + 3.2) * 1.7 + y) * 2.6;
      line(x + i + j, y + y1, x + i + j + 3.2, y + y2);
    }
    i += kata + 8;
  }
  noStroke();
}

void drawDaunBeringin() {
  noStroke(); fill(34, 66, 30);
  ellipse(260, 170, 240, 150);  ellipse(410, 110, 290, 180); ellipse(640, 70, 340, 200);   ellipse(870, 110, 290, 180); ellipse(1020, 170, 240, 150); ellipse(320, 230, 140, 80);   ellipse(960, 230, 140, 80);
  fill(48, 92, 40);
  ellipse(220, 190, 200, 120);  ellipse(350, 140, 250, 150); ellipse(490, 95, 270, 170);   ellipse(640, 85, 310, 180);  ellipse(790, 95, 270, 170);   ellipse(930, 140, 250, 150); ellipse(1060, 190, 200, 120);
  fill(72, 122, 52);
  ellipse(280, 205, 160, 100);  ellipse(420, 150, 210, 120); ellipse(560, 115, 230, 140);  ellipse(720, 115, 230, 140);  ellipse(860, 150, 210, 120);  ellipse(1000, 205, 160, 100);
  fill(120, 165, 80, 90); ellipse(250, 185, 90, 50);  ellipse(390, 130, 110, 60);  ellipse(530, 95, 120, 65);
}

void drawAyamJago(float x, float y) {
  float angguk = sin(frameCount * 0.07) * 2.5;
  pushMatrix(); translate(x, y); noStroke();
  pushMatrix(); translate(-13, -24); fill(26, 70, 54);
  pushMatrix(); rotate(radians(-35)); ellipse(0, -12, 12, 30); popMatrix();
  fill(34, 84, 62); pushMatrix(); rotate(radians(-62)); ellipse(0, -11, 10, 26); popMatrix();
  popMatrix();
  fill(152, 62, 36); ellipse(-2, -18, 30, 22); fill(120, 48, 28); ellipse(-4, -17, 18, 13);
  fill(172, 82, 42); ellipse(9, -30 + angguk, 11, 15); ellipse(11, -38 + angguk, 10, 10);
  fill(208, 42, 36); ellipse(9, -44 + angguk, 5, 6); ellipse(13, -43 + angguk, 5, 6); ellipse(14, -32 + angguk, 4, 6);
  fill(236, 176, 70); triangle(15, -40 + angguk, 21, -38 + angguk, 15, -36 + angguk); fill(25); ellipse(12, -39 + angguk, 2.5, 2.5);
  stroke(150, 110, 50); strokeWeight(2); line(-6, -8, -6, 0);  line(2, -8, 2, 0); line(-6, 0, -9, 2);   line(-6, 0, -3, 2); line(2, 0, -1, 2);    line(2, 0, 5, 2);
  noStroke(); popMatrix();
}

void drawGulunganKertas(float x, float y) {
  pushMatrix(); translate(x, y); stroke(40, 38, 48); strokeWeight(3); fill(236, 231, 214);
  pushMatrix(); rotate(radians(-2)); rect(-34, -18, 76, 9, 4.5); popMatrix();
  fill(244, 240, 226); pushMatrix(); rotate(radians(2)); rect(-42, -10, 84, 10, 5); popMatrix();
  noFill(); strokeWeight(2); ellipse(38, -5, 8, 8); ellipse(30, -14, 7, 7); noStroke(); popMatrix();
}

void drawEmberLem(float x, float y) {
  pushMatrix(); translate(x, y); stroke(126, 86, 46); strokeWeight(4); line(10, -44, 16, -24);
  noStroke(); fill(80, 70, 58); quad(14, -26, 20, -28, 23, -18, 16, -16);
  stroke(40, 38, 48); strokeWeight(3); fill(152, 160, 170); quad(-16, -26, 16, -26, 12, 0, -12, 0);
  noFill(); arc(0, -30, 28, 16, PI + 0.4, TWO_PI - 0.4); noStroke(); fill(238, 235, 222); ellipse(0, -26, 27, 7); popMatrix();
}

void drawRicePlant(float x, float y) {
  pushMatrix(); translate(x, y); line(0, 0, -4, -8); line(0, 0, 0, -11); line(0, 0, 4, -8); popMatrix();
}
