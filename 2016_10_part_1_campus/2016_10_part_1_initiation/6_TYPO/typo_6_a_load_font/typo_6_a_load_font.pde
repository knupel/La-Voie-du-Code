PFont font ;
String path_name_font_file = "Aktuelle-48.vlw" ;


void setup() {
  size(600,600) ;
  font = loadFont(path_name_font_file) ;
  textFont(font, 150) ;
  text("Ainsi Font Font Font", 10, height/2) ;
}