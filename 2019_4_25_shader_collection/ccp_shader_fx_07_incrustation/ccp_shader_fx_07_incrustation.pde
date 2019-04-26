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

/*
* 1 multiply
* 2 screen
* 3 exclusion
* 4 overlay
* 5 hard_light
* 6 soft_light
* 7 color_dodge
* 8 color_burn
* 9 linear_dodge
* 10 linear_burn
* 11 vivid_light
* 12 linear_light
* 13 pin_light
* 14 hard_mix
* 15 subtract
* 16 divide
* 17 addition
* 18 difference
* 19 darken
* 20 lighten
* 21 invert
* 22 invert_rgb
* 23 main
* 24 layer
*/

PImage img_1, img_2;
void setup() {
  size(640,480,P2D);
  img_1 = loadImage("medium_puros_girl.jpg");
  img_2 = loadImage("medium_leticia.jpg");
  surface.setSize(img_1.width,img_2.height);
}

int mode = 1;
void draw() {
  vec3 level_source = abs(vec3().sin_wave(frameCount,.01,.02,.005)).add(.5);
  vec3 level_layer = abs(vec3().cos_wave(frameCount,.01,.02,.005)).add(.5);
  image(fx_mix(img_1,img_2,false,mode,level_source,level_layer));  
}

void keyPressed() {
  if(key == 'n') mode = ceil(random(22));
}
