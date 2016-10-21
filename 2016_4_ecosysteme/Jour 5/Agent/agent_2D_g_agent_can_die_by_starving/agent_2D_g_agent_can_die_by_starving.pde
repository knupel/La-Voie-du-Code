/**
Ref
http://www.uqac.ca/algvecto/AlgVectof4htch2.xml#AlgVectof4htse5.xml
http://natureofcode.com/book/chapter-1-vectors/
http://natureofcode.com/book/chapter-2-forces/#chapter02_example6
*/
void setup() {
  size(1000,1000, P3D) ;
  colorMode(HSB, 360,100,100,100) ;
  int num_herbivore = 30 ;
  int num_carnivore = 1 ;
  build_herbivore(num_herbivore) ;
  build_carnivore(num_carnivore) ;

}

void draw() {
  background(0) ;
  herbivore(h_list) ;
  carnivore(c_list, h_list) ;
}






