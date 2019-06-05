void setup() {
  size(400,400);
  colorMode(HSB,1,1,1,1);
}

void draw() {
  if(use_bg_is) {
    background(1);
  }
  int turn_by_round = 50;
  float velocity = map(mouseY,0,height,-1,1);
  float max_speed = .5;
  float speed = max_speed *velocity;
  float teinte = sin(frameCount *.001);
  int couleur = color(teinte,1,1);
  for(int i = 0 ; i < turn_by_round ; i++) {
    trigart(speed,couleur);
  } 
}

float dir;
void trigart(float speed, int c) {
  push();
  dir += speed;
  // normalise
  float radius = mouseX;
  float x = sin(dir) *radius;
  float y = cos(dir) *radius;
  // translate
  translate(width/2,height/2);
  stroke(c);
  point(x,y);
  pop();
}


boolean use_bg_is;
void keyPressed() {
  if(key == 'b') {
    use_bg_is = !use_bg_is;
  }
}
