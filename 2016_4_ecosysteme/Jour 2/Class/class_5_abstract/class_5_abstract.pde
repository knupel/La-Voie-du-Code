void setup() {
  size(500,500) ;
  // With polymorphism you can build a class with the Parent name, and after you call the specific Child to build
  Parent c_a = new Child_A(width/2, height/2) ;
  Parent c_b = new Child_B((int)random(width), (int)random(height)) ;
  
  c_a.display() ;
  c_b.display() ;
}



abstract class Parent {
  int x ;
  int y ;
  // define the method must obligatory used by the child
  abstract void display() ;
}


class Child_A extends Parent {
  Child_A(int x, int y) {
    this.x = x ;
    this.y = y ;
  }
  
  // this method must be use because she is from the abstract class Parent
  void display() {
    ellipse(x,y,20,20) ;
  }
}



class Child_B extends Parent {
  Child_B(int x, int y) {
    this.x = x ;
    this.y = y ;
  }
  
  // this method must be use because she is from the abstract class Parent
  void display() {
    ellipse(x,y,20,20) ;
  }
}

/*
class Child_C extends Parent {
  Child_C(int x, int y) {
    this.x = x ;
    this.y = y ;
  }
}
*/