void setup() {
  size(400,400);
}

float rouge;
float vert;
float bleu;
void draw() {
  background(rouge,vert,bleu);
}


void keyPressed() {
  rouge = random(255);
  vert = random(255);
  bleu = random(255);
}
