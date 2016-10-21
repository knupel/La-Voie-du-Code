void setup() {
  size(400,400) ;
}

String letter = "" ;
void draw() {
  background(0) ;
  println(letter) ;
}


void keyPressed() {
  if(key == 'a' || key == 'A') letter = letter + "A" ;
  else if(key == 'z') letter += "Z" ;
  else if(key == 'e') letter += "E" ;
  else if(key == 'r') letter += "R" ;
  else if(key == 't') letter += "T" ;
  else if(key == 'y') letter += "Y" ;
}