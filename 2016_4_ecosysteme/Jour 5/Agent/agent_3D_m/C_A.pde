/**
CLASS AGENT 0.0.1
*/
class Agent implements RULES {
  String name ;
  int ID = 0 ;
  Vec2 ID_target = Vec2(-1) ;


  boolean watching = true   ;
  boolean alive = true ;
  boolean carrion ;
  boolean calm ;
  boolean eating ;


  int age = 0 ;
  int life_expectancy = 1 ;
  int dead_since = 0 ;

  Vec3 pos, motion, direction ;
  Vec3 velocity_xyz ;
  Vec4 colour = Vec4(0,0,0,g.colorModeA) ;
  int velocity, velocity_ref ;

  int size, size_ref ;
  int life ;
  int meat_quality ;

  int radar ;
  int speed_eating = 1 ;
  int eat_zone ;
  int greed = int(180 *CLOCK) ; // num of frame before stop to eat :)
  float gourmet = 2. ;


  int step_hunger ;
  int hunger  ;

  Agent(Vec3 pos, int size, int life, int velocity, String name) {
    this.name = name ;
    this.ID = int(random(1000000)) ;
    this.colour.set(colour) ;

    this.size = this.size_ref = size ;
    this.life = life ;

    this.pos = pos ;
    this.velocity = this.velocity_ref = velocity ;
    motion = Vec3(pos) ; ;
    direction = Vec3("RANDOM",1) ;
    velocity_xyz = Vec3() ;

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
  

  void set_greed(int greed) {
    this.greed = int(greed *CLOCK) ;
  }
  void set_gourmet(float gourmet) {
    this.gourmet = abs(gourmet) +1.1 ;
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
  void set_colour(Vec4 colour) {
    this.colour.set(colour) ;
  }
  void set_alive(boolean alive) {
    this.alive = alive ;
  }

  
  /**
  // MOTION
  */
  void rebound(Vec6 l, boolean rebound_on_limit) {
    if(ENVIRONMENT == 2 ) rebound(l.a, l.b, l.c, l.d, 0, 0, rebound_on_limit) ;
    else if(ENVIRONMENT == 3) rebound(l.a, l.b, l.c, l.d, l.e, l.f,  rebound_on_limit) ;
  }
  
  void rebound(float left, float right, float top, float bottom, float front, float back, boolean rebound_on_limit) {
    Vec3 pos_temp = Vec3(pos.x, pos.y,pos.z);
    Vec3 dir_temp = Vec3(direction.x, direction.y,direction.z);
    
    if(rebound_on_limit) {
      dir_temp.set(rebound(left, right, top, bottom, front, back, pos_temp, dir_temp)) ;
      direction.set(dir_temp) ;
    } else {
      Vec3 motion_temp = Vec3(motion.x, motion.y,motion.z) ;
      motion_temp.set(jump(left, right, top, bottom, front, back, motion_temp)) ;
      motion.set(motion_temp) ;
    }
  }


  // local method
  Vec3 rebound(float left, float right, float top, float bottom, float front, float back, Vec3 pos, Vec3 dir) {
    // here we use size to have a physical rebound
    int effect = size ;
    left -=effect ;
    right +=effect ;
    top -=effect ;
    bottom +=effect ;
    front -=effect;
    back +=effect;

    // detection x
    if(pos.x > right ) dir.x *= -1 ;
    else if (pos.x < left ) dir.x *= -1 ;
    // detection y
    if(pos.y > bottom) dir.y *= -1 ;
    else if (pos.y < top ) dir.y *= -1 ;
    // detection z
    if(pos.z > front) dir.z *= -1 ;
    else if (pos.z < back ) dir.z *= -1 ;
    return Vec3(dir) ;
  }


  Vec3 jump(float left, float right, float top, float bottom, float front, float back, Vec3 motion) {
    // here we use radar to find a good jump
    int effect = radar ;
    left -=effect ;
    right +=effect ;
    top -=effect ;
    bottom +=effect ;
    front -=effect;
    back +=effect;

    if(motion.x > right ) motion.x = left ;
    else if (motion.x < left ) motion.x = right ;
    // detection y
    if(motion.y > bottom) motion.y = top ;
    else if (motion.y < top ) motion.y = bottom  ;
    // detection z
    if(motion.z > back) motion.z = front ;
    else if (motion.z < front ) motion.z = back ;
    return Vec3(motion) ;
  }



  void motion() {
    velocity_xyz.set(velocity) ;
    velocity_xyz.mult(direction) ;
    motion.add(velocity_xyz) ;
  }
  
  void set_position() {
    if(ENVIRONMENT == 2 ) pos.set(motion.x, motion.y, 0) ; else if(ENVIRONMENT == 3 ) pos.set(motion.x, motion.y, motion.z) ;
  }








  /**
  // STATEMENT
  */
  void statement() {
    time_to_eat() ;
    if(calm) velocity = 0 ; else velocity = velocity_ref ;

    // corpse
    if(life <= 0) {
      alive = false ;
      life = 0 ;
    }
    if(!alive) direction.set(Vec3(0)) ;
  }

  // local method
  int start_eating ;
  void time_to_eat() {
    if(hunger < step_hunger) {
      calm = false ;
      start_eating = frameCount ; 
    } else {
      int time_to_stop_eating = start_eating +greed ;
      if ( time_to_stop_eating > frameCount) calm = true ; 
    }

  }
  

  void carrion() {
    int threshold = 2 ;
    if(!alive) {
      dead_since += int(1. *CLOCK) ;
      if(size < size_ref / threshold || dead_since > (TIME_TO_BE_CARRION *frameRate) ) carrion = true ; else carrion = false ;
    } 
  }



  void hunger(int speed_starving) {
    if(frameCount%(1 + int(frameRate *CLOCK)) == 0) {
      hunger -= speed_starving ;
      if(hunger <= 0 ) life -= speed_starving ;
    }
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
  void info_visual() {
    Vec3 pos_temp = Vec3(0) ;
    //Vec3 pos_temp = Vec3(pos) ;
    matrix_start() ;
    translate(pos) ;
    // ellipse(pos.x, pos.y, size *2, size *2) ;
    ellipse(pos_temp.x, pos_temp.y, size *2, size *2) ;
    matrix_end() ;
  }

  void info_visual_text(int size_text) {

    //Vec pos_text = Vec2(pos) ;
    Vec2 pos_text = Vec2(0) ;
    matrix_start() ;
    translate(pos) ;
    textSize(size_text) ;
    textAlign(CENTER) ;
    text(name, pos_text.x, pos_text.y) ;
    text(life + " " + size + " " + size_ref, pos_text.x, pos_text.y +(size_text *1.2) ) ;
    textSize(16) ;
    if(alive) {
      if (eating) {
        text("I'm eating", pos_text.x, pos_text.y +(size_text *2.4) ) ;
      } else {
        if(calm) text("I'm cool", pos_text.x, pos_text.y +(size_text *2.4) ) ; 
        if(!calm) text("I'm hungry", pos_text.x, pos_text.y +(size_text *2.4) ) ;
      }
    } else {
      if(!carrion) text("I'm dead", pos_text.x, pos_text.y +(size_text *2.4) ) ; else text("I'm carrion", pos_text.x, pos_text.y +(size_text *2.4) ) ;
    }
    matrix_end() ;
  }

  void info_print_agent() {
    // basic Agent info
    println(this.name + " " +this.getClass().getSimpleName()) ;
    info_print_agent_structure() ;
    info_print_agent_motion() ;
    info_print_agent_statement() ;
  }
  void info_print_agent_structure() {
    println("CARACTERISTIC",this.name) ;
    println(this.name, "size", this.size) ;
    println(this.name, "life", this.life) ;
    println(this.name, "meat quality", this.meat_quality) ;
    println(this.name, "Flora exigency", this.gourmet) ;
  }

  void info_print_agent_motion() {
    println("MOTION",this.name) ;
    println(this.name, "velocity", this.velocity_ref) ;
    println(this.name, "current velocity", this.velocity) ;
    println(this.name, "position", this.pos) ;
    println(this.name, "direction", this.direction) ;
    println(this.name, "motion", this.motion) ;
  }



  void info_print_agent_statement() {
    println("STATEMENT",this.name) ;
    println(this.name, "alive", this.alive) ;
    println(this.name, "carrion", this.carrion) ;
    println(this.name, "calm", this.calm) ;
    println(this.name, "eating", this.eating) ;
    println(this.name, "hunger", this.hunger) ;
    println(this.name, "watching", this.watching) ;
  }
}