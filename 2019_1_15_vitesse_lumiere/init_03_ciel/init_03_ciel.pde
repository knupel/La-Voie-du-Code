/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
PVector [] etoile ;
void setup() {
  size(640,480,P3D);
  colorMode(HSB,360,100,100);
  background(0);
  
  // créer des étoiles
  int num = 4000;
  etoile = new PVector[num];
  for(int i = 0 ; i < num ; i++) {
    float x = random(width);
    float y = random(height);
    float z = random(-width,width);
    etoile[i] = new PVector(x,y,z);
  }
  

}


void draw() {
 // afficher des étoiles
 background(0);
  noFill();
  for(int i = 0 ; i < etoile.length ; i++) {
    strokeWeight(random(2));
    float couleur = random(360);
    float lumiere = random(0,10);
    float densite = random(10,100);
    stroke(couleur,lumiere,densite);
    point(etoile[i].x,etoile[i].y,etoile[i].z);
  }
}
