PVector [] points = new PVector[3];
void setup() {
  size(500,500);
  for(int i = 0 ; i < points.length ; i++) {
    points[i] = new PVector(random(-1,1),random(-1,1));
  }
  
}

void draw() {
  background(0);
  beginShape();
  float tx = width/2;
  float ty = height/2;
  for(int i = 0 ; i < points.length ; i++) {
    PVector temp = points[i].copy();
    //PVector temp = points[i];
    temp.mult(mouseX);
    vertex(temp.x +tx,temp.y +ty);
  }
  endShape(CLOSE);
}
