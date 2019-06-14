void show(float amp) {
  for(int i = 0 ; i < ecv.length ; i++) {
    vec3 temp = ecv[i].get_pos();
    temp.mult(amp);
    show_item(i,temp.x(),temp.y(),temp.z());  
  }
}

void show_item(int name, float x, float y, float z) {
  // text(name,x,y,z);
  push();
  translate(x,y,z);
  sphere(5);
  pop();
}
