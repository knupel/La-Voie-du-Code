/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
http://natureofcode.com/book/chapter-2-forces/#chapter02_example6
*/
void setup() {
  size(800,800, P3D) ;
  colorMode(HSB, 360,100,100,100) ;
  int num_food = 50 ;
  int num_herbivore = 50 ;
  int num_carnivore = 1 ;
 build_food(num_food) ;
  build_herbivore(num_herbivore) ;
 build_carnivore(num_carnivore) ;

}

void draw() {
  background(0) ;
 food(f_list) ;
  herbivore(h_list, f_list) ;
  carnivore(c_list, h_list) ;
}


void mousePressed() {
  Vec2 pos = Vec2(mouseX,mouseY) ;
  int size = int(random(10,100)) ;
  String name = "" + frameCount/10 ;
   Vec4 color_f = Vec4(100,100,100,100) ;
  add_food(pos, size, name,  color_f) ;
}