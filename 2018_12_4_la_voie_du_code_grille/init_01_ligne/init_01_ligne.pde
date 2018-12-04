/**
La Voie du Code : grille
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_4
*/
void setup() {
  size(400,400);
  strokeWeight(10);
  int num = 20;
  int y = height/2;
  int cell_size = width/num;
  for(int x = 0 ; x < num ; x++) {
    // x *=cell_size // work bad because x became to big at the next round
    int temp_x = x * cell_size;
    point(temp_x,y);
  }
}
