Ma_class c ; 

void setup() {
  size(200,200) ;
  c = new Ma_class() ;
}


int which_shape ;
void draw() {
  background(0) ;
  if(mousePressed) which_shape = 1 ; else which_shape = 0 ;
  c.display_shape(mouseX,mouseY, 60, which_shape) ;
}


class Ma_class {
  
  Ma_class() {}
  
  void display_shape(int pos_x, int pos_y, int size, int which_one) {
    if(which_one == 0 ) rect(pos_x -size/2, pos_y -size/2, size, size) ;
    if(which_one == 1 ) ellipse(pos_x, pos_y, size, size) ;
  }
}