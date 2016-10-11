void setup() {
  size(400,400) ;
}


void draw() {
  background(0) ;
  int width_rect = 100 ;
  int height_rect = 100 ;
  // étant donné que pour le rectangle processing utilise le côté aut gauche de la forme
  // il suffit d'en retirer la moitié pour repositionner au centre.
  translate(mouseX -width_rect/2, mouseY -height_rect/2) ;
  rect(0,0, width_rect, width_rect) ;
}