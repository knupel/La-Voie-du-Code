PFont font ;
void init_typo() {
  font = createFont("MADFONT.ttf", 200) ;
  textFont(font) ;
}

void update_typo() {
  String titre = "aplha B" ;
  textSize(20) ;
  textAlign(CENTER) ;
  text(titre, mouseX, mouseY) ;  
}