void setup() {
  size(400,400);
}


void draw() {
  background(0);
  float diam = 150;
  float ratio_diam = sin(frameCount *.01);
  diam *= ratio_diam;
  ellipse(mouseX,mouseY,diam,diam);
}
