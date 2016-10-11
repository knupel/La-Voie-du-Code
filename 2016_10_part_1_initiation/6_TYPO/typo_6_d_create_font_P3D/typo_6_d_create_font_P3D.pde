PFont font ;
String font_file = "Aktuelle" ;
String sentence = "Ainsi Font Font Font" ;

void setup() {
  size(600,600, P3D) ;
  font = createFont(font_file, 72) ;
  textFont(font, 72) ;
}

void draw() {
  background(0) ;
  fill(255) ;
  text(sentence, 48, height/2) ;
  
  //
  pushMatrix() ;
  
  translate(width/2,height/2,-50) ;
  rotateX(frameCount *.01) ;
  
  noStroke() ;
  fill(240, 0,0) ;
  rect(-width/2,-height/2, width, height) ;
  
  popMatrix() ;
}