/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/

void espace(float couleur,float lumiere,float densite,float transparence) {
  fill(couleur,lumiere,densite,transparence);
  noStroke();
  int size_x = width*7;
  int size_y = height*7;
  float offset_x = -(size_x/2) +(width/2);
  float offset_y = -(size_y/2) +(height/2);
  // rectMode(CENTER);
  pushMatrix();
  translate(0,0,-3*width);
  rect(offset_x,offset_y,size_x,size_y);
  popMatrix();
}
