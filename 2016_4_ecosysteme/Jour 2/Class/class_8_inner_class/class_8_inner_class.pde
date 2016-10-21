C c ;
void setup() {
  size(300,300) ;
  c = new C() ;
}


void draw() {
  background(0) ;
  stroke(255) ;
  strokeWeight(10) ;
  c.display(mouseX,mouseY) ;
}

class C {
  C() {}
  
  In in = new In() ;
  
  void display(int x, int y) {
    in.display(x,y) ;
  }
  
  // Inner class
  class In {
    In() { }
    
    void display(int x, int y) {
      point(x,y) ;
    }
  }
}