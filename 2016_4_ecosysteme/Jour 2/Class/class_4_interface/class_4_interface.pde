

void setup() {
  size(500,500) ;
  // With polymorphism you can build a class with the Parent name, and after you call the specific Child to build
  Family_A f_a = new Family_A(200, 200) ;
  println(f_a.x, f_a.y) ;
  Family_B f_b = new Family_B(200, 200) ;
  println(f_b.x, f_b.y) ;
  
  
}



interface Constants {
  int VALUE = 100 ;
}



class Family_A implements Constants {
  int x ;
  int y ;
  Family_A(int x, int y) {
    this.x = x + VALUE ;
    this.y = y ;
  }
}


class Family_B {
  int x ;
  int y ;
  Family_B(int x, int y) {
    this.x = x + VALUE ;
    this.y = y ;
  }
}