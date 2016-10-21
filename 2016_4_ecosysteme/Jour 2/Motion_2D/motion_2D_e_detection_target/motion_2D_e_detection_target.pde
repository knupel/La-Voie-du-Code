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



Vec2 direction = new Vec2("RANDOM",1,1) ;

Vec2 pos = Vec2(width/2, height/2) ;
Vec2 motion = pos.copy() ; ;
int velocity = 2 ;
Vec2 velocity_xy = Vec2() ;
int size = 10 ;

void motion_2D() {
  direction.set(rebound(0 +size, height -size, 0 +size, width -size, pos, direction)) ;
  // folllow target
  Vec2 target = Vec2(mouseX,mouseY) ;
  if(dist(target,pos) < 50 ) direction.set(target_direction(target, pos)) ;
  

  
  
  // motion
  velocity_xy.set(velocity) ;
  velocity_xy.mult(direction) ;
  motion.add(velocity_xy) ;
  
  // position
  pos.set(motion) ;
  
  // aspect
  noFill() ;
  stroke(255) ;
  strokeWeight(size *2) ;
  
  // costume
  point(pos) ;
}


Vec2 rebound(float top, float bottom, float left, float right, Vec2 pos, Vec2 dir) {
  // detection x
  if(pos.x > right ) dir.x *= -1 ;
  else if (pos.x < left ) dir.x *= -1 ;
  //detection z
  if(pos.y > bottom) dir.y *= -1 ;
  else if (pos.y < top ) dir.y *= -1 ;
  return Vec2(dir.x,dir.y) ;
}