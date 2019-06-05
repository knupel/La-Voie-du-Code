void setup() {
  size(400,400);
  //fulScreen();
}

void draw() {
  background(0);
  int x = mouseX;
  int y = mouseY;
  println(x,y);
  ellipse(x,y,50,50);
}
