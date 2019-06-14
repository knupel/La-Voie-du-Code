void show(float amp) {
  //fill(255);
  noFill();
  // stroke(255);
  strokeWeight(1);
  for(int i = 0 ; i < ecv.length ; i++) {
    vec3 temp = ecv[i].get_pos();
    temp.mult(amp);
    float alpha = map(temp.z(),-width,width,0,g.colorModeA);
    if(alpha < 0 ) {
      alpha = 0;
    } else if(alpha > g.colorModeA) {
      alpha = g.colorModeA;
    }
    stroke(255,alpha);
    show_item(ecv[i],temp.x(),temp.y(),temp.z());  
  }
}

void show_item(ECV ecv, float x, float y, float z) {
  // text(name,x,y,z);
  push();
  translate(x,y,z);
  // costume(vec3(),ecv.get_size(),HOUSE_ROPE);
  costume(vec3(),ecv.get_size(),SPHERE_LOW_ROPE);
  // sphere(ecv.get_size().x);
  pop();
}
