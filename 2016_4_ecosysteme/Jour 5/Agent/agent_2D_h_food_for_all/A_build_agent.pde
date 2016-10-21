/**
BUILT 0.0.2
*/
// FOOD
// HERBIVORE
ArrayList<Food> f_list = new ArrayList<Food>() ;
void build_food(int num) {
  Vec4 color_f = Vec4(100,100,100,100) ;
  for(int i = 0 ; i < num ; i++) {
    Vec2 pos_f = Vec2("RANDOM ZERO",width, height) ;
    int radius_f = int(random(10,100)) ;
    String name_f = "Herbe " + i ;
    add_food(pos_f, radius_f,name_f, color_f) ;
  }
}

void add_food(Vec2 pos, int radius, String name, Vec4 colour) {
   Food f = new Food(pos, radius, name, colour) ;
   f_list.add(f) ;
}



// AGENT
// HERBIVORE
ArrayList<Herbivore> h_list = new ArrayList<Herbivore>() ;
void build_herbivore(int num) {
  Vec4 color_h = Vec4(50,100,100,100) ;
  int radius_h = 10 ;
  int velocity_h = 5 ;
  int radar_h = 50 ;
  int life_h = 20 ;

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos_h = Vec2("RANDOM ZERO",width, height) ;
    String name_h = "Gazelle " + i ;

    Herbivore h = new Herbivore(pos_h,radius_h, velocity_h, life_h, name_h, color_h, radar_h) ;
    h_list.add(h) ;
  }
}




// CARNIVORE
ArrayList<Carnivore> c_list = new ArrayList<Carnivore>() ;
void build_carnivore(int num) {
  Vec4 color_c = Vec4(0,100,100,100) ;
  int radius_c = 20 ;
  int velocity_c = 8 ;
  int radar_c = 200 ;
  int life_c = 100 ;

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos_c = Vec2("RANDOM ZERO",width, height) ;
    String name_c = "LIONNE " + i ;

    Carnivore c = new Carnivore(pos_c, radius_c, velocity_c, life_c, name_c, color_c, radar_c) ;
    c_list.add(c) ;
  }
}