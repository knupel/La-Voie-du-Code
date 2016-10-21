void setup(){
  size(300,300) ;
  background(0) ;
} 


int r, g, b ;
void draw() {
  /*
  r = r + 1;
  g = g + 2 ;
  b  = b + 3 ;
  */
  background(r,g,b) ;
  println(r,g,b) ;

  r = couleur(r , 1) ;
  g = couleur(g , 2) ;
  b = couleur(b , 3) ;
}

int couleur(int arg_couleur, int inc) {
  arg_couleur = arg_couleur + inc;
  if( arg_couleur > 255) arg_couleur = 0 ;
  return arg_couleur ;
}