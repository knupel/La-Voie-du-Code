/**
* La Voie du Code : Paramétrage
* @see https://github.com/StanLepunK/La-Voie-du-Code
* 2019_4_9
*/

void setup() {
  size(600,600,P2D);
  regenerateur();
}


void draw() {
  background_perso(0,5);

  for(int i = 0 ; i < forme.length ; i++) {
  	fill(255,30);
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

}


