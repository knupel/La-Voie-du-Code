
Vec2 a = Vec2() ;
Vec2 b = Vec2() ;
Vec2 c = Vec2() ;
Vec2 d = Vec2() ;
void mon_dessin() {
  fill(255,0,0) ;
  strokeWeight(5) ;
  // stroke(0,255,0) ;
  noStroke() ;
  // noFill() ;
  
  if(mousePressed == true) {
    a.x  = random(width/2, width) ;
    a.y  = random(width) ;
    b.x  = random(width/2, width) ;
    b.y  = random(width) ;
    c.x  = random(width/2, width) ;
    c.y  = random(width) ;
    d.x  = random(width/2, width) ;
    d.y  = random(width) ;
  }
  beginShape() ;
  vertex(a) ;
  vertex(b) ;
  vertex(c) ;
  vertex(d) ;
  endShape(CLOSE) ;
}