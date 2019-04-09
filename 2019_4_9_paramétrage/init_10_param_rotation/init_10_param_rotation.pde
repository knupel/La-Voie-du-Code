/**
* La Voie du Code : Paramétrage
* @see https://github.com/StanLepunK/La-Voie-du-Code
* 2019_4_9
*/

void setup() {
  size(600,600,P2D);
  colorMode(HSB,360,100,100,100);
  regenerateur();
}


void draw() {
  background_perso(0,3);

  for(int i = 0 ; i < forme.length ; i++) {
    aspect(i);
  	float rayon_a = sin(frameCount *pulsar[i].x)*taille[i].x;
  	float rayon_b = cos(frameCount *pulsar[i].y)*taille[i].y;

  	forme[i].set_rayon(rayon_a,rayon_b);
    pushMatrix();
    translate(forme[i].get_pos().x,forme[i].get_pos().y);
    rotate(angle[i] += speed_rotation[i]);
  	forme[i].show();
    popMatrix();
  }
}

void keyPressed() {
  if(key == 'n') regenerateur();
  if(key == 's') {
    stroke_is = stroke_is? false:true; // short write, same code as below  
  }

  if(key == 'f') {
    fill_is = fill_is? false:true;
  }
}

boolean fill_is = true;
boolean stroke_is = false;
void aspect(int target) {
  if(fill_is) {
    fill(couleur[target].x,couleur[target].y);
  } else {
    noFill();
  }

  if(stroke_is) {
    float thickness = abs(sin(frameCount *.001));
    strokeWeight(thickness);
    stroke(couleur[target].x,couleur[target].y);
  } else {
    noStroke();
  }
}


PVector [] pulsar;
PVector [] couleur;
PVector [] taille;
float [] speed_rotation;
float [] angle;
Forme [] forme;
void regenerateur() {
  forme = new Forme[(int)random(50,150)]; // definit le nombre de forme
  for(int i = 0 ; i < forme.length ; i++) {
    int num = (int)random(3,16) *2;
    forme[i] = new Forme(num);  // definit le nombre de sommmet
    float marge = width/5;
    forme[i].set_pos(random(-marge,width+marge),random(-marge,height+marge));
  }

  pulsar = new PVector[forme.length];
  for(int i = 0 ; i < pulsar.length ; i++) {
    float x = random(1)*.02;
    float y = random(1)*.02;
    pulsar[i] = new PVector(x,y);
  }

  couleur = new PVector[forme.length];
  for(int i = 0 ; i < couleur.length ; i++) {
    float c = random(g.colorModeX); // random on the X > HUE range of the color space
    float a = random(g.colorModeA); // random on the alpha componenet of color space
    couleur[i] = new PVector(c,a);
  }

  taille = new PVector[forme.length];
  for(int i = 0 ; i < taille.length ; i++) {
    float ta = random(10,width); 
    float tb = random(10,width);
    taille[i] = new PVector(ta,tb);
  }

  speed_rotation = new float[forme.length];
  angle = new float[forme.length];
  for(int i = 0 ; i < speed_rotation.length ; i++) {
    angle[i] = 0;
    speed_rotation[i] = random(1) * 0.1;
  }
}


