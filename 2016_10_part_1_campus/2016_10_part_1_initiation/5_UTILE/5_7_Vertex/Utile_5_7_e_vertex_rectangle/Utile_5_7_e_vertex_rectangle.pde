void setup() {
  size(500,500) ;
}


void draw() {
  background(0) ;
  // method indirect bcp plus lisible, la mieux je pense.

  Vec2 pos = Vec2(mouseX, mouseY) ;
  Vec2 size = Vec2(50) ;
  rectangle(pos, size) ;
  
}





void rectangle(Vec2 pos, Vec2 size) {
  Vec2 displacement = Vec2(size.div(2)) ;
  Vec2 [] coord = new Vec2[4] ;
  coord[0] = Vec2(pos.x -displacement.x, pos.y -displacement.y) ;
  coord[1] = Vec2(pos.x +displacement.x, pos.y -displacement.y) ;
  coord[2] = Vec2(pos.x +displacement.x, pos.y +displacement.y) ;
  coord[3] = Vec2(pos.x -displacement.x, pos.y +displacement.y) ;
  
  beginShape() ;
  for(int i = 0 ; i < coord.length ; i++) {
     vertex(coord[i]) ;
  }
  endShape() ;
}