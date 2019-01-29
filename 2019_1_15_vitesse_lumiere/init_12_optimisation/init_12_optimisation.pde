/**
La Voie du Code : Vitesse lumière
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_15
*/
int canvas ;
void setup() {
  // fullScreen(P3D,2);
  size(800,600,P3D);
  colorMode(HSB,360,100,100,100);
  background(0);
  canvas = 3*width;
  generateur(10,canvas);
  
}


boolean bang = false;
void draw() {
  cursor(CROSS);
  // afficher des étoiles
  // espace(0,0,0,100);
  
  if(speed_vaisseau < 30) {
    espace(245,95,15,5);
  } else {
    if(bang == false) {
      background(0,0,100);
      bang = true;   
    } else {
      espace(245,95,15,5);
    }
  }
  
 
  
  // afficher les étoiles
  noFill();
  pushMatrix();
  float angle_y = map(mouseX,0,width,PI/8,-PI/8);
  float angle_x = map(mouseY,0,height,-PI/8,PI/8);
  translate(width/2,height/2);
  rotateY(angle_y);
  rotateX(angle_x);
  for(int i = 0 ; i < etoile.length ; i++) {
    float ratio = map(etoile[i].pos.z,-(2*height),height/2,0,1);
    if(ratio < 0) ratio = 0;
    else if(ratio > g.colorModeA) ratio = 1;
    strokeWeight(etoile[i].taille *ratio);

    
    stroke(etoile[i].aspect.x,etoile[i].aspect.y,etoile[i].aspect.z,g.colorModeA*ratio);
    point(etoile[i].pos.x,etoile[i].pos.y,etoile[i].pos.z);
  }
  popMatrix();
  
  vaisseau(0.02);
  
  // info
  println("vitesse",(int)speed_vaisseau);
  println("etoiles",etoile.length);
}







void keyPressed() {
  if(key == 'n') {
    int num = (int)random(1000,30000);
    generateur(num,canvas);
    speed_vaisseau = 0;
    background(0);
  }
}
