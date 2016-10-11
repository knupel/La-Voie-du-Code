Vec2 pos ;
Vec2 size ;
void setup() {
  size(400,400) ;
  pos = Vec2(width/2, height/2) ;
  size = Vec2(50) ;
}


void draw() {
  background(0) ;
  pos.set(mouseX, mouseY) ;
  // operator add, sub, mult ou div
  pos.sub(size.x/2, size.y/2) ;
  rect(pos, size) ;
}