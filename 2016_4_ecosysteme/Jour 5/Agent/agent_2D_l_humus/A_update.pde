/**
UPDATE ECOSYSTEME 0.0.2
*/
/**
BIOTOPE
*/
Vec4 biotope_colour() {
  float normal_humus_level = 1 - HUMUS / HUMUS_MAX ;
  float var_colour_ground = 90 *normal_humus_level ;
  return Vec4(40,90, 5 +var_colour_ground,100) ;
}



/**
Flora
*/
void flora(ArrayList<Flora> list_f) {

  // remove
  for(Flora f : list_f) {
    if(f.life < 0 ) {
      list_f.remove(f) ;
      break ;
    }
  }

  // life of the agent
  for(Flora f : list_f) {
    // info
    float ratio = float(f.size) / float(f.size_ref) ;
    float alpha = g.colorModeA *ratio ;
    if(alpha <= 0) alpha = .001 ;
    f.colour.set(f.colour.r, f.colour.g, f.colour.b, alpha) ;
    // update
    f.growth() ;

    f.aspect(f.colour, f.colour, 1) ;

    f.info_visual_text(SIZE_TEXT_INFO) ;
  }
}






/**
// BACTERIUM
*/

// void bacterium(ArrayList<Bacterium> list_b, ArrayList<Herbivore> list_h, ArrayList<Carnivore> list_c) {
void bacterium(ArrayList<Bacterium> list_b, ArrayList<Agent> list_dead_body) {
  // var
  int speed_starving = 4 ;
  // remove bacterium
  for(Bacterium b : list_b) {
    if(b.size < 0 ) {
      list_b.remove(b) ;
      break ;
    }
  }


  // life of the agent
  for(Bacterium b : list_b) {
    int radius = b.size ;
    // motion
    b.rebound(LIMIT_2D, REBOUND) ;
    b.motion() ;
    b.set_position() ;

    // statement
    // search target
    search_corpse_target(b, list_dead_body) ;

    for(Agent target : list_dead_body) {
      b.eat(target) ;
    }

    b.statement() ;
    b.hunger(speed_starving) ;
    b.carrion() ;

    // info
    Vec4 b_fill = Vec4(0) ;
    b.aspect(b_fill, b.colour, 1) ;
    b.info_visual_bacterium() ;
    b.aspect(b.colour, b.colour, 1) ;
    b.info_visual_text(SIZE_TEXT_INFO) ;
  }
}

// local method
void search_corpse_target(Bacterium b, ArrayList<Agent> list_target) {
  if(!b.calm) {
    for(Agent target : list_target) {
      b.watch(target) ;
      b.pick(target) ;
      if(b.picking()) break ;
    }
  }
}














/**
CORPSE || DEAD BODY
*/

void corpse(ArrayList<Agent> list_dead_body) {
  // the dead body is burried !
  for(Agent corpse : list_dead_body) {
    if(corpse.size < 0) {
      list_dead_body.remove(corpse) ;
      break ;
    }
  }
  // Dead bobies is undead
  
  for(Agent corpse : list_dead_body) {
    Vec4 colour_of_death = Vec4(0,0,30,g.colorModeA); 
    Vec4 corpse_fill = Vec4(0) ;
    corpse.set_colour(colour_of_death) ;
    corpse.carrion() ;

    corpse.aspect(corpse_fill, corpse.colour, 1) ;
    corpse.info_visual() ;
    corpse.info_visual_text(SIZE_TEXT_INFO) ;
  }
}









/**
// HERBIVORE
*/
void herbivore(ArrayList<Herbivore> list_h, ArrayList<Flora> list_f) {
  // var
  int speed_starving = 4 ;
  // remove and add in the corpse list of dead body
  for(Herbivore h : list_h) {
    if(!h.alive) {
      CORPSE_LIST.add(h) ;
      list_h.remove(h) ;
      break ;
    }
  }

  // life of the agent
  for(Herbivore h : list_h) {
    int radius = h.size ;
    // motion
    h.rebound(LIMIT_2D, REBOUND) ;
    h.motion() ;
    h.set_position() ;


    // statement
    // hunt or pick time
    search_Flora_target(h, list_f) ;
    // eat time
    for(Flora f : list_f) {
      h.eat(f) ;
    }
    
    h.statement() ;
    h.hunger(speed_starving) ;
    // h.carrion() ;

    // info
    Vec4 h_fill = Vec4(0) ;
    h.aspect(h_fill, h.colour, 1) ;
    h.info_visual_herbivore() ;
    h.aspect(h.colour, h.colour, 1) ;
    h.info_visual_text(SIZE_TEXT_INFO) ;
  }
}

// local method
void search_Flora_target(Herbivore h, ArrayList<Flora> list_Flora_target) {
  if(!h.calm) {
    for(Flora target : list_Flora_target) {
      h.watch(target) ;
      h.pick(target) ;
      if(h.picking()) break ;
    }
  }
}






/**
// CARNIVORE
*/
void carnivore(ArrayList<Carnivore> list_c, ArrayList<Herbivore> list_h, ArrayList<Agent> list_dead_body) {
  // var
  int speed_starving = 15 ;
  /// remove and add in the corpse list of dead body
  for(Carnivore c : list_c) {
    if(!c.alive) {
      CORPSE_LIST.add(c) ;
      list_c.remove(c) ;
      break ;
    }
  }

  // life of the agent
  for(Carnivore c : list_c) {
    // motion
    c.motion() ;
    int radius = c.size ;
    c.rebound(LIMIT_2D, REBOUND) ;
    c.set_position() ;


    // statement
    search_agent_target(c, list_h) ;
    // eat
    for(Agent a : list_dead_body) {
      c.eat(a) ;
    }

    c.statement() ;
    c.hunger(speed_starving) ;


    // info
    Vec4 c_fill = Vec4(0) ;
    c.aspect(c_fill, c.colour, 1) ;
    c.info_visual_carnivore() ;
    c.aspect(c.colour, c.colour, 1) ;
    c.info_visual_text(SIZE_TEXT_INFO) ;
  }
}


// local method
void search_agent_target(Carnivore c, ArrayList<Herbivore> list_herbivore_target) {
  if(!c.calm) {
    for(Herbivore target : list_herbivore_target) {
      c.watch(target) ;
      c.hunt(target) ;
      c.kill(target) ;
      if(c.hunting()) break ;
    }
  }
}