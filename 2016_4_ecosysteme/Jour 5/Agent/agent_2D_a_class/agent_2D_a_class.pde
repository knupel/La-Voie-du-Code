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
  agent_2D() ;
}



Agent agent ;
void build_agent() {
  Vec2 pos = Vec2("RANDOM ZERO",width, height) ;
  int size = 10 ;
  int velocity = 20 ;
  agent = new Agent(pos,size,velocity) ;
}
void agent_2D() {
  agent.rebound(0 +agent.size, height -agent.size, 0 +agent.size, width -agent.size) ;
  agent.motion() ;
  
  agent.set() ;
  agent.aspect() ;
  agent.costume() ;
}