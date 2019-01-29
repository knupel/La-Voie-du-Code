void espace(float c, float l, float d, float a) {
  fill(c,l,d,a);
  noStroke();
  int taille_x = width *7;
  int taille_y = height *7;
  float offset_x = -(taille_x/2) + (width/2);
  float offset_y = -(taille_y/2) + (height/2);
  
  pushMatrix();
  translate(0,0,-3*width);
  rect(offset_x,offset_y,taille_x,taille_y);
  popMatrix();
  
}
