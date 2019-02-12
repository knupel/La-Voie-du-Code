/**
La Voie du Code : rotation
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/
float vitesse = 0.1;
float direction = 0;
float radius = 30;
void setup() {
  size(300,300);
}

void draw() {
  background(0); 
  direction += vitesse;
  stroke(255);
  strokeWeight(10);
  animation(width/2,height/2,direction,radius);
}

void animation(int x, int y, float dir, float rad) {
  float px = cos(dir);
  float py = sin(dir);
  PVector pos  = new PVector(px,py);
  pos.mult(rad);
  push();
  translate(x,y);
  point(pos.x,pos.y);
  pop();
}