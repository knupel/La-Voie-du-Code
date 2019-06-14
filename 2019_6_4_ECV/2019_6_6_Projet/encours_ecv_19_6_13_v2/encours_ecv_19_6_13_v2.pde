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
  stroke(255);
  if(mousePressed) {
    rotation.y = map(mouseX,0,width,0,TAU);
    rotation.x = map(mouseY,0,height,0,TAU);
    // rotation.sin_wave(frameCount,.01,.02,.03);
  }
  push();
  translate(width/2,height/2);
  rotateX(rotation.x());
  rotateY(rotation.y());
  rotateZ(rotation.z());

  update_position();
  // float amp = map(mouseX,0,width,50,width);
  float amp = sin(frameCount * 0.01);
  amp = map(amp,-1,1,width/10,width*2);
  show(amp);
  pop();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
}
