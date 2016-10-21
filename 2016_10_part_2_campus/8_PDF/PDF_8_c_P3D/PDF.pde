/**
PDF
*/
import processing.pdf.*;
boolean record_PDF;

void start_PDF() {
  if (record_PDF) {
    if(renderer_P3D()) {
      beginRaw(PDF, "impression/frame_P3D-####.pdf"); 
    } else {
      beginRecord(PDF, "impression/frame_P2D-####.pdf");
    }
  }
}
void stop_PDF() {
  if (record_PDF) {
    if(renderer_P3D()) {
      endRaw(); 
    } else {
      endRecord() ;
    }
    record_PDF = false;
  }
}