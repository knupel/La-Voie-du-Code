void setup() {
  size(300,300) ;
  stroke(0) ;
  int step = 30 ;
  int num  = 0 ;
  for(int i = 0 ; i < width ; i++ ) {
    for(int k = 0 ; k < height ; k++) {
      if( i%step == 0 && k%step == 0 ) {
        num++ ;
      }
    }
  }
  
  PVector [] pts = new PVector[num] ;
  int count = 0 ;
  for(int i = 0 ; i < width ; i++ ) {
    for(int k = 0 ; k < height ; k++) {
      if( i%step == 0 && k%step == 0 ) {
        pts[count] = new PVector(i, k) ;
        count++ ;
      }
    }
  }
  
  for( int i = 0 ; i < pts.length ; i++) {
    point(pts[i].x, pts[i].y) ;
  }
}