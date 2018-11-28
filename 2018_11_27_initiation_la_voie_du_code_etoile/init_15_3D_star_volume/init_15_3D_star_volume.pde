/**
La Voie du Code vers les Étoiles
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_11_27
*/

void setup() {
  size(600,400,P3D);
}

float rotate_x = 0;
float rotate_y = 0;
float rotate_z = 0;
void draw() {
  background(0,0,80);
  aspect();
  
  PVector offset = new PVector();
  offset.x = width/2;
  offset.y = height/2;
  pushMatrix();
  translate(offset.x,offset.y);
  rotateX(rotate_x += .01);
  rotateX(rotate_y += .02);
  rotateX(rotate_z += .001);
  few_points();
  popMatrix();
  
}




void aspect() {
  fill(255,255,0,150);
  stroke(255,0,0,150);
  strokeWeight(1);
}



int num = 10;
PVector [] pos = new PVector[num];
void few_points() {
  float angle = TAU / num;


  
 // setting
  float ratio = .38;
  float start_angle = map(mouseX,0,width,0,TAU);
  float diam = map(mouseY,0,height,20,200);
  
  // position
  for(int i = 0 ; i < num ; i++) {
    if(pos[i] == null) pos[i] = new PVector();
    float final_angle = (angle*i)+start_angle;
    float cos_x = cos(final_angle);
    float sin_y = sin(final_angle);

    float temp_diam = diam;
    if(i%2 == 0) temp_diam = diam *ratio;
    pos[i].x = (temp_diam * cos_x);
    pos[i].y = (temp_diam * sin_y);
  }
  
  PVector barycenter = new PVector();
  for(int i = 0 ; i < num ; i++) {
    barycenter.x = barycenter.x + pos[i].x;
    barycenter.y = barycenter.y + pos[i].y;
  }
  barycenter.div(num);
  
  // forme
  for(int i = 0 ; i < num ; i++) {
    int next = i+1;
    if(next == num) next = 0;
    // face up
    float up = diam/5;
    beginShape();
    vertex(pos[i].x,pos[i].y,0);
    vertex(barycenter.x,barycenter.y,up);
    vertex(pos[next].x,pos[next].y,0);
    endShape(CLOSE);
    // face down
    float down = -diam/5;
    beginShape();
    vertex(pos[i].x,pos[i].y,0);
    vertex(barycenter.x,barycenter.y,down);
    vertex(pos[next].x,pos[next].y,0);
    endShape(CLOSE);
  }
}
