Vec3 pos = Vec3() ;

void setup() {
  size(400,400,P3D) ;
  //colorMode(HSB, 360,100,100,100) ; 
}

void draw() {
  background_3D(#a1ca14, 30) ;
  fill(255) ;
  stroke(255) ;
  strokeWeight(1) ;
  pos = Vec3(mouseX, mouseY,0) ;
  int size = 200 ;
  Vec3 dir = new Vec3("RANDOM",1) ;

  costume(pos, size, dir, which_costume) ;
}




int which_costume = 4 ;
void keyPressed() {
	if(key == '0') which_costume = 0 ;
	else if(key == '1') which_costume = 1 ;
	else if(key == '2') which_costume = 2 ;
	else if(key == '3') which_costume = 3 ;
	else if(key == '4') which_costume = 4 ;
	else if(key == '5') which_costume = 5 ;
	else if(key == '6') which_costume = 6 ;
	else if(key == '7') which_costume = 7 ;
	else if(key == '8') which_costume = 8 ;
	else if(key == '9') which_costume = 9 ;


	// reset
	else if(key == 'r') reset_chaos() ;
}