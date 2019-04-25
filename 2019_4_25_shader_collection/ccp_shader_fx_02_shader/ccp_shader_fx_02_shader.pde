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
  boolean on_g = true;
  vec3 strength = vec3().sin_wave(frameCount,.1).mult(50);
  int num = 10;
  fx_blur_circular(g,on_g,strength,num);
}
