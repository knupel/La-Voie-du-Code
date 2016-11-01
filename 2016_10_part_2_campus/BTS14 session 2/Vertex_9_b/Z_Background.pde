/**
RPE – Romanesco Processing environment – 
BACKGROUND_2D_3D 0.0.3
* @author Stan le Punk
* @see other Processing work on https://github.com/StanLepunK
*/

// 2D BG
void background_2D(int colour) {
  background_2D(colour, g.colorModeA) ;
}

void background_2D(int colour, float a) {
  fill(colour,a) ;
  noStroke() ;
  rect(0,0,width,height) ;
}




void background_2D(float r, float g, float b, float a) {
  fill(r,g,b,a) ;
  noStroke() ;
  rect(0,0,width,height) ;
}
void background_2D(float r, float g, float b) {
  fill(r,g,b) ;
  noStroke() ;
  rect(0,0,width,height) ;
}




void background_2D(Vec4 c) {
  fill(c.r,c.g,c.b,c.a) ;
  noStroke() ;
  rect(0,0,width,height) ;
}

void background_2D(Vec3 c) {
  fill(c.r,c.g,c.b) ;
  noStroke() ;
  rect(0,0,width,height) ;
}



/**
Background 3D
*/
void background_3D(int colour, float a) {
  fill(colour,a) ;
  noStroke() ;
  pos_background() ;
}

void background_3D(int colour) {
  background_3D(colour, g.colorModeA) ;
}



void background_3D(float r, float g, float b, float a) {
  fill(r,g,b,a) ;
  noStroke() ;
  pos_background() ;
}

void background_3D(float r, float g, float b) {
  fill(r,g,b) ;
  noStroke() ;
  pos_background() ;
}



void background_3D(Vec4 c) {
  fill(c.r,c.g,c.b,c.a) ;
  noStroke() ;
  rect(0,0,width,height) ;
}

void background_3D(Vec3 c) {
  fill(c.r,c.g,c.b) ;
  noStroke() ;
  rect(0,0,width,height) ;
}


// local method
void pos_background() {
  int canvas_width = width *100 ;
  int canvas_height = height *100 ;
  int canvas_depth = height *6 ;
  matrix_start() ;
  translate(-canvas_width *.5, -canvas_height *.5, -canvas_depth) ;
  rect(0,0,canvas_width,canvas_height) ;
  matrix_end() ;
}