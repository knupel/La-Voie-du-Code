class Agent {
  Vec2 pos, motion, direction ;
  Vec2 velocity_xy ;
  int velocity ;
  int radius ;
  
  String name ;
  int life ;
  
  Agent(Vec2 pos, int radius, int velocity, int life, String name) {
    this.velocity = velocity ;
    this.radius = radius ;
    this.pos = pos ;
    this.name = name ;
    this.life = life ;
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
  
  void costume() {
    //point(pos) ;
    int size_text = 24 ;
    textSize(size_text) ;
    textAlign(CENTER) ;
    text(name, pos.x, pos.y) ;
    text(life, pos.x, pos.y +(size_text *1.2) ) ;
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






/**
PREDATOR
*/
class Predator extends Agent {
  boolean watching = true   ;
  boolean killing   ;
  int radar ;
  int kill_zone ;
  Predator(Vec2 pos, int radius, int velocity, int life, String name, int radar) {
    super(pos, radius, velocity, life, name) ;
    this.radar = radar ;
    kill_zone = int(radius *2) + radius ;
  }
  
  void watch(Vec2 target) {
    if(dist(target,pos) < radar ) watching = false ; else watching = true ;
  }
  
  void kill(Prey prey) {
    if(dist(prey.pos,pos) < kill_zone ) prey.life -= 1 ;
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
    ellipse(pos.x, pos.y, kill_zone *2, kill_zone *2) ;
    ellipse(pos.x, pos.y, radius *2, radius *2) ;
  }
}








/**
PREY
*/
class Prey extends Agent {
  Prey(Vec2 pos, int size, int velocity, int life, String name) {
    super(pos, size, velocity, life, name) ;
  }
}