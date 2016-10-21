/**
ECOSYSTEME release 0.0.1.2016_01 for l'École multimédia / Atelier d'une semaine

Stan le Punk on Github
https://github.com/StanLepunK
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
*/
interface RULES {
  float CLOCK = 1.5 ;
}




void setup() {
  fullScreen(P3D) ;
  // size(800,800, P3D) ;
  colorMode(HSB, 360,100,100,100) ;
  build_environment() ;
  
  // QUANTITY
  int num_food = 200;
  int num_herbivore = 150 ; 
  int num_carnivore = 1 ; 
  int num_bacterium = 3 ;

  // FOOD
  Vec4 colour_food = Vec4(100,100,80,100) ;
  build_food(num_food, colour_food) ;

  // HERBIVORE
  int size_herbivore = 40 ;
  int life_herbivore = 50 ;
  int velocity_herbivore = 5 ;
  float radar_herbivore = 3 ;
  Vec4 colour_herbivore = Vec4(50,100,100,100) ;
  build_herbivore(size_herbivore, life_herbivore, velocity_herbivore, radar_herbivore, colour_herbivore, num_herbivore) ;

  // CARNIVORE
  int size_carnivore = 30 ;
  int life_carnivore = 800 ;
  int velocity_carnivore = 8 ;
  float radar_carnivore = 12 ;
  Vec4 colour_carnivore = Vec4(0,100,100,100) ;
  build_carnivore(size_carnivore, life_carnivore, velocity_carnivore, radar_carnivore, colour_carnivore, num_carnivore) ;

  // BACTERIUM
  int size_bacterium = 1 ;
  int life_bacterium = 400 ;
  int velocity_bacterium = 2 ;
  float radar_bacterium = 400 ;
  Vec4 colour_bacterium = Vec4(30,0,30,100) ;
  build_bacterium(size_bacterium, life_bacterium, velocity_bacterium, radar_bacterium, colour_bacterium, num_bacterium) ;
}



void draw() {
  background(0) ;
  
  food(f_list) ;
  herbivore(h_list, f_list) ;
  carnivore(c_list, h_list, corpse_list) ;
  bacterium(b_list, corpse_list) ;
  corpse(corpse_list) ;

  // print_list() ;
  // println("FrameRate", int(frameRate)) ;
  // print_info_carnivore(c_list) ;
  // print_info_herbivore(h_list) ;

}


void mousePressed() {
  Vec2 pos = Vec2(mouseX,mouseY) ;
  int size = int(random(10,100)) ;
  String name = "New salad" ;
  Vec4 colour_food = Vec4(100,100,80,100) ;
  add_food(pos, size, name, colour_food) ;
}







void print_info_herbivore(ArrayList<Herbivore> list_h) {
  for(Herbivore h : list_h) {
        // h.info_print_agent_() ;
    h.info_print_agent_motion() ;
    //h.info_print_agent_structure() ;
    // h.info_print_agent_statement() ;
  }
}

void print_info_carnivore(ArrayList<Carnivore> list_c) {
  for(Carnivore c : list_c) {
    // c.info_print_agent() ;
    c.info_print_agent_motion() ;
    //c.info_print_agent_structure() ;
    // c.info_print_agent_statement() ;
  }
}


void print_list(){
  println("Food", f_list.size()) ;
  println("Bacterium",b_list.size()) ;
  println("Herbivore",h_list.size()) ;
  println("Carnivore",c_list.size()) ;
  println("Corpse",corpse_list.size()) ;
}


