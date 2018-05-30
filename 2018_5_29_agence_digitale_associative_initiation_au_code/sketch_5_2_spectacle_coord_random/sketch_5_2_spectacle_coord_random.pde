void setup() {
  size(900,400);
  background(0);
}

void draw() {
  // random
  int x = int(random(width)); 
  int y = int(random(height));
  int c = int(random(255));
  set(x,y,c);
}
