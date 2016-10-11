// RPE SVG
RPEsvg svg ;
void setup() {
  size(600,600) ;
  
  String path = "pirate_couleur.svg" ;
  svg = new RPEsvg(this, path) ;
  svg.build() ;
}

void draw() {
  background_3D(0, 10) ;

  svg.svg_mode(CENTER) ;

  // variable common to the 2D and 3D vertex
  float scale = 1.5;
  int jitting = 10 ;

  Vec2 pos_2D = Vec2 (mouseX,mouseY); 
  Vec2 jitter_2D = Vec2 (jitting) ;
  Vec2 scale_2D = Vec2(scale, scale) ;


  full_svg_2D(pos_2D, scale_2D, jitter_2D) ;
  
  //name_svg_2D(pos_2D, scale_2D, jitter_2D) ;
  
  int which = (int)random(svg.num_brick()) ;
  // ID_svg_2D(pos_2D, scale_2D, jitter_2D, which) ;

  // add_value_to_points(pos_2D) ;
}


void add_value_to_points(Vec2 pos) {
  for(int ID = 0 ; ID < svg.num_brick() ; ID++ ) {
    int length = svg.list_points_of_interest(ID).length ;
    Vec3 [] value = new Vec3[length] ;
    for(int i = 0 ; i < value.length ; i++) {
      value[i] = new Vec3("RANDOM", 10,10, 10) ;
      value[i].mult(.1) ;
    }
    
    svg.add_def(ID, value) ;
    svg.pos(pos) ;
    svg.original_style(true, true) ;
   // svg.original_style(false, false) ;
   // svg.fill((int)random(255),100,100,255) ;
    svg.fill_factor(1,1,1,map(mouseX, 0,width, 0, 1)) ;
    svg.stroke_factor(1,1,1,map(mouseY, 0,height, 1, 0)) ;
    svg.draw_2D(ID) ;
  }

  // rebuild your shape from the original SVG
  if(mousePressed) svg.build() ;
}




void full_svg_2D(Vec2 pos_2D, Vec2 scale_2D, Vec2 jitter_2D) {
  svg.pos(pos_2D) ;
  svg.scale(scale_2D) ;
  svg.jitter(jitter_2D) ;
  svg.original_style(true, false) ;
  svg.draw_2D() ;
}


void name_svg_2D(Vec2 pos_2D, Vec2 scale_2D, Vec2 jitter_2D) {
  svg.start() ;
  svg.pos(pos_2D) ;
  svg.scale(scale_2D) ;
  // svg.jitter(jitter_2D.mult(.2)) ;
  svg.original_style(false, false) ;
  svg.fill(255,255,0, 255) ;
  String layer_name_A = "Dentition" ;
  svg.draw_2D(layer_name_A) ;
  svg.end() ;
  
  svg.start() ;
  svg.pos(pos_2D) ;
  svg.original_style(true, false) ;
  String layer_name_B = "SabreGauche" ;
  svg.draw_2D(layer_name_B) ;
  svg.end() ;
  
}



void ID_svg_2D(Vec2 pos_2D, Vec2 scale_2D, Vec2 jitter_2D, int ID) {
  svg.pos(pos_2D) ;
  svg.scale(scale_2D) ;
  svg.jitter(jitter_2D) ;
  svg.fill(255,255,255, 255) ;
  svg.original_style(false, false) ;
  svg.draw_2D(ID) ;
}