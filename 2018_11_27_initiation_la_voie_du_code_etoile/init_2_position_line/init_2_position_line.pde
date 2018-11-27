/**
La Voie du Code vers les Étoiles
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_11_27
*/

void setup() {
  size(600,400);
}

void draw() {
  float x_1 = mouseX;
  float y_1 = mouseY;
  float x_2 = width - mouseX;
  float y_2 = height - mouseY;
  line(x_1,y_1,x_2,y_2);
}
