/**
 * ============================================================
 * S20 — PAGI: WARGA LAIN DATANG DAN IKUT MENULIS DI PAPAN
 * ============================================================
 * Struktur folder: Menggunakan localTime (detik).
 * Alur adegan:
 *   - 0.0 - 2.5s  : Pak Dolf & Ibu Sari berjalan masuk dari kiri jalan.
 *   - 2.5 - 8.0s  : Pak Dolf bicara (5.5s), Ibu Sari mengangguk di sebelahnya.
 *   - 8.0 - 11.0s : Bu Darmi bicara takjub (3.0s), Pak Dolf & Ibu Sari maju ke papan.
 *   - 11.0 - 15.3s: Sari menjawab (4.3s), Pak Dolf & Ibu Sari menulis di papan.
 */

void sceneS20(float localTime) {
  // 1. Render Latar Belakang & Papan Informasi (Fungsi global dari S18.pde)
  drawBackgroundPagi();
  drawPapanInformasi();
  drawDaunBeringin();

  // Properti sisa kegiatan menempel di tanah
  drawGulunganKertas(540, 703);
  drawEmberLem(622, 706);

  // Posisi konstan barisan samping kiri luar tiang (dari scene sebelumnya)
  float darmiX = 170;
  float sariX = 250;
  float rahmaX = 430;

  // 2. Logika Pergerakan Koordinat X & Pose Pak Dolf + Ibu Sari
  float dolfX, busariX;
  boolean isWalkingState = false;
  boolean isDolfTalking = false;
  boolean isBuSariNodding = false;
  boolean isDarmiTalking = false;
  boolean isSariTalking = false;

  if (localTime < 2.5) {
    // Fase 1: Berjalan Masuk dari kiri (0.0 - 2.5s)
    float t = localTime / 2.5;
    dolfX = lerp(-100, 520, t);
    busariX = lerp(-180, 600, t);
    isWalkingState = true;
    isDolfTalking = false;
    isBuSariNodding = false;
    isDarmiTalking = false;
    isSariTalking = false;
  } else if (localTime >= 2.5 && localTime < 8.0) {
    // Fase 2: Pak Dolf Bicara & Ibu Sari Mengangguk (2.5 - 8.0s)
    dolfX = 520;
    busariX = 600;
    isWalkingState = false;
    isDolfTalking = true;
    isBuSariNodding = true;
    isDarmiTalking = false;
    isSariTalking = false;
  } else if (localTime >= 8.0 && localTime < 11.0) {
    // Fase 3: Bu Darmi Protes & Duo Maju ke Papan (8.0 - 11.0s)
    float t = (localTime - 8.0) / 3.0; // Durasi sinkronisasi 3 detik penuh
    dolfX = lerp(520, 580, t);
    busariX = lerp(600, 680, t);
    isWalkingState = true; 
    isDolfTalking = false;
    isBuSariNodding = false;
    isDarmiTalking = true; // Bu Darmi mulai berbicara
    isSariTalking = false;
  } else {
    // Fase 4: Sari Menjawab Protes & Duo Menulis di Papan (11.0 - 15.3s)
    dolfX = 580;
    busariX = 680;
    isWalkingState = false;
    isDolfTalking = false;
    isBuSariNodding = false;
    isDarmiTalking = false;
    isSariTalking = true; // KOREKSI: Sari berbicara lancar di detik 11.0 ke atas
  }

  // 3. Render Bayangan Semua Aktor di Atas Jalan Tanah
  noStroke();
  fill(40, 26, 12, 40);
  ellipse(darmiX, 692, 130, 18);
  ellipse(sariX, 690, 132, 18);
  ellipse(rahmaX, 692, 130, 18);
  ellipse(dolfX, 692, 130, 18);
  ellipse(busariX, 695, 130, 18);

  // 4. Render Aktor Bu Darmi (Hadap Kanan)
  pushMatrix();
  translate(darmiX, 688);
  scale(-1, 1); 
  scale(0.66);
  if (isDarmiTalking) {
    drawBuDarmiBicara(0, 0); // Animasi mulut bergerak dari Actors.pde
  } else {
    drawBuDarmiIdle(0, 0);
  }
  popMatrix();

  // 5. Render Aktor Sari (Hadap Kanan)
  pushMatrix();
  translate(sariX, 684);
  scale(-1, 1); 
  scale(0.68);
  if (isSariTalking) {
    drawSariBicara(0, 0);    // KOREKSI S20: Memanggil fungsi mulut bergerak membuka-tutup
  } else {
    drawSariIdle(0, 0);
  }
  popMatrix();

  // 6. Render Aktor Bu Rahma (Diam mengernyit melihat papan anggaran)
  pushMatrix();
  translate(rahmaX, 685);
  scale(0.67);
  drawWargaPerempuanIdle(0, 0); 
  popMatrix();

  // 7. Render Aktor Pak Dolf
  pushMatrix();
  translate(dolfX, 685);
  scale(0.67);
  if (isWalkingState) {
    scale(-1, 1); 
    drawDolfWalking(0, 0);
  } else if (isDolfTalking) {
    drawDolfBicara(0, 0); 
  } else {
    drawDolfIdle(0, 0); // Menghadap kanan (papan) saat menulis
  }
  popMatrix();

  // 8. Render Aktor Ibu Sari (Selalu Hadap Kanan)
  pushMatrix();
  float buSariBobbing = 0;
  if (isBuSariNodding) {
    buSariBobbing = abs(sin(frameCount * 0.15)) * -4; 
  }
  translate(busariX, 688 + buSariBobbing);
  scale(-1, 1); 
  scale(0.65);
  if (isWalkingState) {
    drawBuSariWalking(0, 0); 
  } else {
    drawBuSariIdle(0, 0);    
  }
  popMatrix();

  // 9. Sistem Bubble Chat Dialog (Dipanggil otomatis dari UI.pde)
  if (localTime >= 2.5 && localTime < 8.0) {
    drawDialogBubble("PAK DOLF", "Sumur di RT 4 juga harusnya dapat dana perbaikan. Tapi sampai sekarang belum ada.");
  } else if (localTime >= 8.0 && localTime < 11.0) {
    drawDialogBubble("BU DARMI", "Mereka... mau bersatu..");
  } else if (localTime >= 11.0 && localTime < 15.3) {
    drawDialogBubble("SARI", "Mereka selalu mau, Bu. Mereka cuma butuh tempat untuk mulai.");
  }
}
