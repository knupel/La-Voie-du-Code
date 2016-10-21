PShape cerf ;

void setup() {
  size(800, 600);
  // cerf = loadShape("Cerf.svg");
  cerf = loadShape("Cerf_2.svg");
  cerf.enableStyle() ;
  //cerf.disableStyle();
}

void draw() {
  background(0);
  //fill(255);
  shape (cerf);

}