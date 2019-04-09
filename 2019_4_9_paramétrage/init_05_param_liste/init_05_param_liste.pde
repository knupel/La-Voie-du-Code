/**
* La Voie du Code : Paramétrage
* @see https://github.com/StanLepunK/La-Voie-du-Code
* 2019_4_9
*/
Forme [] forme;
void setup() {
  size(600,600,P2D);
  forme = new Forme[(int)random(30,100)]; // definit le nombre de forme
  for(int i = 0 ; i < forme.length ; i++) {
  	int num = (int)random(3,25) *2;
  	forme[i] = new Forme(num);  // definit le nombre de sommmet
  	forme[i].set_pos(random(width),random(height));
  }
}


void draw() {
  background_perso(0,10);

  for(int i = 0 ; i < forme.length ; i++) {
  	fill(255,5);
  	float taille_a = width/3;
  	float taille_b = width/6;
  	float rayon_a = 10 + sin(frameCount *.01)*taille_a;
  	float rayon_b = 10 + cos(frameCount *.002)*(taille_b);
  	forme[i].set_rayon(rayon_a,rayon_b);
  	forme[i].show(); 
  }
}


