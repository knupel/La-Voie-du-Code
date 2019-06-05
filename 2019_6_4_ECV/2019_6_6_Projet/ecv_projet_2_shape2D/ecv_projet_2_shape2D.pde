import rope.vector.*;


vec2 master;
ECV ecv;
void setup() {
  size(640,480);
  master = new vec2();
  ecv = new ECV(master,3,50);
}

void draw() {
  background(0);
  strokeWeight(5);
  stroke(255);
  master.set(mouseX,mouseY);
  ecv.show();
}

class ECV {
  vec2 pos;
  vec2 [] points;
  ECV(vec2 pos, int num, int radius) {
    this.pos = pos; // pointer
    // this.pos = pos.copy(); // pointer
    points = new vec2[num];
    for(int i = 0 ; i < num ; i++) {
      points[i] = new vec2().rand(-radius,radius);
    }
  }
  
  void show() {
    push();
    translate(pos.x(),pos.y());
    beginShape();
    for(int i = 0 ; i < points.length ; i++) {
      vertex(points[i].x(),points[i].y());
    }
    endShape(CLOSE);
    pop();
  }
}
