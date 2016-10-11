int var = 3 ;
// plus à propos des operators
// https://www.tutorialspoint.com/java/java_basic_operators.htm
void draw() {
  var = var + 1 ;
  println("result plus", var) ;
  var += 1 ;
  println("result plus", var) ;
  
  var = var - 1 ;
  println("result sub", var) ;
  var -= 1 ;
  println("result sub", var) ;
  
  var = var * 2 ;
  println("result sub", var) ;
  var *= 2 ;
  println("result sub", var) ;
  
  var = var / 2 ;
  println("result div", var) ;
  var /= 2 ;
  println("result div", var) ;
}