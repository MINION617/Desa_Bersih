/**
 * ============================================================
 * S14 — LUAR BALAI LANJUTAN (SEAMLESS CONTINUITY & TOUCH FIX)
 * ============================================================
 * Alur Koreksi: Posisi Sari (850) & Bu Sari (960) dijamin kontinu mutlak.
 * Tambahan: Bu Darmi jalan procedural dari kanan dalam kusen (690) ke tengah pintu (640).
 * Lengan Ibu Sari resmi nempel memegang pundak Sari.
 */

void sceneS14(float localTime) {
  // 1. Render Latar Belakang Wide Shot Menyatu Sempurna Tanpa Loncat Zoom
  background(60, 42, 30);
  s14_drawInterior();          
  s14_drawOpenDoors();         
  s14_drawFacade();            
  s14_drawPavement();          
  s14_drawSteps();             
  s14_drawForegroundPillars(); 
  s14_drawLighting(); 

  // 2. PERGERAKAN PROCEDURAL BU DARMI JALAN DI TENGAH PINTU JOGLO
  // Detik 0 s/d 4 melangkah maju dari kanan (690f) ke tengah (640f) pintu dalam, lalu memantau tajam
  float s14_darmiX = lerp(690f, 640f, min(localTime / 4.0f, 1.0f));
  float s14_darmiBobbing = (localTime < 4.0f) ? sin(frameCount * 0.2f) * 2.0f : 0f;
  
  pushMatrix();
  translate(s14_darmiX, 510f + s14_darmiBobbing); scale(0.35f); 
  drawBuDarmiIdle(0f, 0f); 
  popMatrix();

  float lantaiY = 680f;

  // 3. RENDER KONTINUITAS WARGA (Posisi Spasial Terkunci Presisi Samaan S13)
  pushMatrix(); translate(300f, lantaiY); scale(0.45f); drawDolfIdle(0f, 0f); popMatrix();
  pushMatrix(); translate(450f, lantaiY); scale(-0.45f, 0.45f); drawWargaPerempuanIdle(0f, 0f); popMatrix();

  // Sari (Menatap Papan Anggaran, Mengucapkan Dialog Terakhir, Hadap KANAN)
  pushMatrix();
  translate(850f, lantaiY); scale(-0.45f, 0.45f); 
  if (localTime < 5.0f) drawSariBicara(0f, 0f); 
  else drawSariIdle(0f, 0f);
  popMatrix();
  
  // Ibu Sari (Lengan Depan Menjangkau & Menyentuh Bahu Sari Pas, Hadap KIRI)
  pushMatrix();
  translate(960f, lantaiY); scale(-0.45f, 0.45f); 
  drawBuSariPegangPundak(0f, 0f); // Fungsi nempel pundak tervalidasi
  popMatrix();

  // 4. DIALOG BUBBLE S14
  if (localTime < 6.0f) {
    drawDialogBubble("SARI", "Mungkin itu masalahnya, Bu.");
  }
}
