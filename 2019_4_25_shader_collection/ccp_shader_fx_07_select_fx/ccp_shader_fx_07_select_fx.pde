/**
* INIT SHADER COLLECTION
* @see https://github.com/StanLepunK/La-Voie-du-Code
* about shader framework laboratory fx background and post fx
* @see https://github.com/StanLepunK/Shader
* More about Rope framework
* @see https://github.com/StanLepunK/Rope_method
* Processing 3.5.3.269
* Rope Library 0.7.1.25
*/
PImage img;
FX fx_circular = new FX();
void setup() {
  size(640,480,P3D);
  img = loadImage("medium_puros_girl.jpg");
}

void draw() {
  background(img,SCREEN);
  item();
  if(mousePressed) {
    set_fx();
  }

  select_fx_post(g,null,null,fx_circular);
}


void set_fx() {
  vec3 strength = vec3().sin_wave(frameCount,.01).mult(100);
  int num = 10;
  fx_circular.set_type(FX_BLUR_CIRCULAR);
  fx_circular.set_strength(strength.array());
  fx_circular.set_num(num);
  
}





// item
float rx,ry = 0;
void item() {
  push();
  translate(width/2,height/2);
  rotateX(rx += .01);
  rotateY(ry += .03);
  box(width,width/6,width/6);
  pop();
}
