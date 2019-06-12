import rope.core.*;
import rope.costume.*;
import rope.vector.*;

ECV ecv[];

void setup() {
 size(400,400,P3D); 
 int num = 100;
 ecv = new ECV[num];
 for(int i = 0; i < ecv.length; i++){
  //float x = random(0,300);
  float x = random(-1,1);
  float y = random(-1,1);
  //float y = random(0,300);
  float z = random(-1,1);
  ecv[i] = new ECV(x,y,z);
  println(ecv[i]);
 }
}

vec3 rotation = new vec3();
//add
//PVector [] points = new PVector [ecv.length];
void draw() {
 background(125);
 fill(255);
 if(mousePressed) {
   rotation.sin_wave(frameCount,.01,.02,.03);
 }
 push();
 translate(width/2,height/2);
 rotateX(rotation.x());
 rotateY(rotation.y());
 rotateZ(rotation.z());
 float amp = map(mouseX,0,width,50,200);
 for(int i = 0; i < ecv.length; i++){
   vec3 temp = ecv[i].get_pos();
   temp.mult(amp);
   show(i, temp.x(), temp.y(), temp.z());
   
   
 }
 pop();
 
 /*for(int i = 0; i < points.length; i++){
    points[i] = new PVector(random(-1,1),random(-1,1));
  }*/
  
}


void show(int name, float x, float y, float z){
  //text(name,x, y, z);
  //vertex
  
  // float j = random(0,300);
  float j = 0;
  
  //vertex(0,0,0);
   beginShape();
   
    vertex(x, x, j);
    vertex(25+x, 17.5+x, j);
    vertex(50+x, x, j);
    vertex(35+x, 20+x, j);
    vertex(25+x, 50+x, j);
    vertex(20+x, 20+x, j);
   endShape(CLOSE);
  
}
