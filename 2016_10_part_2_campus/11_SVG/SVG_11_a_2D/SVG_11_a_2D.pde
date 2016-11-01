
void setup() {
  size(600,600) ;
  svg_init() ;
  

}

void draw() {
  start_PDF() ;

  background_3D(255, 40) ;
  
  svg_update() ;
  
  background_PDF(0, g.colorModeA) ; 
  stop_save_frame() ;
  
  
    

}



void mousePressed() {
  event_save() ;

}