PVector [] juju;
void setup() {
  size(300,300);
}

float angle;
void draw() {
  arriere_plan(255,0,0,2);
  float taille = cos(frameCount *.01) *200;
  //float taille = 100;
  angle +=.02;
  fill(255,20);
  stroke(0);
  strokeWeight(1); /// adelbenahmed00@gmail.com
  motif(mouseX,mouseY,taille,angle);
  
}
