/**
La Voie du Code : rotation
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/
int colonne = 12;
int ligne = 12;
Animator [] ani = new Animator[colonne *ligne];
void setup() {
  size(900,900);
  colorMode(HSB,360,100,100);
  for(int i = 0 ; i < ani.length ; i++) {
    ani[i] = new Animator();
    ani[i].set_vitesse(random(1)*.1);
    ani[i].set_radius(30);
  }
}

void draw() {
  mon_background(0,5); 
  
  int cell_x = width/colonne;
  int cell_y = height/ligne;
  int offset_x = cell_x /2;
  int offset_y = cell_y /2;
  int count = 0;
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
}

class Animator {
  float dir;
  float vit;
  float rad;

  Animator() {}

  void set_vitesse(float vit) {
    this.vit = vit;
  }

  void set_radius(float rad) {
    this.rad = rad;
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
    stroke(c);
    strokeWeight(epaisseur);
  }

  void show(int x, int y) {
    float px = cos(dir);
    float py = sin(dir);
    PVector pos  = new PVector(px,py);
    pos.mult(rad);
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

