/**
 * Mirror 2 
 * by Daniel Shiffman. 
 *
 * Each pixel from the video source is drawn as a rectangle with size based on brightness.  
 */
 
import rope.vector.*;


void setup() {
  size(640, 480);
  //colorMode(RGB, 255, 255, 255, 100);
  set_input_camera();
  background(0);
}


void draw() { 
  if (video.available()) {
    background(0,0,255);
    render_camera();
    println("average bright",average_brightness());
    println("average hsb",average_hsb());
  } 
}
