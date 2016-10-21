/**
PREDATOR
*/
class Carnivore extends Agent {
  boolean watching = true   ;
  boolean killing   ;
  int radar ;
  int kill_zone ;
  Carnivore(Vec2 pos_c, int radius_c, int velocity_c, int life_c, String name_c, Vec4 color_c, int radar) {
    super(pos_c, radius_c, velocity_c, life_c, name_c, color_c) ;
    this.radar = radar ;
    kill_zone = int(radius *2) + radius ;
  }
  
  void watch(Vec2 target) {
    if(dist(target,pos) < radar ) watching = false ; else watching = true ;
  }
  
  void kill(Herbivore h) {
    if(dist(h.pos,pos) < kill_zone ) h.life -= 1 ;
  }
  void kill(Carnivore c) {
    if(dist(c.pos,pos) < kill_zone ) c.life -= 1 ;
  }
  
  void hunt(Vec2 target) {
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