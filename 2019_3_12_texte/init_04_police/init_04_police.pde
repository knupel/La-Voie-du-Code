/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_3_12
*/
String [] texte;
String[] fontList;
void setup() {
  size(600,600);
  colorMode(HSB,360,100,100,100);
  background(0);
  println(g.colorModeX,g.colorModeY,g.colorModeZ,g.colorModeA);
  texte = loadStrings("voyager.txt");
  printArray(texte);
  // police
  fontList = PFont.list();
}

void draw() {
  println((int)frameRate);
  int cible = 0; 
  String [] letter = texte[cible].split("");
  for(int i = 0; i < texte[cible].length() ; i++) {
    float couleur = random(g.colorModeX);
    fill(couleur,g.colorModeY,g.colorModeZ);
    float pos_x = random(width);
    float pos_y = random(height);
    // size
    int size = (int)random(6,64);
    // police
    int which_font = (int)random(fontList.length);
    PFont font = createFont(fontList[which_font],size);
    textFont(font);
    text(letter[i],pos_x,pos_y);
  }
}
