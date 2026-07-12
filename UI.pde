// =========================================================
// UI.pde
// Elemen UI non-karakter, non-prop — dialog bubble buat nampilin
// naskah karakter di layar (gaya caption/subtitle, bawah layar).
//
// Pemakaian di scene manapun:
//   drawDialogBubble("PAK KARSO", "Baik, bapak-ibu sekalian...");
//
// Tinggi bubble otomatis nyesuain panjang teks (word-wrap asli
// pakai textWidth(), bukan lebar tetap).
// =========================================================

final float BUBBLE_MAX_WIDTH   = 1100;
final float BUBBLE_BOTTOM_GAP  = 30;   // jarak dari tepi bawah layar
final float BUBBLE_PADDING     = 30;   // padding dalam bubble
final float BUBBLE_LINE_HEIGHT = 32;
final float BUBBLE_TEXT_SIZE   = 20;
final float BUBBLE_TAG_HEIGHT  = 46;
final float BUBBLE_TAG_PAD_X   = 20;
final float BUBBLE_CORNER      = 22;

color C_BUBBLE_BLUE = color(46, 98, 176);
color C_BUBBLE_WHITE = color(255);
color C_BUBBLE_TEXT = color(20, 20, 25);

void drawDialogBubble(String speaker, String dialogText) {

  textSize(BUBBLE_TEXT_SIZE);
  String[] lines = wrapDialogText(dialogText, BUBBLE_MAX_WIDTH - BUBBLE_PADDING * 2);

  float bubbleH = BUBBLE_PADDING * 2 + lines.length * BUBBLE_LINE_HEIGHT;
  float bubbleX = (width - BUBBLE_MAX_WIDTH) / 2.0;
  float bubbleY = height - BUBBLE_BOTTOM_GAP - bubbleH;

  // ---- Bubble utama ----
  stroke(C_BUBBLE_BLUE);
  strokeWeight(5);
  fill(C_BUBBLE_WHITE);
  rect(bubbleX, bubbleY, BUBBLE_MAX_WIDTH, bubbleH, BUBBLE_CORNER);

  // ---- Tag nama, nempel di pojok kiri-atas bubble ----
  textSize(15);
  float tagTextW = textWidth(speaker);
  float tagW = tagTextW + BUBBLE_TAG_PAD_X * 2;
  float tagX = bubbleX + 30;
  float tagY = bubbleY - BUBBLE_TAG_HEIGHT * 0.55;

  stroke(C_BUBBLE_BLUE);
  strokeWeight(4);
  fill(C_BUBBLE_BLUE);
  rect(tagX, tagY, tagW, BUBBLE_TAG_HEIGHT, 14);

  noStroke();
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(15);
  text(speaker, tagX + tagW / 2.0, tagY + BUBBLE_TAG_HEIGHT / 2.0 + 1);

  // ---- Isi dialog, di-wrap otomatis ----
  noStroke();
  fill(C_BUBBLE_TEXT);
  textAlign(CENTER, CENTER);
  textSize(BUBBLE_TEXT_SIZE);
  float textStartY = bubbleY + BUBBLE_PADDING + BUBBLE_LINE_HEIGHT / 2.0;
  for (int i = 0; i < lines.length; i++) {
    text(lines[i], bubbleX + BUBBLE_MAX_WIDTH / 2.0, textStartY + i * BUBBLE_LINE_HEIGHT);
  }
}

// Word-wrap manual pakai textWidth() asli Processing, biar akurat
// sesuai font/size yang lagi aktif pas dipanggil.
String[] wrapDialogText(String text, float maxWidth) {
  String[] words = split(text, ' ');
  StringList lines = new StringList();
  String current = "";

  for (String w : words) {
    String test = (current.length() == 0) ? w : current + " " + w;
    if (textWidth(test) > maxWidth && current.length() > 0) {
      lines.append(current);
      current = w;
    } else {
      current = test;
    }
  }
  if (current.length() > 0) lines.append(current);

  return lines.array();
}
