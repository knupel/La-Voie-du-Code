void bg(float gris) {
  bg(gris, gris, gris, g.colorModeA)  ;
}

void bg(float gris, float alpha) {
  bg(gris, gris, gris, alpha)  ;
}

void bg(float rouge, float vert, float bleu) {
  bg(rouge, vert, bleu, g.colorModeA)  ;
}

void bg(float rouge, float vert, float bleu, float alpha) {
  fill(rouge, vert, bleu, alpha)  ;
  noStroke() ;
  rect(0,0, width, height) ;
}