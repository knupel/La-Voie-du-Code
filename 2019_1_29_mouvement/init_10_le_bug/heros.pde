/**
HEROS
*/
class Heros {
  PVector position;
  float direction;
  float vitesse;
  
  boolean offset_is;
  PVector offset;
  Heros(float x, float y) {
    position = new PVector(x,y);
    offset = new PVector(0,0);
  }

  void set_vitesse(float vitesse) {
    this.vitesse = vitesse;
  }

  void set_offset(float x, float y, boolean is) {
    offset_is = is;
    offset.set(x,y);
  }

  void set_position(float x, float y) {
    position.set(x,y);
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

  PVector get_absolute_position() {
    return position;
  }

  PVector get_position() {
    if(offset_is && offset != null) {
      return position.copy().add(offset);
    } else {
      return position;
    } 
  }

  float get_direction() {
    return direction;
  }
}