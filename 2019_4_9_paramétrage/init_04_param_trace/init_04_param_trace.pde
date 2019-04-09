/**
* La Voie du Code : Paramétrage
* @see https://github.com/StanLepunK/La-Voie-du-Code
* 2019_4_9
*/
Forme forme ;
void setup() {
  size(300,600);
  forme = new Forme(20);
}


void draw() {
  background_perso(0,5);

  fill(255,5);
  forme.set_pos(mouseX,mouseY);
  float rayon_a = 10 + sin(frameCount *.01)*width;
  float rayon_b = 10 + cos(frameCount *.002)*(width/2);
  forme.set_rayon(rayon_a,rayon_b);
  forme.show(); 
}


