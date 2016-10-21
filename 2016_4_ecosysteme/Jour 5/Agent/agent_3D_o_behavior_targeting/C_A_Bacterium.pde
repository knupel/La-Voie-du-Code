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



  void watch(Agent a, boolean info) {
    // Vec3 pos_target = a.pos.copy() ;
    if(dist(a.pos,pos) < radar && !a.alive ) {
      if(info) line(a.pos, pos) ;
      watching = false ; 
    } else watching = true ;
  }

   // Method
  void eat(Agent a, boolean info) {
    if(dist(a.pos,pos) < eat_zone ) {
      if(info) line(a.pos, pos) ;
      float calories = speed_eating *humus_prod ;
      a.size -= speed_eating ;
      hunger += calories ;
      HUMUS += (calories *humus_prod) ;
      life += (calories *.75) ;
      eating = true ;
    } else eating = false ;
  }


  void pick(Agent a) {
    if (!watching) direction.set(target_direction(a.pos,pos)) ; 
  }

  boolean picking() {
    if (watching) return false ; else return true ;
  }

  // info
  void info(Vec4 colour, int size_text) {
    info_visual_bacterium(colour) ;
    info_text(colour, size_text) ;
  }

  void info_visual_bacterium(Vec4 colour) {
    aspect(Vec4(), colour, 1) ;
    Vec3 pos_temp = Vec3 (0) ;
    matrix_start() ;
    translate(pos) ;
    ellipse(pos_temp.x, pos_temp.y, radar*2, radar*2) ;
    ellipse(pos_temp.x, pos_temp.y, eat_zone *2, eat_zone *2) ;
    ellipse(pos_temp.x, pos_temp.y, size *2, size *2) ;
    matrix_end() ;
  }


  // print
  void info_print_bacterium() {
    println("INFO",this.name) ;
    println("No particular info for the moment") ;
  }
}