

void setup() {
  size(400, 600, P3D);
  titre_init() ;
}

void draw() {
  start_PDF() ;
  
  background(255);
  
  titre_update() ;
  
  stop_PDF() ;
}


void mousePressed() {
  record_PDF = true;
}