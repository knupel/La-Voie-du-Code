



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
  titre_display(width/2, height/3) ;
}


RPoint[] points;
void create_font_point(int espace_entre_les_points) {
  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(espace_entre_les_points);
  points = titre.getPoints();
}

void titre_aspect() {
  stroke(255,0,0) ;
}


void titre_display(int pos_x, int pos_y) {
  translate(pos_x,pos_y) ;
  if(points != null){
    beginShape() ;
    for(int i=0; i<points.length; i++){
      vertex(points[i].x, points[i].y) ;  
    }
    endShape() ;
  }
}