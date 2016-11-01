void setup() {
  size(600,300) ;
}


void draw() {
  background(255, 255,0) ;
  
  fill(0,0,255) ;
  stroke(0) ;
  strokeWeight(3) ;
  rect(width/2 -25, height/2 -25, 50, 50) ;
  
  fill(255, 0,0) ;
  stroke(0) ;
  strokeWeight(3) ;
  ellipse(width/2, height/2, 50, 50) ;
  
  textAlign(CENTER) ;
  textSize(48) ;
  text("Bonjour le Monde", mouseX, mouseY) ;
  println(frameCount, mouseX, mouseY) ;
  
  
}