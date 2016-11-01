
void init_typo() {
  RPE_text_font("MADFONT.ttf", 40) ;
  textAlign(LEFT) ;
}

void update_typo() {
  String titre = "aplha B" ;
  RPE_text_vertex(true) ;
  RPE_text_glyph_point(4) ;
  
  RPE_text_spacing(false, 10, 30) ;
  RPE_text_baseline(true, 10, 0, 10) ;
  RPE_text_frontback(true, 10, -100, 10) ;
  
  RPE_text(titre, mouseX, mouseY, 0) ;
  
  float speed = .1 ;
  RPE_text_effect_wave(true, speed, 10) ;
  
  RPE_text_mode_point() ;
  // RPE_text_mode_vertex() ;
}