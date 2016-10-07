// plus à propos des operators
// https://www.tutorialspoint.com/java/java_basic_operators.htm

void setup() {
  size(200,200) ;
  for(int i = 0 ; i < width ; i++) {
    for(int j = 0 ; j < height ; j++) {
      // attention utiliser print dans une boucle peut-être source de plantage. 
      // c4est très gourmand en ressource.
      println(i, j) ;
    }
  }
}