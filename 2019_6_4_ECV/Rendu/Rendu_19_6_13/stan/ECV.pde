/**
* ECV
* v 0.1.0
*/
class ECV {
  vec3 pos;
  vec3 size;
  float speed;
  vec3 dir;

  int fill;
  int stroke;
  float thickness;
  String name;
  
  // constructor
  ECV(vec3 pos) {
    this.pos = pos.copy();
  }
  
  ECV(float x, float y, float z) {
    this.pos = new vec3(x,y,z);
  }
   
  // get
  vec3 get_pos() {
    return pos.copy();
  }

  vec3 get_dir() {
    return dir;
  }

  float get_speed() {
    return speed;
  }

  vec3 get_size() {
    return size;
  }
  
  // set
  void set_pos(vec pos) {
    this.pos = new vec3(pos);
  }

  void set_speed(float speed) {
    this.speed = speed;
  }

  void set_size(vec3 size) {
    this.size = size.copy();
  }

  void set_dir(vec3 dir) {
    this.dir = dir.copy();
  }
  
  void set_pos(float x, float y, float z) {
    this.pos = new vec3(x,y,z);
  }
}
