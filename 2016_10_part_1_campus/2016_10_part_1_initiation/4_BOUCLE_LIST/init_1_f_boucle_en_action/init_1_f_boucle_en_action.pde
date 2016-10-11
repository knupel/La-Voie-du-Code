void setup() {
  size(300,300) ;
}

int tempo ;
int div = 4 ;
void draw() {
  background(125) ;
  strokeWeight(div/2) ;
  tempo++ ;
  if(tempo > width /div ) tempo = 1 ;
  println(frameRate, tempo) ;
  for(int i = 0 ; i < width /div ; i++) {
    stroke(0) ;
    for(int j = 0 ; j < height /div ; j++) {
      if(i%tempo == 0) stroke(255) ;
      point(i *div,j *div) ;
    }
  }
}