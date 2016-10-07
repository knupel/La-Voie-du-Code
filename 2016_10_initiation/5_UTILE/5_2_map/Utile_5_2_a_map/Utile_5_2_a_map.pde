void setup() {
  size(400,400) ;
}

float var ;
void draw() {
  var = map(mouseX, 0,width, 0, 10 ) ;
  println(var) ;
}