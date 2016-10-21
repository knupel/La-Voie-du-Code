void setup() {
  size(500,500) ;
  Child c = new Child(200) ;
  println(c.value) ;
  
}



class Parent {
  private int arg = 2 ;
  
  int get_arg() {
    return arg;
  }
}


class Child extends Parent {
  int value ;
  Child(int x) {
     value = x *get_arg();
  }
}