import rope.vector.*;

import processing.sound.*;
AudioIn in;
Amplitude loudness;

ArrayList<vec3>list = new ArrayList<vec3>();

void setup() {
  size(500,500,P3D);
  // in
  in = new AudioIn(this,0);
  in.start();
  // volume
  loudness = new Amplitude(this);
  loudness.input(in);
}

void draw() {
  background(255,0,0);
  float volume = loudness.analyze();
  if(volume > .3) {
    vec3 temp = new vec3(random(width),random(height),random(-width,width));
    list.add(temp);
  }
  
  // strokeWeight(2);
  //stroke(0);
  noStroke();
  fill(255,g.colorModeA*.3);
  beginShape();
  for(vec3 v : list) {
    vertex(v.x(),v.y(),v.z());
  }
  endShape(CLOSE);
  
}
