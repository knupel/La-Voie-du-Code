/**
SUB CLASS HERBIVORE 0.0.1
*/
class Bacterium extends Agent {
  // boolean eating   ;
  Bacterium(Vec2 pos, int size, int life, int velocity, float radar, String name) {
    super(pos, size, life, velocity, name) ;
    this.radar = int(size *radar) ;
    eat_zone = int(size *2) + size ;
  }



  void watch(Agent a) {
    Vec2 pos_target = a.pos.copy() ;
    if(dist(pos_target,pos) < radar && !a.alive ) watching = false ; else watching = true ;
  }

   // Method
  void eat(Agent a) {
    if(dist(a.pos,pos) < eat_zone ) {
      a.size -= speed_eating ;
      hunger += (a.meat_quality *speed_eating) ;
    }
  }


  void pick(Agent a) {
    if (!watching) {
      Vec2 pos_target = a.pos.copy() ;
      direction.set(target_direction(pos_target, pos)) ; 
    }
  }

  boolean picking() {
    if (watching) return false ; else return true ;
  }


   // info
  void info_visual_bacterium() {
    if(alive) {
      ellipse(pos.x, pos.y, radar*2, radar*2) ;
      ellipse(pos.x, pos.y, eat_zone *2, eat_zone *2) ;
    }
    ellipse(pos.x, pos.y, size *2, size *2) ;
  }
}