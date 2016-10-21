void setup() {
  size(400,400) ;
  background(0);
  fill(255);
  forme_build();
}


void draw() {
  background(0) ;
  Vec2 pos_forme = Vec2(mouseX,mouseY) ;
  int radius = 140 ;
  forme_display(pos_forme, radius);
}  