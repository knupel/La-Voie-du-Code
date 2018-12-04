/**
La Voie du Code : grille
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_4
*/
void setup() {
  size(400,400);
  strokeWeight(10);
  int num = 20;
  int cell_size = width/num;
  int offset_x = cell_size/2;
  int offset_y = cell_size/2;
  for(int x = 0 ; x < num ; x++) {
    for(int y = 0 ; y < num ; y++) {
      int temp_x = x * cell_size +offset_x;
      int temp_y = y * cell_size +offset_y;
      point(temp_x,temp_y);
    }
  }
}
