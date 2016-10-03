void setup() {
  size(300,300) ;
  background(0) ;
}


void draw() {
  background(frameCount) ;
  println("frameCount", frameCount) ;
  
  fill(0) ;
  stroke(0) ;
  textAlign(CENTER) ;
  textSize(24) ;
  text("Bonjour le Monde", mouseX, mouseY) ;
  
  fill(255) ;
  ellipse(width/2, height/2, 50, 50) ;
}