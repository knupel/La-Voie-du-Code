// RPE SVG
RPEsvg svg ;
void setup() {
  size(600,600) ;
  
  String path = "pirate_couleur.svg" ;
  svg = new RPEsvg(path) ;
  svg.build() ;
}

void draw() {
  background_3D(0, 50) ;

  svg.svg_mode(CENTER) ;

  // variable common to the 2D and 3D vertex
  float scale = 0.5;
  int jitting = 0 ;
  /**
  2D VERTEX
  be careful you must start from with an illustor where the coordinate is clean and the (0,0) are the good place, 
  it's better to start from a new illustrator file
  */
  /**
  CLASSIC VERTEX
  */
  Vec2 pos_2D = Vec2 (mouseX,mouseY); 
  Vec2 jitter_2D = Vec2 (jitting) ;
  Vec2 scale_2D = Vec2(scale, scale) ;

// Vec3 pos_3D = new Vec3 (mouseX,mouseY, sin(frameCount *.1) *150) ;
  Vec3 scale_3D = Vec3(scale) ;
  Vec3 pos_3D = Vec3 (mouseX,mouseY, 0); 
  Vec3 jitter_3D = Vec3 (jitting);


  // full_svg_2D(pos_2D, scale_2D, jitter_2D) ;
  
  // name_svg_2D(pos_2D, scale_2D, jitter_2D) ;
  
  // ID_svg_2D(pos_2D, scale_2D, jitter_2D, ID) ;

  add_value_to_points(pos_2D) ;
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
   // svg.fill_custom((int)random(255),100,100,255) ;
    svg.fill_factor(1,1,1,map(mouseX, 0,width, 0, 1)) ;
    svg.stroke_factor(1,1,1,map(mouseY, 0,height, 1, 0)) ;
    svg.draw_2D(ID) ;
  }

  // rebuild your shape from the original SVG
  if(mousePressed) svg.build() ;
}






void print_info_by_ID() {
  int ID = (int)random(svg.num_brick()) ;
  println(ID) ;
  // println(svg.name_brick(ID)) ;
  println(svg.kind_brick(ID)) ;
  println(svg.list_points_of_interest(ID)) ;
}

void print_info_by_list(){
  println(svg.brick_name_list()) ; 
  println(svg.family_brick()) ;
  println(svg.kind_brick()) ;
  println(svg.folder_brick_name()) ;

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
  svg.jitter(jitter_2D.mult(.2)) ;
  String layer_name_A = "Dentition" ;
  svg.draw_2D(layer_name_A) ;
  svg.end() ;
  
  svg.start() ;
  svg.pos(mouseY, mouseX) ;
  svg.original_style(false, false) ;
  String layer_name_B = "Dentition" ;
  svg.draw_2D(layer_name_B) ;
  svg.end() ;
}



void ID_svg_2D(Vec2 pos_2D, Vec2 scale_2D, Vec2 jitter_2D, int ID) {
  svg.pos(pos_2D) ;
  svg.scale(scale_2D) ;
  svg.jitter(jitter_2D) ;
  svg.original_style(true, false) ;
  svg.draw_2D(ID) ;
}