PVector pos = new PVector();
void animation(int x, int y, float dir, float rayon, int couleur) {
  pos.x = cos(dir);
  pos.y = sin(dir);
  pos.mult(rayon);
  fill(couleur);
   noStroke();
  pushMatrix();
  translate(x,y);

  ellipse(pos.x,pos.y,50,50);
  popMatrix();
}
