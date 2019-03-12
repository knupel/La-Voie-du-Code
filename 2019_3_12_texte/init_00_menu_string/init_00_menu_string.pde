/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_3_12
*/

void setup() {
  String str_a = "Salut tout le monde";
  String str_b = ("Aujourd'hui c'est littérature française");
  println(str_a);
  println(str_b);
  
  // concaténer un texte
  String str_a_plus_b = str_a + "! " + str_b;
  println(str_a_plus_b, "ce texte est lond de",str_a_plus_b.length(),"caractères");
  
  // diviser un texte
  String [] eclat = str_a.split(" ");
  printArray(eclat);
  
  // charger un gexte
  // note: on utilise un array car il est créé une séquence par paragraphe.
  String [] str_ext = loadStrings("voyager.txt");
  printArray(str_ext);
}
