// plus à propos des operators
// https://www.tutorialspoint.com/java/java_basic_operators.htm
int var ;
void draw() {
  var++ ;
  if(var%2 == 0) println("paire", var) ; else println("impaire", var) ;
  
  if(var%3 == 0) println(var, "est un multiple de 3") ; else println(var, "Rien à voir avec 3") ;
}