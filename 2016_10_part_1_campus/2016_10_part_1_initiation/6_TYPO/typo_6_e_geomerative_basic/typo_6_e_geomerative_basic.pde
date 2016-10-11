import geomerative.*;

RShape myObj ;

// seulement avec les font TTF
String font_file = "Delineate.ttf" ;
String sentence = "Ainsi Font Font Font" ;


void setup() {
  size(600,600, P3D) ;
  RG.init(this); 
  myObj = RG.getText(sentence, font_file, 72, CENTER);
}

void draw() {
  background(0) ;
  fill(255) ;
  pushMatrix() ;
  translate(width/2,height/2,0) ;
  myObj.draw();
  popMatrix() ;
  
  
    //
  pushMatrix() ;
  
  translate(width/2,height/2,-50) ;
  rotateX(frameCount *.01) ;
  
  noStroke() ;
  fill(240, 0,0) ;
  rect(-width/2,-height/2, width, height) ;
  
  popMatrix() ;
}