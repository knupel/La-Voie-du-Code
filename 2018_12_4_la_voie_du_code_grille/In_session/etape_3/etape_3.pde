/*
@see https://github.com/StanLepunK/La-Voie-du-Code
*/
PVector [] pts;
void setup() {
  size(320,240);
  strokeWeight(10);
  int max = 10;
  pts = new PVector[max*max];
  float cellule = width / (float)max;
  float offset_x = cellule /2;
  float offset_y = cellule /2;
  
  int rank = 0 ;
  for(int x = 0 ; x < max ; x++) {
    for(int y = 0 ; y < max ; y++) {
      float temp_x = x *cellule +offset_x;
      float temp_y = y *cellule +offset_y;
      pts[rank] = new PVector(temp_x,temp_y); 
      rank++;
    }
  }
}

float angle;
void draw() {
  arriere_plan(255,0,0,20);
  fill(255);
  stroke(255);
  float taille = 10;
  angle += .1;
  for(int i = 0 ; i < pts.length ; i++) {
    // point(pts[i].x,pts[i].y);
    motif(pts[i].x,pts[i].y,taille,angle);
  }
}
