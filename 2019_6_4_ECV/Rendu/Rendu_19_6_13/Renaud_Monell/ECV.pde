class ECV {
  vec3 pos;
  vec3 size;
  
  int fill;
  int stroke;
  
  float thickness;
  
  String name;
  
  //constructor
  ECV(vec3 pos) {
    this.pos = pos.copy();
  }
  
  ECV(float x, float y, float z) {
    this.pos = new vec3(x, y, z);
  }
  
  // Getter
  vec3 get_pos() {
    return pos.copy();
  }
  
  // Setter
  void set_pos(vec3 pos) {
    this.pos = pos.copy();
  }
  
  void set_pos(float x, float y, float z) {
    this.pos = new vec3(x, y, z);
  }
}
