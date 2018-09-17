// Declarando variables
int i,j;

// Configurando el entorno
void setup(){
  size(492, 492); 
  background(255,255,255);
}

// Dibujando el grid de la ilusion

void draw(){
  for( i = 0; i < width; i+=50  ){
    for( j = 0; j < height; j+= 50 ){
      noStroke();
      fill(10);
      rect(j,i,42,42);  
    }
  }
}
