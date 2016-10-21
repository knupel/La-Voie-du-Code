class Agent {
  Vec2 pos, motion, direction ;
  Vec2 velocity_xy ;
  int velocity ;
  int size ;
  String name ;
  
  Agent(Vec2 pos, int size, int velocity, String name) {
    this.velocity = velocity ;
    this.size = size ;
    this.pos = pos ;
    this.name = name ;
    // init var
    motion = Vec2(pos) ; ;
    direction = Vec2("RANDOM",1,1) ;
    velocity_xy = Vec2() ;
  }
  
  
  
  void rebound(float top, float bottom, float left, float right) {
    direction.set(rebound(top, bottom, left, right, pos, direction)) ;
  }
  

  
  
  void motion() {
    velocity_xy.set(velocity) ;
    velocity_xy.mult(direction) ;
    motion.add(velocity_xy) ;
  }
  
  void set() {
    pos.set(motion) ;
  }
  
  void aspect(int thickness) {
    // aspect
    noFill() ;
    stroke(255) ;
    strokeWeight(thickness) ;
  }
  
  void costume(int id) {
    //point(pos) ;
    textSize(24) ;
    textAlign(CENTER) ;
    text(name, pos.x, pos.y) ;
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


class Predator extends Agent {
  boolean watching = true  ;
  int radar ;
  Predator(Vec2 pos, int size, int velocity, String name, int radar) {
    super(pos, size, velocity, name) ;
    this.radar = radar ;
  }
  
  void watch(Vec2 target) {
    if(dist(target,pos) < radar ) watching = false ; else watching = true ;
  }
  
  void hunt(Vec2 target) {
    println(watching) ;
    if (!watching) direction.set(target_direction(target, pos)) ; else direction.set(0) ; 
  }
  
  boolean hunting() {
    if (watching) return false ; else return true ;
  }
  
  // info
  void info() {
    ellipse(pos.x, pos.y, radar*2, radar*2) ;
  }
}



class Prey extends Agent {
  Prey(Vec2 pos, int size, int velocity, String name) {
    super(pos, size, velocity, name) ;
  }
}