//Very important, all your point in Illustrator must use the bezier handle vertex.
void setup() {
  size(500,400) ;
  colorMode(HSB, 360,100,100) ;
  String pathSVG = "pirate_2.svg" ;
  setup_shape_SVG(pathSVG) ;
}

int display_type = 0 ;
void draw() {
  background(0) ;
  aspect() ;
  display() ;
}
// choice which method display
void display() {
  if (display_type == 1 ) draw_shape() ;
  else if( display_type == 2) {
    float scale = .5 ;
    draw_shape_scale(scale) ;
  } else if (display_type == 3) {
    float scale = .5 ;
    int jitting = 5 ;
    draw_shape_scale(scale, jitting) ;
  } else {
    draw_shape() ;
  }
}


// Method to draw vertex
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
// end draw vertex


void aspect() {
  noFill() ;
  stroke(20,100,100) ;
}

// change your choice with keyboard
void keyPressed() {
  if(key == '1') display_type = 1 ;
  if(key == '2') display_type = 2 ;
  if(key == '3') display_type = 3 ;
}