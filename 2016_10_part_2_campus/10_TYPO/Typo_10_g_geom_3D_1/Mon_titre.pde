



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

void titre_update() {
  create_font_point(2) ;
  titre_aspect() ;
  titre_display(mouseX, mouseY) ;
}


Vec3[] vec_points;
void create_font_point(int espace_entre_les_points) {
  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(espace_entre_les_points);
  // liste de points
  RPoint[] p;
  p = titre.getPoints();
  vec_points = new Vec3[p.length] ;
  // altitude et ondulation
  float altitude_max = 100. ;
  float step = altitude_max / p.length  ;
  float altitude = 0 ;
  println(step) ;
  
  // create point
  for(int i = 0 ; i < p.length ; i++) {
    altitude += step ;
    if(vec_points[i] == null) {
      vec_points[i] = Vec3(p[i].x,p[i].y, altitude) ; 
    } else {
      vec_points[i].set(p[i].x,p[i].y, altitude) ;
    } ;
  }
}


void titre_aspect() {
  stroke(255,0,0) ;
  noFill() ;
}


void titre_display(int pos_x, int pos_y) {
  translate(pos_x,pos_y) ;
  if(vec_points != null){
    beginShape() ;
    for(int i = 0; i < vec_points.length ; i++){
      vertex(vec_points[i]) ;  
    }
    endShape() ;
  }
}