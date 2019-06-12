/**
* Leap method
* v 0.0.3
* 2016-2019
*/
void leap_finger_single_info(Finger_leap fl) {
  if(fl.is()) {
    for(int i = 0; i < fl.get_num() ; i++) {
      if(fl.visible()[i]) {
        //display info
        push() ;
        
        vec3 pos = vec3(fl.get_pos()[i].x*width, 
                        height -fl.get_pos()[i].y*height, 
                        fl.get_pos()[i].z *(width+height) -((width+height)/2));
        translate(pos) ;
        rotateX(fl.get_pitch()[i] +0.7);
        rotateY(fl.get_roll()[i] +0.9);
        rotateZ(fl.get_yaw()[i] +0.9);
    
        fill(r.BLANC) ;
        textSize(12) ;
        text("My name is " + fl.get_ID()[i],0,0);
        fill(r.BLOOD) ;
        text("my position is " + (int)pos.x + " / " + (int)pos.y + " / " + (int)pos.z,0,12);
        text("my direction is " + fl.get_dir()[i], 0,24) ;
        text("my XXX oriantation " + fl.get_pitch()[i]+"°",0,36);
        text("my YYY oriantation " + fl.get_roll()[i]+"°",0,48);
        text("my ZZZ oriantation " + fl.get_yaw()[i]+"°",0,60);
        String mag = String.format("%.5f", fl.get_mag()[i]);
        text("my magnitude " + mag,0,72);
        pop() ;
      }
    }
  }
}


// void leapFingerAverageInfo(FingerLeap fl, float speed) {
void leap_finger_average_info(Finger_leap fl, float speed) {
  fl.set_speed(speed) ;
  //average fingers info position
  if(fl.is()) {
    for(int i = 0; i < fl.get_num() ; i++) {  
      push() ;
      // println("Average", fl.averageNormPos) ;
      vec3 pos = vec3(fl.get_average_pos().x *width, height -fl.get_average_pos().y *height,fl.get_average_pos().z  *(width+height) -((width+height)/2));
      translate(pos);
      
      fill(r.BLANC);
      textSize(24);
      text("Average position fingers",0,0);
      textSize(12);
      fill(r.BLOOD);
      text("my position is " + ivec3(pos),0,12);
      text("my direction is " + fl.get_average_dir(),0,24);
      pop();
    }
  }
}



