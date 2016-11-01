void oeuvre(int x, int y, int z) {
  pushMatrix() ;
  translate(x,y,z) ;
  
  beginShape() ;
  vertex(10,10, 30) ;
  vertex(300,10, -50) ;
  vertex(50,300, random(-50,50)) ;
  endShape(CLOSE) ;
  
  popMatrix() ;
}