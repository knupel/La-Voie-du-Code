void setup() {
  size(400,400);
}


void draw() {

  float value = sin(frameCount);
  println("normal value",value);
  float x = value *mouseX;
  float y = value *mouseY;
  println("mapped value",x);
  println("mapped value",y);
  float tx = width/2;
  float ty = height/2;
  point(x+tx,y+ty);
}
