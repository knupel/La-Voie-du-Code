// plus à propos des operators
// https://www.tutorialspoint.com/java/java_basic_operators.htm

void setup() {
  size(200,200) ;
  int size = 10 ;
  for(int i = 0 ; i < width ; i++) {
    for(int k = 0 ; k < height ; k++) {
      if(i%20 == 0 && k%20 == 0 ) {
        if(i%40 == 0 && k%40 == 0) {
          rect(i,k, size, size) ;
        } else {
          ellipse(i,k, size, size) ;
        }
      }
    }
  }
}