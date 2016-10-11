void setup() {
  size(300,300) ;
  stroke(0) ;
  strokeWeight(5) ;
  for(int i = 0 ; i < width ; i++ ) {
    if( i%20 == 0 ) point(i, height/2) ;
  }
}