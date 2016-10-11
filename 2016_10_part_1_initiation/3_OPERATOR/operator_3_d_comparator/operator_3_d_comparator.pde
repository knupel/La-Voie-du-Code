// plus à propos des operators
// https://www.tutorialspoint.com/java/java_basic_operators.htm
int var ;
void draw() {
  var++ ;
  int target = 20 ;
  if(var > target ) println(var, "est plus grand que", target) ; else println(var, "est inférieure à", target) ;
  if(var >= target ) println(var, "est plus grand ou égale à", target) ; else println(var, "est inférieure à", target) ;
  if(var == target ) println(var, "est égale à", target) ; else println(var, "n'est pas égale à", target) ;
}