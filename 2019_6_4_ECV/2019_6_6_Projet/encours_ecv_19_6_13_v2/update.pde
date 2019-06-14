void update_position() {
  for(int i = 0 ; i < ecv.length ; i++) {
    vec3 temp = ecv[i].get_pos();
    vec3 motion = new vec3().rand(-1,1).mult(.01);
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
