/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
float speed_vaisseau;
void vaisseau(float speed) {
  speed_vaisseau += speed;
  for(int i = 0 ; i < etoile.length ; i++) {
    etoile[i].pos.z += speed_vaisseau;
    if(etoile[i].pos.z > width) {
      etoile[i].pos.z = -(2*width);
    }
  }
}
