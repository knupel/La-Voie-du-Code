/**
CLASS AGENT 0.0.1
*/
class Agent {
  String name ;

  boolean watching = true   ;
  int radar ;
  int age = 0 ;
  int  life_expectancy = 1 ;

  Vec2 pos, motion, direction ;
  Vec2 velocity_xy ;
  Vec4 colour = Vec4() ;
  int velocity, velocity_ref ;

  int size, size_ref ;
  int life ;
  int meat_quality ;
  boolean alive = true ;
  boolean carrion ;
  int speed_eating = 1 ;

  boolean calm ;
  int step_hunger ;
  int hunger  ;
  
  Agent(Vec2 pos, int size, int velocity_ref, int life, String name, Vec4 colour) {
    this.velocity_ref = this.velocity_ref = velocity_ref ;
    this.size = this.size_ref = size ;
    this.pos = pos ;
    this.name = name ;
    this.life = life ;
    this.colour.set(colour) ;
    // init var
    motion = Vec2(pos) ; ;
    direction = Vec2("RANDOM",1,1) ;
    velocity_xy = Vec2() ;

    // statement
    step_hunger = (size + life)/2 *((life_expectancy -age)/life_expectancy) ;
    hunger = 0 ;
    meat_quality = 1 ;
  }
  /**
  //SET AGENT
  */
  void set_agent(int step_hunger, int hunger, int meat_quality, int speed_eating) {
    set_meat_quality(meat_quality) ;
    set_step_hunger(step_hunger) ;
    set_hunger(hunger) ;
    set_speed_eating(speed_eating) ;
  }

  void set_meat_quality(int meat_quality) {
    this.meat_quality = meat_quality ;
  }
  void set_step_hunger(float step_hunger) {
    this.step_hunger = int(size *step_hunger) ;
  }
  void set_hunger(int hunger) {
    this.hunger = hunger ;
  }
  void set_speed_eating(int speed_eating) {
    this.speed_eating = 1 ;
  }

  
  /**
  // MOTION
  */
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






  /**
  // STATEMENT
  */
  void statement() {
    if(hunger < step_hunger) calm = false ; else calm = true ;
    if(calm) velocity = 0 ; else velocity = velocity_ref ;

    // corpse
    if(life < 0) alive = false ;
    if(!alive) direction.set(Vec2(0)) ;

  }

  void hunger(int speed_starving) {
    int seconds = 5 ; // 
    if(frameCount%(seconds *(int)frameRate) == 0) {
      hunger -= speed_starving ;
      if(hunger <= 0 ) life -= speed_starving ;
    }
  }


  boolean carrion(int ratio_carrion) {
    if(!alive && size < size_ref / ratio_carrion ) carrion = true ; else carrion = false ;
    return carrion ;
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
 
  // COSTUME
  /*
  void costume() {

  }
  */
  
  



  /**
  // void info
  */
  void info_text(int size_text) {
    textSize(size_text) ;
    textAlign(CENTER) ;
    text(name, pos.x, pos.y) ;
    text(life, pos.x, pos.y +(size_text *1.2) ) ;
    textSize(16) ;
    if(calm && alive) text("C'est l'heure de la sieste", pos.x, pos.y +(size_text *2.4) ) ; 
    if(!calm && alive) text("J'ai faim", pos.x, pos.y +(size_text *2.4) ) ;
    if(!alive && !carrion) text("Je suis mort", pos.x, pos.y +(size_text *2.4) ) ;
    if(!alive && carrion) text("Je suis une charogne", pos.x, pos.y +(size_text *2.4) ) ;
  }
  void info_agent_print() {
    // basic Agent info
    println(this.name + " " +this.getClass().getSimpleName()) ;
    println(this.name +" size ", this.size) ;
    println(this.name +" life ", this.life) ;
    println(this.name +" meat quality ", this.meat_quality) ;
 
    println(this.name +" velocity", this.velocity_ref) ;
    println(this.name +" current velocity", this.velocity) ;
    println(this.name +" position", this.pos) ;

    println(this.name +" alive ", this.alive) ;
    println(this.name +" carrion ", this.carrion) ;
    println(this.name +" calm ", this.calm) ;
    println(this.name +" hunger ", this.hunger) ;

    println(this.name +" watching ", this.watching) ;
  }
}