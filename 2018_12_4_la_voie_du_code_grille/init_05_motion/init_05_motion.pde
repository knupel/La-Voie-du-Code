
PVector [] pts ;
void setup() {
  size(400,400);
}

float angle ;
void draw() {
  background(255,0,0);
  int x = width/2;
  int y = height/2;
  int size = 50;
  angle += .02;
  rectMode(CENTER);
  pushMatrix();
  translate(x,y);
  rotate(angle);
  rect(0,0,size,size);
  popMatrix();
}
