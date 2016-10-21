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
Prey [] prey_list ;
void build_prey() {
  int radius = 10 ;
  int velocity = 15 ;
  int num = 5 ;
  prey_list = new Prey[num] ;
  for(int i = 0 ; i < prey_list.length ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    String prey_name = "Human " + i ;
    prey_list[i] = new Prey(pos,radius, velocity, prey_name) ;
  }
}

Predator predator ;
void build_predator() {
  Vec2 pos_p = Vec2("RANDOM ZERO",width, height) ;
  int radius_p = 20 ;
  int velocity_p = 5 ;
  int radar = 200 ;
  String predator_name = "ALIEN" ;
  predator = new Predator(pos_p, radius_p, velocity_p, predator_name, radar) ;
}



// display part
void prey(Agent [] a) {
  for( int i = 0 ; i < a.length ; i++) {
    a[i].rebound(0 +a[i].size, height -a[i].size, 0 +a[i].size, width -a[i].size) ;
    a[i].motion() ;
    
    a[i].set() ;
    a[i].aspect(a[i].size *2) ;
    a[i].costume(i) ;
  }
}

void predator(Predator p, Prey [] list) {
  
  p.motion() ;
  p.rebound(0 +p.size, height -p.size, 0 +p.size, width -p.size) ;
  for(int i = 0 ; i < list.length ; i++) {
    p.watch(list[i].pos) ;
    p.hunt(list[i].pos) ;
    if(p.hunting()) break ;
  }
  
  p.set() ;
  
  p.aspect(1) ;
  p.info() ;
  p.aspect(p.size *2) ;
  p.costume(100) ;
}