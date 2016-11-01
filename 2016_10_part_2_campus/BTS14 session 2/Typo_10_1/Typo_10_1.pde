

void setup() {
  size(600, 800, P3D);
  titre_init() ;
}

void draw() {
  start_PDF(true) ;
  
  background(0) ;
  
  titre_update() ;
  
  stop_save_frame() ;
}


void keyPressed() {
  if(key == 'p') event_save() ;
}