Vec2 [] points ;
void forme_build(){
  int num = 10;
  points = new Vec2[num] ;
  for(int i = 0 ; i < num ; i++){
    points[i] = new Vec2("RANDOM", 1);
  }
}

void forme_display(Vec2 pos, int size){
  beginShape();
  for(int i = 0 ; i < points.length ; i++){
    Vec2 ref = points[i].copy() ;
    ref.mult(size) ;
    ref.add(pos);
    vertex(ref);
  }
  endShape();
}