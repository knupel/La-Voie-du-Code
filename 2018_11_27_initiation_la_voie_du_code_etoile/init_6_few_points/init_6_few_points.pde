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
PVector [] pts = new PVector[num];
void few_points() {
  float angle = TAU / num;
  int diam = 50;
  PVector offset = new PVector();
  offset.x = width/2;
  offset.y = height/2;
    
  for(int i = 0 ; i < num ; i++) {
    if(pts[i] == null) pts[i] = new PVector();
    float final_angle = angle*i;
    pts[i].x = cos(final_angle);
    pts[i].y = sin(final_angle);
    PVector pos = new PVector();
    pos.x = (diam * pts[i].x);
    pos.y = (diam * pts[i].y);
    
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
