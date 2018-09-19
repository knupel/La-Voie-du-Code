void setup() {
  size(400,400);
}

float rouge;
float vert;
float bleu;
void draw() {
  background(rouge,vert,bleu);
  text("rouge: "+rouge,10,20);
  text("vert: "+vert,10,40);
  text("bleu: "+bleu,10,60);
}


void keyPressed() {
  if(key == 'r') rouge = random(255);
  if(key == 'v') vert = random(255);
  if(key == 'b') bleu = random(255);
}
