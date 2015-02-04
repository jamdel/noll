PGraphics pg;

void setup() {
  size(430, 680);  // weird background issue
  background(100);
  pg = createGraphics(400, 650); 
  frameRate(0.25);
}

int[] xvals = new int[100];
int[] yvals = new int[100];


float[] normal() {
  float x1 = 0;
  float y1 = 0;
  float w = 1;
  while (w >= 1) {
    x1 = (2 * random(0, 1)) - 1;
//    println(x1);
    y1 = (2 * random(0, 1)) - 1;
//    println(y1);
    w = (x1 * x1) + (y1 * y1);
  }
 
  w = sqrt ((-2 * log(w)) / w);
  float x2 = x1 * w;
  float y2 = y1 * w;
 
  float[] a = {x2, y2};
//  println(x2 + ", " + y2); 
  return a;
}

void xes() {
  for (int i = 0; i < 100; i = i + 2) {
    float[] x_coords = normal();   
    xvals[i] = int((x_coords[0] * 65) + 200); // stdv and mean
    xvals[i+1] = int((x_coords[1] * 65) + 200);
//    println("Iteration: " + i + " " + xvals[i] + ", " + xvals[i+1]);
//      println("Iteration: " + i);
  }
}

void yes() {
  for (int i = 0; i < 100; i++) {
    float a = random(0, 1.000001);
    float b = random(-10, 111);
    float c = random(-72,73);
    float y_coord = (a * pow(i, 2))  + (b * i) + c;
    y_coord = abs(y_coord);
    // determines reflection
    if (y_coord > 650) {
      int leftovers = floor(y_coord/650);
//      println(leftovers);
      if (leftovers % 2 == 1) {
        y_coord = 650 - (y_coord - (650 * leftovers));
      }
      else {
        y_coord = y_coord - (650 * leftovers);
      }
    }   
    yvals[i] = int(y_coord);
  }
}


void draw() {
  xes();
  yes();
  pg.beginDraw();
  pg.background(255);
  for (int i = 1; i < 100; i++) {
    pg.line(xvals[i-1], yvals[i-1], xvals[i], yvals[i]);
    println("Points " + i + ": (" + xvals[i-1] + ", " + yvals[i-1] + ") " + "(" + xvals[i] + ", " + yvals[i] + ")");
  }
  pg.endDraw();
  image(pg, 15, 15);
}

void mousePressed() {
  draw();
}
