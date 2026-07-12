/**
 * ============================================================
 * S19 — PAGI: BU RAHMA DATANG & KAGET MELIHAT ANGGARAN
 * ============================================================
 * Struktur folder: Menggunakan localTime (detik).
 * Alur adegan:
 *   - 0.0 - 3.0s  : Bu Rahma berjalan dari kiri jalan menuju depan papan informasi.
 *   - 3.0 - 6.5s  : Bu Rahma berhenti kaget, mengernyit, dan bergumam protes.
 *   - Sari & Bu Darmi tetap diam di posisinya (X=250 & X=170) menghadap kanan.
 */

void sceneS19(float localTime) {
  // 1. Render Latar Belakang & Papan Informasi (Memanggil fungsi global dari S18.pde)
  drawBackgroundPagi();
  drawPapanInformasi();
  drawDaunBeringin();

  // Properti sisa kegiatan menempel di tanah
  drawGulunganKertas(540, 703);
  drawEmberLem(622, 706);

  // Posisi konstan Sari & Bu Darmi berjejer di samping kiri papan (posisi akhir S18)
  float darmiX = 170;
  float sariX = 250;

  // 2. Logika Pergerakan Koordinat X Bu Rahma
  float rahmaX;
  boolean isWalking = false;

  if (localTime < 3.0) {
    // Fase 1: Proses berjalan dari kiri jalan (durasi 3 detik)
    float t = localTime / 3.0;
    rahmaX = lerp(-100, 450, t); // Bergerak dari luar layar kiri ke depan papan
    isWalking = true;
  } else {
    // Fase 2: Berhenti di depan papan dan menunjukkan ekspresi kaget
    rahmaX = 450;
    isWalking = false;
  }

  // 3. Render Bayangan Semua Aktor di Atas Jalan Tanah
  noStroke();
  fill(40, 26, 12, 40);
  ellipse(darmiX, 692, 130, 18);
  ellipse(sariX, 690, 132, 18);
  ellipse(rahmaX, 692, 130, 18); // Bayangan dinamis Bu Rahma

  // 4. Render Aktor Bu Darmi (Tetap diam menghadap kanan memandangi papan)
  pushMatrix();
  translate(darmiX, 688);
  scale(-1, 1); // Membalik arah hadap bawaan menjadi ke kanan
  scale(0.66);
  drawBuDarmiIdle(0, 0);
  popMatrix();

  // 5. Render Aktor Sari (Tetap diam menghadap kanan memandangi papan)
  pushMatrix();
  translate(sariX, 684);
  scale(-1, 1); // Membalik arah hadap bawaan menjadi ke kanan
  scale(0.68);
  drawSariIdle(0, 0);
  popMatrix();

  // 6. Render Aktor Bu Rahma
  pushMatrix();
  translate(rahmaX, 685);
  scale(0.67); // Skala proporsional disesuaikan dengan tinggi lantai
  if (isWalking) {
    drawWargaPerempuanWalking(0, 0); // Fungsi animasi jalan dari Actors.pde
  } else {
    drawWargaPerempuanBicara(0, 0); // Fungsi mulut animasi bicara/mengernyit kaget
  }
  popMatrix();

  // 7. Sistem Bubble Chat Dialog (Dipanggil otomatis dari UI.pde)
  if (localTime >= 3.0 && localTime < 6.5) {
    drawDialogBubble("BU RAHMA", "Lho... ini dana jalan kok segini?");
  }
}
