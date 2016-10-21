/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
http://natureofcode.com/book/chapter-2-forces/#chapter02_example6
*/
void setup() {
  size(400,400, P3D) ;
  build_agent() ;
}

void draw() {
  background(0) ;
  agent_2D(agent) ;
  agent_2D(predator) ;
}



Agent agent ;
Predator predator ;
void build_agent() {
  Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
  int size = 10 ;
  int velocity = 25 ;
  agent = new Agent(pos,size,velocity) ;
  
  Vec2 pos_p = Vec2("RANDOM ZERO",width, height) ;
  int size_p = 20 ;
  int velocity_p = 5 ;
  predator = new Predator(pos_p,size_p,velocity_p) ;
}


void agent_2D(Agent a) {
  a.rebound(0 +a.size, height -a.size, 0 +a.size, width -a.size) ;
  a.motion() ;
  
  a.set() ;
  a.aspect() ;
  a.costume() ;
}