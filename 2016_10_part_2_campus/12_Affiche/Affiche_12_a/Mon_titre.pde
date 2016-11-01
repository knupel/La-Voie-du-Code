void titre_init() {
  RPE_text_font("MADFONT.ttf", 40) ;
  textAlign(CENTER) ;

}

void titre_update() {
	fill(255,0,0, 80) ;
  noStroke() ;

  String s = "Pirate" ;
  RPE_text_vertex(true) ;
  RPE_text_glyph_point(4) ;
  RPE_text(s, width/2 +20, height/4, 0) ;
  RPE_text_mode_vertex() ;


  RPE_text_spacing(true, 0) ;
  RPE_text_baseline(true, 10, 0, -10) ;
  float speed = .1 ;
  RPE_text_effect_wave(true, speed, 10) ;
}