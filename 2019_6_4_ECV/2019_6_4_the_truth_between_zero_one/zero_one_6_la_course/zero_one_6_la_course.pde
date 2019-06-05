void setup() {
  size(400,400);
}


void draw() {
  int turn_by_round = 50;
  float velocity = map(mouseY,0,height,-1,1);
  float max_speed = 4;
  float speed = max_speed *velocity;
  for(int i = 0 ; i < turn_by_round ; i++) {
    trigart(speed);
  } 
}

float dir;
void trigart(float speed) {
  push();
   dir += speed;
  // normalise
  float radius = mouseX;
  float x = sin(dir) *radius;
  float y = cos(dir) *radius;
  // translate
  translate(width/2,height/2);
  point(x,y);
  pop();
}
