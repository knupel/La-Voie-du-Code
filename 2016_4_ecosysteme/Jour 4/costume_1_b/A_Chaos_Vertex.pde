
ArrayList<Vec3> list_point = new ArrayList<Vec3>();
boolean reset_vertex_shape = true ;

void build_chaos(int num) {
	if(reset_vertex_shape) {
		list_point.clear() ;
		for(int i = 0 ; i < num ; i++) {
			Vec3 temp_normal_point = new Vec3("RANDOM", 1) ;
			list_point.add(temp_normal_point) ;
		}
		reset_vertex_shape = false ;
	}
}


void render_chaos(Vec3 pos, int size, Vec3 dir, ArrayList<Vec3> list) {
	beginShape() ;
	for(Vec3 p : list) {
		Vec3 temp_pos = Vec3(p) ;
		temp_pos.mult(size) ;
		temp_pos.add(pos) ;
		vertex(temp_pos) ;
	}
	endShape(CLOSE) ;
}

ArrayList list_vertex_point() {
	return list_point ;
}

void reset_chaos() {
	reset_vertex_shape = true ;
}