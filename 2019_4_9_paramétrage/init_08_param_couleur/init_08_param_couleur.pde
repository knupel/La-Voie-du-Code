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
    // fill(couleur[i].x,couleur[i].y); // nuance de gris
  	// fill(couleur[i].x,g.colorModeY,g.colorModeZ,couleur[i].y); // couleur pure
    float sat = map(mouseX,0,width,0,g.colorModeY);
    float dens = map(mouseY,0,height,0,g.colorModeZ);
    fill(couleur[i].x,sat,dens,couleur[i].y); // densité et saturation modifié par la souris

  	float taille_a = width/3;
  	float taille_b = width/12;
  	float rayon_a = sin(frameCount *pulsar[i].x)*taille_a;
  	float rayon_b = cos(frameCount *pulsar[i].y)*(taille_b);
  	forme[i].set_rayon(rayon_a,rayon_b);
  	forme[i].show(); 
  }
}

void keyPressed() {
  if(key == 'n') regenerateur();
}


PVector [] pulsar;
PVector [] couleur;
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
}


