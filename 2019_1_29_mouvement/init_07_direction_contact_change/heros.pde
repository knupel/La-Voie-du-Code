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