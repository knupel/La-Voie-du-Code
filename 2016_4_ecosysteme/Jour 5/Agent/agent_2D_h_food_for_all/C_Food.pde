class Food {
  Vec2 pos ;
  int radius ;
  int life ;
  String name ;
  Vec4 colour = new Vec4() ;
  Food(Vec2 pos, int radius, String name, Vec4 colour) {
    this.pos = pos ;
    this.radius= this.life =radius ;
    this.name = name ;
    this.colour.set(colour);
  }
  








  // ASPECT
  void aspect(int thickness) {
    if(thickness <= 0) { 
      noStroke() ;
      fill(colour.r,colour.g,colour.b,colour.a) ;
    } else { 
      strokeWeight(thickness) ;
      stroke(colour) ;
      fill(colour) ;
    }
  }
  void aspect(Vec4 c_fill, Vec4 c_stroke, int thickness) {
    if(thickness <= 0) { 
      noStroke() ;
      fill(c_fill) ;
    } else { 
      strokeWeight(thickness) ;
      stroke(c_stroke) ;
      fill(c_fill) ;
    }
  }
  
  void info_text(int size_text) {
    //point(pos) ;
    textSize(size_text) ;
    textAlign(CENTER) ;
    text(name, pos.x, pos.y) ;
    text(life, pos.x, pos.y +(size_text *1.2) ) ;
  }
}