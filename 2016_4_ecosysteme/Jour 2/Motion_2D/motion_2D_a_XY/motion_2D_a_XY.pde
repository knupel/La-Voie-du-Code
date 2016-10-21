/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
http://natureofcode.com/book/chapter-2-forces/#chapter02_example6
*/
void setup() {
  size(400,400, P3D) ;
}



void draw() {
  background(0) ;
  
  motion_2D() ;
}



Vec2 direction = Vec2(1,1) ;
Vec2 motion = Vec2() ;
Vec2 pos = Vec2(width/2, height/2) ;
int absolute_speed = 2 ;
Vec2 speed = Vec2() ;
int size = 10 ;
float x = width/2 ;
void motion_2D() {
  //detection x
  if(pos.x > width -size ) direction.x = - 1 ;
  else if (pos.x < 0 +size ) direction.x = 1 ;
  //detection z
  if(pos.y > height -size) direction.y = - 1 ;
  else if (pos.y < 0 +size ) direction.y = 1 ;
  
  // motion
  speed.set(absolute_speed) ;
  speed.mult(direction) ;
  motion.add(speed) ;
  
  // position
  pos.set(motion) ;
  
  // aspect
  noFill() ;
  stroke(255) ;
  strokeWeight(size *2) ;
  
  // costume
  point(pos) ;
}