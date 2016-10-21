/**
SUB CLASS CARNIVORE 0.0.1
*/
class Carnivore extends Agent {
  boolean killing   ;
  int kill_zone ;
  int eat_zone ;
  Carnivore(Vec2 pos, int size, int velocity, int life, String name, Vec4 colour, int radar) {
    super(pos, size, velocity, life, name, colour) ;
    this.radar = radar ;
    kill_zone = int(size *2) +size ;
    eat_zone = int(size *1.2) +size ;
  }





  // statement
  void watch(Agent a) {
    // if(dist(target,pos) < radar && target_alive ) watching = false ; else watching = true ;
    Vec2 pos_target = a.pos ;

    if(dist(pos_target,pos) < radar && a.alive ) watching = false ; else watching = true ;
  }
  
  
  void kill(Agent a) {
    if(dist(a.pos,pos) < kill_zone && a.alive ) {
      a.life -= 1 ;
    }
  }

  void eat(Agent a) {
    int carrion_step = 2 ;
    if(dist(a.pos,pos) < eat_zone && !a.alive && !a.carrion(carrion_step) ) {
      a.size -= speed_eating ;
      hunger += (a.meat_quality *speed_eating) ;
    }
  }

  
  void hunt(Agent a) {
    if (!watching) {
      Vec2 pos_target = a.pos ;
      direction.set(target_direction(pos_target, pos)) ;
    }
  }
  
  boolean hunting() {
    if (watching) return false ; else return true ;
  }
  
  // info
  void info_visual() {
    if(alive) {
      ellipse(pos.x, pos.y, radar*2, radar*2) ;
      ellipse(pos.x, pos.y, kill_zone *2, kill_zone *2) ;
      ellipse(pos.x, pos.y, eat_zone *2, eat_zone *2) ;
    }
    ellipse(pos.x, pos.y, size *2, size *2) ;
  }

}