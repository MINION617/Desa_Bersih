// =========================================================
// S14_Background.pde
// Background "Luar Balai" (facade joglo, pintu terbuka, pavement,
// tangga, pilar depan, lighting) — dipakai bareng oleh S13 & S14
// buat kontinuitas visual. Semua fungsi diprefix s14_ biar jelas
// asalnya dan gak nabrak nama lain.
//
// Sumber asli: background_s14.pde (John), di-strip setup()/draw()
// nya sesuai aturan arsitektur (cuma boleh ada di DesaBersih.pde).
// =========================================================

/**
 * ANIME / GAME BACKGROUND — Traditional East Asian Wooden Building Entrance
 * ---------------------------------------------------------------------------
 * Processing (Java) sketch, 1280x720 (HD 16:9).
 * Clean 2D vector / anime-background style, flat fills + subtle gradients.
 * Only native 2D primitives are used (rect, quad, line, fill, stroke...).
 *
 * PAINTING ORDER (back to front):
 *   1. s14_drawInterior()          - dark room, tatami floor, inner pillars,
 *                                low desk, back doorway leading further in
 *   2. s14_drawOpenDoors()         - two door leaves swung wide open inward
 *   3. s14_drawFacade()            - left carved wall, doorway frame, right
 *                                open-frame section, olive side wall,
 *                                heavy top beam + eave shadow
 *   4. s14_drawPavement()          - stone-tiled ground with perspective joints
 *   5. s14_drawSteps()             - three centered stone steps
 *   6. s14_drawForegroundPillars() - big roof pillars on flared stone bases
 *   7. s14_drawLighting()          - warm sun from the front-left: golden edge
 *                                highlights + translucent washes
 *
 * KEY COORDINATES
 *   Eave shadow band : y 0..44          Heavy top beam : y 44..128
 *   Facade           : y 128..640       Center doorway : x 440..840
 *   Interior tatami  : y 510..620       Threshold sill : y 596..616
 *   Steps            : y 596..704       Pavement       : y 620..720
 *   Foreground pillars: x 44..108 (left), x 1168..1232 (right)
 */

/* ---------------------------------------------------------------------------
 * GRADIENT HELPERS — subtle shading built from 1-px lines (native primitives)
 * ------------------------------------------------------------------------- */

// Vertical gradient: c1 at the top -> c2 at the bottom
void s14_gradientRectV(float x, float y, float w, float h, color c1, color c2) {
  strokeWeight(1);
  for (int i = 0; i <= (int) h; i++) {
    stroke(lerpColor(c1, c2, i / h));
    line(x, y + i, x + w, y + i);
  }
  noStroke();
}

// Horizontal gradient: c1 at the left -> c2 at the right
void s14_gradientRectH(float x, float y, float w, float h, color c1, color c2) {
  strokeWeight(1);
  for (int i = 0; i <= (int) w; i++) {
    stroke(lerpColor(c1, c2, i / w));
    line(x + i, y, x + i, y + h);
  }
  noStroke();
}

/* ---------------------------------------------------------------------------
 * LAYER 1 — THE DEEP INTERIOR
 * A darkened room visible through the center doorway AND through the open
 * frame section on the right (x 440..1210). The facade painted later will
 * mask everything that should be hidden.
 * ------------------------------------------------------------------------- */
void s14_drawInterior() {
  // dark room backdrop behind every opening
  s14_gradientRectV(440, 120, 770, 500, color(64, 44, 30), color(40, 27, 19));

  // back wall of the room, with a ceiling shadow fading down onto it
  fill(74, 51, 34); noStroke();
  rect(440, 180, 770, 330);
  s14_gradientRectV(440, 180, 770, 60, color(52, 36, 25), color(74, 51, 34));

  // yellowish-brown tatami floor (y 510..620), lighter toward the viewer
  s14_gradientRectV(440, 510, 770, 110, color(150, 118, 68), color(186, 150, 92));
  stroke(128, 100, 58); strokeWeight(2);
  line(440, 548, 1210, 548);  line(440, 586, 1210, 586);   // mat rows
  line(560, 510, 540, 620);   line(680, 510, 684, 620);    // mat seams,
  line(800, 510, 824, 620);   line(940, 510, 980, 620);    // splaying
  line(1080, 510, 1136, 620);                              // toward viewer

  // back-wall open doorway leading further into the house
  noStroke();
  fill(38, 25, 18);   rect(596, 296, 92, 214);   // dark opening
  fill(112, 84, 50);  rect(610, 318, 64, 192);   // dim corridor wall beyond
  fill(132, 102, 62); rect(610, 468, 64, 42);    // corridor floor catching light
  fill(50, 34, 24);   rect(622, 352, 40, 116);   // an even deeper doorway

  // inner pillars of the center room (feet land on the tatami)
  fill(58, 38, 26);
  rect(538, 180, 20, 388);  rect(726, 180, 20, 388);
  stroke(96, 66, 42); strokeWeight(2);
  line(540, 180, 540, 568); line(728, 180, 728, 568);      // lit pillar edges

  // inner pillars seen through the right open-frame section
  noStroke(); fill(52, 34, 24);
  rect(936, 190, 18, 400);  rect(1064, 190, 18, 400);

  // low desk silhouette, left side of the room, sitting on the tatami
  fill(44, 29, 20);
  rect(548, 498, 124, 12);   // desk top
  rect(556, 510, 10, 58);    // left leg
  rect(654, 510, 10, 58);    // right leg
  rect(556, 534, 108, 8);    // lower stretcher

  // pool of sunlight spilling through the doorway onto the mats
  fill(255, 200, 130, 22);
  quad(500, 620, 780, 620, 744, 540, 536, 540);
}

/* ---------------------------------------------------------------------------
 * OPEN DOOR LEAVES — swung wide open INWARD.
 * Each leaf is a quad(): the hinge edge sits at the jamb (full height), the
 * free edge is foreshortened (shorter + pushed toward the center) to fake
 * the perspective of a door rotated into the room.
 * ------------------------------------------------------------------------- */
void s14_drawOpenDoors() {
  float[] seams = { 0.35, 0.7 };   // plank seam positions across each leaf
  float[] rails = { 0.12, 0.88 };  // top / bottom rail heights

  // LEFT leaf: hinge at x=474, free edge foreshortened to x=544 (lit face)
  noStroke(); fill(168, 116, 64);
  quad(474, 148, 544, 170, 544, 588, 474, 608);
  stroke(120, 78, 44); strokeWeight(2);
  for (float f : seams) {                     // vertical plank seams
    line(lerp(474, 544, f), lerp(148, 170, f),
         lerp(474, 544, f), lerp(608, 588, f));
  }
  for (float t : rails) {                     // horizontal rails
    line(474, lerp(148, 608, t), 544, lerp(170, 588, t));
  }
  noFill(); quad(474, 148, 544, 170, 544, 588, 474, 608);  // outline

  // RIGHT leaf: hinge at x=806, darker (this face turns away from the sun)
  noStroke(); fill(108, 72, 42);
  quad(806, 148, 736, 170, 736, 588, 806, 608);
  stroke(84, 54, 32); strokeWeight(2);
  for (float f : seams) {
    line(lerp(806, 736, f), lerp(148, 170, f),
         lerp(806, 736, f), lerp(608, 588, f));
  }
  for (float t : rails) {
    line(806, lerp(148, 608, t), 736, lerp(170, 588, t));
  }
  noFill(); quad(806, 148, 736, 170, 736, 588, 806, 608);
  noStroke();
}

/* ---------------------------------------------------------------------------
 * LAYER 2 — MAIN WALL, DOOR FRAME, HEAVY TOP BEAM
 * ------------------------------------------------------------------------- */
void s14_drawFacade() {
  noStroke();

  // wall stub hiding behind the left foreground pillar
  fill(96, 62, 36); rect(0, 128, 96, 512);

  // LEFT SECTION — solid closed wooden wall, lit from the left
  s14_gradientRectH(96, 128, 356, 512, color(178, 120, 64), color(146, 96, 50));
  stroke(104, 66, 36); strokeWeight(3); noFill();
  rect(112, 146, 326, 474);                      // carved outer frame
  int[] panelX = { 132, 288 };                   // two tall carved panels
  for (int px : panelX) {
    noStroke(); fill(150, 98, 52);  rect(px, 170, 130, 426);       // recess
    fill(164, 110, 60);             rect(px + 14, 184, 102, 398);  // raised center
    stroke(104, 66, 36); strokeWeight(2); noFill();
    rect(px, 170, 130, 426);  rect(px + 14, 184, 102, 398);
    line(px + 14, 382, px + 116, 382);           // mid divider
  }
  noStroke();

  // CENTER ENTRANCE — lintel, jambs and threshold sill around the doorway
  fill(88, 56, 32); rect(440, 128, 400, 48);     // lintel
  fill(96, 60, 34); rect(440, 128, 32, 512);     // left jamb
  rect(808, 128, 32, 512);                       // right jamb
  fill(72, 46, 28); rect(440, 596, 400, 20);     // threshold sill

  // RIGHT SECTION — open frame revealing the interior pillars
  s14_gradientRectV(840, 128, 356, 76, color(150, 96, 50), color(118, 76, 42)); // top rail
  stroke(90, 58, 32); strokeWeight(2); line(840, 188, 1196, 188);
  noStroke(); fill(112, 72, 40);
  rect(840, 128, 26, 512);                       // section posts
  rect(946, 204, 20, 436);
  rect(1062, 204, 20, 436);
  rect(1170, 128, 26, 512);

  // base runner beam along the whole facade
  fill(70, 45, 28); rect(96, 616, 1100, 24);

  // FAR-RIGHT — muted olive-green side wall accent
  s14_gradientRectV(1196, 128, 84, 512, color(118, 118, 80), color(92, 92, 62));
  stroke(70, 70, 48); strokeWeight(2); line(1214, 128, 1214, 640);

  // TOP — heavy dark beam with decorative panel lines + eave shadow band
  s14_gradientRectV(0, 44, 1280, 84, color(96, 62, 36), color(70, 45, 28));
  noStroke(); fill(50, 34, 24); rect(0, 0, 1280, 44);
  stroke(56, 37, 24); strokeWeight(2);
  line(0, 58, 1280, 58);  line(0, 114, 1280, 114);   // beam grooves
  stroke(56, 37, 24, 120);
  for (int x = 64; x < 1280; x += 64) line(x, 58, x, 114); // panel ticks

  // soft shadow cast by the eave down onto the facade
  s14_gradientRectV(0, 128, 1280, 34, color(30, 18, 10, 110), color(30, 18, 10, 0));
}

/* ---------------------------------------------------------------------------
 * LAYER 3 — STONE-TILED PAVEMENT (bottom of frame)
 * Joints converge toward a vanishing point at (640, 560).
 * ------------------------------------------------------------------------- */
void s14_drawPavement() {
  s14_gradientRectV(0, 620, 1280, 100, color(126, 120, 108), color(172, 166, 150));
  stroke(104, 98, 88); strokeWeight(2);
  line(0, 646, 1280, 646);  line(0, 676, 1280, 676);   // horizontal joints

  // perspective joints: bottom edge points pulled toward VP(640, 560)
  float t = (720.0 - 620.0) / (720.0 - 560.0);
  for (float x = -320; x <= 1600; x += 192) {
    line(x, 720, x + (640 - x) * t, 620);
  }

  // warm sun patch spilling in from the left
  noStroke(); fill(255, 196, 120, 26);
  quad(0, 620, 420, 620, 300, 720, 0, 720);
}

/* ---------------------------------------------------------------------------
 * THREE CENTERED STONE STEPS
 * Each step = thin light top surface + gradient front face + highlight edge.
 * ------------------------------------------------------------------------- */
void s14_drawSteps() {
  noStroke();
  // top step (narrowest)
  fill(184, 178, 162); rect(468, 596, 344, 10);
  s14_gradientRectV(468, 606, 344, 26, color(150, 144, 130), color(128, 122, 110));
  // middle step
  fill(178, 172, 156); rect(438, 632, 404, 10);
  s14_gradientRectV(438, 642, 404, 26, color(146, 140, 126), color(124, 118, 106));
  // bottom step (widest)
  fill(172, 166, 150); rect(408, 668, 464, 10);
  s14_gradientRectV(408, 678, 464, 26, color(142, 136, 122), color(120, 114, 102));

  // shade the right ends (sun comes from the left)
  fill(0, 0, 0, 40);
  rect(772, 606, 40, 26);  rect(802, 642, 40, 26);  rect(832, 678, 40, 26);

  // pale highlight along every front-top edge to show depth
  stroke(214, 208, 190); strokeWeight(2);
  line(468, 606, 812, 606);
  line(438, 642, 842, 642);
  line(408, 678, 872, 678);
  noStroke();
}

/* ---------------------------------------------------------------------------
 * FOREGROUND PILLARS — far left & far right, on flared stone bases
 * ------------------------------------------------------------------------- */
void s14_drawForegroundPillars() {
  noStroke();

  // LEFT pillar (round-ish shading: bright left edge -> dark right edge)
  s14_gradientRectH(44, 24, 64, 628, color(196, 140, 78), color(120, 78, 44));
  stroke(88, 56, 32); strokeWeight(2); line(76, 24, 76, 650);   // center seam
  noStroke();
  fill(178, 172, 158); rect(36, 644, 80, 10);                   // base cap
  fill(140, 134, 122); quad(36, 654, 116, 654, 126, 706, 26, 706); // flared base

  // RIGHT pillar
  s14_gradientRectH(1168, 24, 64, 628, color(210, 150, 84), color(128, 84, 46));
  stroke(92, 58, 32); strokeWeight(2); line(1200, 24, 1200, 650);
  noStroke();
  fill(178, 172, 158); rect(1160, 644, 80, 10);
  fill(140, 134, 122); quad(1160, 654, 1240, 654, 1250, 706, 1150, 706);
}

/* ---------------------------------------------------------------------------
 * LAYER 4 — WARM DIRECTIONAL SUNLIGHT (from the front-left)
 * Golden edge strokes where the sun catches the wood, plus broad low-alpha
 * warm washes.
 * ------------------------------------------------------------------------- */
void s14_drawLighting() {
  noStroke();
  // broad warm wash, strongest on the left third of the facade
  fill(255, 190, 110, 18); rect(0, 128, 430, 512);
  fill(255, 190, 110, 10); rect(430, 128, 410, 512);

  // golden edge catches around the entrance
  strokeWeight(3);
  stroke(255, 214, 120);       line(472, 148, 472, 606);  // inner-left jamb edge
  stroke(255, 214, 120, 200);  line(443, 130, 443, 638);  // outer-left jamb edge
  stroke(255, 236, 170);       line(544, 172, 544, 586);  // left door free edge (hot)
  stroke(255, 214, 120, 170);  line(736, 172, 736, 586);  // right door free edge (dim)
  stroke(255, 214, 120, 170);  line(444, 176, 660, 176);  // lintel underside, left half

  // carved-frame edges on the left wall (left + top edges face the sun)
  stroke(255, 214, 120, 150); strokeWeight(2);
  line(132, 170, 132, 596);  line(132, 170, 262, 170);
  line(288, 170, 288, 596);  line(288, 170, 418, 170);

  // golden step edges, fading out toward the right
  stroke(255, 224, 140, 220);
  line(468, 605, 640, 605);
  line(438, 641, 610, 641);
  line(408, 677, 580, 677);
  line(444, 597, 836, 597);   // sill top edge

  // right pillar catching the sun hard on its left edge
  stroke(255, 214, 120); strokeWeight(4);
  line(1170, 30, 1170, 648);

  // left pillar, subtler catch
  stroke(255, 214, 120, 140); strokeWeight(3);
  line(46, 30, 46, 648);
  noStroke();
}
