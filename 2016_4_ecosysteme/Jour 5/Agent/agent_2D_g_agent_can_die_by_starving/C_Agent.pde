/**
CLASS AGENT 0.0.1
*/
class Agent {
  Vec2 pos, motion, direction ;
  Vec2 velocity_xy ;
  Vec4 colour ;
  int velocity, velocity_ref ;
  int radius ;
  
  String name ;
  int life ;

  boolean calm ;
  int step_hunger ;
  int hunger  ;
  
  Agent(Vec2 pos, int radius, int velocity_ref, int life, String name, Vec4 colour) {
    this.velocity_ref = this.velocity_ref = velocity_ref ;
    this.radius = radius ;
    this.pos = pos ;
    this.name = name ;
    this.life = life ;
    this.colour = colour ;
    // init var
    motion = Vec2(pos) ; ;
    direction = Vec2("RANDOM",1,1) ;
    velocity_xy = Vec2() ;

    // statement
    step_hunger = life /2 ;
    hunger = 0 ;
  }

  //AGENT SETTING
  void set(int step_hunger) {
    this.step_hunger = step_hunger ;
  }

  
  
  // MOTION
  void rebound(float top, float bottom, float left, float right) {
    direction.set(rebound(top, bottom, left, right, pos, direction)) ;
  }

  void motion() {
    velocity_xy.set(velocity) ;
    velocity_xy.mult(direction) ;
    motion.add(velocity_xy) ;
  }
  
  void set_position() {
    pos.set(motion) ;
  }







  // STATEMENT
  void statement() {
    if(hunger < step_hunger) calm = false ; else calm = true ;
    if(calm) velocity = 0 ; else velocity = velocity_ref ;
  }

  void hunger(int speed_starving) {
    int seconds = 5 ; // 
    if(frameCount%(seconds *(int)frameRate) == 0) {
      hunger -= speed_starving ;
      if(hunger <= 0 ) life -= speed_starving ;
    }
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
 
  // COSTUME
  void costume() {
    //point(pos) ;
    int size_text = 24 ;
    textSize(size_text) ;
    textAlign(CENTER) ;
    text(name, pos.x, pos.y) ;
    text(life, pos.x, pos.y +(size_text *1.2) ) ;
    textSize(16) ;
    if(calm) text("C'est l'heure de la sieste", pos.x, pos.y +(size_text *2.4) ) ; else  text("J'ai faim", pos.x, pos.y +(size_text *2.4) ) ;
  }
  
  // internal method
  Vec2 rebound(float top, float bottom, float left, float right, Vec2 pos, Vec2 dir) {
    // detection x
    if(pos.x > right ) dir.x *= -1 ;
    else if (pos.x < left ) dir.x *= -1 ;
    //detection z
    if(pos.y > bottom) dir.y *= -1 ;
    else if (pos.y < top ) dir.y *= -1 ;
    return Vec2(dir.x,dir.y) ;
  }
}