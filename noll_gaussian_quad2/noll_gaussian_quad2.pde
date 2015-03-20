PGraphics pg;

void setup() {
  size(1039, 1039);  // creates a 15 pixel border, solves issue with canvas being cut off
  background(100);
  pg = createGraphics(1024, 1024); 
  frameRate(0.25);
}

int[] xvals = new int[100];
int[] yvals = new int[100];

// This uses an unintentionally wrong version of the Marsaglia polar method
// to transform uniform random numbers into normally distributed ones
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
    xvals[i] = int((x_coords[0] * 150) + 512);  // stdv and mean
    xvals[i+1] = int((x_coords[1] * 150) + 512);
    // println("Iteration: " + i + " " + xvals[i] + ", " + xvals[i+1]);
    // println("Iteration: " + i);
  }
}

void yes() {
  for (int i = 0; i < 100; i++) {
    // formula according to website
    float y_coord = (pow(i, 2)  + (5 * i));
    
    // determines reflection
    if (y_coord > 100) {
      int leftovers = floor(y_coord/1024);
      if (leftovers % 2 == 1) {
        y_coord = 1024 - (y_coord - (1024 * leftovers));
      }
      else {
        y_coord = y_coord - (1024 * leftovers);
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
    println("Points " + i + ": (" + xvals[i-1] + ", " + yvals[i-1] + ") " + "(" + xvals[i] + ", " + yvals[i] + ")");  // this shows up online
  }
  pg.endDraw();
  image(pg, 15, 15);
}
