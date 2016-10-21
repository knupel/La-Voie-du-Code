void background_2D(float r, float g, float b, float a) {
	fill(r,g,b,a) ;
	noStroke() ;
	rect(0,0,width,height) ;
}

void background_2D(int colour, float a) {
	fill(colour,a) ;
	noStroke() ;
	rect(0,0,width,height) ;
}

void background_2D(int colour) {
	background_2D(colour, g.colorModeA) ;
}


void background_3D(float r, float g, float b, float a) {
	fill(r,g,b,a) ;
	noStroke() ;
	pos_background() ;

}

void background_3D(int colour, float a) {
	fill(colour,a) ;
	noStroke() ;
	pos_background() ;
}

void background_3D(int colour) {
	background_3D(colour, g.colorModeA) ;
}

void pos_background() {
	int canvas_width = width *100 ;
	int canvas_height = height *100 ;
	int canvas_depth = width *6 ;
	matrix_start() ;
	translate(-canvas_width *.5, -canvas_height *.5, -canvas_depth) ;
	rect(0,0,canvas_width,canvas_height) ;
	matrix_end() ;
}