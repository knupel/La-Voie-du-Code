void setup() {
  size(400,400, P3D) ;
}



float rotation ;
float pos_z ;
void draw() {
  background(0) ;
  int width_rect = 100 ;
  int height_rect = 100 ;
  rotation += .1 ;
  pos_z = sin(frameCount *.05) *(width/2) ;
  pushMatrix() ;
  translate(mouseX , mouseY, pos_z) ;
  rotateX(rotation) ;
  rect(-width_rect/2,-height_rect/2, width_rect, width_rect) ;
  popMatrix() ; 
}