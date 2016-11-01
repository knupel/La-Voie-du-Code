import processing.pdf.* ;

void setup() {
  size(400, 400, P3D) ;
}
void draw() {

  // background(255) ;
  background_3D(255, 30) ;
  float altitude = sin(frameCount *.1) *200 ;
  fill(255,0,0, 20) ;
  noStroke() ;
  oeuvre(mouseX, mouseY, (int)altitude ) ;
  save_PNG() ;
}

void save_PNG() {
  if(record_PNG) saveFrame("impression/PNG-######.png");
  record_PNG = false ;
}

boolean record_PNG ;
void keyPressed() {
  if(key == 'p' ) record_PNG = true;
}




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








          