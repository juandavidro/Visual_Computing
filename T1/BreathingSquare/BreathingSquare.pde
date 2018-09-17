
float i = 0;
int gRate = 2;
int value = 100;
int state = 0;

void setup(){
  size(700,700);
  smooth();
  
  rectMode(CENTER);
}



void draw(){
  background(200);
 
  noStroke();
  fill(23,23,20);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(i);
  rect(0,0,500,500);
  
  popMatrix();
  i+=0.01;
  
  display();
  move();
}


void display(){
 fill(0,0,209);
 rect(0,0,value,value);  
 rect(width,0,value,value);  
 rect(0, height,value,value);  
 rect(width,height,value,value); 
}

void move(){
  if (state == 0) {
    if(value < 690){
      value += gRate;
    } 
  }else {
    if(value > 100){
      value -= gRate;
    } 
  }
}

// Evento del mouse

void mouseClicked() {
  if (state == 0) {    
    state = 1;
  }else {
    state = 0;
  }
}
