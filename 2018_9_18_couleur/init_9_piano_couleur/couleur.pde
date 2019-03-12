int [] couleur;
  
void init_couleur() {
  couleur = new int[num];
  for(int i = 0 ; i < num ; i++) {
    couleur[i] = color(random(255),random(255),random(255));
  }
}
