color blue = color( 3, 14, 243); 
color black = color(0);
int value = 0; 

int x0 = 160;
int y0 = 160; 

int x1 = 340;
int y1 = 340; 

int x2 = 340;
int y2 = 160; 

int x3 = 160;
int y3 = 340; 

int swi = 0;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255);
  textSize(20);
  text("click for ilussion", 10, 20); 

  switchDirection();
  movingRect(x0, y0, 45);
  movingRect(x1, y1, 45);
  movingRect(x2, y2, 135);
  movingRect(x3, y3, 135);

  if (value == 0) {
    drawCircle(70, 250);
    drawCircle(430, 250);
    drawCircle(260, 70);
    drawCircle(260, 430);
  }
}

void movingRect(int x0, int y0, int angle) {
  pushMatrix();
  fill(black);
  translate(x0, y0);
  rotate(radians(angle));
  rect(0, 0, 25, 190);
  popMatrix();
}

void drawCircle(int x, int y) {
  pushMatrix();
  fill(blue);
  translate(x, y);
  ellipse(0, 0, 125, 125);
  popMatrix();
}

void switchDirection() {
  if (x0 == 190) {
    swi = 1;
  }

  if (x0 == 140) {
    swi = 0;
  }

  if (swi==0) {
    x0++; y0++; x1++; y1++; x2++; y2--; x3++; y3--;
  } else {
    x0--; y0--; x1--; y1--; x2--; y2++; x3--; y3++;
  }
}


void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}
