void draw() {
}

float deep;
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  deep += e;
  println(deep,e);
}
