
Vec2 [] coord ;

void setup() {
  size(500,500) ;
  
  int num = 4 ;
  coord = new Vec2[num] ;
  coord[0] = Vec2(0,0) ;
  coord[1] = Vec2(width,0) ;
  coord[2] = Vec2(width,height) ;
  coord[3] = Vec2(0,height) ;
  
    
}


void draw() {
  background(0) ;
  
  float marge = map(mouseX, 0,width, 10, 200) ;
  // update
  Vec2 [] temp = new Vec2[coord.length] ;
  for(int i = 0 ; i < coord.length ; i++) {
    temp[i] = coord[i].copy() ;
  }
  temp[0].set(coord[0].x +marge, coord[0].y +marge) ;
  temp[1].set(coord[1].x -marge, coord[1].y +marge) ;
  temp[2].set(coord[2].x -marge, coord[2].y -marge) ;
  temp[3].set(coord[3].x +marge, coord[3].y -marge) ;

  
  // display
  beginShape() ;
  for(int i = 0 ; i < coord.length ; i++) {
     vertex(temp[i]) ;
  }
  endShape() ;
  
}