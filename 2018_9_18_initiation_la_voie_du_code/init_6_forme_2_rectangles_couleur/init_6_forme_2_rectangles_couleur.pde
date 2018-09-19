void setup() {
  size(400,400);
}

int couleur_a,couleur_b,couleur_c;
void draw() {
  background(0);
  stroke(0);
  strokeWeight(10);
  fill(couleur_a);
  rect(0,0,width,height/3);
  fill(couleur_b);
  rect(0,height/3,width,height/3);
  fill(couleur_c);
  rect(0,height - (height/3),width,height/3);
}

void keyPressed() {
  if(key == 'a') couleur_a = color(random(255),random(255),random(255));
  if(key == 'b') couleur_b = color(random(255),random(255),random(255));
  if(key == 'c') couleur_c = color(random(255),random(255),random(255));
}
