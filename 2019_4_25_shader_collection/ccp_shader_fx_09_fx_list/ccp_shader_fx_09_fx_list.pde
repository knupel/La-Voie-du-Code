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
ArrayList<FX> fx_list = new ArrayList<FX>();
String [] fx_name = new String[2];
void setup() {
  size(640,480,P3D);
  img = loadImage("medium_puros_girl.jpg");
  fx_name[0] = "blur circular";
  fx_name[1] = "dither bayer";
  
  init_fx(fx_list,fx_name[0],FX_BLUR_CIRCULAR);
  init_fx(fx_list,fx_name[1],FX_DITHER_BAYER_8);
}

void draw() {
  background(img,SCREEN);
  item();
  if(mousePressed) {
    set_fx();
  }
  
  if(keyPressed) {
    select_fx_post(g,null,null,get_fx(fx_list,fx_name[0]));
  } else {
    select_fx_post(g,null,null,get_fx(fx_list,fx_name[1]));
  }
}



void set_fx() {
  vec3 strength = vec3().sin_wave(frameCount,.01).mult(100);
  int num = 10;
  fx_set_strength(fx_list,fx_name[0],strength.array());
  fx_set_num(fx_list,fx_name[0],num);
  
  vec3 level = abs(vec3().sin_wave(frameCount,.01));
  int mode = 1;
  fx_set_level_source(fx_list,fx_name[1],level.array());
  fx_set_mode(fx_list,fx_name[1],mode);
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
