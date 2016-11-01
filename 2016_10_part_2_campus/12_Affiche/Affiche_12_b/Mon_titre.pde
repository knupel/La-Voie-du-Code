void titre_init() {
  RPE_text_font("MADFONT.ttf", 40) ;
  textAlign(LEFT) ;

}

void titre_update(Vec3 pos, String name, float jitter) {
  String s = "Pirate" ;
  RPE_text_vertex(true) ;
  RPE_text_glyph_point(4) ;
  RPE_text(s, pos.x, pos.y, pos.z) ;
  RPE_text_mode_vertex() ;


  RPE_text_spacing(true, 0) ;
  RPE_text_baseline(true, 10, 0, 10) ;
  float speed = .1 ;
  RPE_text_effect_cloud(true, Vec3(jitter)) ;
}



void titre_aspect(Vec4 dedans, Vec4 contour, float epaisseur) {
  if(dedans.a > 0 )fill(dedans.r, dedans.g, dedans.b, dedans.a) ; else noFill() ;
  if(contour.a > 0 && epaisseur > 0) {
    strokeWeight(epaisseur) ;
    // stroke(contour.r, contour.g, contour.b, contour.a) ; 
    stroke(contour.x, contour.y, contour.z, contour.w) ; 
  } else noStroke() ;
}