void setup() {
  size(400,400);
}

int couleur_a,couleur_b,couleur_c;
void draw() {
  background(0);
  noStroke();
  fill(couleur_a);
  int pos_x = width /2;
  int pos_y = height/6;
  ellipse(pos_x,pos_y,50,50);
  pos_y += height/3;
  fill(couleur_b);
  ellipse(pos_x,pos_y,50,50);
  pos_y += height/3;
  fill(couleur_c);
  ellipse(pos_x,pos_y,50,50);
}

void keyPressed() {
  if(key == 'a') couleur_a = color(random(255),random(255),random(255));
  if(key == 'b') couleur_b = color(random(255),random(255),random(255));
  if(key == 'c') couleur_c = color(random(255),random(255),random(255));
}
