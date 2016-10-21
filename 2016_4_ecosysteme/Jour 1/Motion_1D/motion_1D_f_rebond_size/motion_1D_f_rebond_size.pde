void setup() {
  size(400,400, P3D) ;
}


void draw() {
  background(0) ;
  
  motion_1D() ;
}


int size = 20 ;
int direction = 1 ;
int motion_x = 0 ;
float x = width/2 ;
void motion_1D() {
  // motion
  motion_x = motion_x + direction ;
  // position
  
  if(x > width -size/2 ) direction = -1 ;
  else if( x < 0 + size/2 ) direction = 1 ;
  x = motion_x ;
  float y = height/2 ;
  float z = 0 ;
  Vec3 pos = Vec3(x,y,z) ;
  // aspect
  noFill() ;
  stroke(255) ;
  strokeWeight(size) ;
  // costume
  point(pos) ;
}