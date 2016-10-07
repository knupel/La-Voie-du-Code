void setup() {
  size(400,400) ;
  colorMode(HSB, 360, 100, 100, 100) ;
}

float hue ; 
float alpha ;
void draw() {
  background(125) ;
  hue = map(mouseX, 0,width, 0, 360) ;
  alpha = map(mouseY, 0, height, 0, 100) ;
  int c = color(hue,100,100, alpha) ;
  fill(c) ;
  rect(30,30, 50,50) ;
}