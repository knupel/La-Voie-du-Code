void setup() {
  size(200,200) ;
}

int count ;
void draw() {
  background(255) ;
  int step = 20 ;
  stroke(0) ;
  fill(0) ;
  strokeWeight(2) ;
  textAlign(CENTER) ;
  int size_text = 12 ;
  textSize(size_text) ;
  
  for(int i = 0 ; i < width ; i++) {
    for(int j = 0 ; j < height ; j++) {
      if(i%step == 0 && j%step == 0 ) {
        int x = j +step/2 ;
        int y = i +step/2 ;
        count++ ;
        if(mousePressed) { 
          point(x,y) ;
        } else {
          int pos_text_y = y +(size_text/2) ;
          text(count, x, pos_text_y) ;
        }
      }
    }
  }
  count = 0 ;
}