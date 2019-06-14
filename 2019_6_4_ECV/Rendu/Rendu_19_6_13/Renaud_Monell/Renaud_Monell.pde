ECV ecv[];

void setup() {
  size(980, 980, P3D);
  
  int num = 100;
  
  ecv = new ECV [num];
  
  for (int i = 0; i < ecv.length; i++){
    float x = random(-1, 1),
          y = random(-1, 1),
          z = random(-1, 1);
    
    ecv[i] = new ECV(x, y, z);
  }
}

vec3 rotation = new vec3();

void draw() {
  println("FPS : " + Math.round(frameRate));
  background(255);
  
  rotation.sin_wave(frameCount, .001, .002, .03);
  
  push();
  translate(width / 2, height / 2);
  rotateX(rotation.x());
  rotateY(rotation.y());
  rotateZ(rotation.z());
  
  float bursting_val = sin(frameCount * .04);
  bursting_val = map(bursting_val, -1, 1, 0, 1);
  
  float amp = map(bursting_val, 0, 1, 50, width / 4);


  for (int i = 0; i < ecv.length; i++){
    vec3 temp = ecv[i].get_pos();
    temp.mult(amp);
    
    float size_val = cos(frameCount * .04);
    size_val = map(size_val, -1, 1, 10, 80);
    
    push();
    translate(temp.x, temp.y, temp.z);
    
    stroke(1);
    fill(#ff0000);
    sphereDetail(14);
    sphere(size_val);
    
    pop();
  }

  // Shaders   
  PImage source = g;
  
  boolean on_g = true,
          filter_is = true;
  
  vec2 offset_red = vec2().cos_wave(frameCount, 0.01, .0001);
  vec2 offset_green = vec2().cos_wave(frameCount, 0.025, .0001);
  vec2 offset_blue = vec2().cos_wave(frameCount, 0.05, .0001);
         
  if(mousePressed) {
    fx_split_rgb(source, on_g, filter_is, offset_red, offset_green, offset_blue);
  }
  
  pop();
}
