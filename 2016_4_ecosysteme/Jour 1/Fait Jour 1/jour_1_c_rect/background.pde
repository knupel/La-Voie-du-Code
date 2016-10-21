void change_couleur_bg() {
  r = couleur(r, 1) ;
  g = couleur(g, 2) ;
  b = couleur(b, 3) ;
}
// local method
int couleur(int arg_couleur, int var) {
  arg_couleur += var;
  if(arg_couleur > 255) arg_couleur = 0 ;
  return arg_couleur ;
}