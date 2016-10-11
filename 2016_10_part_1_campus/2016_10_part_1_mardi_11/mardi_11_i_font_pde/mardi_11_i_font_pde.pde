PFont font ;
void setup() {
  size(500,500 ) ;
  printArray(font.list()) ;
  font = createFont("Weibei-SC-Bold", 50) ;

}

int size_txt = 0 ;
void draw() {
  background(0) ;
  size_txt++ ;
  if(mousePressed) size_txt = 20 ;
  textFont(font, size_txt) ;
  textAlign(CENTER) ;
  text("fjgnjnbgjn", mouseX, mouseY) ;
}