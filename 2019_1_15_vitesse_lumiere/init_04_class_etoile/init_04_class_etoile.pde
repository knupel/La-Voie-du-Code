/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
Etoile [] etoile ;
void setup() {
  size(640,480,P3D);
  colorMode(HSB,360,100,100);
  background(0);
  
  // créer des étoiles
  int num = 4000;
  etoile = new Etoile[num];
  for(int i = 0 ; i < num ; i++) {
    float x = random(width);
    float y = random(height);
    float z = random(-width,width);
    PVector position = new PVector(x,y,z);
    float couleur = random(360);
    float lumiere = random(0,10);
    float densite = random(10,100);
    PVector aspect = new PVector(couleur,lumiere,densite);
    float taille = random(2);
    etoile[i] = new Etoile(position,taille,aspect); ;
  }
  

}


void draw() {
 // afficher des étoiles
 background(0);
  noFill();
  for(int i = 0 ; i < etoile.length ; i++) {
    strokeWeight(etoile[i].taille);
    stroke(etoile[i].aspect.x,etoile[i].aspect.y,etoile[i].aspect.z);
    point(etoile[i].pos.x,etoile[i].pos.y,etoile[i].pos.z);
  }
}
