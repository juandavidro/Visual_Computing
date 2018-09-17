
boolean active = true;

void mouseClicked() {
  active = !active;
}

void setup() {
  size(750, 600);
}

void draw() {
  background(255);
  ICA(); //induced contrast asynchrony
   textSize(20);
   fill(0);
  text("click for ilussion", 400, 20);
}

int currentColor = 0;
final int deltaColor[] = {7, -7};
int deltaColorId = 0;

void ICA() {
  if (active) {
    pushStyle();
    fill(0);
    rect(0, 0, width/2, height);
    popStyle();
  }
  pushStyle();
  noStroke();
  fill(currentColor);
  currentColor += deltaColor[deltaColorId];
  if (currentColor >= 255 || currentColor <= 0) {
    deltaColorId = 1 - deltaColorId;
  }
  int mainRadius = 200;
  ellipse(200, 300, mainRadius, mainRadius);
  ellipse(550, 300, mainRadius, mainRadius);
  popStyle();
}
