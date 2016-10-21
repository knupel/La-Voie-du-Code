class Agent {
  Vec2 pos, motion, direction ;
  Vec2 velocity_xy ;
  int velocity ;
  int size ;
  
  Agent(Vec2 pos, int size, int velocity) {
    this.velocity = velocity ;
    this.size = size ;
    this.pos = pos ;
    // init var
    motion = Vec2(pos) ; ;
    direction = Vec2("RANDOM",1,1) ;
    velocity_xy = Vec2() ;
  }
  
  
  
  void rebound(float top, float bottom, float left, float right) {
    direction.set(rebound(top, bottom, left, right, pos, direction)) ;
  }
  
  void target(Vec2 target, int dist) {
    if(dist(target,pos) < dist ) direction.set(target_direction(target, pos)) ;
  }
  
  
  void motion() {
    println(direction) ;
    velocity_xy.set(velocity) ;
    velocity_xy.mult(direction) ;
    motion.add(velocity_xy) ;
  }
  
  void set() {
    pos.set(motion) ;
  }
  
  void aspect() {
    // aspect
    noFill() ;
    stroke(255) ;
    strokeWeight(size *2) ;
  }
  
  void costume() {
    point(pos) ;
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