import rope.vector.*;


ECV ecv [];
void setup() {
  size(800,800,P3D);
  int num = 100;
  ecv = new ECV[num];
  for(int i = 0 ; i < ecv.length ; i++) {
    float x = random(-1,1);
    float y = random(-1,1);
    float z = random(-1,1);
    ecv[i] = new ECV(x,y,z);
  }
}

vec3 rotation = new vec3();
void draw() {
  background(0);
  fill(255);
  rotation.sin_wave(frameCount,.01,.02,.03);
  push();
  translate(width/2,height/2);
  rotateX(rotation.x());
  rotateY(rotation.y());
  rotateZ(rotation.z());
  
  float amp = map(mouseX,0,width,50,200);
  for(int i = 0 ; i < ecv.length ; i++) {
    vec3 temp = ecv[i].get_pos();
    temp.mult(amp);
    show(i,temp.x(),temp.y(),temp.z());
    
  }
  pop();
}

void show(int name, float x, float y, float z) {
  text(name,x,y,z);
  

}
