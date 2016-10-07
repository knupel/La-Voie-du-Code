// plus à propos des operators
// https://www.tutorialspoint.com/java/java_basic_operators.htm
int var ;
void draw() {
  var++ ;
  int target = 20 ;
  int range = 2 ;
  
  if(var >=target -range && var <=target +range) {
    println(var, "n'est pas compris entre", target-range, "et", target+range) ;
  } else {
    println(var, "est compris entre", target-range, "et", target+range) ;
  }
  
  if(var > target *2) exit() ;
}