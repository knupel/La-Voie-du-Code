void methode(int posX, int posY, int couleur_1, int couleur_2) {
  int size_width = 50 ; 
  int size_height = 50 ; 
  if(mousePressed) {
    fill(couleur_1) ; 
  } else { 
    fill(couleur_2) ;
  }
  ellipse(posX, posY, size_width, size_height) ;
}