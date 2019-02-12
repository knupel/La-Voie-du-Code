/**
La Voie du Code : rotation
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/
float vitesse = 0.1;
float direction = 0;
float radius = 30;
void setup() {
  size(300,300);
}

void draw() {
  background(0); 
  direction += vitesse;
  stroke(255);
  strokeWeight(10);

  int colonne = 3;
  int ligne = 3;
  int cell_x = width/colonne;
  int cell_y = height/ligne;
  int offset_x = cell_x /2;
  int offset_y = cell_y /2;
  for(int i = 0; i < colonne ; i++) {
    for(int j = 0 ; j < ligne ; j++) {
      int x = i * cell_x +offset_x;
      int y = j * cell_y +offset_y;
      animation(x,y,direction,radius);
    }
  }
}

void animation(int x, int y, float dir, float rad) {
  float px = cos(dir);
  float py = sin(dir);
  PVector pos  = new PVector(px,py);
  pos.mult(rad);
  push();
  translate(x,y);
  point(pos.x,pos.y);
  pop();
}