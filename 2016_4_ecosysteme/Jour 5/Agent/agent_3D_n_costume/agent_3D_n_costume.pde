/**
ECOSYSTEME release 0.0.1.2016_01 for l'École multimédia / Atelier du 4 février au 10 février
*/
/**
WORK with CLASS VEC 1.1.4 & Math 1.8.1
https://github.com/StanLepunK
*/
/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
*/
interface RULES {
  float CLOCK = 1.5 ;
  int TIME_TO_BE_CARRION = 10 ;
}





void setup() {
  fullScreen(P3D) ;
  // size(800,800, P3D) ;
  colorMode(HSB, 360,100,100,100) ;
  
  if (ENVIRONMENT == 3 ) {
    Vec3 pos_box = Vec3(width/2,height/2,0) ;
    int scale_box = 2 ;
    Vec3 size_box = Vec3(width *scale_box,height *scale_box,width *scale_box) ;
    build_environment(pos_box, size_box) ;
  } else {
    Vec2 pos_box = Vec2(width/2,height/2) ;
    Vec2 size_box = Vec2(width,height) ;
    build_environment(pos_box, size_box) ;
  }




  
  // QUANTITY
  int num_flora = 100 ;
  int num_herbivore = 100 ; 
  int num_carnivore = 13 ; 
  int num_bacterium = 13 ;

  // Colour
  Vec4 colour_flora = Vec4(100,100,80,100) ;
  Vec4 colour_herbivore = Vec4(50,100,100,100) ;
  Vec4 colour_carnivore = Vec4(0,100,100,100)  ; 
  Vec4 colour_bacterium = Vec4(30,0,30,100) ;

  // Size
  int size_herbivore = 35 ;
  int size_carnivore = 55 ;
  int size_bacterium = 10 ;

  // Life
  int life_herbivore = 30 ;
  int life_carnivore = 300 ;
  int life_bacterium = 600 ;

  // Velocity
  int velocity_herbivore = 5 ;
  int velocity_carnivore = 8 ;
  int velocity_bacterium = 2 ;

  //Radar
  float radar_herbivore = 3 ;
  float radar_carnivore = 12 ;
  float radar_bacterium = 400 ;
  if(ENVIRONMENT == 3) {
    // in 3D it's necessary to give very very bigger range for the radar.
    int ratio_range_radar = 5 ;
    radar_herbivore *= ratio_range_radar ;
    radar_carnivore *= ratio_range_radar ;
    radar_bacterium *= ratio_range_radar ;
  }


  // COSTUME
  flora_costume = 0 ;
  corpse_costume = 1 ;
  carnivore_costume = 5 ;
  herbivore_costume = 3 ;
  bacterium_costume = 4 ;



  // BUILD
  build_flora(num_flora, colour_flora) ;
  build_herbivore(size_herbivore, life_herbivore, velocity_herbivore, radar_herbivore, colour_herbivore, num_herbivore) ;
  build_carnivore(size_carnivore, life_carnivore, velocity_carnivore, radar_carnivore, colour_carnivore, num_carnivore) ;
  build_bacterium(size_bacterium, life_bacterium, velocity_bacterium, radar_bacterium, colour_bacterium, num_bacterium) ;
}



void draw() {
  background(biotope_colour()) ;
  
  flora(FLORA_LIST, DISPLAY_INFO) ;
  
  herbivore(HERBIVORE_LIST, FLORA_LIST, DISPLAY_INFO) ;
  carnivore(CARNIVORE_LIST, HERBIVORE_LIST, CORPSE_LIST, DISPLAY_INFO) ;
  bacterium(BACTERIUM_LIST, CORPSE_LIST, DISPLAY_INFO) ;
  corpse(CORPSE_LIST, DISPLAY_INFO) ;
  
  // print_info_environment() ;
  //print_list() ;
  // println("FrameRate", int(frameRate)) ;
  // print_info_carnivore(CARNIVORE_LIST) ;
  // print_info_herbivore(HERBIVORE_LIST) ;
  // print_info_bacterium(BACTERIUM_LIST) ;

}


void mousePressed() {
  Vec3 pos = Vec3(mouseX,mouseY, abs(sin(frameCount) *LIMIT.f));
  int size = int(random(10,100)) ;
  String name = "OGM" ;
  Vec4 colour = Vec4(100,100,80,100) ;
  add_flora(pos, size, name, colour) ;
}




void print_info_environment() {
  println("ENVIRONMENT") ;
  println("Humus", HUMUS) ;
}


void print_info_herbivore(ArrayList<Herbivore> list_h) {
  for(Herbivore h : list_h) {
        // h.info_print_agent_() ;
    // h.info_print_agent_motion() ;
    //h.info_print_agent_structure() ;
    h.info_print_agent_statement() ;
    h.info_print_herbivore() ;
  }
}

void print_info_bacterium(ArrayList<Bacterium> list_b) {
  for(Bacterium b : list_b) {
        // b.info_print_agent_() ;
    // b.info_print_agent_motion() ;
    b.info_print_agent_structure() ;
    b.info_print_agent_statement() ;
    b.info_print_bacterium() ;
  }
}

void print_info_carnivore(ArrayList<Carnivore> list_c) {
  for(Carnivore c : list_c) {
    // c.info_print_agent() ;
    // c.info_print_agent_motion() ;
    //c.info_print_agent_structure() ;
    c.info_print_agent_statement() ;
    c.info_print_carnivore() ;
  }
}


void print_list(){
  println("Flora", FLORA_LIST.size()) ;
  println("Bacterium",BACTERIUM_LIST.size()) ;
  println("Herbivore",HERBIVORE_LIST.size()) ;
  println("Carnivore",CARNIVORE_LIST.size()) ;
  println("Corpse",CORPSE_LIST.size()) ;
}