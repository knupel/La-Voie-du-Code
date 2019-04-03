/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_3_12
*/
void setup() {
  size(300,300);
  String phrase = "Voyager c'est bien utile";
  textAlign(CENTER);
  textSize(15);
  text(phrase,width/2,height/4);
  
  // Police de caractère
  String[] fontList = PFont.list();
  printArray(fontList);
  int choix = (int)random(fontList.length);
  int taille = 16;
  PFont font = createFont(fontList[choix],taille);
  fill(255,0,0);
  textFont(font);
  println("");
  println("nom",font.getName(),choix);
  text(phrase,width/2,height/2);
  
  // en bloc
  int taille_bloc_x = 70;
  int taille_bloc_y = 200;
  fill(0);
  textAlign(LEFT);
  text(phrase,width/2,height-height/3,taille_bloc_x,taille_bloc_y);
}
