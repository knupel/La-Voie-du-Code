/**
La Voie du Code : rotation
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/
void setup() {
  size(300,300);
  background(255,0,0);
}


float direction;
void draw() {
  background(#FD3F93);
  direction = direction + 0.1;
  int max = 12;
  int offset_x = width/max /2;
  for(int x = 0 ; x  < max ; x++) {
    int px = x * width/max +offset_x;
    int py = height/2 ;
    if(mousePressed) {
      int c = color(random(255),random(255),random(255));
      animation(px,py,-direction,30,c);
    } else {
      animation(px,py,direction,30,255);
    }
  }
   // animation(mouseX,height/2,direction/2,30);
}
