/**
CONTROLLER 1.0 
*/

import controlP5.*;
ControlP5 cp5;

public float hue_bg, saturation_bg, brightness_bg, alpha_bg,
             hue_fill, saturation_fill, brightness_fill, alpha_fill,
             hue_stroke, saturation_stroke, brightness_stroke, alpha_stroke,
             thickness,
             size_X, size_Y, size_Z,
             canvas_X, canvas_Y, canvas_Z,
             quantity, life,
             speed,
             direction, angle ;
             
boolean displaySlider = true ;          
// main setup method
////////////////////
void setController() {
  int x = 10 ;
  int y = 11 ;
  int sizeSliderX = 100 ;
  int sizeSliderY = 8 ;
  cp5 = new ControlP5(this);
  cp5.addSlider("hue_bg")         .setRange(0, 360).setPosition(x, y *1).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("saturation_bg")  .setRange(0, 100).setPosition(x, y *2).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("brightness_bg")  .setRange(0, 100).setPosition(x, y *3).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("alpha_bg")       .setRange(0, 100).setPosition(x, y *4).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("hue_fill")         .setRange(0, 360).setPosition(x, y *6).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("saturation_fill")  .setRange(0, 100).setPosition(x, y *7).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("brightness_fill")  .setRange(0, 100).setPosition(x, y *8).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("alpha_fill")       .setRange(0, 100).setPosition(x, y *9).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("hue_stroke")         .setRange(0, 360).setPosition(x, y *11).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("saturation_stroke")  .setRange(0, 100).setPosition(x, y *12).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("brightness_stroke")  .setRange(0, 100).setPosition(x, y *13).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("alpha_stroke")       .setRange(0, 100).setPosition(x, y *14).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("thickness")       .setRange(.1, width/10).setPosition(x, y *16).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("size_X")  .setRange(.1, width).setPosition(x, y *18).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("size_Y")  .setRange(.1, width).setPosition(x, y *19).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("size_Z")  .setRange(.1, width).setPosition(x, y *20).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("canvas_X")  .setRange(width/10, width).setPosition(x, y *22).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("canvas_Y")  .setRange(width/10, width).setPosition(x, y *23).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("canvas_Z")  .setRange(width/10, width).setPosition(x, y *24).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("quantity")  .setRange(0,1).setPosition(x, y *26).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("life")      .setRange(0,1).setPosition(x, y *27).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("speed")    .setRange(0,1).setPosition(x, y *29).setSize(sizeSliderX, sizeSliderY) ;
  
  cp5.addSlider("direction")  .setRange(0,360).setPosition(x, y *31).setSize(sizeSliderX, sizeSliderY) ;
  cp5.addSlider("angle")      .setRange(0,360).setPosition(x, y *32).setSize(sizeSliderX, sizeSliderY) ;

  
  // we use this method to disable the peasy cam on the controller
  cp5.setAutoDraw(false);
}


// main draw method
////////////////////
void controller_draw() {
   if (!displaySlider)  {
     cp5.hide() ; 
   } else {
     cp5.show() ;
     
     // we use this method to disable or enable the peasy cam on the controller
     // cam.beginHUD();
     cp5.draw();
     // cam.endHUD();
   }
}



// annexe method
/////////////////////////
void setValueController() {
  
  hue_bg = 195 ;
  saturation_bg = 100 ;
  brightness_bg = 50 ;
  alpha_bg = 100 ;
  
  hue_fill = 30 ;
  saturation_fill = 0 ;
  brightness_fill = 100 ;
  alpha_fill = 100 ;
  
  hue_stroke = 30 ;
  saturation_stroke = 0 ;
  brightness_stroke = 0 ;
  alpha_stroke = 100 ;
  
  thickness = 1 ;
  
  size_X = width/3 ;
  size_Y = width/3 ;
  size_Z = width/3 ;
  
  canvas_X = width/3 ;
  canvas_Y = width/3 ;
  canvas_Z = width/3 ;
  
  quantity = .5 ;
  life = .5 ;
  
  speed = .5 ;
  
  direction = 0 ;
  angle = 0 ;
}