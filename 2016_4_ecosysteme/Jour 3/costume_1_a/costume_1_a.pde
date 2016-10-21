Vec3 pos = Vec3() ;

void setup() {
  size(400,400,P3D) ;
}

void draw() {
  background(0) ;
  fill(255) ;
  stroke(255) ;
  pos = Vec3(mouseX, mouseY,0) ;
  int size = 40 ;
  Vec3 dir = new Vec3("RANDOM",1) ;
  int which_costume = 2 ;
  costume(pos, size, dir, which_costume) ;
}