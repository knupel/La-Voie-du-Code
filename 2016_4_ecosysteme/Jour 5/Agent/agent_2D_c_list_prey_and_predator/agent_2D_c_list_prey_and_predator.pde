/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
http://natureofcode.com/book/chapter-2-forces/#chapter02_example6
*/
void setup() {
  size(400,400, P3D) ;
  build_prey() ;
  build_predator() ;
}

void draw() {
  background(0) ;
  prey(prey) ;
  predator(predator) ;
}


// build part
Prey [] prey ;
void build_prey() {
  int size = 10 ;
  int velocity = 15 ;
  int num = 5 ;
  prey = new Prey[num] ;
  for(int i = 0 ; i < prey.length ; i++) {
    Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
    prey[i] = new Prey(pos,size,velocity) ;
  }
}

Predator predator ;
void build_predator() {
  Vec2 pos_p = Vec2("RANDOM ZERO",width, height) ;
  int size_p = 20 ;
  int velocity_p = 5 ;
  predator = new Predator(pos_p,size_p,velocity_p) ;
}



// display part
void prey(Agent [] a) {
  for( int i = 0 ; i < a.length ; i++) {
    a[i].rebound(0 +a[i].size, height -a[i].size, 0 +a[i].size, width -a[i].size) ;
    a[i].motion() ;
    
    a[i].set() ;
    a[i].aspect() ;
    a[i].costume() ;
  }
}

void predator(Agent a) {
  a.rebound(0 +a.size, height -a.size, 0 +a.size, width -a.size) ;
  a.motion() ;
  
  a.set() ;
  a.aspect() ;
  a.costume() ;
}