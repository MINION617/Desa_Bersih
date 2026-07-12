/**
 * ============================================================
 * S23 — SLOW FADE TO BLACK & AKHIR CERITA
 * ============================================================
 */

void sceneS23(float localTime) {
  // Latar belakang papan kayu
  background(92, 61, 34); 
  
  pushMatrix();
  translate(640, 360); 
  scale(2.0); 
  
  // Panning kamera sangat halus ke kanan bawah
  translate(-640 - (localTime * 15), -380 - (localTime * 8)); 
  
  drawPapanInformasi();
  
  // Coretan ekstra warga (papan makin penuh)
  stroke(74, 84, 100, 200); strokeWeight(2.5);
  line(410, 460, 550, 455); 
  line(570, 465, 780, 460); 
  line(430, 490, 680, 485);
  popMatrix();

  // Voice Over Penutup
  drawDialogBubble("NARATOR (VO)", "Kadang, ia dimulai dari satu pertanyaan.");

  // Efek Slow Fade to Black
  float fadeAlpha = map(localTime, 2.0, 6.0, 0, 255);
  fadeAlpha = constrain(fadeAlpha, 0, 255);
  
  noStroke();
  fill(0, 0, 0, fadeAlpha);
  rect(0, 0, width, height);

  // ---- Credit scroll, mulai setelah layar full item di detik 6.0 ----
  if (localTime >= 6.0) {
    fill(0);
    rect(0, 0, width, height);
    drawCreditsScroll(localTime - 6.0);
  }
}

// =========================================================
// CREDITS SCROLL (nyambung di akhir S23, ~20 detik)
// =========================================================
String[][] creditLines = {
  {"header", "Cast"},
  {"pair", "Ahmad Riza Hafiz", "sebagai Narator"},
  {"pair", "Muhammad Rangga Pratama", "sebagai Pak Karso dan Pak Dolf"},
  {"pair", "Zatya Nurmalia Septyanda Z", "sebagai Bu Sari dan Bu Darmi"},
  {"pair", "Dwi Pramesti", "sebagai Sari dan Bu Rahma"},
  {"spacer", ""},
  {"pair", "Sutradara", "Ahmad Riza Hafiz"},
  {"pair", "Penulis Naskah", "Ahmad Riza Hafiz"},
  {"pair", "Editor", "Ahmad Riza Hafiz"},
  {"roleHeader", "Ilustrator / Animator"},
  {"names", "Ahmad Riza Hafiz, Muhammad Rangga Pratama"},
  {"names", "Zatya Nurmalia Septyanda Z, Dwi Pramesti"},
  {"pair", "Dosen Pembimbing", "Ir. Izzati Muhimmah, S.T., M.Sc., Ph.D."},
  {"roleHeader", "Sound Design / Musik"},
  {"names", "Ahmad Riza Hafiz, Muhammad Rangga Pratama"},
  {"names", "Zatya Nurmalia Septyanda Z, Dwi Pramesti"},
  {"spacer", ""},
  {"spacer", ""},
  {"title", "DESA BERSIH"},
  {"subtitle", "2026"}
};

void drawCreditsScroll(float creditTime) {
  // Hitung tinggi total konten dulu
  float[] lineHeights = new float[creditLines.length];
  float totalH = 0;
  for (int i = 0; i < creditLines.length; i++) {
    String type = creditLines[i][0];
    float h = 40; // default (pair)
    if (type.equals("header")) h = 60;
    else if (type.equals("spacer")) h = 30;
    else if (type.equals("roleHeader")) h = 34;
    else if (type.equals("names")) h = 28;
    else if (type.equals("title")) h = 70;
    else if (type.equals("subtitle")) h = 40;
    lineHeights[i] = h;
    totalH += h;
  }

  float creditDuration = 20.0; // detik, total durasi scroll
  float speed = (height + totalH) / creditDuration;
  float topY = height - speed * creditTime; // posisi Y baris paling atas

  float y = topY;
  textAlign(CENTER, CENTER);
  for (int i = 0; i < creditLines.length; i++) {
    String type = creditLines[i][0];
    String a = creditLines[i][1];
    String b = creditLines[i].length > 2 ? creditLines[i][2] : "";
    float h = lineHeights[i];

    if (y > -h && y < height + h) { // cuma gambar yang kelihatan di layar (hemat)
      if (type.equals("header")) {
        fill(255);
        textSize(34);
        textAlign(CENTER, CENTER);
        text(a, width / 2.0, y);
      } else if (type.equals("title")) {
        fill(255);
        textSize(46);
        textAlign(CENTER, CENTER);
        text(a, width / 2.0, y);
      } else if (type.equals("subtitle")) {
        fill(200);
        textSize(22);
        textAlign(CENTER, CENTER);
        text(a, width / 2.0, y);
      } else if (type.equals("roleHeader")) {
        fill(255);
        textSize(20);
        textAlign(CENTER, CENTER);
        text(a, width / 2.0, y);
      } else if (type.equals("names")) {
        fill(210);
        textSize(17);
        textAlign(CENTER, CENTER);
        text(a, width / 2.0, y);
      } else if (type.equals("pair")) {
        textSize(20);
        fill(255);
        textAlign(RIGHT, CENTER);
        text(a, width / 2.0 - 20, y);
        fill(210);
        textAlign(LEFT, CENTER);
        text(b, width / 2.0 + 20, y);
      }
    }
    y += h;
  }
}
