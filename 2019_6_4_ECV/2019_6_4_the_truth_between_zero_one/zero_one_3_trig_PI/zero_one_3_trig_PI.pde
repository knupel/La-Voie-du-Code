void setup() {
  size(400,400);
}


void draw() {
  float dir_x = random(-PI,PI);
  float dir_y = random(-PI,PI);
  // normalise
  float radius = mouseX;
  float x = sin(dir_x) *radius;
  float y = cos(dir_y) *radius;
  // translate
  float tx = width/2;
  float ty = height/2;
  point(x+tx,y+ty);
}
