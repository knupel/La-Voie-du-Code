/**
La Voie du Code vers les Étoiles
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_11_27
*/

void setup() {
  size(600,400);
}


void draw() {
  background(255);
  //turn_around();
  few_points();
  
}

int num = 10;
void few_points() {
  float angle = TAU / num;
  int diam = 50;
  PVector offset = new PVector();
  offset.x = width/2;
  offset.y = height/2;
    
  for(int i = 0 ; i < num ; i++) {
    float final_angle = angle*i;
    float cos_x = cos(final_angle);
    float sin_y = sin(final_angle);
    PVector pos = new PVector();
    int temp_diam = diam;
    if(i%2 == 0) temp_diam = diam/2;
    pos.x = (temp_diam * cos_x);
    pos.y = (temp_diam * sin_y);
    
    pos.add(offset);
    strokeWeight(3);
    point(pos.x,pos.y);
  }
}









PVector point;
void turn_around() {
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
  strokeWeight(3);
  point(pos.x,pos.y);
}
