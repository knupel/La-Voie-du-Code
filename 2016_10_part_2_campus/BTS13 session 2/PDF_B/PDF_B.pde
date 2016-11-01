import processing.pdf.* ;

void setup() {
  size(400, 400) ;
}
void draw() {
  start_PDF() ;
  background(255) ;
  oeuvre() ;
  stop_PDF() ;
}


void oeuvre() {
  beginShape() ;
  vertex(10,10) ;
  vertex(300,10) ;
  vertex(50,300) ;
  endShape(CLOSE) ;
}













boolean record_PDF;
void keyPressed() {
  if(key == 'p' ) record_PDF = true;
}

void start_PDF() {
  if (record_PDF) {
    beginRecord(PDF, "impression/frame-####.pdf"); 
  }
}
void stop_PDF() {
  if (record_PDF) {
    endRecord();
    record_PDF = false;
  }
}






          