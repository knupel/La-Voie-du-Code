PFont font ;
// Possible avec les font TTF et OTF
String font_file = "Aktuelle" ;

void setup() {
  size(600,600) ;
  font = createFont(font_file, 10) ;
  textFont(font, 170) ;
  text("Ainsi Font Font Font", 10, height/2) ;
}