/**
La Voie du Code : Mouvement
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_29
*/
float vitesse = 2.5;
float direction = PI/4;
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
  PVector mvt = mouvement(vitesse,direction);
  heros.add(mvt);
  point(heros.x,heros.y);
  
  if(heros.x > width || heros.x < 0) {
    direction += PI/2;
  }
  
  if(heros.y > height || heros.y < 0) {
    direction += PI/2;
  }
}


PVector mouvement(float vit, float dir) {
  PVector temp = new PVector(0,0);
  float x = cos(dir);
  float y = sin(dir);
  temp.set(x,y);
  temp.mult(vit);
  return temp;
}