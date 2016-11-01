void titre_init() {
  RPE_text_font("Mabella.ttf", 120) ;
  textAlign(LEFT) ;
  textSize(60) ;
}

void titre_update() {
	stroke(255, 80) ;
strokeWeight(1) ;
  //noStroke() ;

  // String s = "Fenêtre sur cour" ;
  String titre = "FENETRE SUR COUR" ;
  RPE_text_vertex(true) ;
  RPE_text_glyph_point(2) ;
  RPE_text(titre, mouseX, mouseY, 0) ;
  RPE_text_mode_vertex() ;


  RPE_text_spacing(true, 5) ;
  RPE_text_baseline(true, 10, 0, -10) ;
  RPE_text_frontback(true, 100, 0, -100) ;
  float speed = .1 ;
  RPE_text_effect_wave(true, speed, 50) ;
}