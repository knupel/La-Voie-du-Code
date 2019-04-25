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
void setup() {
  size(640,480,P3D);
  img = loadImage("medium_puros_girl.jpg");
}

void draw() {
  background(img,SCREEN);
  item();
  
  vec3 strength = vec3().sin_wave(frameCount,.01).mult(100);
  int num = 10;
  FX fx_circular = new FX();
  fx_circular.set_on_g(true);
  fx_circular.set_strength(strength.array());
  fx_circular.set_num(num);
  
  vec3 level = abs(vec3().sin_wave(frameCount,.01));
  int mode = 1;
  FX fx_bayer = new FX();
  fx_bayer.set_on_g(true);
  fx_bayer.set_level_source(level.array());
  fx_bayer.set_mode(mode);
  
  if(mousePressed) {
    fx_dither_bayer_8(g,fx_bayer);
    fx_blur_circular(g,fx_circular);
  } else {
    fx_blur_circular(g,fx_circular);
    fx_dither_bayer_8(g,fx_bayer);
  }
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
