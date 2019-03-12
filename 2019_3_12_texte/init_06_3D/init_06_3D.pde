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
  int max = lettre.length;
  for(int i = 0; i < max ; i++) {
    float couleur = random(g.colorModeX);
    fill(couleur,g.colorModeY,g.colorModeZ);
    float pos_x = random(width);
    float pos_y = random(height);
    float pos_z = map(i,0,max,height/2,-height/2);
    // size
    int size = (int)random(6,64);
    textFont(police(size,keyPressed));
    text(lettre[i],pos_x,pos_y,pos_z);
  }
}


    
