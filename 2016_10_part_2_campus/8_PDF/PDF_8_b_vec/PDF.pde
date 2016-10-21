/**
PDF
*/
import processing.pdf.*;
boolean record_PDF;

void start_PDF() {
  if (record_PDF) {
    beginRecord(PDF, "impression/frame-####.pdf"); 
  }
}
void stop_PDF() {
  if (record_PDF) {
    endRecord();
    record_PDF = false;
  }
}