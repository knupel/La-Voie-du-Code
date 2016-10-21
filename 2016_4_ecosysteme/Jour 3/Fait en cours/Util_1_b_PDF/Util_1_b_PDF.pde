import processing.pdf.* ;
void setup() {
  size(400,400, PDF, "my_work.pdf") ;
}

String letter = "DAM 12" ;
void draw() {
  background(0) ;
  textAlign(CENTER) ;
  textSize(36) ;
  text(letter, width/2, height/2) ;
  println("Damned 12 my work is done !") ;
  exit() ;
}