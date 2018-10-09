PImage img ;

void setup() {
  size(100,100);
  img = loadImage("medium_vinci_la_dame_à_l_hermine.jpg");
  surface.setSize(img.width,img.height);
}

void draw() {
  // image(img,0,0);
  int get_x = mouseX;
  int get_y = mouseY;
  int area = 20 ;
  for(int i = -area ; i < area ; i++) {
    float dist = random(-area, area);
    float theta = random(2*PI);
    int offset_x = int(dist *sin(theta));
    int offset_y = int(dist *cos(theta));

    int pos_x = get_x + offset_x;
    int pos_y = get_y + offset_y;
    int c = img.get(pos_x,pos_y);
    set(pos_x,pos_y,c);
  }
}

void keyPressed() {
  saveFrame("titre-#####");
}
