/**
La Voie du Code : Mouvement
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_29
*/
float vitesse = 0.5;
PVector heros;
void setup() {
  size(500,500);
  float x = random(width/2);
  float y = random(height/2);
  heros = new PVector(x,y);
}

void draw() {
  background(0); 
  stroke(255);
  strokeWeight(5);
  heros.add(new PVector(vitesse,vitesse));
  point(heros.x,heros.y);
}
