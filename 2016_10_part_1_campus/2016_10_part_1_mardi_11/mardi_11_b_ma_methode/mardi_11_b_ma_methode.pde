void setup() { 
  size(600,300) ;
}

void draw() {
  background(0) ;
  methode(mouseX, mouseY, 125, 35) ;
  methode(mouseY, mouseX, 125, 35) ;
}