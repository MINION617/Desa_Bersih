// =========================================================
// TimeLine.pde
// Dispatcher: menentukan scene mana yang aktif berdasarkan
// frameCount/FPS, lalu memanggil fungsi scene tsb dengan
// localTime yang di-reset ke 0 di awal scene itu.
// =========================================================

final int TOTAL_SCENES = 23;

float[] SCENE_DURATIONS = {
  12, 10.0, 8,         // S01 - S03  
  8, 8, 8.5,           // S04 - S06  (S06: 8 -> 8.5)
  14, 8.6, 6, 46.2, 9.0, 9.5, // S07 - S12  (S09: 8 -> 8.6)
  21.5, 13, 13.0,          // S13 - S15  (FIX koma jadi titik)
  22.5, 15.0, 14, 6.5, 15.3, 8, 8, 26 // S16 - S23 (KOREKSI: S17 diubah menjadi 15.0 detik)
};

float[] sceneStartTime = new float[TOTAL_SCENES];

boolean timelineInit = false;
float timelineStartMs = 0; // waktu mulai animasi dalam milidetik

void initTimeline() {
  float t = 0;
  for (int i = 0; i < TOTAL_SCENES; i++) {
    sceneStartTime[i] = t;
    t += SCENE_DURATIONS[i];
  }
  timelineStartMs = millis(); // catat waktu mulai

  // Mulai audio bersamaan dengan timeline
  if (dialogAudio != null) {
    dialogAudio.play();
  }

  timelineInit = true;
}

void runTimeline() {
  if (!timelineInit) initTimeline();

  // Gunakan jam nyata (millis) bukan frameCount,
  // agar kecepatan animasi tetap 1:1 dengan waktu nyata
  // meski FPS aktual di bawah target 24fps.
  float elapsed = (millis() - timelineStartMs) / 1000.0;

  // Hitung total durasi animasi
  float totalDuration = 0;
  for (int i = 0; i < TOTAL_SCENES; i++) totalDuration += SCENE_DURATIONS[i];

  // Jika animasi sudah selesai, freeze di frame terakhir & hentikan
  if (elapsed >= totalDuration) {
    elapsed = totalDuration - 0.001; // freeze di detik terakhir
    if (dialogAudio != null && dialogAudio.isPlaying()) dialogAudio.stop();
    noLoop(); // hentikan rendering agar tidak boros CPU
  }

  int activeScene = TOTAL_SCENES - 1; 
  for (int i = 0; i < TOTAL_SCENES; i++) {
    float start = sceneStartTime[i];
    float end   = start + SCENE_DURATIONS[i];
    if (elapsed >= start && elapsed < end) {
      activeScene = i;
      break;
    }
  }

  float localTime = elapsed - sceneStartTime[activeScene];

  switch (activeScene) {
    case 0:  sceneS01(localTime); break;
    case 1:  sceneS02(localTime); break;
    case 2:  sceneS03(localTime); break;
    case 3:  sceneS04(localTime); break;
    case 4:  sceneS05(localTime); break;
    case 5:  sceneS06(localTime); break;
    case 6:  sceneS07(localTime); break;
    case 7:  sceneS08(localTime); break;
    case 8:  sceneS09(localTime); break;
    case 9:  sceneS10(localTime); break; 
    case 10: sceneS11(localTime); break;
    case 11: sceneS12(localTime); break; 
    case 12: sceneS13(localTime); break;
    case 13: sceneS14(localTime); break;
    case 14: sceneS15(localTime); break; 
    case 15: sceneS16(localTime); break; 
    case 16: sceneS17(localTime); break; // Memanggil Scene 17
    case 17: sceneS18(localTime); break;
    case 18: sceneS19(localTime); break;
    case 19: sceneS20(localTime); break;
    case 20: sceneS21(localTime); break;
    case 21: sceneS22(localTime); break;
    case 22: sceneS23(localTime); break;
  }
}
