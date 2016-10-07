PVector pos ;
void setup() {
  size(400,400) ;
  // PVector est une Class, donc on doit la créer par l'opération new
  pos = new PVector(width/2, height/2) ;
}


void draw() {
  background(0) ;  
  rect(pos.x, pos.y, 50,50) ;
}