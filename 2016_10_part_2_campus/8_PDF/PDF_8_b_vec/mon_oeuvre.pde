void mon_oeuvre() {
  Vec2 a = Vec2(width/2, 10) ;
  Vec2 b = Vec2(width -10, height -10) ;
  Vec2 c = Vec2(10, height -10) ;
  beginShape() ;
  vertex(a) ;
  vertex(b) ;
  vertex(c) ;
  endShape(CLOSE) ;
}