void setup() {
  size(500,500);
}

void draw() {
  if(bg_is) background(0);
  forme(mouseX,mouseY,100);
  forme(mouseY,mouseX,100);
}

boolean bg_is;
void keyPressed() {
  if(key == 'b') {
    bg_is = !bg_is;
  } 
}

void forme(int x, int y, float size) {
  fill(255,0,0);
  stroke(0);
  strokeWeight(3);
  ellipse(x,y,size,size);
}
