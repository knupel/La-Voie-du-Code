void setup(){
  size(300,300) ;
  background(0) ;
} 

void draw() {
  int r= frameCount;
  int g = frameCount ;
  int b  = frameCount ;
  background(r,g,b) ;
  println(r,g,b) ;
}