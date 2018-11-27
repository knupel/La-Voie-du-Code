/**
La Voie du Code vers les Étoiles
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_11_27
*/

void setup() {
  size(600,400);
}

PVector point;
void draw() {
  background(255);
  if(point == null) point = new PVector();
  point.x = cos(frameCount *.01);
  point.y = sin(frameCount *.01);
  
  int diam = 50;
  
  PVector pos = new PVector();
  pos.x = (diam * point.x);
  pos.y = (diam * point.y);
  
  
  PVector offset = new PVector();
  offset.x = width/2;
  offset.y = height/2;
  
  pos.add(offset);
  
  strokeWeight(2);
  point(pos.x,pos.y);
}
