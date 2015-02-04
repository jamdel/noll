PGraphics pg;

void setup() {
  size(400, 700);
  pg = createGraphics(350, 600);
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
    int y_coord = int(random(15, 686)); // doesn't reflect
    yvals[i] = y_coord;
  }
}

void draw() {
  xes();
  yes();
  pg.beginDraw();
  pg.background(0);
  for (int i = 1; i < 100; i++) {
    pg.line(xvals[i-1], yvals[i-1], xvals[i], yvals[i]);
  }
  pg.endDraw();
}

void mousePressed() {
  pg.clear();
}
