/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_3_12
*/
void setup() {
  size(300,300);
}

void draw() {
  float radius = 10 + (abs(sin(frameCount *.01)*(height/2)));
  fill(0,30);
  stroke(255,30);
  ellipse(mouseX,mouseY,radius,radius); 
}

void keyPressed() {
  if(key == 's') {
    String nom = "c_est_beau";
    String extension = "jpg" ; // png, tif, tga sont possible aussi
    String date = year() + "_" +month() + "_" + day() + "_" + hour() + "_" + minute() + "_" +second();
    String nom_du_fichier = nom+"_"+date+"."+extension;
    String chemin_relatif = "mes_images/";
    saveFrame(chemin_relatif+nom_du_fichier);
  }
}





    
