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
    h.rebound(LIMIT, REBOUND) ;
    h.motion() ;
    h.set_position() ;

    // hunt or pick time
    search_flora_target(h, list_f) ;

    // time to eat
    eat_flora(h, list_f) ;

    // statement
    h.statement() ;
    h.hunger(speed_starving) ;

    // info
    Vec4 h_fill = Vec4(0) ;
    h.aspect(h_fill, h.colour, 1) ;
    h.info_visual_herbivore() ;
    h.aspect(h.colour, h.colour, 1) ;
    h.info_visual_text(SIZE_TEXT_INFO) ;
  }
}

// local method
void eat_flora(Herbivore h, ArrayList<Flora> list_flora_target) {
  if(h.eating) {
    Flora target ;
    target = list_flora_target.get((int)h.ID_target.x) ;
    h.eat(target) ;
  } else {
    for(Flora target : list_flora_target) {
      h.eat(target) ;
      if(h.eating) {
        h.ID_target.set(list_flora_target.indexOf(target),target.ID) ;
        break ;
      }
    }
  }
}


void search_flora_target(Herbivore h, ArrayList<Flora> list_flora_target) {
  if(!h.calm) {
    for(Flora target : list_flora_target) {
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
    c.rebound(LIMIT, REBOUND) ;
    c.set_position() ;


    // statement
    search_agent_target(c, list_h) ;
    // eat
    eat_meat(c, list_dead_body) ;
    /*
    for(Agent a : list_dead_body) {
      c.eat(a) ;
    }
    */

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

void eat_meat(Carnivore c, ArrayList<Agent> list_corpse_target) {
  if(c.eating && list_corpse_target.size() <= 0 ) c.eating = false ;
  // first eat the agent who eat just before without look in the list
  if(c.eating) {
    int pointer = (int)c.ID_target.x ;
    int ID_target = (int)c.ID_target.y ;
    /* here we point directly in a specific point of the list, 
    if the pointer is superior of the list, 
    because if it's inferior a corpse can be eat by an other Agent */
    if(pointer < list_corpse_target.size() ) {
      Agent target = list_corpse_target.get((int)c.ID_target.x) ;
      /* if the entry point of the list return an agent 
      with a same ID than a ID_target corpse eat just before, 
      the Carnivore can continue the lunch */
      if (target.ID == ID_target ) c.eat(target) ; 
      else {
        /* If the ID returned is different, a corpse was leave from the list, 
        and it's necessary to check in the full ist to find if any corpse have a seme ID */
        for(Agent target_in_list : list_corpse_target) {
          if (target_in_list.ID == ID_target ) c.eat(target_in_list) ; else c.eating = false ;
        }
      }
    }
  /* If the last research don't find the corpse, may be this one is return to dust ! */
  } else {
    for(Agent target : list_corpse_target) {
      c.eat(target) ;
      if(c.eating) {
        c.ID_target.set(list_corpse_target.indexOf(target),target.ID) ;
        break ;
      }
    }
  }
}



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
// BACTERIUM
*/
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
    b.rebound(LIMIT, REBOUND) ;
    b.motion() ;
    b.set_position() ;

    // hunt
    search_corpse_target(b, list_dead_body) ;
    // eat
    eat_corpse(b, list_dead_body) ;
    // statement
    b.statement() ;
    b.hunger(speed_starving) ;

    // info
    Vec4 b_fill = Vec4(0) ;
    b.aspect(b_fill, b.colour, 1) ;
    b.info_visual_bacterium() ;
    b.aspect(b.colour, b.colour, 1) ;
    b.info_visual_text(SIZE_TEXT_INFO) ;
  }
}

// local method
void eat_corpse(Bacterium b, ArrayList<Agent> list_corpse_target) {
  if(b.eating && list_corpse_target.size() <= 0 ) b.eating = false ;
// first eat the agent who eat just before without look in the list
  if(b.eating) {
    int pointer = (int)b.ID_target.x ;
    int ID_target = (int)b.ID_target.y ;
    /* here we point directly in a specific point of the list, 
    if the pointer is superior of the list, 
    because if it's inferior a corpse can be eat by an other Agent */
    if(pointer < list_corpse_target.size() ) {
      Agent target = list_corpse_target.get((int)b.ID_target.x) ;
      /* if the entry point of the list return an agent 
      with a same ID than a ID_target corpse eat just before, 
      the Carnivore can continue the lunch */
      if (target.ID == ID_target ) b.eat(target) ; 
      else {
        /* If the ID returned is different, a corpse was leave from the list, 
        and it's necessary to check in the full ist to find if any corpse have a seme ID */
        for(Agent target_in_list : list_corpse_target) {
          if (target_in_list.ID == ID_target ) b.eat(target_in_list) ; else b.eating = false ;
        }
      }
    }
  /* If the last research don't find the corpse, may be this one is return to dust ! */
  } else {
    for(Agent target : list_corpse_target) {
      b.eat(target) ;
      if(b.eating) {
        b.ID_target.set(list_corpse_target.indexOf(target),target.ID) ;
        break ;
      }
    }
  }
}


void search_corpse_target(Bacterium b, ArrayList<Agent> list_target) {
  if(!b.calm) {
    for(Agent target : list_target) {
      b.watch(target) ;
      b.pick(target) ;
      if(b.picking()) break ;
    }
  }
}
