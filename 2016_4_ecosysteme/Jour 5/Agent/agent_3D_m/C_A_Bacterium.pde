/**
SUB CLASS HERBIVORE 0.0.1
*/
class Bacterium extends Agent {
  float humus_prod = .25 ;
  // boolean eating   ;
  Bacterium(Vec3 pos, int size, int life, int velocity, float radar, String name) {
    super(pos, size, life, velocity, name) ;
    this.radar = int(size *radar) ;
    eat_zone = int(size *2) + size ;
  }

  void set_humus_prod(float prod) {
    this.humus_prod = prod ;
  }



  void watch(Agent a) {
    Vec3 pos_target = a.pos.copy() ;
    if(dist(pos_target,pos) < radar && !a.alive ) watching = false ; else watching = true ;
  }

   // Method
  void eat(Agent a) {
    if(dist(a.pos,pos) < eat_zone ) {
      float calories = speed_eating *humus_prod ;
      a.size -= speed_eating ;
      hunger += calories ;
      HUMUS += (calories *humus_prod) ;
      life += (calories *.75) ;
      eating = true ;
    } else eating = false ;
  }


  void pick(Agent a) {
    if (!watching) {
      Vec3 pos_target = a.pos.copy() ;
      direction.set(target_direction(pos_target, pos)) ; 
    }
  }

  boolean picking() {
    if (watching) return false ; else return true ;
  }


   // info
  void info_visual_bacterium() {
    Vec3 pos_temp = Vec3 (0) ;
    // Vec3 pos_temp = Vec3 (pos) ;
    matrix_start() ;
    translate(pos) ;
    ellipse(pos_temp.x, pos_temp.y, radar*2, radar*2) ;
    ellipse(pos_temp.x, pos_temp.y, eat_zone *2, eat_zone *2) ;
    ellipse(pos_temp.x, pos_temp.y, size *2, size *2) ;
    matrix_end() ;

    /*
        ellipse(pos.x, pos.y, radar*2, radar*2) ;
    ellipse(pos.x, pos.y, eat_zone *2, eat_zone *2) ;
    ellipse(pos.x, pos.y, size *2, size *2) ;
    */
  }
}