// plus à propos des operators
// https://www.tutorialspoint.com/java/java_basic_operators.htm
int var ;
boolean verite ;
void draw() {
  var++ ;
  int limite = 20 ;
  
  if(var > limite) {
    verite = true ;
  } else {
    verite = false ;
  }
  println(var, "est superieur à",limite, "c'est", verite) ;
}