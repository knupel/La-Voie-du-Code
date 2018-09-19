void setup() {
  size(400,400);
}

float rouge;
float vert;
float bleu;
void draw() {
  int couleur = color(rouge,vert,bleu);
  background(couleur);
  text("rouge: "+rouge,10,20);
  text("vert: "+vert,10,40);
  text("bleu: "+bleu,10,60);
  text("couleur: "+couleur,10,80);
}


void keyPressed() {
  if(key == 'r') rouge = random(255);
  if(key == 'v') vert = random(255);
  if(key == 'b') bleu = random(255);
}
