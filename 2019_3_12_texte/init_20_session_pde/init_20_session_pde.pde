/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK
2019_4_2
*/
String [] mots;
int cible;

int pos_x;
int pos_y;

String [] liste_font;
PFont ma_police;

void setup() {
  size(480,480,P2D);
  background(0);
  liste_font = PFont.list();
  String [] import_texte = loadStrings("voyager.txt");
  mots = import_texte[0].split(" "); 
  selection_police();
}

void draw() {
  fill(couleur);
  textFont(ma_police);
  textSize(taille);
  text(mots[cible],pos_x,pos_y); 
}

int taille = 12;
void mousePressed() {
  choix(mots.length);
  selection_police();
  taille = (int)random(20,60);
}


int couleur;
void keyPressed() {
  if(key == 's') saveFrame("truc_"+month() + "_" + day() + "_" + hour() + "_" + minute() + "_" +second());
  if(key == 'x') {
    pos_x = (int)random(width);
  }
  if(key == 'y') pos_y = (int)random(height);
  if(key == 'c') couleur = color(random(255),random(255),random(255));
}

void choix(int max) {
  cible = floor(random(max));
}




void selection_police() {
  int numero_police = floor(random(liste_font.length));
  println(liste_font[numero_police]);
  ma_police = createFont(liste_font[numero_police],120);
}
