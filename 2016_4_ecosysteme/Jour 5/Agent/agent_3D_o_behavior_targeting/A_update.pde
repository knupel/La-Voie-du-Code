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
End biotope
*/













/**
Flora
*/
void flora(ArrayList<Flora> list_f, boolean info) {

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

    // display
    f.aspect(f.colour, f.colour, 1) ;
    if(!info) f.costume(flora_costume) ; 
    else f.info_visual_text(f.colour, SIZE_TEXT_INFO) ; 
  }
}
/**
End flora
*/






















/**
// HERBIVORE
*/
void herbivore(ArrayList<Herbivore> list_h, ArrayList<Flora> list_f, boolean info) {
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

    // pick
    if(!h.calm) pick_static_agent(h, list_f, info) ;

    // time to eat
    eat_flora(h, list_f, info) ;

    // statement
    h.statement() ;
    h.hunger(speed_starving) ;

    // display
    h.aspect(h.colour, h.colour, 1) ;
    if(!info) h.costume(herbivore_costume) ; 
    else h.info(h.colour, SIZE_TEXT_INFO) ;
  }
}

// local method
void eat_flora(Herbivore h, ArrayList<Flora> list_flora_target, boolean info) {
  if(h.eating) {
    Flora target ;
    target = list_flora_target.get((int)h.ID_target.x) ;
    h.eat(target, info) ;
  } else {
    for(Flora target : list_flora_target) {
      h.eat(target, info) ;
      if(h.eating) {
        h.ID_target.set(list_flora_target.indexOf(target),target.ID) ;
        break ;
      }
    }
  }
}


void pick_static_agent(Herbivore h, ArrayList<Flora> list_flora_target, boolean info) {
  for(Flora target : list_flora_target) {
    h.watch(target, info) ;
    h.pick(target) ;
    if(h.picking()) break ;
  }
}
/**
End herbivore
*/



























/**
// CARNIVORE
*/
void carnivore(ArrayList<Carnivore> list_carnivore, ArrayList<Herbivore> list_herbivore, ArrayList<Agent> list_dead_body, boolean info) {
  // var
  int speed_starving = 15 ;
  /// remove and add in the corpse list of dead body
  for(Carnivore c : list_carnivore) {
    if(!c.alive) {
      CORPSE_LIST.add(c) ;
      list_carnivore.remove(c) ;
      break ;
    }
  }

  // life of the agent
  for(Carnivore c : list_carnivore) {
    // motion
    c.motion() ;
    int radius = c.size ;
    c.rebound(LIMIT, REBOUND) ;
    c.set_position() ;

    

    // hunt
    if(!c.calm) hunt_dynamic_agent(c, list_herbivore, info) ;    
    // eat after hunt, if this order is not respect the carnivore prefere hunt to eat and finish to die :)
    if(list_dead_body.size() >= 0 ) eat_meat(c, list_dead_body, info) ; else c.eating = false ;


    c.statement() ;
    c.hunger(speed_starving) ;


    // display
    c.aspect(c.colour, c.colour, 1) ;
    if(!info) c.costume(carnivore_costume) ; 
    else c.info(c.colour, SIZE_TEXT_INFO) ;
  }
}

/**
local method eat
*/
void eat_meat(Carnivore c, ArrayList<Agent> list_agent_target, boolean info) {
  // first eat the agent who eat just before without look in the list
  if(c.eating) {
    int pointer = (int)c.ID_target.x ;
    int ID_target = (int)c.ID_target.y ;
    /* here we point directly in a specific point of the list, 
    if the pointer is superior of the list, 
    because if it's inferior a corpse can be eat by an other Agent */
    if(pointer < list_agent_target.size() ) {
      Agent target = list_agent_target.get((int)c.ID_target.x) ;
      /* if the entry point of the list return an agent 
      with a same ID than a ID_target corpse eat just before, 
      the Carnivore can continue the lunch */
      if (target.ID == ID_target ) c.eat(target, info) ; 
      else {
        /* If the ID returned is different, a corpse was leave from the list, 
        and it's necessary to check in the full ist to find if any corpse have a seme ID */
        for(Agent target_in_list : list_agent_target) {
          if (target_in_list.ID == ID_target ) c.eat(target_in_list, info) ; else c.eating = false ;
        }
      }
    }
  /* If the last research don't find the corpse, may be this one is return to dust ! */
  } else {
    for(Agent target : list_agent_target) {
      c.eat(target, info) ;
      if(c.eating) {
        c.ID_target.set(list_agent_target.indexOf(target),target.ID) ;
        break ;
      }
    }
  }
}


/**
local method hunt
*/

void hunt_dynamic_agent(Carnivore c, ArrayList<Herbivore> list_herbivore_target, boolean info) {
  // first watch the agent who watch just before without look in the list
  if(c.watching) find_target(c, list_herbivore_target, info) ;
  if(c.tracking && c.max_time_track > c.time_track) focus_on_target(c, list_herbivore_target, info) ; else c.hunt_stop() ;
}



// Local method : The hunt is launching !
void focus_on_target(Carnivore c, ArrayList<Herbivore> list_herbivore_target, boolean info) {
  int pointer = (int)c.ID_target.x ;
  int ID_target = (int)c.ID_target.y ;
  /* here we point directly in a specific point of the list, 
  if the pointer is superior of the list, 
  because if it's inferior a corpse can be watch by an other Agent */
  if(pointer < list_herbivore_target.size() ) {
    Herbivore target = list_herbivore_target.get((int)c.ID_target.x) ;
    /* if the entry point of the list return an agent 
    with a same ID than a ID_target agent watch just before, 
    the Carnivore can continue the track */
    if (target.ID == ID_target ) {
      hunt_and_kill(c, target, info) ; 
    } else {
      /* If the ID returned is different, a target was leave from the list, 
      and it's necessary to check in the full ist to find if any agent have a same ID */
      for(Herbivore target_in_list : list_herbivore_target) {
        if (target_in_list.ID == ID_target ) {
          hunt_and_kill(c, target_in_list, info) ;
        } else {
          c.hunt_stop() ;
        } 
      }
    }
  } else c.hunt_stop() ;
}
// super local method
void hunt_and_kill(Carnivore c, Agent target, boolean info) {
  if(c.dist_to_target(target, info) < c.radar) {
    c.hunt(target, info) ; 
    c.kill(target, info) ;
  } else c.hunt_stop() ;
}




// Local method : Find target is the Big Carnivore Brother is watching you !
void find_target(Carnivore c, ArrayList<Herbivore> list_herbivore_target, boolean info) {
  // float [] dist_list = new float[0] ;
  ArrayList <Vec3> closest_target = new ArrayList<Vec3>() ;
  // find the closest target 
  for(Herbivore target : list_herbivore_target) {
    if(c.dist_to_target(target, info) < c.radar) {
      float dist = c.dist_to_target(target, info) ;
      /*catch distance to compare with the last one
      plus catch index in the list and the ID target
      and add in the nice target list
      */
      Vec3 new_target = Vec3(dist, list_herbivore_target.indexOf(target), target.ID) ;
      closest_target.add(new_target) ;
      // compare the target to see which one is the closest.
      if(closest_target.size() > 1) if (closest_target.get(1).x <= closest_target.get(0).x ) closest_target.remove(0) ; else closest_target.remove(1) ;
    } 
  }
  // Start the hunt party with the selected target
  if(closest_target.size() > 0 ) {
    Herbivore target = list_herbivore_target.get((int)closest_target.get(0).y) ;
    c.hunt(target, info) ;
    c.kill(target, info) ;
    if(c.tracking) c.ID_target.set(list_herbivore_target.indexOf(target),target.ID) ;
  }
}

/**
End carnivore
*/

























/**
Bacterium
*/
void bacterium(ArrayList<Bacterium> list_bacterium, ArrayList<Agent> list_dead_body, boolean info) {
  // var
  int speed_starving = 4 ;
  // remove bacterium
  for(Bacterium b : list_bacterium) {
    if(b.size < 0 ) {
      list_bacterium.remove(b) ;
      break ;
    }
  }


  // life of the agent
  for(Bacterium b : list_bacterium) {
    int radius = b.size ;
    // motion
    b.rebound(LIMIT, REBOUND) ;
    b.motion() ;
    b.set_position() ;

    // hunt
    if(!b.calm) hunt_static_agent(b, list_dead_body, info) ;
    // eat
    if(list_dead_body.size() >= 0 ) eat_corpse(b, list_dead_body, info) ; else b.eating = false ;
    
    // statement
    b.statement() ;
    b.hunger(speed_starving) ;

    // display
    b.aspect(b.colour, b.colour, 1) ;
    if(!info) b.costume(bacterium_costume) ; 
    else b.info(b.colour, SIZE_TEXT_INFO) ;
  }
}

// local method
void eat_corpse(Bacterium b, ArrayList<Agent> list_corpse_target, boolean info) {
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
      if (target.ID == ID_target ) b.eat(target, info) ; 
      else {
        /* If the ID returned is different, a corpse was leave from the list, 
        and it's necessary to check in the full ist to find if any corpse have a seme ID */
        for(Agent target_in_list : list_corpse_target) {
          if (target_in_list.ID == ID_target ) b.eat(target_in_list, info) ; else b.eating = false ;
        }
      }
    }
  /* If the last research don't find the corpse, may be this one is return to dust ! */
  } else {
    for(Agent target : list_corpse_target) {
      b.eat(target, info) ;
      if(b.eating) {
        b.ID_target.set(list_corpse_target.indexOf(target),target.ID) ;
        break ;
      }
    }
  }
}


void hunt_static_agent(Bacterium b, ArrayList<Agent> list_target, boolean info) {
  for(Agent target : list_target) {
    b.watch(target, info) ;
    b.pick(target) ;
    if(b.picking()) break ;
  }
}
/**
End bacterium
*/













/**
CORPSE || DEAD BODY
*/

void corpse(ArrayList<Agent> list_dead_body, boolean info) {
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

    corpse.set_colour(colour_of_death) ;
    corpse.carrion() ;

    // display
    corpse.aspect(corpse.colour, corpse.colour, 1) ;
    if(!info) corpse.costume(corpse_costume) ; 
    else {
      corpse.info_visual(corpse.colour) ;
      corpse.info_text(corpse.colour, SIZE_TEXT_INFO) ;
    }
  }
}
