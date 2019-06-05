void setup() {
  size(400,400);
}


void draw() {
  float value = random(1);
  println("normal value",value);
  float x = value *mouseX;
  float y = value *mouseY;
  println("mapped value",x);
  println("mapped value",y);
  point(x,y);
}
