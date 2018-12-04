/**
La Voie du Code : grille
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_4
*/
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
  rect_motion(x,y,size,angle);
}

void rect_motion(int x,int y,int size, float angle) {
  rectMode(CENTER);
  pushMatrix();
  translate(x,y);
  rotate(angle);
  rect(0,0,size,size);
  popMatrix();
}
