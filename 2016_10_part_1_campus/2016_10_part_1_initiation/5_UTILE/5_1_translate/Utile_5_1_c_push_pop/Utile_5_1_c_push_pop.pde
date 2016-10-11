void setup() {
  size(400,400) ;
}


void draw() {
  background(0) ;
  int width_rect = 100 ;
  int height_rect = 100 ;
  
  pushMatrix() ;
  translate(mouseX -width_rect/2, mouseY -height_rect/2) ;
  rect(0,0, width_rect, width_rect) ;
  popMatrix() ;
  
  pushMatrix() ;
  translate(mouseY -width_rect/2, mouseX -height_rect/2) ;
  rect(0,0, width_rect, width_rect) ;
  popMatrix() ;
  
}