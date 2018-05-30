void setup() {
  size(900,400);
  background(0);
}

void draw() {
  int num = int(random(50));
  for(int i = 0 ; i < num ; i++) {
    int x = int(random(width)); 
    int y = int(random(height));
    // int c = color(random(255)); // noir et blanc
    int rouge = (int)random(255);
    int vert = (int)random(255);
    int bleu = (int)random(255);
    int c = color(rouge,vert,bleu); // couleur
    set(x,y,c);
  }
}
