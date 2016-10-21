/**
Food 0.0.1
*/
class Food {
  Vec2 pos ;
  int size, size_ref ;
  int life ;
  String name ;
  Vec4 colour = new Vec4(0,0,0,g.colorModeA) ;
  int food_quality ;
  Food(Vec2 pos, int size, String name) {
    this.pos = pos ;
    this.size = this.size_ref = this.life = size ;
    this.name = name ;
    this.colour.set(colour);

    this.food_quality = 1 ;
  }
  /**
  // SET FOOD
  */
  void set_food_quality(int food_quality) {
     this.food_quality =  food_quality ;
  }
  void set_colour(Vec4 colour) {
    this.colour.set(colour) ;
  }


  /**
  // ASPECT
  */
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
  
  /**
  // info
  */
  void info_visual_text(int size_text) {
    textSize(size_text) ;
    textAlign(CENTER) ;
    text(name, pos.x, pos.y) ;
    text(life, pos.x, pos.y +(size_text *1.2) ) ;
  }
}