void setup() {
  size(400,400);
}


void draw() {
  int turn_by_round = 50;
  for(int i = 0 ; i < turn_by_round ; i++) {
    trigart();
  }
  
}

void trigart() {
  push();
  float dir_x = random(-PI,PI);
  float dir_y = random(-PI,PI);
  // normalise
  float radius = mouseX;
  float x = sin(dir_x) *radius;
  float y = cos(dir_y) *radius;
  // translate
  translate(width/2,height/2);
  point(x,y);
  pop();
}
