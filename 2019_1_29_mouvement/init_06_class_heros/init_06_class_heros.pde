/**
La Voie du Code : Mouvement
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_29
*/
Heros heros;
void setup() {
  size(500,500);
  float x = random(width);
  float y = random(height);
  heros = new Heros(x,y);
  heros.set_direction(PI/4);
  heros.set_vitesse(2.5);
}

void draw() {
  background(0); 
  stroke(255);
  strokeWeight(5);
  heros.update();

  point(heros.get_position().x,heros.get_position().y);
  
  // change direction
  float direction = heros.get_direction();
  if(heros.get_position().x > width || heros.get_position().x < 0) {
    direction += PI/2;
    heros.set_direction(direction);
    
  }
  
  if(heros.get_position().y > height || heros.get_position().y < 0) {
    direction += PI/2;
    heros.set_direction(direction);
  }
}




/**
HEROS
*/
class Heros {
  PVector position;
  float direction;
  float vitesse;
  Heros(float x, float y) {
    position = new PVector(x,y);
  }

  void set_vitesse(float vitesse) {
    this.vitesse = vitesse;
  }

  void set_direction(float direction) {
    this.direction = direction;
  }

  void update() {
    PVector temp = new PVector(0,0);
    float x = cos(direction);
    float y = sin(direction);
    temp.set(x,y);
    temp.mult(vitesse);
    position.add(temp);
  }

  PVector get_position() {
    return position;
  }

  float get_direction() {
    return direction;
  }
}