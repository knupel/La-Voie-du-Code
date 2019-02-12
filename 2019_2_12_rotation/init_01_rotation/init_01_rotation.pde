/**
La Voie du Code : rotation
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/
float vitesse = 0.1;
float direction = 0;
float radius = 30;
PVector pos = new PVector(0,0);
void setup() {
  size(300,300);
}

void draw() {
  background(0); 
  direction += vitesse;
  pos.x = cos(direction);
  pos.y = sin(direction);
  pos.mult(radius);
  
  stroke(255);
  strokeWeight(10);

  push();
  translate(mouseX,mouseY);
  point(pos.x,pos.y);
  pop();
}
