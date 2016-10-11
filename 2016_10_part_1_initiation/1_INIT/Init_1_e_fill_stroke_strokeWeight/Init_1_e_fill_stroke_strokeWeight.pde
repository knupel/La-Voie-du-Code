void setup() {
  size(300,300) ;
  background(0) ;
}


void draw() {
  background(125) ;
  
  strokeWeight(1) ;
  // Grey
  stroke(0) ;
  fill(255) ;
  ellipse(width/5, height/2, 50,50) ;
  // Grey Alpha
  stroke(0, 125) ;
  fill(255, 125) ;
  ellipse(width/3, height/2, 50,50) ;
  // RVB
  stroke(0, 0, 0) ;
  fill(50, 255, 255) ;
  ellipse(width -width/3, height/2, 50,50) ;
  // RVBA
  stroke(0, 0, 0, 125) ;
  fill(50, 255, 255, 125) ;
  ellipse(width -width/5, height/2, 50,50) ;
}