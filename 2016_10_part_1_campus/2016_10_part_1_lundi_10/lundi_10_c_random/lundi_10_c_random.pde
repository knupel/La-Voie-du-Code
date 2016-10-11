void setup() {
  size(400,400) ;
}

float rouge, vert, bleu ;
void draw() {
  bg(rouge, 30) ;
  
  if(mousePressed) {
    rouge += 1  ;
    vert  += 2;
    bleu  += 3;
  }
  
  if(rouge > 255) rouge = 0 ;
  if(vert > 255) vert = 0 ;
  if(bleu > 255) bleu = 0 ;
  
  println(rouge, vert, bleu) ;
  fill(rouge, vert, bleu) ;
  int posX = mouseX ;
  int posY = mouseY ;
  int sizeShape = 50 ;
  ellipse(posX, posY, sizeShape, sizeShape) ;
}


void bg(float x, int alpha) {
  fill(x, alpha) ;
  noStroke() ;
  rect(0,0, width, height) ;
}