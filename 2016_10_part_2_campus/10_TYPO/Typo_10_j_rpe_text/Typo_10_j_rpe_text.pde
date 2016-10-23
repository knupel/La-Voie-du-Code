

void setup() {
  size(600, 800, P3D);
  titre_init() ;
}

void draw() {
  start_PDF() ;
  
  background(0) ;
  
  titre_update() ;
  
  stop_PDF() ;
}


void mousePressed() {
  record_PDF = true;
}