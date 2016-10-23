/**
SAVE FRAME 0.0.1
*/

void stop_save_frame() {
  stop_PDF() ;
  save_PNG() ;
}
void event_save() {
  event_PNG() ;
  event_PDF() ;
}
/**
PDF 0.0.1
*/
import processing.pdf.*;
boolean record_PDF;

void start_PDF() {
  printTempo(60, frameCount, record_PDF,!record_PNG);
  if (record_PDF && !record_PNG) {

    if(renderer_P3D()) {
      beginRaw(PDF, "impression/frame_P3D-####.pdf"); 
      if(background_pdf) background_2D(rgba_bg) ;
    } else {
      beginRecord(PDF, "impression/frame_P2D-####.pdf");
      if(background_pdf) background_3D(rgba_bg) ;
    }
  }
}
void stop_PDF() {
  if (record_PDF && !record_PNG) {
    if(renderer_P3D()) {
      endRaw(); 
    } else {
      endRecord() ;
    }
    record_PDF = false;
  }
}

void event_PDF() {
  record_PDF = true;
}

boolean background_pdf ;
Vec4 rgba_bg ;
void background_PDF(float grey) {
  background_PDF(grey, grey, grey, g.colorModeA) ;
}
void background_PDF(float grey, float a) {
  background_PDF(grey, grey, grey, a) ;
}

void background_PDF(float red, float green, float blue) {
  background_pdf = true ;
  rgba_bg = Vec4(red, green, blue, g.colorModeA) ;
}
void background_PDF(float red, float green, float blue, float alpha) {
  background_pdf = true ;
  rgba_bg = Vec4(red, green, blue, alpha) ;
}




/**
PNG
*/
boolean record_PNG ;

void save_PNG() {
  if(record_PNG) {
    saveFrame("impression/PNG-######.png");
    record_PNG = false ;
  }
}

void event_PNG() {
  record_PNG = true;
}