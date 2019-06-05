void setup() {
  size(400,400);
}


void draw() {

  float dir_x = random(TWO_PI);
  float dir_y = random(TAU);
  // normalise
  dir_x = sin(dir_x);
  dir_y = cos(dir_y);
  float x = dir_x *mouseX;
  float y = dir_y *mouseY;
  // translate
  float tx = width/2;
  float ty = height/2;
  point(x+tx,y+ty);
}
