/**
UPDATE ECOSYSTEME 0.0.2
*/
// food
void food(ArrayList<Food> list_f) {

  // remove
  for(Food f : list_f) {
    if(f.life < 0 ) {
      list_f.remove(f) ;
      break ;
    }
  }

  // life of the agent
  for(Food f : list_f) {
    // info
    f.aspect(f.colour, f.colour, 1) ;
    f.info_text(12) ;
  }
}








// HERBIVORE
void herbivore(ArrayList<Herbivore> list_h, ArrayList<Food> list_f) {
  // var
  int speed_starving = 4 ;
  // remove
  for(Herbivore h : list_h) {
    if(h.size < 0 ) {
      list_h.remove(h) ;
      break ;
    }
  }
  // life of the agent
  for(Herbivore h : list_h) {
    int radius = h.size ;
    // motion
    h.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
    h.motion() ;
    h.set_position() ;
    // statement
   
    if(!h.calm) {
      for(Food f : list_f) {
        h.watch(f) ;
        h.pick(f) ;
        h.eat(f) ;
        if(h.picking()) break ;
      }
    } 
    
    h.statement() ;
    h.hunger(speed_starving) ;

    // info
    Vec4 h_fill = Vec4(0) ;
    h.aspect(h_fill, h.colour, 1) ;
    h.info_visual() ;
    h.aspect(h.colour, h.colour, 1) ;
   // h.info_text(20) ;
  }
}







// CARNIVORE
void carnivore(ArrayList<Carnivore> list_c, ArrayList<Herbivore> list_h) {
  // var
  int speed_starving = 15 ;
  // remove
  for(Carnivore c : list_c) {
    if(c.life < 0 ) {
      list_c.remove(c) ;
      break ;
    }
  }
  // life of the agent
  for(Carnivore c : list_c) {
    // motion
    c.motion() ;
    int radius = c.size ;
    c.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
    c.set_position() ;

    // statement
    if(!c.calm) {
      for(Herbivore h : list_h) {
        c.watch(h) ;
        c.hunt(h) ;
        c.kill(h) ;
        c.eat(h) ;
        if(c.hunting()) break ;
      }
    } 
    c.statement() ;
    c.hunger(speed_starving) ;

    // info
    Vec4 c_fill = Vec4(0) ;
    c.aspect(c_fill, c.colour, 1) ;
    c.info_visual() ;
    c.aspect(c.colour, c.colour, 1) ;
    c.info_text(20) ;
    c.info_agent_print() ;
  }
}