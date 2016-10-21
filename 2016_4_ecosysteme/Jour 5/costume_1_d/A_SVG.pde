boolean reset_SVG = true ;

void build_SVG() {
	String path_SVG = "pirate_3.svg" ;
	setup_shape_SVG(path_SVG) ;
	reset_SVG = false ;
}



void display_full_SVG() {
  // be careful you must start from with an illustor where the coordinate is clean and the (0,0) are the good place.
  Vec2 size_SVG = Vec2(600,450) ;
  Vec2 pos = new Vec2 (mouseX -(size_SVG.x *.5) ,mouseY -(size_SVG.y *.5)); 
  float scale = .5 ;
  int jitting = 5 ;
  Vec2 jitter = new Vec2 (jitting,jitting);
  draw_vertex_SVG(pos, scale, jitter) ;
}

int ID = 0 ;
void display_animation_SVG(Vec3 pos, int size) {
  float beat = abs(sin(frameCount *.1)) ;
  
  float scale = .0025 *size *beat ;
  println(scale) ;
  Vec2 jitter = Vec2() ;
  Vec2 canvas_SVG = Vec2(200,200) ;
  canvas_SVG.mult(scale) ;
  Vec2 final_pos = Vec2(pos.x,pos.y) ;
  final_pos.sub(canvas_SVG) ;
  
  
  
  if(frameCount%5 == 0 )ID ++ ;
  if(ID > num_group_vertex()) ID = 0 ;
 // draw_specific_child_vertex_SVG(final_pos, scale, jitter, ID) ;
  
  for(int i = 0 ; i < num_group_vertex() ; i++) {
    draw_specific_child_vertex_SVG(final_pos, scale, jitter, i) ;
  }
  //draw_vertex_SVG(pos, scale, jitter) ;

  

  
}