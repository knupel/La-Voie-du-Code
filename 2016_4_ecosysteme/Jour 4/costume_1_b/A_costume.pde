void costume(Vec3 pos, int size, Vec3 dir, int which_costume) {
  if (which_costume == 0 ) {
    costume_zero(pos, size, dir) ;
  } else if (which_costume == 1 ) {
    costume_one(pos, size, dir) ;
  } else if (which_costume == 2 ) {
    costume_two(pos, size, dir) ;
  } else if (which_costume == 3 ) {
    costume_three(pos, size, dir) ;
  } else if (which_costume == 4 ) {
    costume_four(pos, size, dir) ;
  }else if (which_costume == 5 ) {
    costume_five(pos, size, dir) ;
  } else {
    which_costume = (int)random(5) ;
    // opération récursive, car la fonction boucle sur elle-même à manipuler avec précaution. surtout sauvegarder avant de s'en servir !
    costume(pos, size, dir, which_costume) ;
  }
}

// Mes différents costumes

// CLASSIC SHAPE
void costume_zero(Vec3 pos, int size, Vec3 dir) {
  matrix_start() ;
  translate(pos) ;
  ellipse(0,0, size, size) ;
  matrix_end() ;
}

// POLYGONE
void costume_one(Vec3 pos, int size, Vec3 dir) {
  primitive(pos, size, 3) ;
}

/*
* POLYHEDRON
* Voir le fichier Guide_math.txt pour la liste de nom et le type d'affichage, sachant que l'affichage VERTEX est plus proche du chaos qu'autre chose :(
*/
void costume_two(Vec3 pos, int size, Vec3 dir) {
  matrix_start() ;
  translate(pos) ;
  polyhedron("CUBE","LINE", size) ;
  matrix_end() ;
}

// CHAOS VERTEX
void costume_three(Vec3 pos, int size, Vec3 dir) {
  if(reset_vertex_shape) build_chaos(50) ;
  render_chaos(pos, size, dir, list_vertex_point()) ;
}

// SVG VERTEX
void costume_four(Vec3 pos, int size, Vec3 dir) {
  if(reset_SVG ) build_SVG() ;
  display_full_SVG() ;
}

// TYPO
void costume_five(Vec3 pos, int size, Vec3 dir) {
  String txt = "DAMNED 1.2" ;
  matrix_start() ;
  translate(pos) ;
  textSize(34) ;
  textAlign(CENTER) ;
  text(txt, 0,0) ;
  matrix_end() ;
}