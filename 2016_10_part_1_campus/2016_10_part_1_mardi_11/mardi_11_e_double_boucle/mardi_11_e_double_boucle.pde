void setup() {
  size(300,300) ;
  strokeWeight(5) ;
  int step = 30 ;
  for(int i = 0 ; i < width ; i++ ) {
    for(int k = 0 ; k < height ; k++) {
      if( i%step == 0 && k%step == 0 ) {
        if(i%(step*2) == 0 && k%(step*2) == 0 ) {
          stroke(0) ;
        } else {
          stroke(255) ;
        }
        point(i, k) ;
      }
    }
  }
}