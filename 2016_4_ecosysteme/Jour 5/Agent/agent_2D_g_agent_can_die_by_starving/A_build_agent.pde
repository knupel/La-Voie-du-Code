/**
BUILT AGENT 0.0.1
*/
// HERBIVORE
ArrayList<Herbivore> h_list = new ArrayList<Herbivore>() ;
void build_herbivore(int num) {
  Vec4 color_h = Vec4(100,100,100,100) ;
  int radius = 10 ;
  int velocity = 5 ;
  int life_h = 20 ;

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String name_h = "Gazelle " + i ;

    Herbivore h = new Herbivore(pos,radius, velocity, life_h, name_h, color_h) ;
    h_list.add(h) ;
  }
}




// CARNIVORE
ArrayList<Carnivore> c_list = new ArrayList<Carnivore>() ;
void build_carnivore(int num) {
  Vec2 pos_c = Vec2("RANDOM ZERO",width, height) ;
  Vec4 color_c = Vec4(0,100,100,100) ;
  int radius_c = 20 ;
  int velocity_c = 8 ;
  int radar = 200 ;
  int life_c = 100 ;

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String name_c = "LIONNE " + i ;

    Carnivore c = new Carnivore(pos_c, radius_c, velocity_c, life_c, name_c, color_c,radar) ;
    c_list.add(c) ;
  }
}