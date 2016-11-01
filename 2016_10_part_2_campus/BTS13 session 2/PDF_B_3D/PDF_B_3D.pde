import processing.pdf.* ;

void setup() {
  size(400, 400, P3D) ;
}
void draw() {
  start_PDF() ;
  background(255) ;
  float altitude = sin(frameCount *.1) *200 ;
  oeuvre(mouseX, mouseY, (int)altitude ) ;
  stop_PDF() ;
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













boolean record_PDF;
void keyPressed() {
  if(key == 'p' ) record_PDF = true;
}

void start_PDF() {
  if (record_PDF) {
    // beginRecord(PDF, "impression/frame-####.pdf"); 
    beginRaw(PDF, "impression/frame_P3D-####.pdf"); 
  }
}
void stop_PDF() {
  if (record_PDF) {
    // endRecord();
    endRaw(); 
    record_PDF = false;
  }
}






          