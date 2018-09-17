
// definiendo variables 
float x = 0;
float y = 100;
float speed = 1;
int value = 10;
int sent = 0;

void setup(){
  size(900,400);
}

void draw() {
  background(255);
  move();
  display();    
}

// Generando el movimiento en x de los rectangulos

void move() {
  if(sent == 0){
    x = x + speed;
    if (x + 80 > width) {
      sent = 1;
    }
  }else{
    x = x - speed;
    if (x == 0) {
      sent = 0;
    }
  }
  
}

// Desplegando los rectangulos en cada llamada del movimiento

void display() {
  grid();
  fill(255, 255, 70);
  noStroke();
  rect(x, 150, 80, 30);  
  fill(0, 0, 70);
  noStroke();
  rect(x, 300, 80, 30);
  
}

void grid(){
  for(int i = 0; i < width; i += 40 ){
      fill(value);
      rect(i, 0, 20, height);
    } 
}


void mouseClicked() {
  if (value == 10) {
    value = 255;
  } else {
    //for(int i = 0; i < width; i += 20 ){
      //fill(255);
      //rect(i, 0, 20, height);
    //}
    value = 10;
  }
}
