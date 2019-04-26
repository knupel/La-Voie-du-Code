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
  size(640,480,P2D);
  // fullScreen(P2D);
  img = loadImage("medium_puros_girl.jpg");
}

void draw() {
  vec3 colour_bg = vec3(1,0,0); // color from 0 to 1
  // need to cast in float because to have a float precision for the result.
  vec2 target_size = vec2(width/2,height/3);
  vec2 scale = target_size.copy().div(img.width,img.height);


  vec2 target_pos = vec2(mouseX,mouseY);
  float px = map(target_pos.x(),0,width,0,1);
  float py = map(target_pos.y(),0,height,0,1);
  vec2 pos = vec2(px,py); // move image by center


  vec4 curtain = abs(vec4().sin_wave(frameCount,.01)).mult(.5); // use to hide a part of picture
  // curtain.set(0); // no curtain is used
  int mode = r.SCALE; // you can also use SCREEN or CENTER

  /**
  * mode 1
  * direct on g
  */
  fx_image(img,true,pos,scale,colour_bg,curtain,mode);


  /**
  * mode 2
  *return a PImage
  */
  // vec2 ratio = vec2(width,height).div(target_size);
  // println(ratio);
  // pos.mult(scale.copy().mult(ratio));
  // PImage temp = fx_image(img,false,pos,scale,colour_bg,curtain,mode);
  // image(temp);
}
