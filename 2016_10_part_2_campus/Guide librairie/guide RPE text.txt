RPE text 0.0.2
--

void RPE_text_font(String font_path, int size) ;

void RPE_text_vertex(boolean vertex_or_glyphe) ;

void RPE_text_spacing(boolean loop, float... spacing) ;
void RPE_text_spacing(int entry, boolean loop, float... spacing) ;
void RPE_text_spacing(int entry, int exit, boolean loop, float... spacing) ;

void RPE_text_baseline(boolean loop, float... baseline) ;
void RPE_text_baseline(int entry, boolean loop, float... baseline) ;
void RPE_text_baseline(int entry, int exit, boolean loop, float... baseline) ;

void RPE_text_frontback(boolean loop, float... frontback) ;
void RPE_text_frontback(int entry, boolean loop, float... frontback) ;
void RPE_text_frontback(int entry, int exit, boolean loop, float... frontback) ;


PFont getFont_rpe_text()



Method for the vertex mode
----------------------------
void RPE_text_glyph_point(int space) ;
  
void RPE_text(String sentence, int x, int y, int z) ;

void RPE_text_mode_point() ;
void RPE_text_mode_vertex() ;

void RPE_text_effect_wave(float speed, int... amplitude) ;
void RPE_text_effect_wave(int entry, float speed, int... amplitude) ;
void RPE_text_effect_wave(int entry, int exit, float speed, int... amplitude) ;

void RPE_text_effect_cloud(boolean loop, Vec... range) ;
void RPE_text_effect_cloud(int entry, boolean loop, Vec... range) ;
void RPE_text_effect_cloud(int entry, int exit, boolean loop, Vec... range) ;