/**
SUB CLASS HERBIVORE 0.0.1
*/
class Herbivore extends Agent {
  // boolean eating   ;
  Herbivore(Vec2 pos, int size, int life, int velocity, float radar, String name) {
    super(pos, size, life, velocity, name) ;
    this.radar = int(size *radar) ;
    eat_zone = int(size *1.2) ;
  }



  void watch(Flora f) {
    Vec2 pos_target = f.pos.copy() ;
    if(dist(pos_target,pos) < radar && threshold_quality_food(f, gourmet) ) watching = false ; else watching = true ;
  }

   // Method
  void eat(Flora f) {
    if(dist(f.pos,pos) < eat_zone && threshold_quality_food(f, gourmet) ) {
      f.life -= speed_eating ;
      f.size -= speed_eating ;
      hunger += (f.nutrient_quality *speed_eating) ;
    }
  }
  // local method
  boolean threshold_quality_food(Flora f, float step) {
    if(f.size > f.size_ref / step ) return true ; else return false ;
  }


  void pick(Flora f) {
    if (!watching) {
      Vec2 pos_target = f.pos.copy() ;
      direction.set(target_direction(pos_target, pos)) ; 
    }
  }

  boolean picking() {
    if (watching) return false ; else return true ;
  }


   // info
  void info_visual_herbivore() {
    if(alive) {
      ellipse(pos.x, pos.y, radar*2, radar*2) ;
      ellipse(pos.x, pos.y, eat_zone *2, eat_zone *2) ;
    }
    ellipse(pos.x, pos.y, size *2, size *2) ;
  }
}