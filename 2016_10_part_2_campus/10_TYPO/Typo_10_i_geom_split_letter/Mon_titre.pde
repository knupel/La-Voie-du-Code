



import geomerative.*;
// seulement avec les font TTF
String font_file = "typo_TTF/Mabella.ttf" ;
String sentence = "Fenêtre sur cour" ;

/**
BUILD
*/
Letter [] letter ;
RShape [] R_letter ;
int size_font = 60 ;
void titre_init() {
  RG.init(this); 
  // Geomerative a besoin d'une taille minimum pour créer un nombre de point suffisant,
  // afin de rendre un rendu correct, ce minimum peut changer en fonction de la complexité de la typo

  // letters
  String [] s = sentence.split("") ;
  letter = new Letter[s.length] ;
  R_letter = new RShape[s.length] ;
  for(int i = 0 ; i < R_letter.length ; i++) {
    R_letter[i] = RG.getText(s[i], font_file, size_font, CENTER) ;
  } 
}



void titre_update() {
  int espace = 2 ; 
  create_font_point(espace, size_font) ;
  titre_aspect() ;
  titre_display(mouseX, mouseY) ;
}



/**
CREATE
*/
void create_font_point(int space, int size) {
  PFont font = createFont(font_file, size) ;
  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  // liste des lettres
  float pos_x_next_letter = 0 ;
  String [] s = sentence.split("") ;
  RPoint[] points;
  for(int i = 0 ; i < letter.length ; i++) {
    pos_x_next_letter += width_String(font, s[i], size) ;
    if(points(R_letter[i], space) != null ) {
      points = points(R_letter[i], space).clone();
       
      letter[i] = letter(points, pos_x_next_letter) ;
    }
  }
}


Letter letter(RPoint[] points, float displacement) {
  Letter l = new Letter() ;
  if(points != null){
    Vec3 [] temp_pos = new Vec3[points.length] ;
    for(int i=0; i<points.length; i++){
      temp_pos[i] = Vec3(points[i].x +displacement, points[i].y, 0) ;
    }
    l.set(temp_pos) ;
  }
  return l ;
}


// local
RPoint[] points(RShape myObj, int space) {
  RPoint[] pts ;
  RG.setPolygonizerLength(space);
  pts = myObj.getPoints();
  if(pts == null ) {
    return null ;
  } else {
    return pts ;
  }

}





/**
ASPECT
*/
void titre_aspect() {
  // strokeWeight(2) ;
  // stroke(255,0,0) ;
  noStroke() ;
  fill(255,0,0) ;
}








/**
DISPLAY
*/
void titre_display(int pos_x, int pos_y) {
  translate(pos_x,pos_y) ;
  if(letter.length > 0){
    for(int i = 0 ; i < letter.length ; i++) {

      if(letter[i] != null) display_vertex(letter[i].pos) ;
    // display_point(letter[i].pos) ;
    }

  }
}



// local method for different display
void display_vertex(Vec3 [] v) {
  beginShape() ;
  for(int i = 0; i < v.length ; i++){
    vertex(v[i]) ;  
  }
  endShape() ;
}

void display_point(Vec3 [] v ) {
  for(int i = 0; i < v.length ; i++){
    point(v[i]) ;  
  }
}