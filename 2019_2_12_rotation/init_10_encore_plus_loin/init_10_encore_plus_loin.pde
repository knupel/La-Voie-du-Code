/**
La Voie du Code : rotation
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/
int colonne = 18;
int ligne = 18;
Animator [] ani = new Animator[colonne *ligne];
void setup() {
  size(300,300);
  colorMode(HSB,360,100,100,100);
  float min = 10;
  float radius_x = width/3;
  float radius_y = width/3;
  float h = 0;
  float a = 100;
  construction(min,radius_x,radius_y,h,a);
}



void draw() {
  if(mousePressed) mon_background(0,30); 
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

void keyPressed() {
  if(key == 'n') {
    float min = 10;
    float radius_x = random(10,width/3);
    float radius_y = random(10,width/3);
    float h = random(360);
    float a = random(20,100);
    // float h = random(g.colorModeX);
    // float a = random(20,g.colorModeA);
    construction(min,radius_x,radius_y,h,a);
  }
}



class Animator {
  float dir;
  float vit;
  float rx;
  float ry;
  int cycle = 0;
  float start_hue =0;
  float alpha = g.colorModeA;

  Animator() {}

  void set_vitesse(float vit) {
    this.vit = vit;
    cycle = 0;
  }

  void set_start_hue(float start_hue) {
    this.start_hue = start_hue;
  }

  void set_alpha(float alpha) {
    this.alpha = alpha;
  }

  void set_radius(float rx, float ry) {
    this.rx = rx;
    this.ry = ry;
  }

  void update() {
    dir += vit;
    cycle++;

  }

  void aspect(int max_epaisseur) {
    float hue = (cycle*vit+start_hue)%g.colorModeX; // ici c'est égale à 360, définit avec colorMode dans le setup;
    float saturation = 100;
    float brightness = 100;
    int c = color(hue,saturation,brightness);

    float epaisseur = abs(sin(frameCount *vit) *max_epaisseur);
    stroke(c,alpha);
    strokeWeight(epaisseur);
  }

  void show(int x, int y) {
    float px = cos(dir);
    float py = sin(dir);
    PVector pos = new PVector(px,py);
    pos.x *= rx;
    pos.y *= ry;
    push();
    translate(x,y);
    point(pos.x,pos.y);
    pop();
  }
}


void construction(float min, float range_x, float range_y, float start_hue, float alpha) {
  for(int i = 0 ; i < ani.length ; i++) {
    ani[i] = new Animator();
    ani[i].set_start_hue(start_hue);
    ani[i].set_alpha(alpha);
    ani[i].set_vitesse(random(-1,1)*.1);
    ani[i].set_radius(random(min,range_x),random(min,range_y));
  }
}


void mon_background(int c, int alpha) {
  noStroke();
  fill(c,alpha);
  rect(0,0,width,height);
}

