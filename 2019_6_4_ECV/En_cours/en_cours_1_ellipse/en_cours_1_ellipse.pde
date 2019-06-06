void setup() {
  size(500,500);
  // background(0);
  // background(255,255,255,255);
  // background(0,0,0,255);
  //colorMode(HSB,360,100,100,100);
  background(255,100,100);
  println(frameCount);
}


void draw() {
  if(bg_is) background(0);
  println(frameCount);
  fill(255,0,0);
  stroke(0);
  strokeWeight(3);
  ellipse(mouseX,mouseY,50,50);
}

boolean bg_is;
void keyPressed() {
  if(key == 'b') {
    bg_is = !bg_is;
  }
  
}
