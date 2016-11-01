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