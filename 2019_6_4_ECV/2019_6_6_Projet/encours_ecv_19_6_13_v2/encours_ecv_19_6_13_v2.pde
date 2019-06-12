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
  if(!keyPressed) {
    rotation.sin_wave(frameCount,.01,.02,.03);
  }
  push();
  translate(width/2,height/2);
  rotateX(rotation.x());
  rotateY(rotation.y());
  rotateZ(rotation.z());

  update_position();
  show();
  pop();
}

void update_position() {
  for(int i = 0 ; i < ecv.length ; i++) {
    vec3 temp = ecv[i].get_pos();
    vec3 motion = new vec3().rand(-1,1).mult(.01);
    temp.add(motion);
    if(temp.x() < -1) {
      temp.x(1);
    }

    if(temp.y() < -1) {
      temp.y(1);
    }

    if(temp.z() < -1) {
      temp.z(1);
    }

    if(temp.x() > 1) {
      temp.x(-1);
    }

    if(temp.y() > 1) {
      temp.y(-1);
    }

    if(temp.z() > 1) {
      temp.z(-1);
    }
    ecv[i].set_pos(temp);
  }
}

void show() {
  float amp = map(mouseX,0,width,50,width);
  for(int i = 0 ; i < ecv.length ; i++) {
    vec3 temp = ecv[i].get_pos();
    temp.mult(amp);
    show_item(i,temp.x(),temp.y(),temp.z());  
  }
}

void show_item(int name, float x, float y, float z) {
  // text(name,x,y,z);
  push();
  translate(x,y,z);
  sphere(5);
  pop();
}
