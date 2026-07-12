// =================================================================
// Actors.pde — FILE MASTER UTUH AMAN (ANTI-RUSAK SCENE LAIN)
// Semua fungsi drawXxx karakter dikumpulkan rapi di sini.
// x, y = titik tengah-bawah (kaki di lantai), KECUALI Dolf.
// =================================================================

// =========================================================
// KARSO — IDLE (berdiri diam, napas halus)
// =========================================================
void drawKarsoIdle(float x, float y) {
  float waktu = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 280f + bobbing); fill(175, 140, 95); rect(-21f, 0f, 42f, 150f, 12f); fill(235, 155, 120); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  pushMatrix();
  translate(168f, 415f); fill(175, 140, 95); rect(-26f, 0f, 52f, 235f); fill(240, 240, 230); rect(-18f, 235f, 34f, 15f); fill(55, 53, 65); rect(-43f, 247f, 62f, 25f, 8f, 8f, 2f, 2f);
  popMatrix();

  pushMatrix();
  translate(220f, 415f); fill(175, 140, 95); rect(-26f, 0f, 52f, 235f); fill(240, 240, 230); rect(-18f, 235f, 34f, 15f); fill(55, 53, 65); rect(-42f, 250f, 65f, 26f, 8f, 8f, 2f, 2f);
  popMatrix();

  fill(235, 155, 120); rect(132f, 160f + bobbing, 116f, 135f, 45f);
  ellipse(245f, 225f + bobbing, 25f, 35f);
  fill(40, 38, 48); rect(228f, 165f + bobbing, 20f, 37f, 5f);
  fill(40, 38, 48); rect(128f, 110f + bobbing, 120f, 60f, 10f, 10f, 0f, 0f);

  fill(240, 200, 50); noStroke();
  for(int i=0; i<6; i++) rect(140f + i*16f, 135f + bobbing, 10f, 4f, 2f);

  fill(55, 53, 65); stroke(40, 38, 48); strokeWeight(6f);
  ellipse(160f, 215f + bobbing, 14f, 14f); ellipse(195f, 215f + bobbing, 14f, 14f);

  fill(55, 53, 65);
  beginShape();
  vertex(142f, 242f + bobbing);
  bezierVertex(142f, 230f + bobbing, 210f, 230f + bobbing, 210f, 242f + bobbing);
  bezierVertex(210f, 265f + bobbing, 185f, 270f + bobbing, 176f, 252f + bobbing);
  bezierVertex(165f, 270f + bobbing, 142f, 265f + bobbing, 142f, 242f + bobbing);
  endShape(CLOSE);

  fill(175, 140, 95); rect(130f, 280f + bobbing, 120f, 150f);
  fill(255); triangle(145f, 280f + bobbing, 185f, 280f + bobbing, 165f, 335f + bobbing);

  fill(40, 38, 48);
  beginShape();
  vertex(155f, 295f + bobbing); vertex(175f, 295f + bobbing); vertex(180f, 395f + bobbing); vertex(165f, 415f + bobbing); vertex(150f, 395f + bobbing);
  endShape(CLOSE);

  stroke(240, 200, 50); strokeWeight(3f);
  line(158f, 330f + bobbing, 172f, 320f + bobbing);
  line(156f, 360f + bobbing, 175f, 345f + bobbing);
  line(154f, 390f + bobbing, 178f, 370f + bobbing);

  stroke(40, 38, 48); strokeWeight(6f);
  pushMatrix();
  translate(231f, 280f + bobbing); fill(175, 140, 95); rect(-21f, 0f, 42f, 150f, 12f); fill(235, 155, 120); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  popMatrix();
}

// =========================================================
// KARSO — PIDATO (S07): tangan depan gestur + mulut buka-tutup
// =========================================================
void drawKarsoPidato(float x, float y) {
  float waktu = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;
  float armGesture = 130f + sin(waktu * 1.1f) * 35f + sin(waktu * 3.0f) * 8f;
  float mouthCycle = (sin(waktu * 7.0f) + 1.0f) / 2.0f;
  float mouthOpen = mouthCycle * mouthCycle;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 280f + bobbing); rotate(radians(armGesture)); fill(175, 140, 95); rect(-21f, 0f, 42f, 150f, 12f); fill(235, 155, 120); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  stroke(40, 38, 48); strokeWeight(6f);

  pushMatrix();
  translate(168f, 415f); fill(175, 140, 95); rect(-26f, 0f, 52f, 235f); fill(240, 240, 230); rect(-18f, 235f, 34f, 15f); fill(55, 53, 65); rect(-43f, 247f, 62f, 25f, 8f, 8f, 2f, 2f);
  popMatrix();

  pushMatrix();
  translate(220f, 415f); fill(175, 140, 95); rect(-26f, 0f, 52f, 235f); fill(240, 240, 230); rect(-18f, 235f, 34f, 15f); fill(55, 53, 65); rect(-42f, 250f, 65f, 26f, 8f, 8f, 2f, 2f);
  popMatrix();

  fill(235, 155, 120); rect(132f, 160f + bobbing, 116f, 135f, 45f);
  ellipse(245f, 225f + bobbing, 25f, 35f);
  fill(40, 38, 48); rect(228f, 165f + bobbing, 20f, 37f, 5f);
  fill(40, 38, 48); rect(128f, 110f + bobbing, 120f, 60f, 10f, 10f, 0f, 0f);

  fill(240, 200, 50); noStroke();
  for(int i=0; i<6; i++) rect(140f + i*16f, 135f + bobbing, 10f, 4f, 2f);

  fill(55, 53, 65); stroke(40, 38, 48); strokeWeight(6f);
  ellipse(160f, 215f + bobbing, 14f, 14f); ellipse(195f, 215f + bobbing, 14f, 14f);

  fill(55, 53, 65);
  beginShape();
  vertex(142f, 242f + bobbing);
  bezierVertex(142f, 230f + bobbing, 210f, 230f + bobbing, 210f, 242f + bobbing);
  bezierVertex(210f, 265f + bobbing, 185f, 270f + bobbing, 176f, 252f + bobbing);
  bezierVertex(165f, 270f + bobbing, 142f, 265f + bobbing, 142f, 242f + bobbing);
  endShape(CLOSE);

  noStroke(); fill(90, 30, 25);
  float mouthH = 4f + mouthOpen * 14f;
  ellipse(176f, 258f + bobbing, 26f, mouthH);
  if (mouthOpen > 0.35f) {
    fill(200, 90, 90); ellipse(176f, 258f + bobbing + mouthH * 0.18f, 14f, mouthH * 0.4f);
  }
  stroke(40, 38, 48); strokeWeight(6f);

  fill(175, 140, 95); rect(130f, 280f + bobbing, 120f, 150f);
  fill(255); triangle(145f, 280f + bobbing, 185f, 280f + bobbing, 165f, 335f + bobbing);

  fill(40, 38, 48);
  beginShape();
  vertex(155f, 295f + bobbing); vertex(175f, 295f + bobbing); vertex(180f, 395f + bobbing); vertex(165f, 415f + bobbing); vertex(150f, 395f + bobbing);
  endShape(CLOSE);

  stroke(240, 200, 50); strokeWeight(3f);
  line(158f, 330f + bobbing, 172f, 320f + bobbing);
  line(156f, 360f + bobbing, 175f, 345f + bobbing);
  line(154f, 390f + bobbing, 178f, 370f + bobbing);

  stroke(40, 38, 48); strokeWeight(6f);
  pushMatrix();
  translate(231f, 280f + bobbing); fill(175, 140, 95); rect(-21f, 0f, 42f, 150f, 12f); fill(235, 155, 120); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  popMatrix();
}

// =========================================================
// IBU SARI — IDLE
// =========================================================
void drawBuSariIdle(float x, float y) {
  float waktu = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  color warnaKulit = color(253, 199, 161); color warnaBaju = color(146, 120, 187);
  color warnaRok = color(104, 73, 124);    color warnaJilbab = color(118, 99, 166);
  color warnaSepatu = color(70, 68, 76);    color warnaGaris = color(40, 38, 48);

  stroke(warnaGaris); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(140f, 290f + bobbing); fill(warnaKulit); ellipse(0f, 130f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 120f, 15f);
  popMatrix();

  pushMatrix();
  translate(194f, 415f); fill(warnaRok); rect(-45f, 0f, 90f, 240f, 5f); fill(warnaSepatu); rect(-50f, 235f, 48f, 25f, 10f, 10f, 5f, 5f); rect(2f, 235f, 48f, 25f, 10f, 10f, 5f, 5f);
  popMatrix();

  pushMatrix();
  translate(194f, 280f + bobbing); fill(warnaBaju); rect(-50f, 0f, 100f, 140f, 20f, 20f, 5f, 5f); fill(warnaKulit); arc(0f, 0f, 30f, 20f, 0f, PI);
  popMatrix();

  pushMatrix();
  translate(194f, 210f + bobbing); fill(warnaJilbab); ellipse(5f, 0f, 135f, 155f); fill(warnaKulit); ellipse(-5f, 0f, 110f, 110f);
  fill(warnaGaris); noStroke(); ellipse(-25f, -5f, 14f, 14f); ellipse(25f, -5f, 14f, 14f);
  stroke(warnaGaris); strokeWeight(3f); line(-37f, -12f, -32f, -7f); line(-33f, -17f, -28f, -12f); line(37f, -12f, 32f, -7f); line(33f, -17f, 28f, -12f);
  noFill(); strokeWeight(4f); arc(0f, 20f, 25f, 15f, 0f, PI);
  popMatrix();

  strokeWeight(6f);
  pushMatrix();
  translate(248f, 290f + bobbing); fill(warnaKulit); ellipse(0f, 130f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 120f, 15f);
  popMatrix();

  popMatrix();
}

// =========================================================
// IBU SARI — JALAN
// =========================================================
void drawBuSariWalking(float x, float y) {
  float waktu = frameCount * 0.12f;
  float bobbing = sin(waktu * 2f) * 3.5f;
  float ayunanTangan = sin(waktu) * 25f;
  float ayunanRok = sin(waktu) * 8f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  color warnaKulit  = color(253, 199, 161); color warnaBaju   = color(146, 120, 187); color warnaRok    = color(104, 73, 124);  color warnaJilbab = color(118, 99, 166); color warnaSepatu = color(70, 68, 76);    color warnaGaris  = color(40, 38, 48);
  stroke(warnaGaris); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(140f, 290f + bobbing); rotate(radians(-ayunanTangan)); fill(warnaKulit); ellipse(0f, 130f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 120f, 15f); popMatrix();
  fill(warnaRok); beginShape(); vertex(194f - 45f, 415f + bobbing); vertex(194f + 45f, 415f + bobbing); vertex(194f + 45f + ayunanRok, 415f + 240f); vertex(194f - 45f + ayunanRok, 415f + 240f); endShape(CLOSE);
  fill(warnaSepatu); float langkahKiri = sin(waktu) * 12f; rect((194f - 50f) + langkahKiri, 415f + 235f + abs(langkahKiri) * 0.3f, 48f, 25f, 10f, 10f, 5f, 5f); float langkahKanan = -sin(waktu) * 8f; rect((194f - 4f) + langkahKanan, 415f + 235f + abs(langkahKanan) * 0.3f, 48f, 25f, 10f, 10f, 5f, 5f);
  pushMatrix(); translate(194f, 280f + bobbing); fill(warnaBaju); rect(-50f, 0f, 100f, 140f, 20f, 20f, 5f, 5f); fill(warnaKulit); arc(0f, 0f, 30f, 20f, 0f, PI); popMatrix();
  pushMatrix(); translate(194f, 210f + bobbing); fill(warnaJilbab); ellipse(5f, 0f, 135f, 155f); fill(warnaKulit); ellipse(-5f, 0f, 110f, 110f); fill(warnaGaris); noStroke(); ellipse(-25f, -5f, 14f, 14f); ellipse(25f, -5f, 14f, 14f); stroke(warnaGaris); strokeWeight(3f); line(-37f, -12f, -32f, -7f); line(-33f, -17f, -28f, -12f); line(37f, -12f, 32f, -7f); line(33f, -17f, 28f, -12f); noFill(); strokeWeight(4f); arc(0f, 20f, 25f, 15f, 0f, PI); popMatrix();
  strokeWeight(6f); pushMatrix(); translate(248f, 290f + bobbing); rotate(radians(ayunanTangan)); fill(warnaKulit); ellipse(0f, 130f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 120f, 15f); popMatrix(); popMatrix();
}

// =========================================================
// IBU SARI — BICARA (ANIMASI MULUT UNTUK SCENE 13)
// =========================================================
void drawBuSariBicara(float x, float y) {
  float waktu = frameCount * 0.05f; float bobbing = sin(waktu) * 2.5f; float mouthCycle = (sin(waktu * 7.0f) + 1.0f) / 2.0f; float mouthOpen = mouthCycle * mouthCycle;
  pushMatrix(); translate(x, y); translate(-194f, -672f);
  color warnaKulit = color(253, 199, 161); color warnaBaju = color(146, 120, 187); color warnaRok = color(104, 73, 124); color warnaJilbab = color(118, 99, 166); color warnaSepatu = color(70, 68, 76); color warnaGaris = color(40, 38, 48);
  stroke(warnaGaris); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(140f, 290f + bobbing); fill(warnaKulit); ellipse(0f, 130f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 120f, 15f); popMatrix();
  pushMatrix(); translate(194f, 415f); fill(warnaRok); rect(-45f, 0f, 90f, 240f, 5f); fill(warnaSepatu); rect(-50f, 235f, 48f, 25f, 10f, 10f, 5f, 5f); rect(2f, 235f, 48f, 25f, 10f, 10f, 5f, 5f); popMatrix();
  pushMatrix(); translate(194f, 280f + bobbing); fill(warnaBaju); rect(-50f, 0f, 100f, 140f, 20f, 20f, 5f, 5f); fill(warnaKulit); arc(0f, 0f, 30f, 20f, 0f, PI); popMatrix();
  pushMatrix(); translate(194f, 210f + bobbing); fill(warnaJilbab); ellipse(5f, 0f, 135f, 155f); fill(warnaKulit); ellipse(-5f, 0f, 110f, 110f); fill(warnaGaris); noStroke(); ellipse(-25f, -5f, 14f, 14f); ellipse(25f, -5f, 14f, 14f); stroke(warnaGaris); strokeWeight(3f); line(-37f, -12f, -32f, -7f); line(-33f, -17f, -28f, -12f); line(37f, -12f, 32f, -7f); line(33f, -17f, 28f, -12f);
  noStroke(); fill(90, 30, 25); float bsMouthH = 2f + mouthOpen * 12f; ellipse(0f, 20f, 14f, bsMouthH); if (mouthOpen > 0.35f) { fill(200, 90, 90); ellipse(0f, 20f + bsMouthH * 0.15f, 8f, bsMouthH * 0.4f); }
  stroke(warnaGaris); strokeWeight(6f); popMatrix();
  pushMatrix(); translate(248f, 290f + bobbing); fill(warnaKulit); ellipse(0f, 130f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 120f, 15f); popMatrix(); popMatrix();
}

// =========================================================
// IBU SARI — PEGANG PUNDAK SARI (KUNCI TIMPA EXPLICIT)
// =========================================================
void drawBuSariPegangPundak(float x, float y) {
  float waktu = frameCount * 0.05f; float bobbing = sin(waktu) * 2.5f;
  pushMatrix(); translate(x, y); translate(-194f, -672f);
  color warnaKulit = color(253, 199, 161); color warnaBaju = color(146, 120, 187); color warnaRok = color(104, 73, 124); color warnaJilbab = color(118, 99, 166); color warnaSepatu = color(70, 68, 76); color warnaGaris = color(40, 38, 48);
  stroke(warnaGaris); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(140f, 290f + bobbing); fill(warnaKulit); ellipse(0f, 130f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 120f, 15f); popMatrix();
  pushMatrix(); translate(194f, 415f); fill(warnaRok); rect(-45f, 0f, 90f, 240f, 5f); fill(warnaSepatu); rect(-50f, 235f, 48f, 25f, 10f, 10f, 5f, 5f); rect(2f, 235f, 48f, 25f, 10f, 10f, 5f, 5f); popMatrix();
  pushMatrix(); translate(194f, 280f + bobbing); fill(warnaBaju); rect(-50f, 0f, 100f, 140f, 20f, 20f, 5f, 5f); fill(warnaKulit); arc(0f, 0f, 30f, 20f, 0f, PI); popMatrix();
  pushMatrix(); translate(194f, 210f + bobbing); fill(warnaJilbab); ellipse(5f, 0f, 135f, 155f); fill(warnaKulit); ellipse(-5f, 0f, 110f, 110f); fill(warnaGaris); noStroke(); ellipse(-25f, -5f, 14f, 14f); ellipse(25f, -5f, 14f, 14f); stroke(warnaGaris); strokeWeight(3f); line(-37f, -12f, -32f, -7f); line(-33f, -17f, -28f, -12f); line(37f, -12f, 32f, -7f); line(33f, -17f, 28f, -12f); noFill(); strokeWeight(4f); arc(0f, 20f, 25f, 15f, 0f, PI); popMatrix();
  // Lengan depan memanjang lurus ke koordinat pundak Sari
  strokeWeight(6f); pushMatrix(); translate(248f, 290f + bobbing); rotate(radians(-82f)); fill(warnaKulit); ellipse(0f, 162f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 152f, 15f); popMatrix();
  popMatrix();
}

// =========================================================
// BU DARMI — IDLE
// =========================================================
void drawBuDarmiIdle(float x, float y) {
  pushMatrix(); translate(x, y); translate(-194f, -672f); float waktu = frameCount * 0.05f; float bobbing = sin(waktu) * 2.5f; stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(136f, 310f + bobbing); fill(160, 125, 90); rect(-21f, 0f, 42f, 150f, 12f); fill(245, 185, 140); ellipse(0f, 150f, 32f, 32f); popMatrix();
  pushMatrix(); translate(168f, 430f); fill(245, 185, 140); rect(-10f, 0f, 20f, 220f); fill(55, 53, 65); rect(-28f, 215f, 55f, 25f, 8f, 8f, 2f, 2f); popMatrix();
  pushMatrix(); translate(220f, 430f); fill(245, 185, 140); rect(-10f, 0f, 20f, 220f); fill(55, 53, 65); rect(-30f, 215f, 55f, 25f, 8f, 8f, 2f, 2f); popMatrix();
  fill(110, 85, 60); beginShape(); vertex(134f, 430f); vertex(246f, 430f); vertex(260f, 645f); vertex(120f, 645f); endShape(CLOSE);
  fill(165, 167, 172); ellipse(222f, 162f + bobbing, 40f, 40f); fill(245, 185, 140); rect(132f, 190f + bobbing, 116f, 135f, 50f);
  fill(165, 167, 172); beginShape(); vertex(132f, 220f + bobbing); bezierVertex(132f, 140f + bobbing, 248f, 140f + bobbing, 248f, 220f + bobbing); bezierVertex(248f, 232f + bobbing, 229f, 232f + bobbing, 229f, 220f + bobbing); bezierVertex(229f, 232f + bobbing, 210f, 232f + bobbing, 210f, 220f + bobbing); bezierVertex(210f, 232f + bobbing, 190f, 232f + bobbing, 190f, 220f + bobbing); bezierVertex(190f, 232f + bobbing, 171f, 232f + bobbing, 171f, 220f + bobbing); bezierVertex(171f, 232f + bobbing, 152f, 232f + bobbing, 152f, 220f + bobbing); bezierVertex(152f, 232f + bobbing, 132f, 232f + bobbing, 132f, 220f + bobbing); endShape(CLOSE);
  noFill(); stroke(190, 130, 100); strokeWeight(3f); arc(172f, 242f + bobbing, 24f, 6f, PI, TWO_PI); arc(172f, 250f + bobbing, 16f, 4f, PI, TWO_PI);
  fill(40, 38, 48); noStroke(); ellipse(152f, 265f + bobbing, 12f, 12f); ellipse(192f, 265f + bobbing, 12f, 12f); stroke(40, 38, 48); strokeWeight(4f); line(148f, 262f + bobbing, 142f, 255f + bobbing); line(153f, 259f + bobbing, 149f, 251f + bobbing); line(189f, 259f + bobbing, 193f, 251f + bobbing); line(194f, 262f + bobbing, 200f, 255f + bobbing);
  noFill(); strokeWeight(5f); arc(172f, 282f + bobbing, 20f, 12f, 0f, PI);
  fill(160, 125, 90); strokeWeight(6f); rect(130f, 310f + bobbing, 120f, 150f); line(172f, 325f + bobbing, 172f, 460f + bobbing);
  fill(160, 125, 90); arc(152f, 310f + bobbing, 45f, 35f, 0f, PI); arc(202f, 310f + bobbing, 45f, 35f, 0f, PI);
  pushMatrix(); translate(231f, 310f + bobbing); fill(160, 125, 90); rect(-21f, 0f, 42f, 150f, 12f); fill(245, 185, 140); ellipse(0f, 150f, 32f, 32f); popMatrix(); popMatrix();
}

// =========================================================
// SARI — IDLE / WALKING / BICARA
// =========================================================
void drawSariIdle(float x, float y) {
  float waktu = frameCount * 0.05f; float bobbing = sin(waktu) * 2.5f;
  pushMatrix(); translate(x, y); translate(-194f, -672f); stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(136f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix();
  stroke(40, 38, 48); strokeWeight(6f); fill(102, 78, 158); beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 662f); vertex(128f, 662f); endShape(CLOSE);
  fill(55, 53, 65); rect(125f, 662f, 62f, 25f, 8f, 8f, 2f, 2f); rect(178f, 665f, 65f, 26f, 8f, 8f, 2f, 2f); fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f); fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f);
  ellipse(246f, 222f + bobbing, 20f, 28f); noFill(); strokeWeight(3f); arc(244f, 222f + bobbing, 8f, 10f, -HALF_PI, HALF_PI);
  strokeWeight(6f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI); stroke(40, 38, 48); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix();
  fill(55, 53, 65); noStroke(); ellipse(164f, 218f + bobbing, 13f, 13f); ellipse(199f, 218f + bobbing, 13f, 13f);
  stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f); noFill(); arc(181f, 238f + bobbing, 22f, 13f, 0f, PI);
  fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 175f, 15f, 15f, 0f, 0f); noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI);
  stroke(40, 38, 48, 60); strokeWeight(3f); line(146f, 340f + bobbing, 146f, 420f + bobbing); line(234f, 340f + bobbing, 234f, 420f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f); pushMatrix(); translate(231f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix(); popMatrix();
}

void drawSariWalking(float x, float y) {
  float waktu = frameCount * 0.12f; float bobbing = sin(waktu * 2f) * 3.5f; float ayunanTangan = sin(waktu) * 25f; float ayunanRok = sin(waktu) * 8f;
  pushMatrix(); translate(x, y); translate(-194f, -672f); stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(136f, 280f + bobbing); rotate(radians(-ayunanTangan)); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix();
  stroke(40, 38, 48); strokeWeight(6f); fill(102, 78, 158); beginShape(); vertex(142f, 415f + bobbing); vertex(246f, 415f + bobbing); vertex(260f + ayunanRok, 662f); vertex(128f + ayunanRok, 662f); endShape(CLOSE);
  fill(55, 53, 65); float langkahKiri = sin(waktu) * 12f; rect(125f + langkahKiri, 662f + abs(langkahKiri) * 0.3f, 62f, 25f, 8f, 8f, 2f, 2f); float langkahKanan = -sin(waktu) * 12f; rect(178f + langkahKanan, 665f + abs(langkahKanan) * 0.3f, 65f, 26f, 8f, 8f, 2f, 2f);
  fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f); fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f);
  ellipse(246f, 222f + bobbing, 20f, 28f); noFill(); strokeWeight(3f); arc(244f, 222f + bobbing, 8f, 10f, -HALF_PI, HALF_PI);
  strokeWeight(6f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI); stroke(40, 38, 48); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix();
  fill(55, 53, 65); noStroke(); ellipse(164f, 218f + bobbing, 13f, 13f); ellipse(199f, 218f + bobbing, 13f, 13f);
  stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f); noFill(); arc(181f, 238f + bobbing, 22f, 13f, 0f, PI);
  fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 175f, 15f, 15f, 0f, 0f); noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI);
  stroke(40, 38, 48, 60); strokeWeight(3f); line(146f, 340f + bobbing, 146f, 420f + bobbing); line(234f, 340f + bobbing, 234f, 420f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f); pushMatrix(); translate(231f, 280f + bobbing); rotate(radians(ayunanTangan)); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix(); popMatrix();
}

void drawSariBicara(float x, float y) {
  float waktu = frameCount * 0.05f; float mouthCycle = (sin(waktu * 7.0f) + 1.0f) / 2.0f; float mouthOpen = mouthCycle * mouthCycle; float bobbing = sin(waktu) * 2.5f;
  pushMatrix(); translate(x, y); translate(-194f, -672f); stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(136f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix();
  fill(102, 78, 158); beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 662f); vertex(128f, 662f); endShape(CLOSE);
  fill(55, 53, 65); rect(125f, 662f, 62f, 25f, 8f, 8f, 2f, 2f); rect(178f, 665f, 65f, 26f, 8f, 8f, 2f, 2f); fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f); fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f);
  ellipse(246f, 222f + bobbing, 20f, 28f); noFill(); strokeWeight(3f); arc(244f, 222f + bobbing, 8f, 10f, -HALF_PI, HALF_PI);
  strokeWeight(6f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI); stroke(40, 38, 48); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix();
  fill(55, 53, 65); noStroke(); ellipse(164f, 218f + bobbing, 13f, 13f); ellipse(199f, 218f + bobbing, 13f, 13f); stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing); stroke(40, 38, 48); strokeWeight(6f);
  noStroke(); fill(90, 30, 25); float sariMouthH = 2f + mouthOpen * 11f; ellipse(181f, 238f + bobbing, 16f, sariMouthH); if (mouthOpen > 0.35f) { fill(200, 90, 90); ellipse(181f, 238f + bobbing + sariMouthH * 0.15f, 10f, sariMouthH * 0.4f); }
  stroke(40, 38, 48); strokeWeight(6f); fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 175f, 15f, 15f, 0f, 0f); noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI);
  stroke(40, 38, 48, 60); strokeWeight(3f); line(146f, 340f + bobbing, 146f, 420f + bobbing); line(234f, 340f + bobbing, 234f, 420f + bobbing); stroke(40, 38, 48); strokeWeight(6f);
  pushMatrix(); translate(231f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix(); popMatrix();
}

// =========================================================
// PAK DOLF & BU RAHMA — IDLE + BICARA
// (belum ada sama sekali di struktur baru ini, padahal S13/S14
// butuh keduanya -> ditambahkan dari file lama)
// =========================================================
void drawDolfIdle(float x, float y) {
  float bobbingJalan = 0f;
  pushMatrix();
  translate(x + 45f, y); scale(-1f, 1f);

  stroke(0); strokeWeight(5f); strokeJoin(ROUND); strokeCap(ROUND);

  fill(65, 67, 71); rect(20f, -425f + bobbingJalan, 32f, 130f, 8f); fill(210, 180, 155); ellipse(36f, -295f + bobbingJalan, 26f, 26f);
  fill(140); rect(33f, -250f + bobbingJalan, 44f, 210f); fill(220, 190, 165); rect(38f, -40f + bobbingJalan, 34f, 15f); fill(220); rect(15f, -25f + bobbingJalan, 65f, 10f, 3f);

  fill(173, 177, 182); rect(18f, -250f + bobbingJalan, 44f, 210f); fill(240, 210, 185); rect(23f, -40f + bobbingJalan, 34f, 15f); fill(255); rect(0f, -25f + bobbingJalan, 65f, 10f, 3f);

  fill(85, 87, 91); rect(-5f, -450f + bobbingJalan, 110f, 205f, 5f);
  fill(240, 210, 185); noStroke(); arc(18f, -450f + bobbingJalan, 45f, 50f, 0f, PI); stroke(0); noFill(); arc(18f, -450f + bobbingJalan, 45f, 50f, 0f, PI);

  fill(85, 87, 91); rect(52f, -425f + bobbingJalan, 36f, 135f, 8f); fill(240, 210, 185); ellipse(70f, -290f + bobbingJalan, 28f, 28f);

  fill(240, 210, 185); rect(-2f, -580f + bobbingJalan, 105f, 132f, 25f); ellipse(98f, -515f + bobbingJalan, 22f, 28f);

  fill(40); arc(50f, -572f + bobbingJalan, 110f, 90f, PI, TWO_PI); rect(78f, -572f + bobbingJalan, 25f, 55f);
  noStroke(); rect(40f, -575f + bobbingJalan, 45f, 10f); stroke(0);
  line(63f, -572f + bobbingJalan, 78f, -545f + bobbingJalan); line(78f, -517f + bobbingJalan, 103f, -517f + bobbingJalan); line(103f, -517f + bobbingJalan, 103f, -572f + bobbingJalan);

  fill(0); ellipse(15f, -515f + bobbingJalan, 14f, 14f); ellipse(45f, -515f + bobbingJalan, 14f, 14f);
  rect(15f, -492f + bobbingJalan, 20f, 20f);

  popMatrix();
}

void drawDolfBicara(float x, float y) {
  float waktu = frameCount * 0.05f;
  float mouthCycle = (sin(waktu * 7.0f) + 1.0f) / 2.0f;
  float mouthOpen = mouthCycle * mouthCycle;
  float bobbingJalan = 0f;

  pushMatrix();
  translate(x + 45f, y); scale(-1f, 1f);

  stroke(0); strokeWeight(5f); strokeJoin(ROUND); strokeCap(ROUND);

  fill(65, 67, 71); rect(20f, -425f + bobbingJalan, 32f, 130f, 8f); fill(210, 180, 155); ellipse(36f, -295f + bobbingJalan, 26f, 26f);
  fill(140); rect(33f, -250f + bobbingJalan, 44f, 210f); fill(220, 190, 165); rect(38f, -40f + bobbingJalan, 34f, 15f); fill(220); rect(15f, -25f + bobbingJalan, 65f, 10f, 3f);

  fill(173, 177, 182); rect(18f, -250f + bobbingJalan, 44f, 210f); fill(240, 210, 185); rect(23f, -40f + bobbingJalan, 34f, 15f); fill(255); rect(0f, -25f + bobbingJalan, 65f, 10f, 3f);

  fill(85, 87, 91); rect(-5f, -450f + bobbingJalan, 110f, 205f, 5f);
  fill(240, 210, 185); noStroke(); arc(18f, -450f + bobbingJalan, 45f, 50f, 0f, PI); stroke(0); noFill(); arc(18f, -450f + bobbingJalan, 45f, 50f, 0f, PI);

  fill(85, 87, 91); rect(52f, -425f + bobbingJalan, 36f, 135f, 8f); fill(240, 210, 185); ellipse(70f, -290f + bobbingJalan, 28f, 28f);

  fill(240, 210, 185); rect(-2f, -580f + bobbingJalan, 105f, 132f, 25f); ellipse(98f, -515f + bobbingJalan, 22f, 28f);

  fill(40); arc(50f, -572f + bobbingJalan, 110f, 90f, PI, TWO_PI); rect(78f, -572f + bobbingJalan, 25f, 55f);
  noStroke(); rect(40f, -575f + bobbingJalan, 45f, 10f); stroke(0);
  line(63f, -572f + bobbingJalan, 78f, -545f + bobbingJalan); line(78f, -517f + bobbingJalan, 103f, -517f + bobbingJalan); line(103f, -517f + bobbingJalan, 103f, -572f + bobbingJalan);

  fill(0); ellipse(15f, -515f + bobbingJalan, 14f, 14f); ellipse(45f, -515f + bobbingJalan, 14f, 14f);
  rect(15f, -492f + bobbingJalan, 20f, 20f);

  noStroke(); fill(90, 30, 25);
  float dolfMouthH = 3f + mouthOpen * 12f;
  ellipse(25f, -462f + bobbingJalan, 18f, dolfMouthH);
  if (mouthOpen > 0.35f) {
    fill(200, 90, 90); ellipse(25f, -462f + bobbingJalan + dolfMouthH * 0.15f, 10f, dolfMouthH * 0.4f);
  }
  stroke(0); strokeWeight(5f);

  popMatrix();
}

void drawWargaPerempuanIdle(float x, float y) {
  float waktu  = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;

  pushMatrix();
  translate(x, y);
  translate(-195f, -660f);

  stroke(20); strokeWeight(4f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(190f, 270f + bobbing); fill(198, 75, 59); rect(-14f, 0f, 28f, 130f, 12f); fill(200, 139, 94); ellipse(0f, 130f, 30f, 30f);
  popMatrix();

  pushMatrix();
  translate(175f, 395f); fill(245, 245, 245); rect(-15f, 0f, 30f, 235f); fill(200, 139, 94); rect(-15f, 235f, 42f, 15f, 2f, 8f, 2f, 2f); fill(35, 125, 49); rect(-18f, 250f, 48f, 8f, 4f);
  strokeWeight(3f); line(10f, 250f, 0f, 239f); strokeWeight(4f);
  popMatrix();

  pushMatrix();
  translate(205f, 395f); fill(245, 245, 245); rect(-15f, 0f, 30f, 235f); fill(200, 139, 94); rect(-15f, 235f, 42f, 15f, 2f, 8f, 2f, 2f); fill(35, 125, 49); rect(-18f, 250f, 48f, 8f, 4f);
  strokeWeight(3f); line(10f, 250f, 0f, 239f); strokeWeight(4f);
  popMatrix();

  fill(198, 75, 59); rect(155f, 260f + bobbing, 80f, 150f, 10f);
  fill(200, 139, 94); arc(200f, 260f + bobbing, 40f, 25f, 0f, PI);

  fill(44, 44, 44); ellipse(142f, 195f + bobbing, 36f, 46f);
  fill(200, 139, 94); rect(155f, 145f + bobbing, 90f, 115f, 45f);

  fill(44, 44, 44);
  beginShape(); vertex(155f, 210f + bobbing); bezierVertex(140f, 130f + bobbing, 250f, 130f + bobbing, 248f, 190f + bobbing); bezierVertex(235f, 160f + bobbing, 185f, 160f + bobbing, 155f, 210f + bobbing); endShape(CLOSE);

  fill(200, 139, 94); ellipse(162f, 205f + bobbing, 20f, 25f); noFill(); strokeWeight(2f); arc(159f, 205f + bobbing, 10f, 12f, HALF_PI, PI + HALF_PI); strokeWeight(4f);

  fill(20); noStroke(); ellipse(208f, 195f + bobbing, 14f, 14f); ellipse(235f, 195f + bobbing, 14f, 14f);
  noFill(); stroke(20); strokeWeight(4f); arc(224f, 220f + bobbing, 14f, 8f, 0f, PI);

  pushMatrix();
  translate(190f, 270f + bobbing); fill(198, 75, 59); rect(-14f, 0f, 28f, 130f, 12f); fill(200, 139, 94); ellipse(0f, 130f, 30f, 30f);
  popMatrix();

  popMatrix();
}

void drawWargaPerempuanBicara(float x, float y) {
  float waktu  = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;
  float mouthCycle = (sin(waktu * 7.0f) + 1.0f) / 2.0f;
  float mouthOpen = mouthCycle * mouthCycle;

  pushMatrix();
  translate(x, y);
  translate(-195f, -660f);

  stroke(20); strokeWeight(4f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(190f, 270f + bobbing); fill(198, 75, 59); rect(-14f, 0f, 28f, 130f, 12f); fill(200, 139, 94); ellipse(0f, 130f, 30f, 30f);
  popMatrix();

  pushMatrix();
  translate(175f, 395f); fill(245, 245, 245); rect(-15f, 0f, 30f, 235f); fill(200, 139, 94); rect(-15f, 235f, 42f, 15f, 2f, 8f, 2f, 2f); fill(35, 125, 49); rect(-18f, 250f, 48f, 8f, 4f);
  strokeWeight(3f); line(10f, 250f, 0f, 239f); strokeWeight(4f);
  popMatrix();

  pushMatrix();
  translate(205f, 395f); fill(245, 245, 245); rect(-15f, 0f, 30f, 235f); fill(200, 139, 94); rect(-15f, 235f, 42f, 15f, 2f, 8f, 2f, 2f); fill(35, 125, 49); rect(-18f, 250f, 48f, 8f, 4f);
  strokeWeight(3f); line(10f, 250f, 0f, 239f); strokeWeight(4f);
  popMatrix();

  fill(198, 75, 59); rect(155f, 260f + bobbing, 80f, 150f, 10f);
  fill(200, 139, 94); arc(200f, 260f + bobbing, 40f, 25f, 0f, PI);

  fill(44, 44, 44); ellipse(142f, 195f + bobbing, 36f, 46f);
  fill(200, 139, 94); rect(155f, 145f + bobbing, 90f, 115f, 45f);

  fill(44, 44, 44);
  beginShape(); vertex(155f, 210f + bobbing); bezierVertex(140f, 130f + bobbing, 250f, 130f + bobbing, 248f, 190f + bobbing); bezierVertex(235f, 160f + bobbing, 185f, 160f + bobbing, 155f, 210f + bobbing); endShape(CLOSE);

  fill(200, 139, 94); ellipse(162f, 205f + bobbing, 20f, 25f); noFill(); strokeWeight(2f); arc(159f, 205f + bobbing, 10f, 12f, HALF_PI, PI + HALF_PI); strokeWeight(4f);

  fill(20); noStroke(); ellipse(208f, 195f + bobbing, 14f, 14f); ellipse(235f, 195f + bobbing, 14f, 14f);

  noStroke(); fill(90, 30, 25);
  float rahmaMouthH = 3f + mouthOpen * 12f;
  ellipse(224f, 220f + bobbing, 14f, rahmaMouthH);
  if (mouthOpen > 0.35f) {
    fill(200, 90, 90); ellipse(224f, 220f + bobbing + rahmaMouthH * 0.15f, 8f, rahmaMouthH * 0.4f);
  }
  stroke(20); strokeWeight(4f);

  pushMatrix();
  translate(190f, 270f + bobbing); fill(198, 75, 59); rect(-14f, 0f, 28f, 130f, 12f); fill(200, 139, 94); ellipse(0f, 130f, 30f, 30f);
  popMatrix();

  popMatrix();
}

// =========================================================
// SISA ASET PENGAMAN COMPILER (STUB DAN FUNGSI STATIS)
// =========================================================
void drawBuDarmiPegangKertas(float x, float y) {
  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  float waktu   = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;
  float bisik   = (sin(waktu * 6.0f) + 1.0f) * 0.5f;

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 310f + bobbing); fill(160, 125, 90); rect(-21f, 0f, 42f, 150f, 12f); fill(245, 185, 140); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  pushMatrix();
  translate(168f, 430f); fill(245, 185, 140); rect(-10f, 0f, 20f, 220f); fill(55, 53, 65); rect(-28f, 215f, 55f, 25f, 8f, 8f, 2f, 2f);
  popMatrix();

  pushMatrix();
  translate(220f, 430f); fill(245, 185, 140); rect(-10f, 0f, 20f, 220f); fill(55, 53, 65); rect(-30f, 215f, 55f, 25f, 8f, 8f, 2f, 2f);
  popMatrix();

  fill(110, 85, 60);
  beginShape(); vertex(134f, 430f); vertex(246f, 430f); vertex(260f, 645f); vertex(120f, 645f); endShape(CLOSE);

  fill(165, 167, 172); ellipse(222f, 162f + bobbing, 40f, 40f);
  fill(245, 185, 140); rect(132f, 190f + bobbing, 116f, 135f, 50f);

  fill(165, 167, 172);
  beginShape();
  vertex(132f, 220f + bobbing); bezierVertex(132f, 140f + bobbing, 248f, 140f + bobbing, 248f, 220f + bobbing);
  bezierVertex(248f, 232f + bobbing, 229f, 232f + bobbing, 229f, 220f + bobbing); bezierVertex(229f, 232f + bobbing, 210f, 232f + bobbing, 210f, 220f + bobbing);
  bezierVertex(210f, 232f + bobbing, 190f, 232f + bobbing, 190f, 220f + bobbing); bezierVertex(190f, 232f + bobbing, 171f, 232f + bobbing, 171f, 220f + bobbing);
  bezierVertex(171f, 232f + bobbing, 152f, 232f + bobbing, 152f, 220f + bobbing); bezierVertex(152f, 232f + bobbing, 132f, 232f + bobbing, 132f, 220f + bobbing);
  endShape(CLOSE);

  noFill(); stroke(190, 130, 100); strokeWeight(3f); arc(172f, 242f + bobbing, 24f, 6f, PI, TWO_PI); arc(172f, 250f + bobbing, 16f, 4f, PI, TWO_PI);

  fill(40, 38, 48); noStroke(); ellipse(147f, 265f + bobbing, 12f, 12f); ellipse(187f, 265f + bobbing, 12f, 12f);
  stroke(40, 38, 48); strokeWeight(4f); line(148f, 262f + bobbing, 142f, 255f + bobbing); line(153f, 259f + bobbing, 149f, 251f + bobbing); line(189f, 259f + bobbing, 193f, 251f + bobbing); line(194f, 262f + bobbing, 200f, 255f + bobbing);

  strokeWeight(3.5f); line(140f, 250f + bobbing, 156f, 256f + bobbing); line(182f, 256f + bobbing, 198f, 250f + bobbing);

  noStroke(); fill(90, 30, 25); ellipse(170f, 284f + bobbing, 9f, 2.5f + bisik * 4.0f);

  stroke(40, 38, 48); strokeWeight(6f);
  fill(160, 125, 90); rect(130f, 310f + bobbing, 120f, 150f);
  line(172f, 325f + bobbing, 172f, 460f + bobbing);

  fill(160, 125, 90); arc(152f, 310f + bobbing, 45f, 35f, 0f, PI); arc(202f, 310f + bobbing, 45f, 35f, 0f, PI);

  pushMatrix();
  translate(231f, 310f + bobbing); rotate(radians(48f)); fill(160, 125, 90); rect(-21f, 0f, 42f, 80f, 12f);
  popMatrix();

  pushMatrix();
  translate(176f, 366f + bobbing); rotate(radians(-5f)); stroke(40, 38, 48); strokeWeight(3f);
  fill(234, 229, 214); rect(-34f, -20f, 64f, 42f, 2f); fill(250, 247, 236); rect(-31f, -24f, 64f, 42f, 2f);
  stroke(150); strokeWeight(1.5f); line(-23f, -14f, 25f, -14f); line(-23f, -6f, 25f, -6f); line(-23f, 2f, 25f, 2f); line(-23f, 10f, 8f, 10f);
  popMatrix();

  stroke(40, 38, 48); strokeWeight(6f); fill(245, 185, 140); ellipse(196f, 356f + bobbing, 26f, 26f);

  popMatrix();
}
void drawSariIdleNotebook(float x, float y) {
  float waktu = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f);
  popMatrix();

  stroke(40, 38, 48); strokeWeight(6f);

  fill(102, 78, 158);
  beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 662f); vertex(128f, 662f); endShape(CLOSE);

  fill(55, 53, 65); rect(125f, 662f, 62f, 25f, 8f, 8f, 2f, 2f); rect(178f, 665f, 65f, 26f, 8f, 8f, 2f, 2f);
  fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f);
  fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f);

  ellipse(246f, 222f + bobbing, 20f, 28f); noFill(); strokeWeight(3f); arc(244f, 222f + bobbing, 8f, 10f, -HALF_PI, HALF_PI);
  strokeWeight(6f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI);

  stroke(40, 38, 48); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix();

  fill(55, 53, 65); noStroke(); ellipse(164f, 218f + bobbing, 13f, 13f); ellipse(199f, 218f + bobbing, 13f, 13f);
  stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing);

  stroke(40, 38, 48); strokeWeight(6f); noFill(); arc(181f, 238f + bobbing, 22f, 13f, 0f, PI);

  fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 175f, 15f, 15f, 0f, 0f);
  noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI);

  stroke(40, 38, 48, 60); strokeWeight(3f); line(146f, 340f + bobbing, 146f, 420f + bobbing); line(234f, 340f + bobbing, 234f, 420f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f);

  pushMatrix();
  translate(231f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f);
  popMatrix();

  pushMatrix();
  translate(231f, 280f + bobbing + 160f); rotate(radians(-10f));
  fill(250, 245, 225); stroke(40, 38, 48); strokeWeight(3f); rect(-20f, -14f, 40f, 30f, 3f);
  fill(200, 60, 60); noStroke(); rect(-20f, -14f, 5f, 30f);
  stroke(150); strokeWeight(1.5f); line(-10f, -6f, 14f, -6f); line(-10f, 0f, 14f, 0f); line(-10f, 6f, 14f, 6f);
  pushMatrix(); translate(16f, -10f); rotate(radians(20f)); noStroke(); fill(230, 190, 80); rect(-2.5f, -11f, 5f, 22f); fill(60); triangle(-2.5f, -11f, 2.5f, -11f, 0f, -16f); popMatrix();
  popMatrix();

  popMatrix();
}
void drawSariNotebookCloseup(float x, float y) {
  float waktu = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f);
  popMatrix();

  stroke(40, 38, 48); strokeWeight(6f);

  fill(102, 78, 158);
  beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 662f); vertex(128f, 662f); endShape(CLOSE);

  fill(55, 53, 65); rect(125f, 662f, 62f, 25f, 8f, 8f, 2f, 2f); rect(178f, 665f, 65f, 26f, 8f, 8f, 2f, 2f);
  fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f);
  fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f);

  ellipse(246f, 222f + bobbing, 20f, 28f); noFill(); strokeWeight(3f); arc(244f, 222f + bobbing, 8f, 10f, -HALF_PI, HALF_PI);
  strokeWeight(6f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI);

  stroke(40, 38, 48); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix();

  fill(55, 53, 65); noStroke(); ellipse(164f, 218f + bobbing, 13f, 13f); ellipse(199f, 218f + bobbing, 13f, 13f);
  stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing);

  stroke(40, 38, 48); strokeWeight(6f); noFill(); arc(181f, 238f + bobbing, 22f, 13f, 0f, PI);

  fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 175f, 15f, 15f, 0f, 0f);
  noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI);

  stroke(40, 38, 48, 60); strokeWeight(3f); line(146f, 340f + bobbing, 146f, 420f + bobbing); line(234f, 340f + bobbing, 234f, 420f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f);

  pushMatrix();
  translate(231f, 280f + bobbing); rotate(radians(42f)); fill(162, 122, 233); rect(-21f, 0f, 42f, 70f, 10f); fill(253, 197, 155); ellipse(0f, 70f, 28f, 28f);
  popMatrix();

  pushMatrix();
  translate(231f, 280f + bobbing); rotate(radians(42f)); translate(0f, 70f); rotate(radians(-42f));
  fill(250, 245, 225); stroke(40, 38, 48); strokeWeight(3f); rect(-22f, -20f, 44f, 32f, 3f);
  fill(200, 60, 60); noStroke(); rect(-22f, -20f, 5f, 32f);
  stroke(150); strokeWeight(1.5f); line(-12f, -11f, 16f, -11f); line(-12f, -4f, 16f, -4f); line(-12f, 3f, 16f, 3f);
  pushMatrix(); translate(20f, -15f); rotate(radians(25f)); noStroke(); fill(230, 190, 80); rect(-2.5f, -12f, 5f, 24f); fill(60); triangle(-2.5f, -12f, 2.5f, -12f, 0f, -17f); popMatrix();
  popMatrix();

  popMatrix();
}
void drawSariMenulis(float x, float y) {
  float waktu   = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;
  float progres = (waktu * 0.28f) % 1.0f;
  float getar = sin(waktu * 26.0f) * 1.2f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  fill(102, 78, 158);
  beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 662f); vertex(128f, 662f); endShape(CLOSE);

  fill(55, 53, 65); rect(125f, 662f, 62f, 25f, 8f, 8f, 2f, 2f); rect(178f, 665f, 65f, 26f, 8f, 8f, 2f, 2f);
  fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f);
  fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f);

  ellipse(246f, 222f + bobbing, 20f, 28f); noFill(); strokeWeight(3f); arc(244f, 222f + bobbing, 8f, 10f, -HALF_PI, HALF_PI);
  strokeWeight(6f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI);

  stroke(40, 38, 48); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix();

  fill(55, 53, 65); noStroke(); ellipse(164f, 221f + bobbing, 13f, 13f); ellipse(199f, 221f + bobbing, 13f, 13f);
  stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing);

  stroke(40, 38, 48); strokeWeight(6f); noFill(); arc(181f, 240f + bobbing, 14f, 8f, 0f, PI);

  fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 175f, 15f, 15f, 0f, 0f);
  noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI);

  stroke(40, 38, 48, 60); strokeWeight(3f); line(146f, 340f + bobbing, 146f, 420f + bobbing); line(234f, 340f + bobbing, 234f, 420f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f);

  pushMatrix();
  translate(136f, 280f + bobbing); rotate(radians(-42f)); fill(162, 122, 233); rect(-21f, 0f, 42f, 70f, 10f); fill(253, 197, 155); ellipse(0f, 70f, 28f, 28f);
  popMatrix();

  float bukuX = 196f; float bukuY = 346f + bobbing;
  pushMatrix(); translate(bukuX, bukuY);
  fill(250, 245, 225); stroke(40, 38, 48); strokeWeight(3f); rect(-22f, -20f, 44f, 32f, 3f);
  fill(200, 60, 60); noStroke(); rect(-22f, -20f, 5f, 32f);

  stroke(120); strokeWeight(1.5f);
  float sisa = progres * 84.0f;
  for (int b = 0; b < 3; b++) {
    float len = constrain(sisa, 0f, 28f);
    if (len > 0.5f) line(-12f, -11f + (float)b * 7f, -12f + len, -11f + (float)b * 7f);
    sisa -= 28f;
  }

  float dTulis = progres * 84.0f;
  int baris = min(int(dTulis / 28.0f), 2);
  float ujungX = -12f + (dTulis - (float)baris * 28f);
  float ujungY = -11f + (float)baris * 7f + getar * 0.4f;
  popMatrix();

  float tanganX = bukuX + ujungX + 14f; float tanganY = bukuY + ujungY - 20f;
  float sudut = atan2(tanganY - (290f + bobbing), tanganX - 236f);
  float panjang = dist(236f, 290f + bobbing, tanganX, tanganY);

  stroke(40, 38, 48); strokeWeight(6f);
  pushMatrix();
  translate(236f, 290f + bobbing); rotate(sudut - HALF_PI); fill(162, 122, 233); rect(-15f, 0f, 30f, panjang, 10f); fill(253, 197, 155); ellipse(0f, panjang, 24f, 24f);
  popMatrix();

  pushMatrix();
  translate(bukuX + ujungX, bukuY + ujungY); rotate(radians(45f + getar)); noStroke();
  fill(60); triangle(-3f, -7f, 3f, -7f, 0f, 0f); fill(230, 190, 80); rect(-3f, -36f, 6f, 29f, 1f); fill(235, 120, 130); rect(-3f, -41f, 6f, 5f, 2f);
  popMatrix();

  popMatrix();
}
void drawSariTempel(float x, float y) {
  float waktu = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.5f;
  float usap = sin(waktu * 2.4f) * 6f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 280f + bobbing); rotate(radians(104f + usap)); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f);
  popMatrix();

  stroke(40, 38, 48); strokeWeight(6f);

  fill(102, 78, 158);
  beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 662f); vertex(128f, 662f); endShape(CLOSE);

  fill(55, 53, 65); rect(125f, 662f, 62f, 25f, 8f, 8f, 2f, 2f); rect(178f, 665f, 65f, 26f, 8f, 8f, 2f, 2f);
  fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f);
  fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f);

  ellipse(246f, 222f + bobbing, 20f, 28f); noFill(); strokeWeight(3f); arc(244f, 222f + bobbing, 8f, 10f, -HALF_PI, HALF_PI);
  strokeWeight(6f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI);

  stroke(40, 38, 48); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing);
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix();

  fill(55, 53, 65); noStroke(); ellipse(161f, 220f + bobbing, 13f, 13f); ellipse(196f, 220f + bobbing, 13f, 13f);
  stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing);

  stroke(40, 38, 48); strokeWeight(6f); noFill(); arc(181f, 238f + bobbing, 18f, 11f, 0f, PI);

  fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 175f, 15f, 15f, 0f, 0f);
  noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI);

  stroke(40, 38, 48, 60); strokeWeight(3f); line(146f, 340f + bobbing, 146f, 420f + bobbing); line(234f, 340f + bobbing, 234f, 420f + bobbing);
  stroke(40, 38, 48); strokeWeight(6f);

  pushMatrix();
  translate(231f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f);
  popMatrix();

  popMatrix();
}
void drawDolfWalking(float x, float y) {
  float waktu = frameCount * 0.25f;
  float ayunKakiDepan     = sin(waktu) * 28f;
  float ayunKakiBelakang  = -sin(waktu) * 28f;
  float ayunLenganDepan   = -sin(waktu) * 25f;
  float ayunLenganBelakang = sin(waktu) * 25f;
  float bobbingJalan      = abs(sin(waktu * 2f)) * 6f;

  pushMatrix();
  translate(x - 45f, y);

  stroke(0); strokeWeight(5f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(35f, -425f + bobbingJalan); rotate(radians(ayunLenganBelakang)); fill(65, 67, 71); rect(-15f, 0f, 32f, 130f, 8f); fill(210, 180, 155); ellipse(0f, 130f, 26f, 26f);
  popMatrix();

  pushMatrix();
  translate(55f, -250f + bobbingJalan); rotate(radians(ayunKakiBelakang)); fill(140); rect(-22f, 0f, 44f, 210f); fill(220, 190, 165); rect(-17f, 210f, 34f, 15f); fill(220); rect(-40f, 225f, 65f, 10f, 3f);
  popMatrix();

  pushMatrix();
  translate(40f, -250f + bobbingJalan); rotate(radians(ayunKakiDepan)); fill(173, 177, 182); rect(-22f, 0f, 44f, 210f); fill(240, 210, 185); rect(-17f, 210f, 34f, 15f); fill(255); rect(-40f, 225f, 65f, 10f, 3f);
  popMatrix();

  fill(85, 87, 91); rect(-5f, -450f + bobbingJalan, 110f, 205f, 5f);
  fill(240, 210, 185); noStroke(); arc(18f, -450f + bobbingJalan, 45f, 50f, 0f, PI); stroke(0); noFill(); arc(18f, -450f + bobbingJalan, 45f, 50f, 0f, PI);

  pushMatrix();
  translate(70f, -425f + bobbingJalan); rotate(radians(ayunLenganDepan)); fill(85, 87, 91); rect(-18f, 0f, 36f, 135f, 8f); fill(240, 210, 185); ellipse(0f, 135f, 28f, 28f);
  popMatrix();

  fill(240, 210, 185); rect(-2f, -580f + bobbingJalan, 105f, 132f, 25f);
  ellipse(98f, -515f + bobbingJalan, 22f, 28f);

  fill(40); arc(50f, -572f + bobbingJalan, 110f, 90f, PI, TWO_PI); rect(78f, -572f + bobbingJalan, 25f, 55f);
  noStroke(); rect(40f, -575f + bobbingJalan, 45f, 10f); stroke(0);
  line(63f, -572f + bobbingJalan, 78f, -545f + bobbingJalan); line(78f, -517f + bobbingJalan, 103f, -517f + bobbingJalan); line(103f, -517f + bobbingJalan, 103f, -572f + bobbingJalan);

  fill(0); ellipse(15f, -515f + bobbingJalan, 14f, 14f); ellipse(45f, -515f + bobbingJalan, 14f, 14f);
  rect(15f, -492f + bobbingJalan, 20f, 20f);

  popMatrix();
}
void drawWargaPerempuanWalking(float x, float y) {
  pushMatrix();
  translate(x, y);
  translate(-195f, -660f);

  float waktu = frameCount * 0.1f;
  float ayunan = sin(waktu) * 0.35f;
  float bobbing = cos(waktu * 2f) * 2.5f;

  stroke(20); strokeWeight(4f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(190f, 270f + bobbing); rotate(-ayunan); fill(198, 75, 59); rect(-14f, 0f, 28f, 130f, 12f); fill(200, 139, 94); ellipse(0f, 130f, 30f, 30f);
  popMatrix();

  pushMatrix();
  translate(175f, 395f + bobbing); rotate(ayunan); fill(245, 245, 245); rect(-15f, 0f, 30f, 235f); fill(200, 139, 94); rect(-15f, 235f, 42f, 15f, 2f, 8f, 2f, 2f); fill(35, 125, 49); rect(-18f, 250f, 48f, 8f, 4f);
  strokeWeight(3f); line(10f, 250f, 0f, 239f); strokeWeight(4f);
  popMatrix();

  pushMatrix();
  translate(205f, 395f + bobbing); rotate(-ayunan); fill(245, 245, 245); rect(-15f, 0f, 30f, 235f); fill(200, 139, 94); rect(-15f, 235f, 42f, 15f, 2f, 8f, 2f, 2f); fill(35, 125, 49); rect(-18f, 250f, 48f, 8f, 4f);
  strokeWeight(3f); line(10f, 250f, 0f, 239f); strokeWeight(4f);
  popMatrix();

  fill(198, 75, 59); rect(155f, 260f + bobbing, 80f, 150f, 10f);
  fill(200, 139, 94); arc(200f, 260f + bobbing, 40f, 25f, 0f, PI);

  fill(44, 44, 44); ellipse(142f, 195f + bobbing, 36f, 46f);
  fill(200, 139, 94); rect(155f, 145f + bobbing, 90f, 115f, 45f);

  fill(44, 44, 44);
  beginShape(); vertex(155f, 210f + bobbing); bezierVertex(140f, 130f + bobbing, 250f, 130f + bobbing, 248f, 190f + bobbing); bezierVertex(235f, 160f + bobbing, 185f, 160f + bobbing, 155f, 210f + bobbing); endShape(CLOSE);

  fill(200, 139, 94); ellipse(162f, 205f + bobbing, 20f, 25f); noFill(); strokeWeight(2f); arc(159f, 205f + bobbing, 10f, 12f, HALF_PI, PI + HALF_PI); strokeWeight(4f);

  fill(20); noStroke(); ellipse(208f, 195f + bobbing, 14f, 14f); ellipse(235f, 195f + bobbing, 14f, 14f);
  noFill(); stroke(20); strokeWeight(4f); arc(224f, 220f + bobbing, 14f, 8f, 0f, PI);

  pushMatrix();
  translate(190f, 270f + bobbing); rotate(ayunan); fill(198, 75, 59); rect(-14f, 0f, 28f, 130f, 12f); fill(200, 139, 94); ellipse(0f, 130f, 30f, 30f);
  popMatrix();

  popMatrix();
}
void drawBuDarmiBicara(float x, float y) {
  float waktu = frameCount * 0.05f;
  float mouthCycle = (sin(waktu * 7.0f) + 1.0f) / 2.0f;
  float mouthOpen = mouthCycle * mouthCycle;
  float bobbing = sin(waktu) * 2.5f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 310f + bobbing); fill(160, 125, 90); rect(-21f, 0f, 42f, 150f, 12f); fill(245, 185, 140); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  pushMatrix(); translate(168f, 430f); fill(245, 185, 140); rect(-10f, 0f, 20f, 220f); fill(55, 53, 65); rect(-28f, 215f, 55f, 25f, 8f, 8f, 2f, 2f); popMatrix();
  pushMatrix(); translate(220f, 430f); fill(245, 185, 140); rect(-10f, 0f, 20f, 220f); fill(55, 53, 65); rect(-30f, 215f, 55f, 25f, 8f, 8f, 2f, 2f); popMatrix();

  fill(110, 85, 60);
  beginShape(); vertex(134f, 430f); vertex(246f, 430f); vertex(260f, 645f); vertex(120f, 645f); endShape(CLOSE);

  fill(165, 167, 172); ellipse(222f, 162f + bobbing, 40f, 40f);
  fill(245, 185, 140); rect(132f, 190f + bobbing, 116f, 135f, 50f);

  fill(165, 167, 172);
  beginShape();
  vertex(132f, 220f + bobbing); bezierVertex(132f, 140f + bobbing, 248f, 140f + bobbing, 248f, 220f + bobbing);
  bezierVertex(248f, 232f + bobbing, 229f, 232f + bobbing, 229f, 220f + bobbing); bezierVertex(229f, 232f + bobbing, 210f, 232f + bobbing, 210f, 220f + bobbing);
  bezierVertex(210f, 232f + bobbing, 190f, 232f + bobbing, 190f, 220f + bobbing); bezierVertex(190f, 232f + bobbing, 171f, 232f + bobbing, 171f, 220f + bobbing);
  bezierVertex(171f, 232f + bobbing, 152f, 232f + bobbing, 152f, 220f + bobbing); bezierVertex(152f, 232f + bobbing, 132f, 232f + bobbing, 132f, 220f + bobbing);
  endShape(CLOSE);

  noFill(); stroke(190, 130, 100); strokeWeight(3f); arc(172f, 242f + bobbing, 24f, 6f, PI, TWO_PI); arc(172f, 250f + bobbing, 16f, 4f, PI, TWO_PI);

  fill(40, 38, 48); noStroke(); ellipse(152f, 265f + bobbing, 12f, 12f); ellipse(192f, 265f + bobbing, 12f, 12f);
  stroke(40, 38, 48); strokeWeight(4f); line(148f, 262f + bobbing, 142f, 255f + bobbing); line(153f, 259f + bobbing, 149f, 251f + bobbing); line(189f, 259f + bobbing, 193f, 251f + bobbing); line(194f, 262f + bobbing, 200f, 255f + bobbing);

  noStroke(); fill(90, 30, 25);
  float darmiMouthH = 2f + mouthOpen * 10f;
  ellipse(172f, 282f + bobbing, 16f, darmiMouthH);
  if (mouthOpen > 0.35f) {
    fill(200, 90, 90); ellipse(172f, 282f + bobbing + darmiMouthH * 0.15f, 10f, darmiMouthH * 0.4f);
  }
  stroke(40, 38, 48); strokeWeight(6f);

  fill(160, 125, 90); rect(130f, 310f + bobbing, 120f, 150f); line(172f, 325f + bobbing, 172f, 460f + bobbing);
  fill(160, 125, 90); arc(152f, 310f + bobbing, 45f, 35f, 0f, PI); arc(202f, 310f + bobbing, 45f, 35f, 0f, PI);

  pushMatrix(); translate(231f, 310f + bobbing); fill(160, 125, 90); rect(-21f, 0f, 42f, 150f, 12f); fill(245, 185, 140); ellipse(0f, 150f, 32f, 32f); popMatrix();
  popMatrix();
}
void drawKarsoBackView(float x, float y) {
  float waktu = frameCount * 0.05f;
  float bobbing = sin(waktu) * 2.0f;

  pushMatrix();
  translate(x, y);
  translate(-194f, -672f);

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix();
  translate(136f, 280f + bobbing); fill(175, 140, 95); rect(-21f, 0f, 42f, 150f, 12f); fill(235, 155, 120); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  pushMatrix();
  translate(168f, 415f); fill(175, 140, 95); rect(-26f, 0f, 52f, 235f); fill(240, 240, 230); rect(-18f, 235f, 34f, 15f); fill(55, 53, 65); rect(-43f, 247f, 62f, 25f, 8f, 8f, 2f, 2f);
  popMatrix();

  pushMatrix();
  translate(220f, 415f); fill(175, 140, 95); rect(-26f, 0f, 52f, 235f); fill(240, 240, 230); rect(-18f, 235f, 34f, 15f); fill(55, 53, 65); rect(-42f, 250f, 65f, 26f, 8f, 8f, 2f, 2f);
  popMatrix();

  fill(175, 140, 95); rect(130f, 280f + bobbing, 120f, 150f);
  fill(235, 155, 120); rect(170f, 265f + bobbing, 40f, 30f, 5f);

  pushMatrix();
  translate(231f, 280f + bobbing); fill(175, 140, 95); rect(-21f, 0f, 42f, 150f, 12f); fill(235, 155, 120); ellipse(0f, 150f, 32f, 32f);
  popMatrix();

  fill(235, 155, 120); rect(132f, 160f + bobbing, 116f, 115f, 45f);
  fill(40, 38, 48); rect(128f, 140f + bobbing, 120f, 60f, 40f, 40f, 0f, 0f);

  popMatrix();
}
void drawBuSariDuduk(float x, float y) {
  float waktu = frameCount * 0.1f;       
  float bobbing = sin(waktu) * 3.0f; 

  pushMatrix(); translate(x, y); translate(-194f, -450f); 
  color warnaKulit = color(253, 199, 161); color warnaBaju = color(146, 120, 187);
  color warnaRok = color(104, 73, 124);    color warnaJilbab = color(118, 99, 166); color warnaGaris = color(40, 38, 48); 
  stroke(warnaGaris); strokeWeight(7f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(140f, 290f + bobbing); fill(warnaKulit); ellipse(0f, 100f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 90f, 15f); popMatrix(); 
  fill(warnaRok); rect(-45f, 415f, 90f, 100f, 5f); 
  pushMatrix(); translate(194f, 280f + bobbing); fill(warnaBaju); rect(-50f, 0f, 100f, 140f, 20f, 20f, 5f, 5f); fill(warnaKulit); arc(0f, 0f, 30f, 20f, 0f, PI); popMatrix(); 
  pushMatrix(); translate(194f, 210f + bobbing); fill(warnaJilbab); ellipse(5f, 0f, 135f, 155f); fill(warnaKulit); ellipse(-5f, 0f, 110f, 110f); fill(warnaGaris); noStroke(); ellipse(-25f, -5f, 14f, 14f); ellipse(25f, -5f, 14f, 14f); stroke(warnaGaris); strokeWeight(3f); line(-37f, -12f, -32f, -7f); line(-33f, -17f, -28f, -12f); line(37f, -12f, 32f, -7f); line(33f, -17f, 28f, -12f); noFill(); strokeWeight(4f); arc(0f, 20f, 25f, 15f, 0f, PI); popMatrix(); 
  strokeWeight(7f); pushMatrix(); translate(248f, 290f + bobbing); fill(warnaKulit); ellipse(0f, 100f, 25f, 25f); fill(warnaBaju); rect(-15f, 0f, 30f, 90f, 15f); popMatrix(); 
  popMatrix();  
}
void drawSariDuduk(float x, float y) {
  float waktu = frameCount * 0.1f;       
  float bobbing = sin(waktu + 1.0f) * 3.0f; 

  pushMatrix(); translate(x, y); translate(-194f, -450f); 
  stroke(40, 38, 48); strokeWeight(7f); strokeJoin(ROUND); strokeCap(ROUND);

  pushMatrix(); translate(136f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 120f, 12f); fill(253, 197, 155); ellipse(0f, 120f, 32f, 32f); popMatrix(); 
  fill(102, 78, 158); beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(255f, 520f); vertex(133f, 520f); endShape(CLOSE); 
  fill(55, 53, 65); rect(124f, 150f + bobbing, 138f, 142f, 65f, 65f, 35f, 35f); fill(253, 197, 155); rect(132f, 160f + bobbing, 116f, 120f, 48f); ellipse(246f, 222f + bobbing, 20f, 28f); fill(55, 53, 65); arc(190f, 182f + bobbing, 118f, 52f, PI, TWO_PI); line(165f, 158f + bobbing, 172f, 172f + bobbing); line(210f, 156f + bobbing, 206f, 170f + bobbing); 
  fill(243, 143, 153); pushMatrix(); translate(144f, 158f + bobbing); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); fill(255, 190, 200); ellipse(0f, 0f, 6f, 6f); popMatrix(); 
  fill(55, 53, 65); noStroke(); ellipse(164f, 218f + bobbing, 13f, 13f); ellipse(199f, 218f + bobbing, 13f, 13f); stroke(55, 53, 65); strokeWeight(3f); line(157f, 214f + bobbing, 151f, 210f + bobbing); line(156f, 220f + bobbing, 150f, 218f + bobbing); line(205f, 214f + bobbing, 211f, 210f + bobbing); line(204f, 220f + bobbing, 210f, 218f + bobbing); stroke(40, 38, 48); strokeWeight(7f); noFill(); arc(181f, 238f + bobbing, 22f, 13f, 0f, PI); 
  fill(162, 122, 233); rect(130f, 280f + bobbing, 120f, 150f, 15f, 15f, 0f, 0f); noFill(); arc(190f, 280f + bobbing, 36f, 16f, 0f, PI); 
  pushMatrix(); translate(231f, 280f + bobbing); fill(162, 122, 233); rect(-21f, 0f, 42f, 120f, 12f); fill(253, 197, 155); ellipse(0f, 120f, 32f, 32f); popMatrix(); 
  popMatrix();  
}
void drawBuSariDiTruk(float x, float y) {
  pushMatrix(); translate(x, y); translate(-194f, -450f); 
  color warnaKulit = color(253, 199, 161); color warnaBaju = color(146, 120, 187);
  color warnaRok = color(104, 73, 124);    color warnaJilbab = color(118, 99, 166); color warnaGaris = color(40, 38, 48); 
  stroke(warnaGaris); strokeWeight(7f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(136f, 280f); fill(warnaBaju); rect(-21f, 0f, 42f, 110f, 12f); fill(warnaKulit); ellipse(0f, 110f, 32f, 32f); popMatrix();
  fill(warnaRok); beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(255f, 520f); vertex(133f, 520f); endShape(CLOSE);
  pushMatrix(); translate(194f, 210f); fill(warnaJilbab); ellipse(5f, 0f, 135f, 155f); fill(warnaKulit); ellipse(-5f, 0f, 110f, 110f); fill(warnaGaris); noStroke(); ellipse(-25f, -5f, 14f, 14f); ellipse(25f, -5f, 14f, 14f); stroke(warnaGaris); strokeWeight(3f); line(-37f, -12f, -32f, -7f); line(37f, -12f, 32f, -7f); noFill(); strokeWeight(4f); arc(0f, 20f, 25f, 15f, 0f, PI); popMatrix();
  stroke(warnaGaris); strokeWeight(7f); fill(warnaBaju); rect(130f, 280f, 120f, 140f, 15f, 15f, 0f, 0f);
  pushMatrix(); translate(231f, 280f); fill(warnaBaju); rect(-21f, 0f, 42f, 110f, 12f); fill(warnaKulit); ellipse(0f, 110f, 32f, 32f); popMatrix();
  popMatrix(); 
}
void drawSariDiTruk(float x, float y) {
  pushMatrix(); translate(x, y); translate(-194f, -450f); 
  stroke(40, 38, 48); strokeWeight(7f); strokeJoin(ROUND); strokeCap(ROUND);
  pushMatrix(); translate(136f, 280f); fill(162, 122, 233); rect(-21f, 0f, 42f, 110f, 12f); fill(253, 197, 155); ellipse(0f, 110f, 32f, 32f); popMatrix();
  fill(102, 78, 158); beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(255f, 520f); vertex(133f, 520f); endShape(CLOSE);
  fill(55, 53, 65); rect(124f, 150f, 138f, 142f, 65f, 65f, 35f, 35f); fill(253, 197, 155); rect(132f, 160f, 116f, 120f, 48f); ellipse(246f, 222f, 20f, 28f); 
  fill(55, 53, 65); arc(190f, 182f, 118f, 52f, PI, TWO_PI); pushMatrix(); translate(144f, 158f); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); popMatrix();
  fill(55, 53, 65); noStroke(); ellipse(164f, 218f, 13f, 13f); ellipse(199f, 218f, 13f, 13f); stroke(40, 38, 48); strokeWeight(7f); noFill(); arc(181f, 238f, 22f, 13f, 0f, PI);
  stroke(40, 38, 48); strokeWeight(7f); fill(162, 122, 233); rect(130f, 280f, 120f, 140f, 15f, 15f, 0f, 0f);
  pushMatrix(); translate(231f, 280f); fill(162, 122, 233); rect(-21f, 0f, 42f, 110f, 12f); fill(253, 197, 155); ellipse(0f, 110f, 32f, 32f); popMatrix();
  popMatrix(); 
}
void drawBuSariDiamDiTanah(float x, float y) {
  pushMatrix(); translate(x, y); translate(-194f, -420f); 
  color warnaKulit = color(253, 199, 161); color warnaBaju = color(146, 120, 187); color warnaRok = color(104, 73, 124); 
  color warnaJilbab = color(118, 99, 166); color warnaSepatu = color(70, 68, 76); color warnaGaris = color(40, 38, 48); 
  stroke(warnaGaris); strokeWeight(7f); strokeJoin(ROUND); strokeCap(ROUND);
  fill(warnaSepatu); rect(150f, 560f, 35f, 18f, 6f); rect(205f, 560f, 35f, 18f, 6f); 
  pushMatrix(); translate(136f, 280f); fill(warnaBaju); rect(-12f, 0f, 24f, 110f, 10f); fill(warnaKulit); ellipse(0f, 110f, 22f, 22f); popMatrix();
  fill(warnaRok); beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 560f); vertex(128f, 560f); endShape(CLOSE);
  stroke(warnaGaris); fill(warnaBaju); rect(130f, 280f, 120f, 140f, 15f, 15f, 0f, 0f);
  pushMatrix(); translate(194f, 210f); fill(warnaJilbab); ellipse(5f, 0f, 135f, 155f); fill(warnaKulit); ellipse(-5f, 0f, 110f, 110f); stroke(warnaGaris); strokeWeight(5f); line(-35f, -2f, -15f, -5f); line(15f, -5f, 35f, -2f); noFill(); strokeWeight(4f); line(-10f, 20f, 10f, 20f); popMatrix(); 
  stroke(warnaGaris); strokeWeight(7f); pushMatrix(); translate(231f, 280f); fill(warnaBaju); rect(-12f, 0f, 24f, 110f, 10f); fill(warnaKulit); ellipse(0f, 110f, 22f, 22f); popMatrix();
  popMatrix(); 
}
void drawSariDiamDiTanah(float x, float y) {
  pushMatrix(); translate(x, y); translate(-194f, -420f); 
  stroke(40, 38, 48); strokeWeight(7f); strokeJoin(ROUND); strokeCap(ROUND);
  fill(55, 53, 65); rect(150f, 560f, 35f, 18f, 6f); rect(205f, 560f, 35f, 18f, 6f); 
  pushMatrix(); translate(136f, 280f); fill(162, 122, 233); rect(-12f, 0f, 24f, 110f, 10f); fill(253, 197, 155); ellipse(0f, 110f, 22f, 22f); popMatrix();
  fill(102, 78, 158); beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 560f); vertex(128f, 560f); endShape(CLOSE);
  fill(55, 53, 65); rect(124f, 150f, 138f, 142f, 65f, 65f, 35f, 35f); fill(253, 197, 155); rect(132f, 160f, 116f, 120f, 48f); ellipse(246f, 222f, 20f, 28f); fill(55, 53, 65); arc(190f, 182f, 118f, 52f, PI, TWO_PI); pushMatrix(); translate(144f, 158f); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); popMatrix();
  stroke(55, 53, 65); strokeWeight(5f); line(152f, 218f, 172f, 216f); line(190f, 216f, 210f, 218f); strokeWeight(4f); line(170f, 240f, 192f, 240f); 
  stroke(40, 38, 48); strokeWeight(7f); fill(162, 122, 233); rect(130f, 280f, 120f, 140f, 15f, 15f, 0f, 0f);
  pushMatrix(); translate(231f, 280f); fill(162, 122, 233); rect(-12f, 0f, 24f, 110f, 10f); fill(253, 197, 155); ellipse(0f, 110f, 22f, 22f); popMatrix();
  popMatrix(); 
}

// =================================================================
// Actors.pde — FILE MASTER UTUH (FIXED: Added drawSariHeranDiam)
// =================================================================

// [KODE KARSO & IBU SARI YANG SEBELUMNYA TETAP DI SINI...]

// (Copy-paste semua fungsi di atas, lalu pastikan di paling bawah kamu tambahkan ini:)

// =========================================================
// SARI — HERAN (BROW_RAISE) — FUNGSI YANG KEMARIN HILANG
// =========================================================
void drawSariHeranDiam(float x, float y) {
  pushMatrix();
  translate(x, y);
  translate(-194f, -672f); 

  stroke(40, 38, 48); strokeWeight(6f); strokeJoin(ROUND); strokeCap(ROUND);

  // Lengan Belakang
  pushMatrix(); translate(136f, 280f); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix();

  // Rok Trapesium
  fill(102, 78, 158); 
  beginShape(); vertex(142f, 415f); vertex(246f, 415f); vertex(260f, 662f); vertex(128f, 662f); endShape(CLOSE);

  // Sepatu
  fill(55, 53, 65); 
  rect(125f, 662f, 62f, 25f, 8f, 8f, 2f, 2f); rect(178f, 662f, 65f, 26f, 8f, 8f, 2f, 2f);

  // Kepala & Rambut
  fill(55, 53, 65); rect(124f, 150f, 138f, 142f, 65f, 65f, 35f, 35f);
  fill(253, 197, 155); rect(132f, 160f, 116f, 120f, 48f);
  ellipse(246f, 222f, 20f, 28f);
  fill(55, 53, 65); arc(190f, 182f, 118f, 52f, PI, TWO_PI);
  
  // Pita Pink
  fill(243, 143, 153);
  pushMatrix(); translate(144f, 158f); rotate(radians(-15f)); triangle(0f, 0f, -13f, -8f, -13f, 8f); triangle(0f, 0f, 13f, -8f, 13f, 8f); popMatrix();

  // MATA & ALIS HERAN
  fill(55, 53, 65); noStroke();
  ellipse(164f, 218f, 13f, 13f); 
  ellipse(199f, 218f, 13f, 13f); 

  stroke(40, 38, 48); strokeWeight(4f); noFill();
  line(152f, 202f, 172f, 202f);  
  beginShape(); vertex(188f, 204f); bezierVertex(193f, 185f, 205f, 185f, 212f, 195f); endShape();

  stroke(40, 38, 48); strokeWeight(5f); fill(243, 143, 153);
  ellipse(181f, 242f, 14f, 16f);

  stroke(40, 38, 48); strokeWeight(6f); fill(162, 122, 233);
  rect(130f, 280f, 120f, 175f, 15f, 15f, 0f, 0f);

  pushMatrix(); translate(231f, 280f); fill(162, 122, 233); rect(-21f, 0f, 42f, 160f, 12f); fill(253, 197, 155); ellipse(0f, 160f, 32f, 32f); popMatrix();

  popMatrix(); 
}

// [TAMBAHKAN SISA FUNGSI PENGAMAN LAINNYA DI BAWAH INI...]
