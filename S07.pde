// =========================================================
// S07.pde (14 dtk)
// Karso pidato di tengah panggung, warga mendengarkan.
// Tab ini juga menjadi tempat didefinisikannya helper placeActor()
// yang digunakan oleh seluruh shot di project ini.
// =========================================================

final float S07_CHAR_SCALE = 0.33;

void sceneS07(float localTime) {
  // 1. Gambar background bersama
  image(bgS07toS12, 0, 0, width, height);

  // 2. Taruh Pak Karso di panggung tengah dengan pose pidato
  placeActor(width / 2.0, 580, S07_CHAR_SCALE, "karsoPidato");

  // 3. Taruh warga di karpet kiri (Pak Dolf & Bu Rahma dalam kondisi diam/idle mendengarkan)
  placeActor(320, 600, S07_CHAR_SCALE, "dolfIdle");
  placeActor(400, 600, S07_CHAR_SCALE, "rahmaIdle");

  // 4. Taruh warga di karpet kanan (Sari bawa buku, Bu Darmi, Ibu Sari)
  placeActor(880, 600, S07_CHAR_SCALE, "sariNotebook");
  placeActor(960, 600, S07_CHAR_SCALE, "buDarmiIdle");
  placeActor(1040, 600, S07_CHAR_SCALE, "buSariIdle");

  // ---- Dialog Karso ----
  drawDialogBubble("PAK KARSO", "Baik, bapak-ibu sekalian. Alhamdulillah, bulan ini semua program desa berjalan dengan baik dan lancar. Dana infrastruktur sudah diproses. Dana sosial sudah didistribusikan. Semua sudah sesuai dengan rencana kerja kita bersama.");
}

// =========================================================
// HELPER: placeActor
// Fungsi sentral untuk mengatur posisi, skala, dan pemanggilan
// aset visual karakter agar konsisten di semua scene.
// =========================================================
void placeActor(float worldX, float worldY, float scale, String namaKey) {
  pushMatrix();
  translate(worldX, worldY);
  scale(scale);

  if (namaKey.equals("karsoIdle")) {
    drawKarsoIdle(0, 0);
  } else if (namaKey.equals("karsoPidato")) {
    drawKarsoPidato(0, 0);
  } else if (namaKey.equals("buSariIdle")) {
    drawBuSariIdle(0, 0);
  } else if (namaKey.equals("buDarmiIdle")) {
    drawBuDarmiIdle(0, 0);
  } else if (namaKey.equals("sariIdle")) {
    drawSariIdle(0, 0);
  } else if (namaKey.equals("sariNotebook")) {
    drawSariIdleNotebook(0, 0);
  } else if (namaKey.equals("sariCloseup")) {
    drawSariNotebookCloseup(0, 0);
  } else if (namaKey.equals("sariMenulis")) {
    drawSariMenulis(0, 0);
  } else if (namaKey.equals("sariWalking")) {
    drawSariWalking(0, 0);
  } else if (namaKey.equals("dolfWalking")) {
    drawDolfWalking(0, 0);
  } else if (namaKey.equals("dolfIdle")) {
    drawDolfIdle(0, 0);
  } else if (namaKey.equals("dolfBicara")) {
    drawDolfBicara(0, 0);
  } else if (namaKey.equals("rahmaIdle")) {
    drawWargaPerempuanIdle(0, 0);
  } else if (namaKey.equals("rahmaBicara")) {
    drawWargaPerempuanBicara(0, 0);
  } else if (namaKey.equals("rahmaWalking")) {
    drawWargaPerempuanWalking(0, 0);
  }

  popMatrix();
}
