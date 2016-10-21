void setup() {
  size(400,400, P3D) ;
}


void draw() {
  background(0) ;
  
  motion_1D() ;
}


int motion_x = 0 ;
void motion_1D() {
  // motion
  motion_x = motion_x + 1 ;
  // position
  float x = width/2 + motion_x ;
  float y = height/2 ;
  float z = 0 ;
  Vec3 pos = Vec3(x,y,z) ;
  // aspect
  noFill() ;
  stroke(255) ;
  strokeWeight(5) ;
  // costume
  point(pos) ;
}