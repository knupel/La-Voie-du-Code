void souris() {
  float diam = 150;
  float ratio_diam = sin(frameCount *.01);
  diam *= ratio_diam;
  fill(255);
  ellipse(mouseX,mouseY,diam,diam);
}
