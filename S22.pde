/**
 * ============================================================
 * S22 — CLOSE-UP KARSO & PAPAN ANGGARAN (BERSIH TOTAL)
 * ============================================================
 * Durasi: 7 detik.
 *   - 0.0s - 3.0s: Ruang putih, extreme close-up wajah Karso (Ekspresi ambigu).
 *   - 3.0s - 7.0s: Cut ke close-up papan anggaran statis (DIEM).
 *                  REVISI: Tangan warga dihapus total agar murni fokus pada spanduk.
 */

void sceneS22(float localTime) {
  
  if (localTime < 3.0) {
    // ---- PART 1: Extreme Close-Up Wajah Karso (Ruang Putih) ----
    background(255); 
    
    pushMatrix();
    float getarX = random(-1.2, 1.2);
    float getarY = random(-1.2, 1.2);
    
    // Matriks tumpuan agar wajah Karso pas di tengah layar
    translate(640 + getarX, 1942 + getarY); 
    scale(3.5); 
    drawKarsoIdle(0, 0); 
    popMatrix();
    
  } else {
    // ---- PART 2: Close-Up Papan Anggaran Statis (DIEM, TANPA TANGAN) ----
    background(92, 61, 34); // Warna kayu backdrop papan
    
    pushMatrix();
    translate(640, 360); 
    scale(2.0);          // Kunci tingkatan zoom 2x lipat
    translate(-640, -380); 
    drawPapanInformasi();
    popMatrix();
    
    // REVISI FINAL: Fungsi s22_drawTanganMenulis() sudah dihapus sepenuhnya dari sini
    
    // Bubble Dialog Voice Over Narator
    drawDialogBubble("NARATOR (VO)", "Perubahan tidak selalu datang dengan gemuruh.");
  }
}
