/**
 * ============================================================
 * S13 — LUAR BALAI (WIDE): WARGA BUBAR & BISIK-BISIK
 * ============================================================
 * Alur Koreksi: Karso dihapus. Sari & Bu Sari jalan ke kiri (badan hadap kiri).
 * Detik ke-2: Berhenti, Sari balik badan hadap kanan, Ibu Sari hadap kiri.
 * Jarak dirapatkan ke 110px agar jangkauan visual pas kontinu.
 */

void sceneS13(float localTime) {
  // 1. Render Latar Belakang Balai Desa Native Wide 1280x720
  background(60, 42, 30);
  s14_drawInterior();          
  s14_drawOpenDoors();         
  s14_drawFacade();            
  s14_drawPavement();          
  s14_drawSteps();             
  s14_drawForegroundPillars(); 
  s14_drawLighting(); 

  float lantaiY = 680f;

  // 2. Pak Dolf & Bu Rahma (Grup Kiri - Berbisik Semu)
  pushMatrix();
  translate(300f, lantaiY); scale(0.45f); // Dolf hadap Kanan
  if (localTime >= 2.0f && localTime < 5.0f) drawDolfBicara(0f, 0f);
  else drawDolfIdle(0f, 0f);
  popMatrix();

  pushMatrix();
  translate(450f, lantaiY); scale(-0.45f, 0.45f); // Rahma di-mirror hadap Kiri
  if (localTime >= 5.0f && localTime < 8.0f) drawWargaPerempuanBicara(0f, 0f);
  else drawWargaPerempuanIdle(0f, 0f);
  popMatrix();

  // 3. LOGIKA UTAMA SARI & IBU SARI (Grup Kanan - Rapat 110px)
  float s13_sariX = 850f;
  float s13_buSariX = 960f;
  boolean sedangJalan = false;

  if (localTime < 2.0f) {
    float progress = localTime / 2.0f;
    s13_sariX = lerp(1350f, 850f, progress);   
    s13_buSariX = lerp(1460f, 960f, progress); // Dikunci jarak selisih tetap 110px sembari jalan
    sedangJalan = true;
  }

  // Render Tokoh Sari
  pushMatrix();
  translate(s13_sariX, lantaiY);
  if (sedangJalan) {
    scale(0.45f, 0.45f);   // FIX KOREKSI: Alami hadap KIRI penuh saat melangkah maju
    drawSariWalking(0f, 0f);
  } else {
    scale(-0.45f, 0.45f);  // FIX KOREKSI: Berhenti langsung balik badan hadap KANAN menatap Ibu Sari
    if (localTime >= 13.5f && localTime < 16.5f) drawSariBicara(0f, 0f);
    else drawSariIdle(0f, 0f);
  }
  popMatrix();

  // Render Tokoh Ibu Sari
  pushMatrix();
  translate(s13_buSariX, lantaiY);
  scale(-0.45f, 0.45f);    // FIX KOREKSI: Selalu konsisten hadap KIRI mengejar/menghadap Sari
  if (sedangJalan) drawBuSariWalking(0f, 0f);
  else {
    if ((localTime >= 8.0f && localTime < 13.5f) || (localTime >= 16.5f && localTime < 21.5f)) drawBuSariBicara(0f, 0f);
    else drawBuSariIdle(0f, 0f);
  }
  popMatrix();

  // 4. SISTEM SUBTITLE TIMING DIALOG S13
  if (localTime >= 2.0f && localTime < 5.0f) {
    drawDialogBubble("PAK DOLF", "Berani juga anak baru itu.");
  } else if (localTime >= 5.0f && localTime < 8.0f) {
    drawDialogBubble("BU RAHMA", "Ssst! Jangan keras-keras.");
  } else if (localTime >= 8.0f && localTime < 13.5f) {
    drawDialogBubble("IBU SARI", "Sari... kamu nggak apa-apa? Itu tadi—");
  } else if (localTime >= 13.5f && localTime < 16.5f) {
    drawDialogBubble("SARI", "Aku cuma tanya, Bu.");
  } else if (localTime >= 16.5f && localTime < 21.5f) {
    drawDialogBubble("IBU SARI", "Ibu tahu. Tapi di sini... orang tidak biasa ditanya begitu.");
  }
}
