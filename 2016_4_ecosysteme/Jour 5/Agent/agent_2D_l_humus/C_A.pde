/**
CLASS AGENT 0.0.1
*/
class Agent implements RULES {
  String name ;


  boolean watching = true   ;
  int radar ;
  int age = 0 ;
  int  life_expectancy = 1 ;

  Vec2 pos, motion, direction ;
  Vec2 velocity_xy ;
  Vec4 colour = Vec4(0,0,0,g.colorModeA) ;
  int velocity, velocity_ref ;

  int size, size_ref ;
  int life ;
  int meat_quality ;
  boolean alive = true ;
  boolean carrion ;
  int speed_eating = 1 ;
  int eat_zone ;
  int greed = int(180 *CLOCK) ; // num of frame before stop to eat :)
  float gourmet = 2. ;

  boolean calm ;
  int step_hunger ;
  int hunger  ;

  Agent(Vec2 pos, int size, int life, int velocity, String name) {
    this.velocity = this.velocity_ref = velocity ;
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
  void rebound(Vec4 l, boolean rebound_on_limit) {
    rebound(l.x, l.y, l.z, l.w, rebound_on_limit) ;
  }

  void rebound(float left, float right, float top, float bottom, boolean rebound_on_limit) {
    float back = 0 ;
    float front = 0 ;
    Vec3 pos_temp = Vec3(pos.x, pos.y,0);
    Vec3 dir_temp = Vec3(direction.x, direction.y,0);
    
    if(rebound_on_limit) {
      dir_temp.set(rebound(left, right, top, bottom, front, back, pos_temp, dir_temp)) ;
      direction.set(dir_temp.x, dir_temp.y) ;
    } else {
      Vec3 motion_temp = Vec3(motion.x, motion.y,0) ;
      /*
      pos_temp.set(jump(left, right, top, bottom, front, back, pos_temp)) ;
      pos.set(pos_temp.x, pos_temp.y) ;
      */
      motion_temp.set(jump(left, right, top, bottom, front, back, motion_temp)) ;
      motion.set(motion_temp.x, motion_temp.y) ;
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
    if(motion.z > front) motion.z = back ;
    else if (motion.z < back ) motion.z = front ;
    return Vec3(motion) ;
  }



  void motion() {
    velocity_xy.set(velocity) ;
    velocity_xy.mult(direction) ;
    motion.add(velocity_xy) ;
  }
  
  void set_position() {
    pos.set(motion) ;
  }








  /**
  // STATEMENT
  */
  void statement() {
    time_to_eat() ;
    if(calm) velocity = 0 ; else velocity = velocity_ref ;

    // corpse
    if(life < 0) alive = false ;
    if(!alive) direction.set(Vec2(0)) ;
  }


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

  void hunger(int speed_starving) {
    if(frameCount%(1 + int(frameRate *CLOCK)) == 0) {
      hunger -= speed_starving ;
      if(hunger <= 0 ) life -= speed_starving ;
    }
  }


  void carrion() {
    int threshold = 2 ;
    if(!alive && size < size_ref / threshold ) carrion = true ; else carrion = false ;
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
    ellipse(pos.x, pos.y, size *2, size *2) ;
  }

  void info_visual_text(int size_text) {
    textSize(size_text) ;
    textAlign(CENTER) ;
    text(name, pos.x, pos.y) ;
    text(life + " " + size + " " + size_ref, pos.x, pos.y +(size_text *1.2) ) ;
    textSize(16) ;
    if(calm && alive) text("Time to nap", pos.x, pos.y +(size_text *2.4) ) ; 
    if(!calm && alive) text("I'm hungry", pos.x, pos.y +(size_text *2.4) ) ;
    if(!alive && !carrion) text("I'm dead", pos.x, pos.y +(size_text *2.4) ) ;
    if(!alive && carrion) text("I'm carrion", pos.x, pos.y +(size_text *2.4) ) ;
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
    println(this.name, "hunger", this.hunger) ;
    println(this.name, "watching", this.watching) ;
  }
}