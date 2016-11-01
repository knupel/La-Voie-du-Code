RPEsvg svg ;

void svg_init() {
  String path = "pirate_couleur.svg" ;
  svg = new RPEsvg(this, path) ;
  svg.build() ;
}

void oeuvre() {
  svg.svg_mode(CENTER) ;
  Vec3 pos = Vec3(mouseX, mouseY, 0 ) ;
  Vec3 scale = Vec3(1) ;
  Vec3 jitter = Vec3(10) ;
  svg.pos(pos) ;
  svg.scale(scale) ;
  svg.jitter(jitter) ;
  svg.original_style(true, false) ;
  svg.draw_3D() ;
}