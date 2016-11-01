
Vec2 [] p = new Vec2[100] ;
void mon_dessin() {
  fill(255,0,0,50) ;
  strokeWeight(5) ;
  noStroke() ;
  
  for(int i = 0 ; i < p.length ; i++) {
    p[i] = Vec2(random(width), random(height)) ;
  }


  beginShape() ;
  for(int i = 0 ; i < p.length ; i++) {
    vertex(p[i]) ;
  }
  endShape(CLOSE) ;
}