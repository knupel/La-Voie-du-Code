/**
La Voie du Code vers les Étoiles
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_11_27
*/

void setup() {
  size(600,400);
}

float x;
float y;
void draw() {
  x = cos(frameCount *.01);
  y = sin(frameCount *.01);
  
  int diam = 50;
  
  float pos_x = (diam * x);
  float pos_y = (diam * y);
  
  float offset_x = width/2;
  float offset_y = height/2;
  
  pos_x = pos_x + offset_x;
  pos_y = pos_y + offset_y;
  
  point(pos_x,pos_y);
}
