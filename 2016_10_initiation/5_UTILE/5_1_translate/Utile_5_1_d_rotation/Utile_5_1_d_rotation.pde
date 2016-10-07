void setup() {
  size(400,400) ;
}

float rotation ;
void draw() {
  background(0) ;
  int width_rect = 100 ;
  int height_rect = 100 ;
  
  rotation += .1 ;
  
  
  pushMatrix() ;

  translate(mouseX, mouseY) ;
  rotate(rotation) ;
  rect(-width_rect/2,-width_rect/2, width_rect, width_rect) ;
  popMatrix() ;
  
}