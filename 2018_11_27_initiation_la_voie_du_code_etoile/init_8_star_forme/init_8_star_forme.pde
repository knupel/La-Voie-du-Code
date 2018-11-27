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
PVector [] pos = new PVector[num];
void few_points() {
  float angle = TAU / num;
  int diam = 50;
  PVector offset = new PVector();
  offset.x = width/2;
  offset.y = height/2;
  // position
  for(int i = 0 ; i < num ; i++) {
    if(pts[i] == null) pts[i] = new PVector();
    if(pos[i] == null) pos[i] = new PVector();
    float final_angle = angle*i;
    pts[i].x = cos(final_angle);
    pts[i].y = sin(final_angle);
    int temp_diam = diam;
    if(i%2 == 0) temp_diam = diam/2;
    pos[i].x = (temp_diam * pts[i].x);
    pos[i].y = (temp_diam * pts[i].y);
    
    pos[i].add(offset);
  }
  // forme
  beginShape();
  for(int i = 0 ; i < num ; i++) {
    vertex(pos[i].x,pos[i].y);
  }
  endShape(CLOSE);
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
