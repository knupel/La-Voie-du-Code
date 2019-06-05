PVector [] pts = new PVector[5];
void setup() {
  size(500,500);
  for(int i = 0 ; i < pts.length ; i++) {
    pts[i] = new PVector(random(-1,1),random(-1,1));
  }
}


void draw() {
  background(255,0,0);
  noStroke();
  fill(0);
  float radius = mouseX /2;
  push();
  translate(width/2,height/2);
  beginShape();
  for(int i = 0 ; i < pts.length ; i++) {
    PVector temp = pts[i].copy();
    temp.mult(radius);
    vertex(temp.x,temp.y);
  }
  endShape();
  pop();
}
