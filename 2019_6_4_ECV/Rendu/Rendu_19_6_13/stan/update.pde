void update_position() {
  for(int i = 0 ; i < ecv.length ; i++) {
    vec3 temp = ecv[i].get_pos();
    vec3 temp_dir = ecv[i].get_dir().copy();
    float speed = 1.0 / ecv[i].get_speed();
    vec3 motion = temp_dir.mult(speed);
    // vec3 motion = temp_dir.mult(ecv[i].get_speed());
    //println(motion);
    temp.add(motion);


    
    if(temp.x() < -1) {
      temp.x(1);
    }

    if(temp.y() < -1) {
      temp.y(1);
    }

    if(temp.z() < -1) {
      temp.z(1);
    }

    if(temp.x() > 1) {
      temp.x(-1);
    }

    if(temp.y() > 1) {
      temp.y(-1);
    }

    if(temp.z() > 1) {
      temp.z(-1);
    }
    
    ecv[i].set_pos(temp);
  }
}
