PShape pirate ;
PShape crane, nez, sabre_a,sabre_b, yeux ;

void setup() {
  size(800, 600);
  pirate = loadShape("pirate_2.svg");
  crane = pirate.getChild("crâne");
  crane.disableStyle();
  nez = pirate.getChild("nez");
  nez.disableStyle();
  sabre_a = pirate.getChild("sabre A");
  sabre_a.disableStyle();
  sabre_b = pirate.getChild("sabre B");
  sabre_b.disableStyle();
  yeux = pirate.getChild("yeux");
  yeux.disableStyle();
}

void draw() {
  background(0);
  fill(255);
  shape(crane, -48, 5);
  shape(sabre_a, -48, 5);
  shape(sabre_b, -48, 5);
  fill(0) ;
  shape(yeux, -48, 5);
  shape(nez, -48, 5);
}