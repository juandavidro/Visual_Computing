/*
 Lilac Chaser
 Author: Jeremy L Hinton
*/

boolean active = true;

void setup() {
  size(600, 600);
  background(255);
  frameRate(7);
}

void draw() {
  background(255);
  LilacChaser(300, 300, 350, 12, 75);
}

int hidden = 0;

void LilacChaser(float x, float y, float r, int n, float r1) {

  line(x-7, y-7, x+7, y+7);
  line(x+7, y-7, x-7, y+7);
  
  for (int i = 0; i < n; i++) {
    float xi = r/2 * cos(i*2*PI/n);
    float yi = r/2 * sin(i*2*PI/n);
    if (i != hidden) {
      Gradient(x + xi, y + yi, r1);
    }
  }
  if (active) {
    hidden ++;
    hidden %= n;
  }
}

void Gradient (float x, float y, float radius) {
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  float h = 0;
  for (float r = radius; r > 0; r -= 1) {
    fill(100, h, 100);
    ellipse(x, y, r, r);
    h += 2;
  }
  popStyle();
}
