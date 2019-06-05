void setup() {
  size(400,400);
}


void draw() {
  float value = random(1);
  println("normal value",value);
  float x = value *mouseX;
  float y = value *mouseY;
  println("map value x",x);
  println("map value y",y);
  point(x,y);
}
