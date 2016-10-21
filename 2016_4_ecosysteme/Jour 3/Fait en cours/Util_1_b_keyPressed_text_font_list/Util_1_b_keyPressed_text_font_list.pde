PFont [] font = new PFont[5] ;
void setup() {
  size(400,400) ;
  font[0] = loadFont("HelveticaNeueLTStd-Ex-48.vlw") ;
  font[1] = loadFont("Magneto-Bold-48.vlw") ;
}


String letter = "AZERTY" ;
void draw() {
  background(0) ;
  textFont(font[0]) ;
  textAlign(CENTER) ;
  textSize(36) ;
  text(letter, width/2, height/2) ;
  textFont(font[1]) ;
  text(letter, mouseX, mouseY) ;
}

void keyPressed() {
  if(key == 'a') letter = "A" ;
  else if(key == 'z') letter = "Z" ;
  else if(key == 'e') letter = "E" ;
  else if(key == 'r') letter = "R" ;
  else if(key == 't') letter = "T" ;
  else if(key == 'y') letter = "Y" ;
}