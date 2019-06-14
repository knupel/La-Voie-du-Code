import rope.vector.*;


ECV ecv [];
void setup() {
  size(800,800,P3D);
  int num = 100;
  ecv = new ECV[num];
  vec3 [] list = list_cartesian_fibonacci_sphere(num,5,2);
  // println(list);
  for(int i = 0 ; i < ecv.length ; i++) {
    float dist = random(1);

    // float x = random(-1,1);
    // float y = random(-1,1);
    // float z = random(-1,1);
    // ecv[i] = new ECV(x,y,z);
    ecv[i] = new ECV(list[i].mult(dist));
    vec3 temp_dir = vec3().rand(vec2(-1,1),vec2(-1,1),vec2(-1,1));
    ecv[i].set_dir(temp_dir);
    float speed = random(10,100);
    ecv[i].set_speed(speed);
    vec3 size = vec3().rand(10,100);
    ecv[i].set_size(size);
  }
}

vec3 rotation = new vec3();
void draw() {
  background(0);
  if(mousePressed) {
    rotation.y = map(mouseX,0,width,0,TAU);
    rotation.x = map(mouseY,0,height,0,TAU);
    // rotation.sin_wave(frameCount,.01,.02,.03);
  }
  push();
  translate(width/2,height/2,deep *-1);
  rotateX(rotation.x());
  rotateY(rotation.y());
  rotateZ(rotation.z());

  update_position();
  // float amp = map(mouseX,0,width,50,width);
  float amp = sin(frameCount * 0.01);
  amp = map(amp,-1,1,width/10,width*2);
  show(amp);
  pop();

  // post fx
  if(fx_is) post_fx();
}


float deep;
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  deep += e;
}

boolean fx_is;
void keyPressed() {
  if(key == 'x') {
    fx_is = !fx_is;
  }
}


float strength_warp_fx;
void post_fx() {
  // PImage source = g ;
  boolean on_g = true;
  boolean filter_is = true;
  vec2 offset_red = vec2().cos_wave(frameCount,0.1,0.2);
  vec2 offset_green = vec2().sin_wave(frameCount,0.1,0.2);
  vec2 offset_blue = vec2(0);
  //vec2 offset_blue = vec2().sin_wave(frameCount,0.5,0.2);
  fx_split_rgb(g, on_g, filter_is, offset_red, offset_green, offset_blue);

  // float strength = abs(sin(frameCount * 0.1)) *100;
  if(mousePressed) {
    strength_warp_fx = mouseX;
  }

  // fx_warp_proc(g, on_g,filter_is,strength_warp_fx);


  ivec pix = abs(vec2().sin_wave(frameCount,.01,.02)).mult(20).add(2);
  vec3
  fx_pixel(g,true,true, ivec2(pix),10, vec3 level_source, boolean effect_is) {

}
