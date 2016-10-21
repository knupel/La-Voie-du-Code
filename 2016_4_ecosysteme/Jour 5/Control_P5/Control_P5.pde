/**
Control P5
*/

void setup() {
  size(400,400) ;
  colorMode(HSB,360,100,100,100) ;
  
  setValueController() ;
  setController() ;
    
}

void draw() {
  background_2D(hue_bg, saturation_bg, brightness_bg, alpha_bg) ;
  aspect() ;
  
  float beat = sin(frameCount *speed *.1) ;
  float size = size_X *beat ;
  ellipse(width - width/4, height/2, size, size) ;
  
  // slider
  controller_draw() ;
  //if(displaySlider)println_slider() ;
}


void aspect() {
  if( alpha_fill > 0 ) fill(hue_fill, saturation_fill, brightness_fill, alpha_fill ) ; else noFill() ;
  if( alpha_stroke > 0 || thickness > .1 ) { 
    stroke(hue_stroke, saturation_stroke, brightness_stroke, alpha_stroke) ;
    strokeWeight(thickness) ;
  } else noStroke() ;
}


void keyPressed() {
  if(key == 'i') displaySlider = !displaySlider ;
}


void println_slider() {
  println("colour background",(int)hue_bg, (int)saturation_bg, (int)brightness_bg, (int)alpha_bg) ;
  println("colour fill",(int)hue_fill, (int)saturation_fill, (int)brightness_fill, (int)alpha_fill ) ;
  println("colour stroke",(int)hue_stroke, (int)saturation_stroke, (int)brightness_stroke, (int)alpha_stroke ) ;
  println("Thickness",(int)thickness ) ;
  println("Size",(int)size_X, (int)size_Y, (int)size_Z ) ;
  println("Canvas",(int)canvas_X, (int)canvas_Y, (int)canvas_Z ) ;
  println("Quantity",quantity) ; 
  println("Life",life) ;
  println("Speed",speed) ;
  println("Direction",(int)direction) ; 
  println("Angle",(int)angle) ;
}