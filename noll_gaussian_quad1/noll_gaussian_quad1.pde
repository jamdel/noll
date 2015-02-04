void setup() {
  size(400, 700);
  frameRate(1);  // renders one picture a second, draws over existing pictures
  // add noLoop() if you don't want it to draw over other pictures
  // may also want to switch to PGraphics
  hint(ENABLE_STROKE_PURE);  // doesn't work with processing.js
}

int[] xvals = new int[100];
int[] yvals = new int[100];

void xes() {
  for (int i = 0; i < 100; i++) {
    int x_coord = int(random(15, 336)); // 15 pixel buffer on each side of the piece
    xvals[i] = x_coord; // right now this is a uniform distribution
  }
}

void yes() {
  for (int i = 0; i < 100; i++) {
    int y_coord = int(random(15, 686));  // doesn't reflect, also is random as opposed to quadratic
    yvals[i] = y_coord;
  }
}

void draw() {
  xes();
  yes();
  for (int i = 1; i < 100; i++) {
    line(xvals[i-1], yvals[i-1], xvals[i], yvals[i]);
  }
}

// sometimes is cutoff, and i don't understand why
// switching to PGraphics seemed to help
