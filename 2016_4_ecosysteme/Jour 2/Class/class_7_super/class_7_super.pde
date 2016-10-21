Super_child sc ;
void setup() {
  size(400,400) ;
  sc = new Super_child() ;
}

void draw() {
  background(0) ;
  fill(255) ;
  noStroke() ;
  sc.engine(mouseX, mouseY) ;
  
}

class Parent {
  Parent() {}
  void engine(int x, int y) {
    ellipse(x,y, 20,20) ;
  }
}


class Super_child extends Parent {
  Super_child() {
   super() ;
  }
  

}