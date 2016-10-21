



import geomerative.*;
RShape titre ;
// seulement avec les font TTF
String font_file = "typo_TTF/Mabella.ttf" ;
String sentence = "Fenêtre sur cour" ;

void titre_init() {
  RG.init(this); 
  // Geomerative a besoin d'une taille minimum pour créer un nombre de point suffisant,
  // afin de rendre un rendu correct, ce minimum peut changer en fonction de la complexité de la typo
  int size = 60 ;
  titre = RG.getText(sentence, font_file, size, CENTER);
}

void titre_display() {

  // aspect de mon titre
  
  fill(255,0,0) ;
  noStroke() ;
  // affichage du titre
  translate(width/2,height/4) ;
  titre.draw() ;
}