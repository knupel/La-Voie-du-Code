void setup() {
  size(400,400,P3D);
}


float rx;
float ry;
float rz;
void draw() {
  background(0);
  // start camera
  push();
  translate(width/2,height/2);
  rotateX(rx += .01);
  rotateY(ry += .02);
  rotateZ(rz += .03);
  // scene
  box(100);
  
  // stop camera
  pop();
}
