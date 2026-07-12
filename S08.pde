// =========================================================
// S08.pde (8 dtk)
// Warga bisik-bisik + Sari mencatat di buku kecil
//
// 0.0-2.5 dtk : close-up Pak Dolf, bisik "Tiap bulan sama."
// 2.5-5.0 dtk : close-up Bu Rahma, bisik balik "Ssst."
// 5.0-8.0 dtk : potong (cut, bukan pan) ke close-up Sari — buku
//               catatan & dahi berkerut.
//
// Teknik "close-up": scale + translate seluruh background+aktor
// di sekitar titik fokus (Processing gak punya kamera bawaan),
// lalu di-pop lagi sebelum gambar dialog bubble (UI gak ikut
// ke-zoom, tetap ukuran normal di layar).
// =========================================================

void sceneS08(float localTime) {

  background(0);

  float focusX, focusY, zoom;
  boolean showSari = (localTime >= 5.0);

  if (!showSari) {
    // fokus di antara Dolf & Rahma
    focusX = 375;
    focusY = 520;
    zoom = 2.4;
  } else {
    // fokus ke Sari & buku catatannya
    focusX = 815;
    focusY = 500;
    zoom = 2.8;
  }

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  scale(zoom);
  translate(-focusX, -focusY);

  image(bgS07toS12, 0, 0, width, height);

  if (!showSari) {
    placeActor(340, 626, S07_CHAR_SCALE, "dolfBicara");
    placeActor(410, 626, S07_CHAR_SCALE, "rahmaBicara");
  } else {
    placeActor(808, 626, S07_CHAR_SCALE, "sariMenulis");
  }

  popMatrix();

  // ---- Dialog (di luar transform zoom, ukuran teks tetap normal) ----
  if (localTime < 2.5) {
    drawDialogBubble("PAK DOLF", "(berbisik) Tiap bulan sama.");
  } else if (localTime < 5.0) {
    drawDialogBubble("BU RAHMA", "(berbisik) Ssst.");
  }
  // 5.0-8.0: close-up Sari, gak ada dialog (cuma ekspresi & buku)
}
