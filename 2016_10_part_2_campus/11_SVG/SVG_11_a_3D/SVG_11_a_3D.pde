
void setup() {
  size(600,600, P3D) ;
  svg_init() ;
}

void draw() {
  start_PDF(true) ;

  background_3D(125, 10) ;
  
  svg_update() ;
  
  background_PDF(125, g.colorModeA) ; 
  stop_save_frame() ;
}



void mousePressed() {
  event_save() ;
}