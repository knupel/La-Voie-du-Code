
void setup() {
  size(600,900, P3D) ;
  svg_init() ;
  titre_init() ;
}

void draw() {
  start_PDF(true) ;

  background_3D(0, 60) ;
  
  
  Vec3 pos = Vec3(width/2, height/2 + 150, 0) ;
  float scale = 1.5 ;
  float jitter = 15. ;
  svg_update(pos, scale, jitter) ;
  
  
  
  Vec4 couleur_fill = Vec4(255, 255, 255, 20) ;
  Vec4 couleur_stroke = Vec4(255, 0, 0, 125) ;
  float epaisseur = 0 ;
  titre_aspect(couleur_fill, couleur_stroke, epaisseur) ;
  textSize(100) ;
  titre_update(Vec3(60,height/5, 0), "PIRATE", jitter * .6) ;
  
  background_PDF(0, g.colorModeA) ; 
  stop_save_frame() ;
}



void mousePressed() {
  event_save() ;
}