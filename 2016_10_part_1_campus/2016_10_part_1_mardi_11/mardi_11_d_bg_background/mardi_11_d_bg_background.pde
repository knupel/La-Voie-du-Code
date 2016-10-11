void setup() {
  size(300,300) ;
}


void draw() {
  /*
  Quatre méthodes pour intervenir sur la couleur du background
  ceux sont les mêmes pour fill(,), stroke(,) et background(,) de Processing
  */
  // bg(255) ; // gris
  // bg(255, 10) ; // gris, alpha
  bg(255,0,0) ; // RVB
  // bg(255,0,0,10) ; // RVBalpha
  stroke(0) ;
  strokeWeight(10) ;
  point(mouseX,mouseY) ;
}