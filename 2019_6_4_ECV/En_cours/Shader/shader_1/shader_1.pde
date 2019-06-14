
void setup() {
	size(500,500,P3D);
}



float strength;
void draw() {
  background(0);
  float diam = abs(sin(frameCount * 0.1))*width;
  ellipse(mouseX,mouseY,diam,diam);
  PImage source = g ;
  boolean on_g = true;
  boolean filter_is = true;
  vec2 offset_red = vec2().cos_wave(frameCount,0.1,0.2);
  vec2 offset_green = vec2().sin_wave(frameCount,0.1,0.2);
  vec2 offset_blue = vec2(0);
  //vec2 offset_blue = vec2().sin_wave(frameCount,0.5,0.2);
	fx_split_rgb(source, on_g, filter_is, offset_red, offset_green, offset_blue);

  // float strength = abs(sin(frameCount * 0.1)) *100;
  if(mousePressed) {
  	strength = mouseX;
  }

	fx_warp_proc(source, on_g,filter_is,strength);
}

