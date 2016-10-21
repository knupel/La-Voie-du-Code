/**
BUILT 0.0.2
*/
/**
LIST
*/
ArrayList<Flora> FLORA_LIST = new ArrayList<Flora>() ;
ArrayList<Bacterium> BACTERIUM_LIST = new ArrayList<Bacterium>() ;
ArrayList<Herbivore> HERBIVORE_LIST = new ArrayList<Herbivore>() ;
ArrayList<Carnivore> CARNIVORE_LIST = new ArrayList<Carnivore>() ;
ArrayList<Agent> CORPSE_LIST = new ArrayList<Agent>() ;


/**
ENVIRONMENT
*/
Vec3 BOX = Vec3(100,100,100) ;
Vec3 BOX_POS = Vec3() ;
Vec4 LIMIT_2D = Vec4(0,BOX.x,0,BOX.y) ;
boolean REBOUND ;
int SIZE_TEXT_INFO ;
float HUMUS, HUMUS_MAX ;

void build_environment() {
  BOX = Vec3(width,height,0) ;
  BOX_POS = Vec3(width/2, height/2,0) ;

  float left = BOX_POS.x - (BOX.x *.5) ;
  float right = BOX_POS.x + (BOX.x *.5) ;
  float top = BOX_POS.y - (BOX.y *.5) ;
  float bottom = BOX_POS.y + (BOX.y *.5) ;
  LIMIT_2D.set(left,right, top, bottom) ;

  REBOUND = false ;
  SIZE_TEXT_INFO = 18 ;
  HUMUS_MAX = HUMUS = BOX.x *BOX.y *.01 ;
}





/**
FLORA
*/

void build_flora(int num, Vec4 colour) {

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM RANGE",(int)LIMIT_2D.x, (int)LIMIT_2D.y, (int)LIMIT_2D.z, (int)LIMIT_2D.w) ;
    int size = int(random(10,100)) ;
    String name = "Coffea" ;
    add_flora(pos, size, name, colour) ;
  }
}

void add_flora(Vec2 pos, int size, String name, Vec4 colour) {
   Flora f = new Flora(pos, size, name) ;
   FLORA_LIST.add(f) ;
   f.set_colour(colour) ;
   f.set_growth(2) ;
   f.set_need(.5) ;
}


/**
// AGENT
*/
/**
// BACTERIUM
*/
void build_bacterium(int size, int life, int velocity, float radar, Vec4 colour, int num) {
  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM RANGE",(int)LIMIT_2D.x, (int)LIMIT_2D.y, (int)LIMIT_2D.z, (int)LIMIT_2D.w) ;
    String name = "bacterium" ;
    add_bacterium(pos, size, life, velocity, radar, name, colour) ;
  }
}

void add_bacterium(Vec2 pos, int size, int life, int velocity, float radar, String name, Vec4 colour) {
   Bacterium b = new Bacterium(pos, size, life, velocity, radar, name) ;
   BACTERIUM_LIST.add(b) ;
   b.set_colour(colour) ;
}




/**
// HERBIVORE
*/

void build_herbivore(int size, int life, int velocity, float radar, Vec4 colour, int num) {
  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM RANGE",(int)LIMIT_2D.x, (int)LIMIT_2D.y, (int)LIMIT_2D.z, (int)LIMIT_2D.w) ;
    String name = "human" ;
    add_herbivore(pos, size, life, velocity, radar, name, colour) ;
  }
}

void add_herbivore(Vec2 pos, int size, int life, int velocity, float radar, String name, Vec4 colour) {
   Herbivore h = new Herbivore(pos, size, life, velocity, radar, name) ;
   HERBIVORE_LIST.add(h) ;
   h.set_meat_quality(4) ;
   h.set_colour(colour) ;
   h.set_gourmet(3.5) ;
}



/**
// CARNIVORE
*/

void build_carnivore(int size, int life, int velocity, float radar, Vec4 colour, int num) {
  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM RANGE",(int)LIMIT_2D.x, (int)LIMIT_2D.y, (int)LIMIT_2D.z, (int)LIMIT_2D.w) ;
    String name = "ALIEN" ;
    add_carnivore(pos, size, life, velocity, radar, name, colour) ;
  }
}

void add_carnivore(Vec2 pos, int size, int life, int velocity, float radar, String name, Vec4 colour) {
   Carnivore c = new Carnivore(pos, size, life, velocity, radar, name) ;
   CARNIVORE_LIST.add(c) ;
   c.set_colour(colour) ;
   c.set_gourmet(2.5) ;
}