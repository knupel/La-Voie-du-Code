void setup() {
  size(400, 400, P3D) ;
  init_typo() ;
}
void draw() {
  background_3D(255, 30) ;
  fill(255,0,0, 20) ;
  noStroke() ;
  update_typo() ;
  // oeuvre(mouseX, mouseY, (int)altitude ) ;
  save_PNG() ;
}

void keyPressed() {
  if(key == 'p' ) record_PNG = true;
}













          