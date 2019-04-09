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
  background_perso(0,20);

  for(int i = 0 ; i < forme.length ; i++) {
  	fill(255,10);
  	float taille_a = width/6;
  	float taille_b = width/12;
  	float rayon_a = sin(frameCount *.01)*taille_a;
  	float rayon_b = cos(frameCount *.002)*(taille_b);
  	forme[i].set_rayon(rayon_a,rayon_b);
  	forme[i].show(); 
  }
}

void keyPressed() {
  if(key == 'n') regenerateur();
}



Forme [] forme;
void regenerateur() {
  forme = new Forme[(int)random(100,300)]; // definit le nombre de forme
  for(int i = 0 ; i < forme.length ; i++) {
    int num = (int)random(3,12) *2;
    forme[i] = new Forme(num);  // definit le nombre de sommmet
    forme[i].set_pos(random(width),random(height));
  }

}


