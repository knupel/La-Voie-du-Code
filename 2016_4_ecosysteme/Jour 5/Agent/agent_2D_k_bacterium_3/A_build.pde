/**
BUILT 0.0.2
*/
/**
LIST
*/
ArrayList<Food> f_list = new ArrayList<Food>() ;
ArrayList<Bacterium> b_list = new ArrayList<Bacterium>() ;
ArrayList<Herbivore> h_list = new ArrayList<Herbivore>() ;
ArrayList<Carnivore> c_list = new ArrayList<Carnivore>() ;
ArrayList<Agent> corpse_list = new ArrayList<Agent>() ;
/**
ENVIRONMENT
*/
Vec4 LIMIT_2D = Vec4(0,100,0,100) ;
boolean REBOUND ;
int SIZE_TEXT_INFO ;
void build_environment() {
  LIMIT_2D.set(0,width, 0,height) ;
  REBOUND = false ;
  SIZE_TEXT_INFO = 18 ;
}
/**
// FOOD
*/

void build_food(int num, Vec4 colour) {

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    int size = int(random(10,100)) ;
    String name = "Salad" ;
    add_food(pos, size, name, colour) ;
  }
}

void add_food(Vec2 pos, int radius, String name, Vec4 colour) {
   Food f = new Food(pos, radius, name) ;
   f_list.add(f) ;
   f.set_colour(colour) ;
}


/**
// AGENT
*/
/**
// BACTERIUM
*/
void build_bacterium(int size, int life, int velocity, float radar, Vec4 colour, int num) {
  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String name = "bacterium" ;
    add_bacterium(pos, size, life, velocity, radar, name, colour) ;
  }
}

void add_bacterium(Vec2 pos, int size, int life, int velocity, float radar, String name, Vec4 colour) {
   Bacterium b = new Bacterium(pos, size, life, velocity, radar, name) ;
   b_list.add(b) ;
   // b.set_meat_quality(1) ;
   b.set_colour(colour) ;
}




/**
// HERBIVORE
*/

void build_herbivore(int size, int life, int velocity, float radar, Vec4 colour, int num) {
  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String name = "human" ;
    add_herbivore(pos, size, life, velocity, radar, name, colour) ;
  }
}

void add_herbivore(Vec2 pos, int size, int life, int velocity, float radar, String name, Vec4 colour) {
   Herbivore h = new Herbivore(pos, size, life, velocity, radar, name) ;
   h_list.add(h) ;
   h.set_meat_quality(4) ;
   h.set_colour(colour) ;
   h.set_gourmet(3.5) ;
}



/**
// CARNIVORE
*/

void build_carnivore(int size, int life, int velocity, float radar, Vec4 colour, int num) {
  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String name = "ALIEN" ;
    add_carnivore(pos, size, life, velocity, radar, name, colour) ;
  }
}

void add_carnivore(Vec2 pos, int size, int life, int velocity, float radar, String name, Vec4 colour) {
   Carnivore c = new Carnivore(pos, size, life, velocity, radar, name) ;
   c_list.add(c) ;
   c.set_colour(colour) ;
   c.set_gourmet(2.5) ;
}