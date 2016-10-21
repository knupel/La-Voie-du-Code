/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
http://natureofcode.com/book/chapter-2-forces/#chapter02_example6
*/
void setup() {
  size(1000,1000, P3D) ;
  build_prey() ;
  build_predator() ;
}

void draw() {
  background(0) ;
  prey(prey_list) ;
  predator(predator, prey_list) ;
}


// build part
ArrayList<Prey> prey_list = new ArrayList<Prey>() ;
void build_prey() {
  int radius = 10 ;
  int velocity = 5 ;
  int num = 200 ;
  int life_prey = 20 ;

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String name_prey = "Human " + i ;

    Prey p = new Prey(pos,radius, velocity, life_prey, name_prey) ;
    prey_list.add(p) ;
  }
}

Predator predator ;
void build_predator() {
  Vec2 pos_p = Vec2("RANDOM ZERO",width, height) ;
  int radius_p = 20 ;
  int velocity_p = 8 ;
  int radar = 200 ;
  int life_p = 100 ;
  String name_p = "ALIEN" ;
  predator = new Predator(pos_p, radius_p, velocity_p, life_p, name_p, radar) ;
}



// display part
void prey(ArrayList<Prey> list_p) {
  // remove
  for(Prey p : list_p) {
    if(p.life < 0 ) {
      list_p.remove(p) ;
      break ;
    }
  }
  // move
  for(Prey p : list_p) {
    int radius = p.radius ;
    p.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
    p.motion() ;
    p.set() ;
    p.aspect(p.radius *2) ;
    p.costume() ;
  }
}

void predator(Predator predator, ArrayList<Prey> list_p) {
  
  predator.motion() ;
  int radius = predator.radius ;
  predator.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
  for(Prey prey : list_p) {
    predator.watch(prey.pos) ;
    predator.hunt(prey.pos) ;
    predator.kill(prey) ;
    /*
    Problem I cannot remove an element of the list when I loop in this one.
    Possible to mark to remove after to be exit of this loop.
    */
    if(predator.hunting()) break ;
  }
  
  predator.set() ;
  predator.aspect(1) ;
  predator.info() ;
  predator.aspect(predator.radius *2) ;
  predator.costume() ;
}