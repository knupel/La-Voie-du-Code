class ECV {
  vec3 pos;
  vec3 size;
  int fill;
  int stroke;
  float thickness;
  String name;
  
  //constructeur
  ECV(vec3 pos) {
    this.pos = pos.copy();
  }
  
  ECV(float x, float y, float z) {
    this.pos = new vec3(x, y, z);
  }
  
  //getter
  vec3 getPos() {
    return pos.copy();
  }
  
  //setter
  void setPos(vec3 pos) {
    this.pos = pos.copy();
  }
  
  void setPos(float x, float y, float z) {
    this.pos = new vec3(x, y, z);
  }
  
}
