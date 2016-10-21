/**
SUB CLASS HERBIVORE 0.0.1
*/
class Herbivore extends Agent {
  boolean eating   ;
  int eat_zone ;


  Herbivore(Vec2 pos, int size, int velocity, int life, String name, Vec4 colour, int radar) {
    super(pos, size, velocity, life, name, colour) ;
    this.radar = radar ;
    eat_zone = int(size *2) + size ;
  }



  void watch(Food f) {
    Vec2 pos_target = f.pos.copy() ;
    if(dist(pos_target,pos) < radar ) watching = false ; else watching = true ;
  }

   // Method
  void eat(Food f) {
    if(dist(f.pos,pos) < eat_zone ) {
      f.life -= speed_eating ;
      hunger += (f.food_quality *speed_eating) ;
    }
  }


  void pick(Food f) {
    if (!watching) {
      Vec2 pos_target = f.pos.copy() ;
      direction.set(target_direction(pos_target, pos)) ; 
    }
  }

  boolean picking() {
    if (watching) return false ; else return true ;
  }


   // info
  void info_visual() {
    if(alive) {
      ellipse(pos.x, pos.y, radar*2, radar*2) ;
      ellipse(pos.x, pos.y, eat_zone *2, eat_zone *2) ;
    }
    ellipse(pos.x, pos.y, size *2, size *2) ;
  }

}