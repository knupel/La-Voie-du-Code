PImage img ;

void setup() {
  size(100,100);
  img = loadImage("medium_vinci_la_dame_à_l_hermine.jpg");
  surface.setSize(img.width,img.height);
  background(175,0,0);
}

void draw() {
  // image(img,0,0);
  int get_x = mouseX;
  int get_y = mouseY;
  int area = 20 ;
  for(int i = -area ; i < area ; i++) {
    brosse(get_x,get_y,area); 
  }
}

void brosse(int x, int y, int radius) {
  float density = random(1);
  density = density *density *density ;
  float dist = density *radius;
  float theta = random(2*PI);
  int offset_x = int(dist *sin(theta));
  int offset_y = int(dist *cos(theta));
  
  int pos_x = x + offset_x;
  int pos_y = y + offset_y;
  int c = img.get(pos_x,pos_y);
  // forme_pixel(pos_x,pos_y,c);
  int size = int(dist -abs(radius))/2;
  forme_rectangle(pos_x,pos_y,size,c);
}


void forme_pixel(int x, int y, int c) {
  set(x,y,c);
}

void forme_rectangle(int x, int y, int size, int c) {
  fill(c);
  rect(x,y,size,size);
}






void keyPressed() {
  background(175,0,0);
  //saveFrame("titre-#####");
}
