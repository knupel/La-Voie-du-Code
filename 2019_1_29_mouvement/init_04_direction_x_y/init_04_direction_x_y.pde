/**
La Voie du Code : Mouvement
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_29
*/
PVector vitesse = new PVector(1,1);
PVector heros;
void setup() {
  size(500,500);
  float x = random(width);
  float y = random(height);
  heros = new PVector(x,y);
}

void draw() {
  background(0); 
  stroke(255);
  strokeWeight(5);
  heros.add(vitesse);
  point(heros.x,heros.y);
  
  if(heros.x > width || heros.x < 0) {
    vitesse.x = vitesse.x * (-1);
  }
  
  if(heros.y > height || heros.y < 0) {
    vitesse.y = vitesse.y * (-1);
  }
}
