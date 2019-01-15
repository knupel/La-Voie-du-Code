/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
Etoile [] etoile ;
void generateur(int num) {
  etoile = new Etoile[num];
  for(int i = 0 ; i < num ; i++) {
    float x = random(-width,width);
    float y = random(-height,height);
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
