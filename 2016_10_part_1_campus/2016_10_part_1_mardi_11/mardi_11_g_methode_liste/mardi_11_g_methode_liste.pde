void setup() {
  size(300,300) ;
  stroke(0) ;
  strokeWeight(5) ;
  int step = 30 ;

  liste(step) ;
  for( int i = 0 ; i < pts.length ; i++) {
    point(pts[i].x, pts[i].y) ;
  }
}

PVector [] pts ;
void liste(int step) {
  int num  = 0 ;
  for(int i = 0 ; i < width ; i++ ) {
    for(int k = 0 ; k < height ; k++) {
      if( i%step == 0 && k%step == 0 ) {
        num++ ;
      }
    }
  }
  pts = new PVector[num] ;
  int count = 0 ;
  for(int i = 0 ; i < width ; i++ ) {
    for(int k = 0 ; k < height ; k++) {
      if( i%step == 0 && k%step == 0 ) {
        pts[count] = new PVector(i, k) ;
        count++ ;
      }
    }
  }
}