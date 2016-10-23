void setup() {
  size(300,300) ;
}

void draw() {
  background_2D(0, 30) ;
  fill(255) ;
  ellipse(mouseX, mouseY, 40,40) ;
  save_PNG() ;
}



void mousePressed() {
  event_PNG() ;
}