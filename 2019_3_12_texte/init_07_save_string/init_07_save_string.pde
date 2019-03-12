/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_3_12
*/
void setup() {
  String [] texte = loadStrings("voyager.txt");
  printArray(texte);
  String [] mot = texte[0].split(" ");
  String nouveau_texte = "";
  for(int i = 0 ; i < mot.length ; i++) {
    int cible = (int)random(mot.length);
    nouveau_texte += (mot[cible] + " ");
  }
  String chemin_relatif = "data/";
  String nom_fichier = "mon_poème_" + year() + "_" +month() + "_" + day() + "_" + hour() + "_" + minute() + "_" +second();
  String extension = "txt";
  String []save = {" ",nouveau_texte};
  String chemin = chemin_relatif+nom_fichier + "."+ extension;
  saveStrings(chemin,save);
}





    
