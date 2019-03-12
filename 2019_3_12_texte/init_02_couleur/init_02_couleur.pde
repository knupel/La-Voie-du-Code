/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_3_12
*/
String [] texte;
void setup() {
  size(300,300);
  colorMode(HSB,360,100,100,100);
  println(g.colorModeX,g.colorModeY,g.colorModeZ,g.colorModeA);
  texte = loadStrings("voyager.txt");
  printArray(texte);
}

void draw() {
  //background(0);
  int cible = 0; 
  String [] letter = texte[cible].split("");
  for(int i = 0; i < texte[cible].length() ; i++) {
    float couleur = random(g.colorModeX);
    fill(couleur,g.colorModeY,g.colorModeZ);
    float pos_x = random(width);
    float pos_y = random(height);
    text(letter[i],pos_x,pos_y);
  }
}
