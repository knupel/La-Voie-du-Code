void setup() {
  size(400,400) ;
}

int colour = 0 ;
boolean event ;
void draw() {
  background(colour) ;
  if(event == true) colour = #006699 ; else colour = #000999 ;
}

void mousePressed() {
  if(event) event = false ; else event = true ;
  //if(!event) event = false ; else event = true ;
}