PImage img ;

void setup() {
  size(100,100);
  img = loadImage("medium_vinci_la_dame_à_l_hermine.jpg");
  surface.setSize(img.width,img.height);
}

void draw() {
  // image(img,0,0);
  int num = (int)random(height);
  for(int i = 0 ; i < num ; i++) {
    int get_x = (int)random(width);
    int get_y = (int)random(height);
    int c = img.get(get_x,get_y);

    
    int seuil = 7;
    int chance = (int)random(10);
    if(chance < seuil) {
      int pos_x = (int)random(width);
      int pos_y = (int)random(height);
      set(pos_x,pos_y,c);
    } else {
      set(get_x,get_y,c);
    }
  }
}



void keyPressed() {
  save("result");
  saveFrame();
}
