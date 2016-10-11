PVector pos ;
PVector size ;
void setup() {
  size(400,400) ;
  pos = new PVector(width/2, height/2) ;
  size = new PVector(50,50) ;
}


void draw() {
  background(0) ;
  pos.set(mouseX, mouseY) ;
  // operator add, sub, mult ou div
  pos.sub(size.x/2, size.y/2) ;
  rect(pos.x, pos.y, size.x, size.y) ;
}