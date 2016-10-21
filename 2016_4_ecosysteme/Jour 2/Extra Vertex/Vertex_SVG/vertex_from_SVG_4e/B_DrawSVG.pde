PShape shapeSVG ;
ArrayList<Vec3> list_points_SVG;
ArrayList <Vec3> shape_info ;

//SETUP
void setup_shape_SVG(String p) {
  list_points_SVG = new ArrayList<Vec3>();
  shape_info = new ArrayList<Vec3>();
  shapeSVG = loadShape(p) ;
  createListOfPoint(shapeSVG) ;
}

//Information about the shape
 
PShape[] childrenShape ; // to create a shape children from SVG
int IDshapeChildren ;
int startPoint, endPoint ;

void createListOfPoint (PShape s ) {
  
  int  numChildren, numPoint;
  PVector pos  ;
  //find the quantity object from SVG
  numChildren = s.getChildCount(); 
  
  //if there is children, separate the shape
  if ( numChildren > 0 ) {
    // println("number of Children " + numChildren) ;
    for ( int i = 0 ; i  < numChildren ; i++) {
      childrenShape = s.getChildren() ;
      createListOfPoint (childrenShape[i]) ;
    }
  //if there no children we can write the shape in the list
  } else {
    numPoint = s.getVertexCount() ;
    //to find the exit point in the list
    endPoint = startPoint + numPoint ;
    
    
    //add information ID, entry and exit point of each children shape for the future !
    shape_info.add(Vec3(IDshapeChildren, startPoint, endPoint )) ;
    //display information
    //to find the ID shape
    IDshapeChildren += 1 ;
    //to find the next entry point in the list
    
    //startPoint = endPoint +1 ;
    startPoint = endPoint  ;
    
    //startPoint = endPoint  ;
    //loop to put the point from SVG in the list
    for ( int j = 0 ; j < numPoint ; j++) {
      pos = new PVector (s.getVertexX(j), s.getVertexY(j), 0.0 ) ;
      list_points_SVG.add(Vec3(pos.x, pos.y, pos.z)) ;
    }
  }
}




//Draw shape bezier Vertex
void draw_vertex_SVG() {
  for ( int i = 0 ; i < shape_info.size() ; i++) {
    int start = int(shape_info.get(i).y) ;
    int end   = int(shape_info.get(i).z) ;
    draw_bezier_vertex_SVG(start, end, 1., Vec2(0,0)) ;
  }
}

//Draw with scale
void draw_vertex_SVG(float scale) {
  for ( int i = 0 ; i < shape_info.size() ; i++) {
    int start = int(shape_info.get(i).y) ;
    int end   = int(shape_info.get(i).z) ;
    draw_bezier_vertex_SVG(start, end, scale, Vec2(0,0)) ;
  }
}
//Draw with pos
void draw_vertex_SVG(Vec2 pos) {
  for ( int i = 0 ; i < shape_info.size() ; i++) {
    int start = int(shape_info.get(i).y) ;
    int end   = int(shape_info.get(i).z) ;
    draw_bezier_vertex_SVG(start, end, 1., pos) ;
  }
}

//Draw with pos and scale
void draw_vertex_SVG(Vec2 pos, float scale) {
  for ( int i = 0 ; i < shape_info.size() ; i++) {
    int start = int(shape_info.get(i).y) ;
    int end   = int(shape_info.get(i).z) ;
    draw_bezier_vertex_SVG(start, end, scale, pos) ;
    // draw_vertex_SVG(start, end, scale, pos.x, pos.y) ;
  }
}

//Draw with pos, scale and jitting
void draw_vertex_SVG(Vec2 pos, float scale, Vec2 jitter) {
  for ( int i = 0 ; i < shape_info.size() ; i++) {
    int start = int(shape_info.get(i).y) ;
    int end   = int(shape_info.get(i).z) ;
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
      vertex(list_points_SVG.get(j).x *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x, list_points_SVG.get(j).y *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y) ;
    } else if (j > start && j < end -2 ) { 
      bezierVertex( list_points_SVG.get(j).x   *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x, list_points_SVG.get(j).y   *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y, 
                    list_points_SVG.get(j+1).x *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x, list_points_SVG.get(j+1).y *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y, 
                    list_points_SVG.get(j+2).x *scale +new_pos.x +jitter.jitter((int)jitter.x, (int)jitter.y).x, list_points_SVG.get(j+2).y *scale +new_pos.y +jitter.jitter((int)jitter.x, (int)jitter.y).y) ;
    }
    //must be different of "0" for the starting point
    if( j != start ) j += 2 ; // +=2 for the switch to next point because the BezierVertex need the coordinate
  }
  endShape() ;
}



void draw_vertex_SVG(int start, int end, float scale, float new_x, float new_y) {
  beginShape() ;
  for ( int j = start ; j < end ; j++) {
    vertex(list_points_SVG.get(j).x *scale +new_x, list_points_SVG.get(j).y *scale +new_y) ;
  }
  endShape() ;
}