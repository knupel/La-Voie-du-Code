String font_path_vlw = "typo_VLW/DIN-Bold-48.vlw" ;

String sentence = "Fenêtre sur cour" ;
PFont font  ;

void setup() {
  size(400, 600);
  titre_init(font, font_path_vlw, 32) ;
}

void draw() {
  start_PDF() ;
  
  background(255);
  
  fill(0) ;
  ellipse(mouseX, mouseY, 50, 50 ) ;
  
  titre_display() ;
  
  stop_PDF() ;
}


void mousePressed() {
  record_PDF = true;
}



// seulement avec les font VLW
// PREMI7RE étape créer une font VLW, dans l'onglet Outils de Processing
void titre_init(PFont f, String path, int size) {
  f = loadFont(path);
  textFont(f, size) ;
}

void titre_display() {

  // aspect de mon titre
  fill(255,0,0) ;
  noStroke() ;
  // affichage du titre
  translate(width/2,height/4) ;
  textAlign(CENTER) ;
  text(sentence, 0,0) ;
}