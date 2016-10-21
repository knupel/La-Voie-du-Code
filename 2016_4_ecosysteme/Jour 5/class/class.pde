
Ball ball ;
void setup() {
  size(400,400) ;
  ball = new Ball(width/2, height/2, 30 ) ;
}

void draw() {
  background(0) ;
  fill(255) ;
  noStroke() ;
  float speed_x = map(mouseX,0,width, -3,3) ;
  float speed_y = map(mouseY,0,height, -3,3) ;
  ball.update(speed_x,speed_y) ;
  ball.display() ;
}


// Ma class
class Ball {
  int x, y ;
  int size ;
  Ball(int x, int y, int size) {
    this.x = x ;
    this.y = y ;
    this.size = size ;
  }
  
  void update(float s_x, float s_y) {
    x += s_x ;
    y += s_y ;
  }
  
  void display() {
    ellipse(x,y, size,size) ;
  }
}