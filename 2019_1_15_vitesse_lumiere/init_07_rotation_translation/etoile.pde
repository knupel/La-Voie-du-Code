/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
class Etoile {
  PVector pos;
  PVector aspect;
  float taille;
  Etoile(PVector pos, float taille,PVector aspect) {
    this.pos = pos;
    this.taille = taille;
    this.aspect = aspect;
  }
}
