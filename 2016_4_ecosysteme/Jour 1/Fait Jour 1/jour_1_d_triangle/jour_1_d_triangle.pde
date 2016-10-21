void setup() {
  //fullScreen();
  size(300,300) ;
}

void draw() {
  background_2D(255,0,0,20) ;
  int size = 20 ;
  fill(0) ;
 // ellipse(mouseX, mouseY, size,size) ;
  triangle(mouseX, mouseY, size) ;
}

void triangle(int pos_x, int pos_y, int size) {
  int a_x = 0  *size +pos_x ;
  int a_y = -1 *size +pos_y ;
  int b_x = 1  *size +pos_x ;
  int b_y = 1  *size +pos_y ;
  int c_x = -1 *size +pos_x ;
  int c_y = -1 *size +pos_y ;
  beginShape() ;
  vertex(a_x,a_y) ;
  vertex(b_x,b_y) ;
  vertex(c_x,c_y) ;
  endShape(CLOSE) ;
}