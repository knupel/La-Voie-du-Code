void setup() {
  size(500,500) ;
  My_class c = new My_class(200, 200) ;
  println(c.x, c.y) ;
  
}



class My_class {
  int x ;
  int y ;
  My_class(int x, int y) {
    this.x = x ;
    this.y = y ;
  }
}