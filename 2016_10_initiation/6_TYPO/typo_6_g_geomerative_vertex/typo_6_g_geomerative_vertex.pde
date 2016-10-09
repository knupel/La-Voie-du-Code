import geomerative.*;

RShape myObj ;
RShape grp;
RPoint[] points;

// seulement avec les font TTF
String font_file = "Delineate.ttf" ;
String sentence = "Font Font" ;


void setup() {
  size(600,600) ;
  RG.init(this); 
  myObj = RG.getText(sentence, font_file, 144, CENTER);
}

void draw() {
  background(0) ;
  
  RG.setPolygonizer(RG.ADAPTATIVE);
  // mon objet doit être placé ici sinon il sera dessiné
  // Et nous souhaitons juste récupérer les points.
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  int min_space = 5 ;
  int max_space = 20 ;
  int space = int(abs(sin(frameCount *.01)) *max_space +min_space) ;
  println(space) ;
  RG.setPolygonizerLength(space);
  points = myObj.getPoints();
  stroke(255,0,0) ;
  strokeWeight(2) ;
  noFill() ;
  translate(width/2,height/2) ;
  if(points != null){
    RG.beginShape() ;
    for(int i=0; i<points.length; i++){
      RG.vertex(points[i].x, points[i].y);  
    }
    RG.endShape() ;
  }
}