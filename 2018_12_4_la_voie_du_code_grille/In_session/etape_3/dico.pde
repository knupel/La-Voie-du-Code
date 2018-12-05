void arriere_plan(float r, float v, float b, float a) {
  rectMode(CORNER);
  noStroke();
  fill(r,v,b,a);
  rect(0,0,width,height);
}



void motif(float x, float y, float taille, float angle) {
  rectMode(CENTER);
  pushMatrix();
  translate(x,y);
  rotate(angle);
  rect(0,0,taille,taille);
  popMatrix();
}
