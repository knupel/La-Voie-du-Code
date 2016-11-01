import processing.pdf.* ;

void setup() {
  size(400, 400) ;
}
void draw() {
  start_PDF() ;
  background(255) ;
  line(mouseX, mouseY, width/2, height/2);
  stop_PDF() ;
}

boolean record_PDF;
void mousePressed() {
  record_PDF = true;
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






          