/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_3_12
*/
String [] texte;
String[] fontList;
void setup() {
  size(600,600,P3D);
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
  background(0);
  int cible = 0; 
  String [] lettre = texte[cible].split("");
  String [] mot = texte[cible].split(" ");
  if(mousePressed) {
    show(lettre);
  } else {
    show(mot);
  }
}

void keyPressed() {
  if(key == 's') {
    save_image("mon_image");
  }
}




    
