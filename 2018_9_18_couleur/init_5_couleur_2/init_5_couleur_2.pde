void setup() {
  size(400,400);
}

int rouge;
int vert;
int bleu;
void draw() {
  rouge ++;
  vert ++;
  bleu ++;
  if(rouge > 255) {
    rouge = 0;
  }
  
  if(vert > 255) {
    vert = 0;
  }
  
  if(bleu > 255) {
    bleu = 0;
  }
  background(rouge,vert,bleu);
}
