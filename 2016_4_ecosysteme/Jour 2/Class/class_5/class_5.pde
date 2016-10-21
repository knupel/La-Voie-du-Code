void setup() {
  size(500,500) ;
  // With polymorphism you can build a class with the Parent name, and after you call the specific Child to build
  Parent c = new Child(200, 200) ;
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