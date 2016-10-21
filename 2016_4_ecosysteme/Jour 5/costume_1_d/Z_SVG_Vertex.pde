/**
* SVG_to_Vertex 0.3.0
* @author Stan le Punk
* @see https://github.com/StanLepunK
*/
PShape shapeSVG ;
ArrayList<Vec3> list_points_SVG;
ArrayList <Vec3> shape_info ;

//SETUP
void setup_shape_SVG(String p) {
  list_points_SVG = new ArrayList<Vec3>();
  shape_info = new ArrayList<Vec3>();
  shapeSVG = loadShape(p) ;
  create_list_point_SVG(shapeSVG) ;
}

//Information about the shape
 

int ID_shape_children ;
void create_list_point_SVG (PShape main_shape) {
  int num_children = main_shape.getChildCount(); 
  if (main_shape.getChildCount() > 0 ) create_shape_children(main_shape, num_children) ;
  else { 
    add_point_SVG(main_shape, ID_shape_children) ;
    ID_shape_children += 1 ;
  }
}

PShape[] childrenShape ;
void create_shape_children(PShape mother, int num) {
  for ( int i = 0 ; i  < num ; i++) {
    childrenShape = mother.getChildren() ;
    create_list_point_SVG(childrenShape[i]) ;
  }
}


int startPoint ;
void add_point_SVG(PShape s, int ID) {
  int numPoint = s.getVertexCount() ;
  //to find the exit point in the list
  int endPoint = startPoint + numPoint ;
  //add information ID, entry and exit point of each children shape for the future !
  shape_info.add(Vec3(ID, startPoint, endPoint )) ;
  //display information
  //to find the ID shape

  //to find the next entry point in the list
  //startPoint = endPoint +1 ;
  startPoint = endPoint  ;
  //loop to put the point from SVG in the list
  for ( int j = 0 ; j < numPoint ; j++) {
    Vec3 pos = Vec3(s.getVertexX(j), s.getVertexY(j), 0.0 ) ;
    list_points_SVG.add(pos) ;
  }
}



/**
//Draw shape bezier Vertex
*/
void draw_vertex_SVG() {
  draw_vertex_SVG(Vec2(), 1, Vec2()) ;
}

//Draw with scale
void draw_vertex_SVG(float scale) {
  draw_vertex_SVG(Vec2(), scale, Vec2()) ;
}
//Draw with pos
void draw_vertex_SVG(Vec2 pos, float scale) {
  draw_vertex_SVG(pos, scale, Vec2()) ;
}
void draw_vertex_SVG(Vec2 pos) {
  draw_vertex_SVG(pos, 1, Vec2()) ;
}



//Draw with pos, scale and jitting
void draw_vertex_SVG(Vec2 pos, float scale, Vec2 jitter) {
  for ( int i = 0 ; i < shape_info.size() ; i++) {
    int start = int(shape_info.get(i).y) ;
    int end   = int(shape_info.get(i).z) ;
    draw_bezier_vertex_SVG(start, end, scale, pos, jitter) ;
  }
}

int num_group_vertex() {
  return shape_info.size() ;
}
void draw_specific_child_vertex_SVG(Vec2 pos, float scale, Vec2 jitter, int ID) {
  if(ID < shape_info.size()) {
    int start = int(shape_info.get(ID).y) ;
    int end   = int(shape_info.get(ID).z) ;
    draw_bezier_vertex_SVG(start, end, scale, pos, jitter) ;
  }
}






void draw_bezier_vertex_SVG(int start, int end, float scale, Vec2 new_pos) {
  beginShape() ;
  for ( int j = start ; j < end ; j++) {
    if (j == start ) { 
      vertex(list_points_SVG.get(j).x *scale +new_pos.x, list_points_SVG.get(j).y *scale +new_pos.y) ;
    } else if (j > start && j < end -2 ) { 
      bezierVertex( list_points_SVG.get(j).x   *scale +new_pos.x, list_points_SVG.get(j).y   *scale +new_pos.y, 
                    list_points_SVG.get(j+1).x *scale +new_pos.x, list_points_SVG.get(j+1).y *scale +new_pos.y, 
                    list_points_SVG.get(j+2).x *scale +new_pos.x, list_points_SVG.get(j+2).y *scale +new_pos.y ) ;
    }
    //must be different of "0" for the starting point
    if( j != start ) j += 2 ; // +=2 for the switch to next point because the BezierVertex need the coordinate
  }
  endShape() ;
}


// with jitter
void draw_bezier_vertex_SVG(int start, int end, float scale, Vec2 new_pos, Vec2 jitter) {
  beginShape() ;
  for ( int j = start ; j < end ; j++) {
    if (j == start ) {
      float pos_x = list_points_SVG.get(j).x *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x ;
      float pos_y = list_points_SVG.get(j).y *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y ;
      float pos_z ;
      vertex(pos_x, pos_y) ;
    } else if (j > start && j < end -2 ) {
      float pos_a_x = list_points_SVG.get(j).x   *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x ;
      float pos_a_y = list_points_SVG.get(j).y   *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y;
      float pos_a_z = 0 ;
       float pos_b_x = list_points_SVG.get(j+1).x *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x ;
      float pos_b_y = list_points_SVG.get(j+1).y *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y ;
      float pos_b_z = 0 ;
      float pos_c_x = list_points_SVG.get(j+2).x *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x ;
      float pos_c_y = list_points_SVG.get(j+2).y *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y ;
      float pos_c_z = 0 ;
      // bezierVertex(pos_a_x, pos_a_y, pos_a_z, pos_b_x, pos_b_y, pos_b_z, pos_c_x, pos_c_y, pos_c_z) ;
      bezierVertex(pos_a_x, pos_a_y, pos_b_x, pos_b_y, pos_c_x, pos_c_y) ;
    }
    //must be different of "0" for the starting point
    if( j != start ) j += 2 ; // +=2 for the switch to next point because the BezierVertex need the coordinate
  }
  endShape() ;
}





/**
DEPRECATED ????
*/
/*
//Draw with pos and scale
void draw_vertex_SVG(Vec2 pos, float scale) {
 //  draw_vertex_SVG(pos, scale, Vec2()) ;

  for ( int i = 0 ; i < shape_info.size() ; i++) {
    int start = int(shape_info.get(i).y) ;
    int end   = int(shape_info.get(i).z) ;
    draw_bezier_vertex_SVG(start, end, scale, pos) ;
    // draw_vertex_SVG(start, end, scale, pos) ;
  }

}

void draw_vertex_SVG(int start, int end, float scale, Vec3 pos) {
  beginShape() ;
  for ( int j = start ; j < end ; j++) {
    Vec3 temp_point = Vec3(list_points_SVG.get(j)) ;
    temp_point.mult(scale) ;
    temp_point.add(pos) ;
    vertex(temp_point) ;
  }
  endShape() ;
}
*/