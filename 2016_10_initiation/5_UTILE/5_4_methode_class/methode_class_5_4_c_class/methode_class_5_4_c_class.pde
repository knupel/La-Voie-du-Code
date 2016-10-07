Ma_class [] c ; 

void setup() {
  size(400,400) ;
  int num = 4 ;
  c = new Ma_class[num] ;
  for(int i = 0 ; i < c.length ; i++) {
    c[i] = new Ma_class() ;
  }
}


int which_shape ;
void draw() {
  background(0) ;
  for(int i = 0 ; i < c.length ; i++) {
    if(mousePressed) {
      if(i%2 == 0 ) which_shape = 1 ; else which_shape = 0 ;
    } else {
      if(i%2 == 0 ) which_shape = 0 ; else which_shape = 1 ;
    }
    int size = 20 + i*10 ;
    int displacement = i *size ;
    c[i].display_shape(mouseX +displacement,mouseY +displacement, size, which_shape) ;
  }

  
}


class Ma_class {
  
  Ma_class() {}
  
  void display_shape(int pos_x, int pos_y, int size, int which_one) {
    if(which_one == 0 ) rect(pos_x -size/2, pos_y -size/2, size, size) ;
    if(which_one == 1 ) ellipse(pos_x, pos_y, size, size) ;
  }
}