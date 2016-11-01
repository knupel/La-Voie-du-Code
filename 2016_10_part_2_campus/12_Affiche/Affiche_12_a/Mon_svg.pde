// RPE SVG
RPEsvg svg ;

void svg_init() {
  String path = "pirate_couleur.svg" ;
  // String path = "layer.svg" ;
  svg = new RPEsvg(this, path) ;
  svg.build() ;
}


void svg_update() {
  svg.svg_mode(CENTER) ;

  // variable common to the 2D and 3D vertex
  float scaling = 1.2;
  int jitting = 20 ;

  Vec3 pos = Vec3 (width/2, height/2, 0); 
  Vec3 jitter= Vec3 (jitting, jitting, jitting*2) ;
  Vec3 scale = Vec3(scaling) ;


  full_svg_3D(pos, scale, jitter) ;

  int which = (int)random(svg.num_brick()) ;
  // ID_svg_3D(pos, scale, jitter, which) ;
  
  // name_svg_3D(pos, scale, jitter) ;
  


  // add_value_to_points(pos) ;
}









void full_svg_3D(Vec3 pos, Vec3 scale, Vec3 jitter) {
  svg.pos(pos) ;
  svg.scale(scale) ;
  svg.jitter(jitter) ;
  svg.original_style(true, false) ;
  svg.draw_3D() ;
}



void name_svg_3D(Vec3 pos, Vec3 scale, Vec3 jitter) {
  svg.start() ;
  svg.pos(pos) ;
  svg.scale(scale) ;
  svg.jitter(jitter.mult(.2)) ;
  svg.original_style(true, true) ;
  svg.fill(255,255,0, 255) ;
  String layer_name_A = "Dentition" ;
  // String layer_name_A = "NiveauB" ;
  svg.draw_3D(layer_name_A) ;
  svg.end() ;
  
  svg.start() ;
  svg.pos(pos) ;
  svg.original_style(true, true) ;
  // String layer_name_B = "NiveauC" ;
  String layer_name_B = "SabreGauche" ;
  svg.draw_3D(layer_name_B) ;
  svg.end() ;
  
}



void ID_svg_3D(Vec3 pos, Vec3 scale, Vec3 jitter, int ID) {
  pos.set(pos.x, pos.y,sin(frameCount *.1) *(height/4)) ;
  svg.pos(pos) ;
  svg.scale(scale) ;
  svg.jitter(jitter) ;
  svg.fill(random(255),random(255),random(255),random(255)) ;
  svg.original_style(false, false) ;
  svg.draw_3D(ID) ;
}







void add_value_to_points(Vec3 pos) {
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
    svg.draw_3D(ID) ;
  }

  // rebuild your shape from the original SVG
  if(mousePressed) svg.build() ;
}