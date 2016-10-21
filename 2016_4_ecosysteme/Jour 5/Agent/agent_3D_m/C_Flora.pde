/**
Flora 0.0.1
*/
class Flora implements RULES {
  String name ;
  int ID = 0 ;

  Vec3 pos ;
  int size, size_ref ;
  int speed_growth = 1 ;
  int life ;

  Vec4 colour = new Vec4(0,0,0,g.colorModeA) ;

  int nutrient_quality ;
  float need = 1. ;
  /**
  Constructor
  */
  Flora(Vec3 pos, int size, String name) {
    this.name = name ;
    this.ID = int(random(1000000)) ;

    this.size = this.size_ref = this.life = size ;
    this.colour.set(colour);

    this.pos = pos ;

    this.nutrient_quality = 1 ;
  }
  /**
  Set Flora
  */
  void set_Flora_quality(int nutrient_quality) {
     this.nutrient_quality =  nutrient_quality ;
  }
  void set_colour(Vec4 colour) {
    this.colour.set(colour) ;
  }

  void set_growth(int speed) {
    this.speed_growth = speed ;
  }

  void set_need(float need) {
    this.need = need ;
  }

  

  void growth() {
    if(frameCount%(180 *CLOCK) == 0 ) {
      this.size += speed_growth ;
      this.life += speed_growth ;
      HUMUS -= need ;
    } 
  }


  /**
  Aspect
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

    //Vec3 pos_text = Vec3(pos) ;
    Vec2 pos_text = Vec2(0) ;

    matrix_start() ;
    translate(pos) ;
    text(name, pos_text.x, pos_text.y) ;
    text(life, pos_text.x, pos_text.y +(size_text *1.2) ) ;
    matrix_end() ;
  }
}