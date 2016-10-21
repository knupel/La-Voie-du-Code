void setup() {
  size(400,400) ;
}

String letter = "AZERTY" ;
void draw() {
  background(0) ;
  textAlign(CENTER) ;
  textSize(36) ;
  text(letter, width/2, height/2) ;
}

void keyPressed() {
  if(key == 'a') letter = "A" ;
  else if(key == 'z') letter = "Z" ;
  else if(key == 'e') letter = "E" ;
  else if(key == 'r') letter = "R" ;
  else if(key == 't') letter = "T" ;
  else if(key == 'y') letter = "Y" ;
}