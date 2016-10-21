/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
http://natureofcode.com/book/chapter-2-forces/#chapter02_example6
*/
void setup() {
  size(1000,1000, P3D) ;
  colorMode(HSB, 360,100,100,100) ;
  build_herbivore() ;
  build_carnivore() ;

}

void draw() {
  background(0) ;
  herbivore(h_list) ;
  carnivore(c, h_list) ;
}


// build part
ArrayList<Herbivore> h_list = new ArrayList<Herbivore>() ;
void build_herbivore() {
  Vec4 color_h = Vec4(100,100,100,100) ;
  int radius = 10 ;
  int velocity = 5 ;
  int num = 30 ;
  int life_h = 20 ;

  for(int i = 0 ; i < num ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String name_h = "Gazelle " + i ;

    Herbivore h = new Herbivore(pos,radius, velocity, life_h, name_h, color_h) ;
    h_list.add(h) ;
  }
}

Carnivore c ;
void build_carnivore() {
  Vec2 pos_c = Vec2("RANDOM ZERO",width, height) ;
  Vec4 color_c = Vec4(0,100,100,100) ;
  int radius_c = 20 ;
  int velocity_c = 8 ;
  int radar = 200 ;
  int life_c = 100 ;
  String name_c = "LIONNE" ;
  c = new Carnivore(pos_c, radius_c, velocity_c, life_c, name_c, color_c,radar) ;
}



// display part
void herbivore(ArrayList<Herbivore> list_h) {
  // remove
  for(Herbivore h : list_h) {
    if(h.life < 0 ) {
      list_h.remove(h) ;
      break ;
    }
  }
  // move
  for(Herbivore h : list_h) {
    int radius = h.radius ;
    h.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
    h.motion() ;
    h.set() ;
    h.aspect(h.radius *2) ;
    h.costume() ;
  }
}

void carnivore(Carnivore c, ArrayList<Herbivore> list_h) {
  
  c.motion() ;
  int radius = c.radius ;
  c.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
  for(Herbivore h : list_h) {
    c.watch(h.pos) ;
    c.hunt(h.pos) ;
    c.kill(h) ;
    if(c.hunting()) break ;
  }
  
  c.set() ;
  Vec4 c_fill = Vec4(0) ;
  c.aspect(c_fill, c.colour, 1) ;
  c.info() ;
  c.aspect(c.colour, c.colour, 1) ;
  c.costume() ;
}