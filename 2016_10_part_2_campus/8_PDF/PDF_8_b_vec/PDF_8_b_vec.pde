

void setup() {
  size(400, 400);
}

void draw() {
  start_PDF() ;
  
  background(255);
  
  mon_oeuvre() ;
  
  stop_PDF() ;
}


void mousePressed() {
  record_PDF = true;
}