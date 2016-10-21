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





