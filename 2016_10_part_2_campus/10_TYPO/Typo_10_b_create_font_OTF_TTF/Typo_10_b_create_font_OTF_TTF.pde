String font_path_ttf = "typo_TTF/Mabella.ttf" ;
String font_path_otf = "typo_OTF/Acropolis-HTF-Black-Italic.otf" ;
String sentence = "Fenêtre sur cour" ;
PFont font  ;

void setup() {
  size(400, 600, P3D);
  titre_init(font, font_path_otf, 30) ;
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




// seulement avec les font TTF et OTF

void titre_init(PFont f, String path, int size) {
  f = createFont(path, size);
  textFont(f) ;
}

void titre_display() {
  // aspect de mon titre
  fill(255,0,0) ;
  noStroke() ;
  // affichage du titre
  translate(width/2,height/4) ;

  text(sentence, 0,0) ;
}