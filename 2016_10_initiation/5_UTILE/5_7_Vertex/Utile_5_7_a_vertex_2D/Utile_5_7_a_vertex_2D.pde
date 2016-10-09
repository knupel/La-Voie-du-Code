void setup() {
  size(500,500) ;
}

void draw() {
  background(0) ;
 
  beginShape() ;
  vertex(10,10) ;
  vertex(width -10, 10) ;
  vertex(width-10, height-10) ;
  vertex(10, height-10) ;
  
  endShape() ;
  
}