void setup() {
  size(500,300);
  colorMode(HSB,1,1,1,1);
}

int count;
void draw() {
  if(bg_is) background(0);
    strokeWeight(1);
    float hue = abs(sin(frameCount *0.001));
    //println(hue);
  int c = color(hue,1,1);  
  stroke(c);
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
  float val_x = sin(count *01);
  float val_y = cos(count *01);
  float tx = width/2;
  float ty = height/2;
  float s = mouseY/2;
  float x = val_x *s;
  float y = val_y *s;
  point(x+tx,y+ty);
  // point(x,y);
}


boolean bg_is;
void keyPressed() {
  if(key == 'b') {
    bg_is = !bg_is;
  }
}
