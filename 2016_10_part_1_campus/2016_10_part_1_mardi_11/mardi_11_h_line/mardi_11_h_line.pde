void setup() {
  size(300,300) ;
  stroke(0) ;
  strokeWeight(5) ;
  int step = 30 ;

  liste(step) ;
  ligne(step) ;
}

void ligne(int step) {
  for( int i = 0 ; i < pts.length ; i++) {
    int which = (int)random(pts.length) ;
    PVector temp = pts[which].copy() ;
    int rouge = (int)random(255) ;
    int vert = (int)random(255) ;
    int bleu = (int)random(255) ;
    stroke(rouge, vert, bleu) ;
    float epaisseur = random(30) ;
    strokeWeight(epaisseur) ;
    int cor = step /2 ; 
    line(pts[i].x +cor, pts[i].y +cor, temp.x +cor, temp.y +cor) ;
  }
}