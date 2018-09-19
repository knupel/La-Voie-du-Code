void setup() {
  size(400,400);
}

float rouge;
float vert;
float bleu;
void draw() {
  rouge = random(255);
  vert = random(255);
  bleu = random(255);
  println(rouge,vert,bleu);
  background(rouge,vert,bleu);
}
