Finger_leap finger ;

void setup() {
  size(800,600, P3D) ;
  finger = new Finger_leap() ;
}

void draw() {
  background(0) ;
  finger.update() ;
  leap_finger_single_info(finger) ;
  leap_finger_average_info(finger, 0.05) ;
  textSize(150) ;
  text(finger.active_fingers, width/2, height/2) ;
}
