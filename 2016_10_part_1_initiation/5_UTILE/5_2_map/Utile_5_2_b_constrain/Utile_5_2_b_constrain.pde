void setup() {
  size(400,400) ;
}

float var ;
void draw() {
  int min = 0 ;
  int max = 10 ;
  var = map(mouseX, 0,width, min, max ) ;
  var = constrain(var, min, max) ;
  println(var) ;
}