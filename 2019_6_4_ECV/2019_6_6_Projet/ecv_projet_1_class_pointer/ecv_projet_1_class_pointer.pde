import rope.vector.*;


vec3 master;
ECV ecv;
void setup() {
  size(640,480);
  master = new vec3();
  ecv = new ECV(master);
}

void draw() {
  background(0);
  strokeWeight(5);
  stroke(255);
  master.set(mouseX,mouseY,0);
  ecv.show();
}



class ECV {
  vec3 pos;
  ECV(vec3 pos) {
    this.pos = pos;
  }
  
  void show() {
    point(pos.x(),pos.y());
  }
}
