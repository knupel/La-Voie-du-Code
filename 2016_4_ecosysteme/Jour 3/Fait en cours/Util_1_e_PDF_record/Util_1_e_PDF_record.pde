import processing.pdf.* ;
void setup() {
  size(400,400) ;
  frameRate(5) ;
}

String letter = "DAM 12" ;
boolean record, new_pdf ;
void draw() {
  if(record) beginRecord(PDF, "DAM 12-####.pdf");
  // record part
  background(0) ;
  textAlign(CENTER) ;
  textSize(36) ;
  text(letter, width/2, height/2) ;
  
  if(record) endRecord() ;
  if(record) println("Export in progress") ; else println("Nothing happen") ;
}


void mousePressed() {
  if(record) record = false ; else record = true ;
}


void keyPressed() {
  if(key == 'a') letter += "A" ;
  else if(key == 'z') letter += "Z" ;
  else if(key == 'e') letter += "E" ;
  else if(key == 'r') letter += "R" ;
  else if(key == 't') letter += "T" ;
  else if(key == 'y') letter += "Y" ;
  else if(key == 'u') letter += "E" ;
  else if(key == 'i') letter += "I" ;
  else if(key == 'o') letter += "O" ;
  else if(key == 'p') letter += "P" ;
  else if(key == 'q') letter += "Q" ;
  else if(key == 's') letter += "S" ;
  else if(key == 'd') letter += "D" ;
  else if(key == 'f') letter += "F" ;
  else if(key == 'g') letter += "G" ;
  else if(key == 'h') letter += "H" ;
  else if(key == 'j') letter += "J" ;
  else if(key == 'k') letter += "K" ;
  else if(key == 'l') letter += "L" ;
  else if(key == 'm') letter += "M" ;
  else if(key == 'w') letter += "W" ;
  else if(key == 'x') letter += "X" ;
  else if(key == 'c') letter += "C" ;
  else if(key == 'v') letter += "V" ;
  else if(key == 'b') letter += "B" ;
  else if(key == ' ') letter += " " ;
  else if(key == CODED) {
    if(keyCode == UP)letter = "" ;
    if(keyCode == DOWN)letter = "" ;
    if(keyCode == LEFT)letter = "" ;
    if(keyCode == RIGHT)letter = "" ;
  }
}