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
  float dir = random(-PI,PI);
  // normalise
  float radius = mouseX;
  float x = sin(dir) *radius;
  float y = cos(dir) *radius;
  // translate
  translate(width/2,height/2);
  point(x,y);
  pop();
}
