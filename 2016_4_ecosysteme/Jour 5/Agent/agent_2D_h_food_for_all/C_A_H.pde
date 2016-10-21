/**
SUB CLASS HERBIVORE 0.0.1
*/
class Herbivore extends Agent {
  boolean watching = true   ;
  boolean eating   ;
  int radar ;
  int eat_zone ;


  Herbivore(Vec2 pos_h, int size_h, int velocity_h, int life_h, String name_h, Vec4 color_h, int radar) {
    super(pos_h, size_h, velocity_h, life_h, name_h, color_h) ;
    this.radar = radar ;
    eat_zone = int(radius *2) + radius ;
  }



  void watch(Vec2 target) {
    if(dist(target,pos) < radar ) watching = false ; else watching = true ;
  }

   // Method
  void eat(Food f) {
    if(dist(f.pos,pos) < eat_zone ) {
      f.life -= 1 ;
      hunger += 1 ;
    }
  }

  void pick(Vec2 target) {
    if (!watching) direction.set(target_direction(target, pos)) ; 
  }

  boolean picking() {
    if (watching) return false ; else return true ;
  }


   // info
  void info_visual() {
    ellipse(pos.x, pos.y, radar*2, radar*2) ;
    ellipse(pos.x, pos.y, eat_zone *2, eat_zone *2) ;
    ellipse(pos.x, pos.y, radius *2, radius *2) ;
  }
}