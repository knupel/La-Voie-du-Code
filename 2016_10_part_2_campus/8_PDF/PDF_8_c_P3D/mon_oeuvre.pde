void mon_oeuvre() {
  Vec3 a = Vec3(width/2, 10, 50) ;
  Vec3 b = Vec3(width -10, height -10, -50) ;
  Vec3 c = Vec3(10, height -10, 50) ;
  beginShape() ;
  vertex(a) ;
  vertex(b) ;
  vertex(c) ;
  endShape(CLOSE) ;
}