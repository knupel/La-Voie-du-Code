

void setup() {
  size(400, 600);
  titre_init() ;
}

void draw() {
  start_PDF() ;
  
  background(255);
  
  titre_display() ;
  
  stop_PDF() ;
}


void mousePressed() {
  record_PDF = true;
}