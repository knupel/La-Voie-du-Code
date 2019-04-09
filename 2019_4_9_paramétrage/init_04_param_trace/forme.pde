class Forme {
  PVector [] pts;
  float [] rayon;
  float pos_x;
  float pos_y;
  Forme(int num) {
    float angle = (2*PI)/num;
    pts = new PVector[num];   
    for(int i = 0 ; i < num ; i++) {
      float px = sin(angle*i);
      float py = cos(angle*i);
      pts[i] = new PVector(px,py);
    }
  }
  
  void show() {
    beginShape();
    int count = 0 ;
    for(int i = 0 ; i < pts.length ; i++) {
      PVector temp = new PVector(pts[i].x,pts[i].y);
      if(rayon != null){
        temp.mult(rayon[count]);
        count++;
        if(count >= rayon.length) {
          count = 0;
        }
      } else {
        temp.mult(width/6);
      }
      vertex(temp.x +pos_x,temp.y +pos_y);
    }
    endShape(CLOSE);
  }
  
  void set_rayon(float... rayon) {
    this.rayon = rayon;
  }
  
  void set_pos(float pos_x, float pos_y) {
    this.pos_x = pos_x;
    this.pos_y = pos_y;
  }
}