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
String [] fx_name = new String[3];
void setup() {
  size(640,480,P3D);
  img = loadImage("medium_puros_girl.jpg");
  fx_name[0] = "blur circular";
  fx_name[1] = "dither bayer";
  fx_name[2] = "pixel";
  
  init_fx(fx_list,fx_name[0],FX_BLUR_CIRCULAR);
  init_fx(fx_list,fx_name[1],FX_DITHER_BAYER_8);
  init_fx(fx_list,fx_name[2],FX_PIXEL);
  
  random_effect();
}

void draw() {
  background(img,SCREEN);
  item();
  if(mousePressed) {
    set_fx();
  }
  
  for(int i = 0 ; i < active_effect.length ; i++) {
    select_fx_post(g,null,null,get_fx(fx_list,active_effect[i]));
  }
  
}


void keyReleased() {
  if(key == 'n') random_effect();
}

String [] active_effect;
void random_effect() {
  int num = ceil(random(fx_list.size()));
  active_effect = new String[num];
  for(int i = 0 ; i < num ; i++) {
    int target = floor(random(fx_name.length));
    active_effect[i] = fx_name[target];
  }
}


void set_fx() {
  // name[0]
  vec3 strength = vec3().sin_wave(frameCount,.01).mult(100);
  int num_blur = (int)random(5,30);
  fx_set_strength(fx_list,fx_name[0],strength.array());
  fx_set_num(fx_list,fx_name[0],num_blur);
  
  // name[1]
  vec3 level_dither = abs(vec3().sin_wave(frameCount,.01));
  int mode = 1;
  fx_set_level_source(fx_list,fx_name[1],level_dither.array());
  fx_set_mode(fx_list,fx_name[1],mode);
  
   // name[2]
   float val = random(1);
   if(val > .5) {
     fx_set_event(fx_list,fx_name[2],0,true);
   } else {
     fx_set_event(fx_list,fx_name[2],0,false);
   }
   vec3 level_pixel = abs(vec3().sin_wave(frameCount,.01,.02,.03));
   fx_set_level_source(fx_list,fx_name[2],level_pixel.array());
   int num_pixel = (int)random(2,16);
   fx_set_num(fx_list,fx_name[2],num_pixel);
   vec2 size_pix = vec2().rand(vec2(1,width/10),vec2(1,height/10));;
   fx_set_size(fx_list,fx_name[2],size_pix.array());
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
