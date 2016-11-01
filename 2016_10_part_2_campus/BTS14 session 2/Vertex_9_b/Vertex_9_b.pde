void setup() {
  size(400, 400) ;
}

void draw() {
  start_PDF(true) ;
  
  background(255);
  
  mon_dessin() ;
  
  stop_save_frame() ;
}


void keyPressed() {
  if(key == 'p') event_save() ;
}