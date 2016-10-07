PVector pos ;
void setup() {
  size(400,400) ;
  pos = new PVector(width/2, height/2) ;
}


void draw() {
  background(0) ;
  // Le class PVector posséde ses propre méthode que l'on peut appeler
  // ici par exemple la méthode set
  pos.set(mouseX, mouseY) ;
  rect(pos.x, pos.y, 50,50) ;
}