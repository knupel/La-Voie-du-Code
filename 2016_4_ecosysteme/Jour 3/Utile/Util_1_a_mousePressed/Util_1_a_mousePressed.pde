void setup() {
  size(400,400) ;
}

int colour = 0 ;
boolean event ;
void draw() {
  background(colour) ;
  if(event) colour = 0 ; else colour = 255 ;
}

void mousePressed() {
  if(event) event = false ; else event = true ;
}