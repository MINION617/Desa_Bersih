// =========================================================
// S15.pde — Scene 15 (13.0 detik)
// Malam, rumah Sari. Jangkrik. Bu Darmi berjalan masuk dari luar 
// kanan frame, berhenti di teras, lalu mengetuk pintu pelan bawa map.
// Sari membuka pintu. BU DARMI: "Boleh masuk?"
//
// Fase waktu setelah ditambah durasi jalan (detik lokal):
//   0.0 - 3.0 : Bu Darmi berjalan masuk dari luar kanan (x=1350) ke teras (x=655)
//   3.0 - 6.4 : pintu tertutup, Bu Darmi mengetuk (2 burst)
//   6.4 - 7.4 : jeda (Sari berjalan ke pintu dari dalam)
//   7.4 - 8.6 : pintu dibuka Sari (smoothstep), cahaya tumpah
//   8.6 - 13.0 : pintu terbuka, Bu Darmi bicara "Boleh masuk?"
// =========================================================

void sceneS15(float localTime) {
  // Hitung penyesuaian waktu ketuk setelah dikurangi 3 detik durasi animasi berjalan
  float t_knock = localTime - 3.0;

  float bukaan = constrain((t_knock - 4.4) / 1.2, 0, 1);
  bukaan = bukaan * bukaan * (3 - 2 * bukaan);   // smoothstep (ease in-out)

  drawBgS15Belakang(bukaan);

  // Sari di dalam rumah — tersembunyi di balik daun pintu tertutup,
  // makin terlihat begitu pintu terbuka. Skala 0.78 (agak di dalam).
  pushMatrix();
  translate(528, 574);
  scale(0.78);
  drawSariIdle(0, 0);           // dari Actors.pde
  popMatrix();

  drawBgS15Pintu(bukaan);
  drawBgS15Depan();

  // ---- LOGIKA PERGERAKAN X BU DARMI ----
  float posX;
  boolean isWalking;
  if (localTime < 3.0) {
    // Interpolasi berjalan masuk dari koordinat luar frame kanan (1350) ke depan pintu (655)
    float t_factor = localTime / 3.0;
    posX = lerp(1350, 655, t_factor);
    isWalking = true;
  } else {
    // Menetap di depan pintu untuk mulai mengetuk dan berbicara
    posX = 655;
    isWalking = false;
  }

  // Bu Darmi di teras (skala 0.85, lebih dekat kamera), membawa map usang
  pushMatrix();
  translate(posX, 640);
  scale(0.85);
  drawBuDarmiKetukMap(0, 0, localTime, isWalking);
  popMatrix();

  // Efek garis kejut "tok tok" saat kepalan menyentuh kayu pintu
  boolean burst = (t_knock > 0.9 && t_knock < 1.7) || (t_knock > 2.3 && t_knock < 3.1);
  if (burst && sin(t_knock * 22) < -0.5) {
    stroke(255, 240, 200, 200);
    strokeWeight(3);
    noFill();
    line(524, 212, 512, 202);
    line(518, 226, 502, 224);
    line(524, 240, 512, 250);
  }

  // ---- SINKRONISASI BUBBLE DIALOG BU DARMI ----
  if (t_knock > 5.6 && t_knock < 8.6) {
    drawDialogBubble("BU DARMI", "Boleh masuk?");
  }
}

// =========================================================
// BACKGROUND S15 — bagian BELAKANG (langit s/d interior+lampu)
// =========================================================
void drawBgS15Belakang(float bukaan) {
  pushMatrix();
  scale(1.6);
  fill(#0d1117); noStroke(); rect(0, 0, 800, 450);
  fill(#141813); ellipse(600, 220, 400, 150); ellipse(750, 240, 300, 120);
  fill(#1c1611); rect(570, 150, 60, 40); triangle(570, 150, 600, 130, 630, 150); rect(650, 160, 50, 35); triangle(650, 160, 675, 142, 700, 160); rect(720, 135, 110, 60); triangle(720, 135, 775, 105, 830, 135);
  fill(#231810); rect(0, 210, 800, 240);
  fill(#462d1a); rect(0, 0, 450, 360); stroke(#26170d); strokeWeight(2.5); for (int y = 20; y < 360; y += 24) line(0, y, 450, y);
  stroke(#311e11); strokeWeight(8); fill(#120d08); rect(125, 45, 85, 170); stroke(255, 255, 255, 15); strokeWeight(2); line(140, 55, 185, 160); line(148, 55, 193, 160);
  noStroke(); fill(#311e11); beginShape(); vertex(0, 360); vertex(450, 360); vertex(630, 410); vertex(0, 450); endShape(CLOSE); fill(#3d2616); beginShape(); vertex(0, 450); vertex(630, 410); vertex(615, 450); endShape(CLOSE);
  stroke(#22140a); strokeWeight(12); line(595, 0, 595, 395); noStroke(); fill(#311e11); rect(585, 395, 20, 15);
  fill(#b26b2b); rect(255, 35, 110, 325); stroke(#7a461a); strokeWeight(1.5); for (int x = 265; x < 365; x += 18) line(x, 35, x, 360); noStroke(); fill(#8c5320); quad(255, 300, 365, 280, 365, 360, 255, 360);
  fill(#3a200f); rect(305, 240, 50, 6); rect(312, 246, 5, 45); rect(342, 246, 5, 40);
  float kedipan = random(-2, 2); float redup = 0.15 + 0.85 * bukaan; ellipseMode(CENTER); for (int r = 180; r > 0; r -= 6) { float f = float(r) / 180.0; fill(255, 145, 40, lerp(25, 0, f) * redup); ellipse(330, 222, r + kedipan, r + kedipan); }
  fill(#1c1107); rect(324, 230, 12, 10, 2); fill(#ffeead); ellipse(330, 222, 8, 14);
  popMatrix();
}

// =========================================================
// DAUN PINTU — engsel di sisi KIRI lubang membuka ke dalam
// =========================================================
void drawBgS15Pintu(float bukaan) {
  pushMatrix(); scale(1.6);
  float fx  = lerp(365, 300, bukaan); float fty = lerp(35, 80, bukaan); float fby = lerp(360, 325, bukaan);
  stroke(#201309); strokeWeight(3.5); fill(#422815); quad(255, 35, fx, fty, fx, fby, 255, 360);
  float u1 = 0.17, u2 = 0.83; fill(#2d1b0d); quad(lerp(255, fx, u1), lerp(35, fty, u1) + 16, lerp(255, fx, u2), lerp(35, fty, u2) + 16, lerp(255, fx, u2), lerp(360, fby, u2) - 14, lerp(255, fx, u1), lerp(360, fby, u1) - 14);
  float gx = lerp(255, fx, 0.9); float gy = lerp(lerp(35, fty, 0.9), lerp(360, fby, 0.9), 0.52); stroke(128); strokeWeight(3); line(gx - 7, gy, gx + 6, gy + 2);
  noStroke(); for (int i = 180; i > 0; i -= 12) { float f = float(i) / 180.0; fill(255, 130, 35, lerp(22, 0, f) * bukaan); ellipse(290, 365, i * 1.8, i); }
  popMatrix();
}

// =========================================================
// BACKGROUND S15 — bagian DEPAN (semak, pot, kunang-kunang)
// =========================================================
void drawBgS15Depan() {
  pushMatrix(); scale(1.6);
  noStroke(); fill(#2b1a0e); rect(175, 395, 30, 35); fill(#3d2616); rect(225, 385, 30, 40); fill(#222e1b); ellipse(190, 380, 20, 35); ellipse(180, 370, 15, 25); ellipse(200, 370, 15, 25); fill(#2d3d24); ellipse(240, 365, 25, 45); ellipse(225, 355, 20, 35); ellipse(255, 355, 20, 35); fill(#192414); ellipse(475, 345, 30, 40); ellipse(495, 340, 25, 35); stroke(240, 240, 240, 150); strokeWeight(1.5); line(710, 355, 710, 371); line(702, 363, 718, 363);
  popMatrix();
  noStroke(); fill(255, 230, 140, 120 + 120 * sin(frameCount * 0.06)); ellipse(900 + sin(frameCount * 0.013) * 30, 500 + sin(frameCount * 0.021) * 18, 5, 5); fill(255, 230, 140, 120 + 120 * sin(frameCount * 0.05 + 2)); ellipse(1090 + sin(frameCount * 0.017) * 40, 560 + cos(frameCount * 0.015) * 20, 4, 4);
}

// =========================================================
// BU DARMI — JALAN IN-FRAME / KETUK PINTU + MAP USANG
// =========================================================
void drawBuDarmiKetukMap(float x, float y, float localTime, boolean isWalking) {
  float t_knock = localTime - 3.0;
  float waktuKondisi = frameCount * 0.05;
  
  // PERBAIKAN: Nilai ayunan kini dikunci ke angka 0 jika isWalking == false
  float waktuJalan = frameCount * 0.1; //
  float ayunanJalan = isWalking ? (sin(waktuJalan) * 0.15) : 0; //[cite: 5]
  float bobbing = isWalking ? (cos(waktuJalan * 2) * 1.5) : (sin(waktuKondisi) * 2.5); //[cite: 5]

  float naik = constrain((t_knock - 0.3) / 0.5, 0, 1) - constrain((t_knock - 3.4) / 0.6, 0, 1);
  boolean burst = (t_knock > 0.9 && t_knock < 1.7) || (t_knock > 2.3 && t_knock < 3.1);
  float ketuk = burst ? sin(t_knock * 22) * 12 : 0;
  
  float sudutLenganKetuk = (148 + ketuk) * naik;
  boolean bicara = (t_knock > 5.6 && t_knock < 8.6);

  pushMatrix();
  translate(x, y);
  translate(-194, -672);

  stroke(40, 38, 48); strokeWeight(6); strokeJoin(ROUND); strokeCap(ROUND);

  // 1. LENGAN BELAKANG (KIRI)
  pushMatrix();
  translate(136, 310 + bobbing); //[cite: 5]
  if (isWalking) {
    rotate(ayunanJalan); //[cite: 5]
  } else {
    // Saat sudah diam di teras, beralih ke sudut rotasi mengetuk pintu
    rotate(radians(sudutLenganKetuk));
  }
  fill(160, 125, 90); rect(-21, 0, 42, 150, 12); //[cite: 5]
  fill(245, 185, 140); ellipse(0, 150, 32, 32); //[cite: 5]
  popMatrix();

  stroke(40, 38, 48); strokeWeight(6);

  // 2. KAKI BELAKANG
  pushMatrix();
  translate(168, 430 + bobbing); //[cite: 5]
  rotate(-ayunanJalan); //[cite: 5]
  fill(245, 185, 140); rect(-10, 0, 20, 220); //[cite: 5]
  fill(55, 53, 65); rect(-28, 215, 55, 25, 8, 8, 2, 2); //[cite: 5]
  popMatrix();

  // 3. KAKI DEPAN
  pushMatrix();
  translate(220, 430 + bobbing); //[cite: 5]
  rotate(ayunanJalan); //[cite: 5]
  fill(245, 185, 140); rect(-10, 0, 20, 220); //[cite: 5]
  fill(55, 53, 65); rect(-30, 215, 55, 25, 8, 8, 2, 2); //[cite: 5]
  popMatrix();

  // ROK TRAPESIUM STATIS
  fill(110, 85, 60); //[cite: 5]
  beginShape();
  vertex(134, 430 + bobbing); //[cite: 5]
  vertex(246, 430 + bobbing); //[cite: 5]
  vertex(260, 645 + bobbing); //[cite: 5]
  vertex(120, 645 + bobbing); //[cite: 5]
  endShape(CLOSE); //[cite: 5]

  // 5. KEPALA, SANGGUL & RAMBUT UBAN
  fill(165, 167, 172); ellipse(222, 162 + bobbing, 40, 40); //[cite: 5]
  fill(245, 185, 140); rect(132, 190 + bobbing, 116, 135, 50); //[cite: 5]
  fill(165, 167, 172);
  beginShape();
  vertex(132, 220 + bobbing); //[cite: 5]
  bezierVertex(132, 140 + bobbing, 248, 140 + bobbing, 248, 220 + bobbing); //[cite: 5]
  bezierVertex(248, 232 + bobbing, 229, 232 + bobbing, 229, 220 + bobbing); //[cite: 5]
  bezierVertex(229, 232 + bobbing, 210, 232 + bobbing, 210, 220 + bobbing); //[cite: 5]
  bezierVertex(210, 232 + bobbing, 190, 232 + bobbing, 190, 220 + bobbing); //[cite: 5]
  bezierVertex(190, 232 + bobbing, 171, 232 + bobbing, 171, 220 + bobbing); //[cite: 5]
  bezierVertex(171, 232 + bobbing, 152, 232 + bobbing, 152, 220 + bobbing); //[cite: 5]
  bezierVertex(152, 232 + bobbing, 132, 232 + bobbing, 132, 220 + bobbing); //[cite: 5]
  endShape(CLOSE); //[cite: 5]

  // 6. DETAIL WAJAH
  noFill(); stroke(190, 130, 100); strokeWeight(3); //[cite: 5]
  arc(172, 242 + bobbing, 24, 6, PI, TWO_PI); //[cite: 5]
  arc(172, 250 + bobbing, 16, 4, PI, TWO_PI); //[cite: 5]
  fill(40, 38, 48); noStroke(); //[cite: 5]
  ellipse(152, 265 + bobbing, 12, 12); ellipse(192, 265 + bobbing, 12, 12); //[cite: 5]
  stroke(40, 38, 48); strokeWeight(4); //[cite: 5]
  line(148, 262 + bobbing, 142, 255 + bobbing); line(153, 259 + bobbing, 149, 251 + bobbing); //[cite: 5]
  line(189, 259 + bobbing, 193, 251 + bobbing); line(194, 262 + bobbing, 200, 255 + bobbing); //[cite: 5]

  if (bicara) {
    float mc = (sin(waktuKondisi * 7.0) + 1.0) / 2.0; float mo = mc * mc;
    noStroke(); fill(90, 30, 25); float mh = 3 + mo * 12; ellipse(172, 284 + bobbing, 18, mh);
    if (mo > 0.35) { fill(200, 90, 90); ellipse(172, 284 + bobbing + mh * 0.15, 10, mh * 0.4); }
  } else {
    noFill(); stroke(40, 38, 48); strokeWeight(5); arc(172, 282 + bobbing, 20, 12, 0, PI); //[cite: 5]
  }

  // 7. BADAN & DETAIL KEMEJA COKELAT
  fill(160, 125, 90); stroke(40, 38, 48); strokeWeight(6); //[cite: 5]
  rect(130, 310 + bobbing, 120, 150); line(172, 325 + bobbing, 172, 460 + bobbing); //[cite: 5]
  fill(160, 125, 90); arc(152, 310 + bobbing, 45, 35, 0, PI); arc(202, 310 + bobbing, 45, 35, 0, PI); //[cite: 5]

  // 8. LENGAN DEPAN (KANAN)
  pushMatrix();
  translate(231, 310 + bobbing); //[cite: 5]
  if (isWalking) {
    rotate(-ayunanJalan); //[cite: 5]
  } else {
    rotate(0);
  }
  fill(160, 125, 90); rect(-21, 0, 42, 150, 12); //[cite: 5]
  fill(245, 185, 140); ellipse(0, 150, 32, 32); //[cite: 5]
  popMatrix();

  // MAP USANG di tangan kanan
  pushMatrix();
  translate(238, 464 + bobbing); rotate(radians(5)); stroke(40, 38, 48); strokeWeight(4);
  fill(181, 150, 96); rect(-26, -10, 52, 70, 3);
  fill(232, 222, 196); noStroke(); rect(-14, -16, 30, 8, 2);
  stroke(94, 74, 44); strokeWeight(2.5); line(-26, 24, 26, 24);
  popMatrix();
  stroke(40, 38, 48); strokeWeight(6); fill(245, 185, 140); ellipse(233, 458 + bobbing, 30, 30);

  popMatrix();
}
