class ECV {
 vec3 pos;
 vec3 size;
 int fill;
 int stroke;
 float thinkness;
 String name;
 
 //constructeur
 ECV(vec3 pos){
   this.pos = pos.copy();
 }
 
 ECV(float x, float y, float z){
   this.pos = new vec3(x,y,z);
 }
 
 // get
 vec3 get_pos(){
   return pos.copy();
 }
 
 // set
 void set_pos(vec3 pos){
  this.pos = pos.copy();
 }
 
 void set_pos(float x, float y, float z){
  this.pos = new vec3(x,y,z);
 }
 
}
