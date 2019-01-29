/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
Etoile [] etoiles;
void setup() {
  //size(320,240,P3D);
  fullScreen(P3D,2);
  //colorMode(RGB,255,255,255,255);
  colorMode(HSB,360,100,100,100);
  background(0);
  generateur(200,5);

}

void draw() {
  espace(0,0,0,5);
  pushMatrix();
  float angle_x = map(mouseX,0,width,-PI/6,PI/6);
  float angle_y = map(mouseY,0,height,-PI/6,PI/6);
  rotateX(angle_y);
  rotateY(angle_x);
  for(int i = 0 ; i < etoiles.length ; i++) {
    strokeWeight(etoiles[i].taille);
    stroke(etoiles[i].aspect.x,etoiles[i].aspect.y,etoiles[i].aspect.z);
    point(etoiles[i].pos.x,etoiles[i].pos.y,etoiles[i].pos.z);  
  }
  popMatrix();
  vaisseau();
}


float vitesse_vaisseau = 5.1;
void vaisseau() {
  for(int i = 0 ; i < etoiles.length ;i++) {
    etoiles[i].pos.z = etoiles[i].pos.z + vitesse_vaisseau;
    if(etoiles[i].pos.z > width) etoiles[i].pos.z = -width;
  }
}


void keyPressed() {
  int num = (int)random(400,4000);
  generateur(num,5);
}
