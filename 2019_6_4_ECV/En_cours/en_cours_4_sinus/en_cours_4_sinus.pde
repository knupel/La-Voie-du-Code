void setup() {
  size(500,300);
}

int count;
void draw() {
  background(0);
    strokeWeight(20);
  stroke(255,0,0);
  int num_gen = (int)map(mouseX,0,width,1,50);
  if(num_gen < 1) {
    num_gen = 1;
  }
  for(int i = 0 ; i < num_gen ; i++) {
    generator(count);
    count++;
  }
}

void generator(int count) {
  float val_x = sin(count *0001);
  float val_y = cos(count *0001);
    
  float x = val_x *width;
  float y = val_y *height;
  point(x,y);
}
