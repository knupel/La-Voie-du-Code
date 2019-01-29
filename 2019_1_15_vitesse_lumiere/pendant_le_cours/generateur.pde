void generateur(int num, float taille_max) {
  etoiles = new Etoile[num];
  for(int i = 0 ; i < etoiles.length ; i++) {
    float x = random(-width,width);
    float y = random(-height,height);
    float z = random(-width,width);
    PVector temp = new PVector(x,y,z); 
    float taille = random(taille_max);
    float couleur = random(360);
    float lumiere = random(0,10);
    float densite = random(80,100);
    PVector aspect = new PVector(couleur,lumiere,densite);
    etoiles[i] = new Etoile(temp,taille,aspect);
  }
}
