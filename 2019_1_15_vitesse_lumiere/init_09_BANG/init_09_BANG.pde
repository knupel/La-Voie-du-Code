/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
int canvas ;
void setup() {
  size(640,480,P3D);
  colorMode(HSB,360,100,100);
  background(0);
  canvas = 3*width;
  generateur(400,canvas);
  
}


boolean bang = false;
void draw() {
  // afficher des étoiles
  frameRate(120);
  if(speed_vaisseau < 30) {
    espace(0,0,0,5);
  } else {
    if(bang == false) {
      background(0,0,100);
      bang = true;   
    } else {
      espace(0,0,100,10);
    }
  }
  
  // afficher les étoiles
  noFill();
  for(int i = 0 ; i < etoile.length ; i++) {
    strokeWeight(etoile[i].taille);
    stroke(etoile[i].aspect.x,etoile[i].aspect.y,etoile[i].aspect.z);
    point(etoile[i].pos.x,etoile[i].pos.y,etoile[i].pos.z);
  }
  
  vaisseau(.01);
  
  // info
  println("vitesse",(int)speed_vaisseau);
  println("etoiles",etoile.length);
}





void keyPressed() {
  if(key == 'n') {
    int num = (int)random(100,10000);
    generateur(num,canvas);
    speed_vaisseau = 0;
    background(0);
  }
}
