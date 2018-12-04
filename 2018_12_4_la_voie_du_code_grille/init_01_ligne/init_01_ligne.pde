void setup() {
  size(400,400);
  strokeWeight(10);
  int num = 20;
  int y = height/2;
  int cell_size = width/num;
  for(int x = 0 ; x < num ; x++) {
    // x *=cell_size // work bad because x became to big at the next round
    int temp_x = x * cell_size;
    point(temp_x,y);
  }
}
