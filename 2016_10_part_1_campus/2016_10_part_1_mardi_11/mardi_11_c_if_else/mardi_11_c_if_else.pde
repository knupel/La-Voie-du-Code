void setup() {
  size(300,300) ;
}

void draw() {
  background(255) ;
  fill(0) ;
  if(mousePressed) {
    ellipse(mouseY, mouseX, 30,30) ;
    ellipse(mouseX, mouseY, 30,30) ;
  } else {
    ellipse(mouseX, mouseY, 30,30) ;
  }
}