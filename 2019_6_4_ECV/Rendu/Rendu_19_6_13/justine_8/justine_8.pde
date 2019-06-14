import rope.core.*;
import rope.costume.*;
import rope.vector.*;

//Sound
import processing.sound.*;
FFT fft;
int bands = 32;
float[] sum = new float[bands];
float bar_width;
AudioIn in;
Amplitude loudness;

//Générateur de couleur
float mycolor_x = random(1.4,2);
float mycolor_y = random(1.4,2);
float mycolor_z = random(1.4,2);

ECV ecv[];

void setup() {
 size(400,400,P3D); 
 int num = 100;
 ecv = new ECV[num];
 for(int i = 0; i < ecv.length; i++){
  float x = random(-1,1);
  float y = random(-1,1);
  float z = random(-1,1);
  ecv[i] = new ECV(x,y,z);
 }
 
 //Son
 in = new AudioIn(this,0);
 in.start();
 //volume
 loudness = new Amplitude(this);
 loudness.input(in);
  
 //spectre
 fft = new FFT(this, bands);
 fft.input(in);
 bar_width = width / bands;
}

vec3 rotation = new vec3();
float rot_x, rot_y;
float strenght;


void draw() {
 background(125);
 fill(255);  
 rotation.sin_wave(frameCount,.01,.02,.03);
 

 
 
 push();
 translate(width/2,height/2);
 rotateX(rotation.x());
 rotateY(rotation.y());
 rotateZ(rotation.z());
 
 //Son - Amplitude en fonction du volume sonore
 float volume = loudness.analyze();
 float amp = map(volume*500,0,width,50,200);
 
 //spectre
  fft.analyze();
  for(int j = 0; j<fft.spectrum.length;j++){
    vec3 temp = ecv[j].get_pos(); 
    temp.mult(amp);
   
    float smooth_factor = 0.1;
    sum[j] += (fft.spectrum[j] - sum[j]) * smooth_factor;
    float bar_height = sum[j]*100000;
    rot_x += rot_x+j;
    rot_y += rot_y+j;
    rot_x = map(rot_x,0,fft.spectrum.length,0,PI);
    rot_y = map(rot_x,0,fft.spectrum.length,0,PI);
    show(bar_height, temp.x(), temp.y(), temp.z(), rot_x, rot_y, mycolor_x, mycolor_y, mycolor_x);  
  }
 
 pop();
 
 //filtre warp
 warp();
  
}


void show(float couleur, float x, float y, float z, float rx,float ry, float mycolor_x, float mycolor_y, float mycolor_z){  
  
  push();
   rotateY(ry);
   rotateX(rx);
   beginShape();
     fill(couleur*mycolor_x, couleur*mycolor_y, couleur*mycolor_z);
     vertex(x, y, z);
     vertex(25+x, 17.5+y, z);
     vertex(50+x, y, z);
     vertex(35+x, 20+y, z);
     vertex(25+x, 50+y, z);
     vertex(20+x, 20+y, z);
   endShape(CLOSE);
  pop();
   
    
}

//filtre warp
void warp(){
 PImage source = g;
 boolean on_g = true;
 boolean filter_is = true;
    
 if(mousePressed || keyPressed){
   strenght = mouseX;
 }
 fx_warp_proc(source, on_g, filter_is, strenght);
}
