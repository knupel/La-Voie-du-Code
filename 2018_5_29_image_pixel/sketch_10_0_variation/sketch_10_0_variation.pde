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
  int area = 100 ;
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
  forme_rectangle(pos_x,pos_y,dist,radius,c,density);
  // forme_ellipse(pos_x,pos_y,dist,radius,c);
}


void forme_pixel(int x, int y, int c) {
  set(x,y,c);
}

void forme_rectangle(int x, int y, float dist, int radius, int c, float alpha) {
  float alpha_map = g.colorModeA *alpha ;
  fill(c,alpha_map);
  noStroke();
  int size = int(dist -abs(radius))/2;
  int center_x = -(size/2) + x ;
  int center_y = -(size/2) + y;
  float rand_size_x = random(.1, 2) *size;
  float rand_size_y = random(.1, 2) *size;
  rect(center_x,center_y,rand_size_x/3,rand_size_y/3);
}


void forme_ellipse(int x, int y, float dist, int radius, int c) {
  fill(c);
  int size = int(dist -abs(radius))/2;
  ellipse(x,y,size,size);
}







void keyPressed() {
  background(175,0,0);
  //saveFrame("titre-#####");
}
