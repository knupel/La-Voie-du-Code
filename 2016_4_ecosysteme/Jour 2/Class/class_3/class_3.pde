void setup() {
  size(500,500) ;
  Child c = new Child(200, 200) ;
  println(c.x, c.y) ;
  
}



class Parent {
  int x ;
  int y ;
}


class Child extends Parent {
  Child(int x, int y) {
    this.x = x ;
    this.y = y ;
  }
}