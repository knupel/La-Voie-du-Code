import rope.vector.*;
ArrayList<vec3>list = new ArrayList<vec3>();

void setup() {
  size(500,500,P3D);
}


void draw() {
  background(0);
  if(keyPressed) {
    vec3 temp = new vec3(random(width),random(height),random(-width,width));
    list.add(temp);
  }
  
  println(list.size());
  
  stroke(255);
  strokeWeight(10);
  /*
  for(int i = 0 ; i < list.size() ; i++) {
    vec3 pts = list.get(i);
    point(pts.x,pts.y,pts.z);
  }
  */
  for(vec3 p : list) {
    point(p.x,p.y,p.z);
  }
}
