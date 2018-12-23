void setup() {
  size(300,300);
  int diam = 100;
  int sommet = 5;
  int rank = 5;
  PVector offset = new PVector();
  offset.x = width/2;
  offset.y = height/2;
  float step_rank = diam / rank;
  
  float angle = TAU / sommet;
  for(int x = 0 ; x < sommet ; x++) {
    for(int y = 0 ; y < rank ; y++) {
      float final_angle = angle*x;
      float cos_x = cos(final_angle);
      float sin_y = sin(final_angle);
      float dist = step_rank *y;
      PVector pos = new PVector();
      pos.x = cos_x *dist;
      pos.y = sin_y *dist;
      pos.add(offset);
      strokeWeight(3);
      point(pos.x,pos.y);   
    }
  }
}
