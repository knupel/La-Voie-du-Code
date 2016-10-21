

//Very important, all your point in Illustrator must use the bezier handle vertex.


void setup() {
  size(500,500) ;
  colorMode(HSB, 360,100,100) ;
 String pathSVG = "pirate_2.svg" ;
//  String pathSVG = "forme_imbriquee.svg" ;
  setup_shape_SVG(pathSVG) ;
}


void draw() {
  background(0) ;
  aspect() ;
  // draw_shape() ;
  float scale = .5 ;
  draw_shape_scale(scale) ;
  int jitting = 5 ;
 // draw_shape_scale(scale, jitting) ;
}


void aspect() {
  noFill() ;
  stroke(20,100,100) ;
}


void draw_shape() {
  draw_vertex_SVG() ;
}


void draw_shape_scale(float scale, int jitter) {
  Vec2 pos = new Vec2 (0,0); ;
  Vec2 jitting = new Vec2 (jitter,jitter); ;
  draw_vertex_SVG(pos, scale, jitting) ;
}


void draw_shape_scale(float scale) {
  Vec2 pos = new Vec2 (0,0); ;
  draw_vertex_SVG(pos, scale) ;
}