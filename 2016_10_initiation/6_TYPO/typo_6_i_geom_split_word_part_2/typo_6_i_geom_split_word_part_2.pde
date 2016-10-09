import geomerative.*;

RShape [] letter ;
RShape grp;
RPoint[] points;

// seulement avec les font TTF
String font_file = "Delineate.ttf" ;
String sentence = "Font Font" ;
int size_font = 144 ;


void setup() {
  size(600,600) ;
  RG.init(this);
  
  String [] s = sentence.split("") ;
  letter = new RShape[s.length] ;
  for(int i = 0 ; i < letter.length ; i++) {
    letter[i] = RG.getText(s[i], font_file, size_font, CENTER) ;
  } 
}

void draw() {
  background(0) ;
  
  RG.setPolygonizer(RG.ADAPTATIVE);
  // mon objet doit être placé ici sinon il sera dessiné
  // Et nous souhaitons juste récupérer les points.
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  
  int space = 20 ;
  int pos_x_next_letter = 0 ;
  String [] s = sentence.split("") ;
  for(int i = 0 ; i < letter.length ; i++) {
    points = points(letter[i], space);
    aspect() ;
    pos_x_next_letter += width_String(font_file, s[i], size_font) ; 
    Vec2 pos = Vec2(mouseX +pos_x_next_letter , mouseY) ;
    letter(pos, points) ;
  }
}





// local
RPoint[] points(RShape myObj, int space) {
  RPoint[] pts ;
  RG.setPolygonizerLength(space);
  pts = myObj.getPoints();
  return pts ;
}




void aspect() {
  stroke(255,0,0) ;
  strokeWeight(2) ;
  noFill() ;
}




void letter(Vec2 pos, RPoint[] points) {
  pushMatrix() ;
  translate(pos) ;
  if(points != null){
    RG.beginShape() ;
    for(int i=0; i<points.length; i++){
      RG.vertex(points[i].x, points[i].y);  
    }
    RG.endShape() ;
  }
  popMatrix() ;
}