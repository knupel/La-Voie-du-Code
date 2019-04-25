/**
* La Voie du Code : Paramétrage
* @see https://github.com/StanLepunK/La-Voie-du-Code
* 2019_4_9
*/
Forme forme ;
void setup() {
  size(300,600);
  forme = new Forme(20);
  forme.set_rayon(50);
}


void draw() {
  background(255);
  forme.set_pos(mouseX,mouseY);
  forme.show();
  
}

class Forme {
  PVector [] pts;
  float rayon = 1;
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
    for(int i = 0 ; i < pts.length ; i++) {
      PVector temp = new PVector(pts[i].x,pts[i].y);
      temp.mult(rayon);
      
      vertex(temp.x +pos_x,temp.y +pos_y);
    }
    endShape(CLOSE);
  }
  
  void set_rayon(float rayon) {
    this.rayon = rayon;
  }
  
  void set_pos(float pos_x, float pos_y) {
    this.pos_x = pos_x;
    this.pos_y = pos_y;
  }
}
