/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
void setup() {
  size(640,480,P3D);
  colorMode(HSB,360,100,100);
  background(0);
  generateur(400);
  
}


float speed = 0.01;
float angle = 0;
void draw() {
  // afficher des étoiles
  background(0);
  noFill();
  
  pushMatrix();
  rotateY(angle += speed);
  for(int i = 0 ; i < etoile.length ; i++) {
    strokeWeight(etoile[i].taille);
    stroke(etoile[i].aspect.x,etoile[i].aspect.y,etoile[i].aspect.z);
    point(etoile[i].pos.x,etoile[i].pos.y,etoile[i].pos.z);
  }
  popMatrix();
}


void keyPressed() {
  if(key == 'n') {
    int num = (int)random(100,10000);
    generateur(num);
  }
}
