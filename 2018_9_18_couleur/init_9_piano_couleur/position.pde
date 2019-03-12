int [] pos_x ;
int [] pos_y ;

void init_position() {
  pos_x = new int[num];
  pos_y = new int[num];
  
  for(int i = 0 ; i < num ; i++) {
    pos_x[i] = (int)random(width);
    pos_y[i] = (int)random(height);
  }
}
