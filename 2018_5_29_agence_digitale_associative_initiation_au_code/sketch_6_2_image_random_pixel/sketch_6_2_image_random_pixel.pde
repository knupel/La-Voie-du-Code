PImage img ;

void setup() {
  size(100,100);
  img = loadImage("medium_vinci_la_dame_à_l_hermine.jpg");
  surface.setSize(img.width,img.height);
}

void draw() {
  int get_x = (int)random(width);
  int get_y = (int)random(height);
  int c = img.get(get_x,get_y);
  set(get_x,get_y,c);
}
