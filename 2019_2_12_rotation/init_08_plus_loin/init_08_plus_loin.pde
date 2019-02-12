/**
La Voie du Code : rotation
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/
int colonne = 9;
int ligne = 9;
Animator [] ani = new Animator[colonne *ligne];
void setup() {
  size(300,300);
  colorMode(HSB,360,100,100,100);
  for(int i = 0 ; i < ani.length ; i++) {
    ani[i] = new Animator();
    ani[i].set_vitesse(random(1)*.1);
    ani[i].set_radius(random(width/3),random(height/3));
  }
}

void draw() {
  mon_background(0,30); 
  int cell_x = width/colonne;
  int cell_y = height/ligne;
  int offset_x = cell_x/2;
  int offset_y = cell_y/2;
  int count = 0;
  push();
  translate(width,0);
  rotate(PI/2);
  for(int i = 0; i < colonne ; i++) {
    for(int j = 0 ; j < ligne ; j++) {  
      int x = i * cell_x +offset_x;
      int y = j * cell_y +offset_y;
      ani[count].update();
      ani[count].aspect(width/3);
      ani[count].show(x,y);
      count++;
    }
  }
  pop();
}

class Animator {
  float dir;
  float vit;
  float rx;
  float ry;

  Animator() {}

  void set_vitesse(float vit) {
    this.vit = vit;
  }

  void set_radius(float rx, float ry) {
    this.rx = rx;
    this.ry = ry;
  }

  void update() {
    dir += vit;
  }

  void aspect(int max_epaisseur) {
    float hue = (frameCount*vit)%g.colorModeX; // ici c'est égale à 360, définit avec colorMode dans le setup;
    float saturation = 100;
    float brightness = 100;
    int c = color(hue,saturation,brightness);

    float epaisseur = abs(sin(frameCount *vit) *max_epaisseur);
    stroke(c,70);
    strokeWeight(epaisseur);
  }

  void show(int x, int y) {
    float px = cos(dir);
    float py = sin(dir);
    PVector pos  = new PVector(px,py);
    pos.x *= rx;
    pos.y *= ry;
    push();
    translate(x,y);
    point(pos.x,pos.y);
    pop();
  }
}



void mon_background(int c, int alpha) {
  noStroke();
  fill(c,alpha);
  rect(0,0,width,height);
}

