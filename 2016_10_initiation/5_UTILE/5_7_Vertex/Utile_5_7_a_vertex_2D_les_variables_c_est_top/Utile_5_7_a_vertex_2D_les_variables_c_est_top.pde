void setup() {
  size(500,500) ;
}

void draw() {
  background(0) ;
  
  float marge = map(mouseX, 0,width, 10, 200) ;
 
  beginShape() ;
  vertex(marge,marge) ;
  vertex(width -marge, marge) ;
  vertex(width-marge, height-marge) ;
  vertex(marge, height-marge) ;
  
  endShape() ;
  
}