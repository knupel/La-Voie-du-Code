

void setup() {
  size(640, 360);
  background(255);
  sound_setup();
  minim_setup();


}


void draw() {
  sound_draw();
  minim_draw();


  background(0);
  noStroke();
  fill(255);
  ellipse(width/3, height/2, size_sound, size_sound);
  fill(255,0,0);
  ellipse(width-(width/3), height/2, size_minim, size_minim);
}


import ddf.minim.*;
Minim minim;
AudioInput in;
void minim_setup() {
  minim = new Minim(this);
  in = minim.getLineIn();
}

float size_minim = 0 ;
void minim_draw() {
  // println("mix", in.mix.level()*100);
  // println("left", in.left.level()*100);
  // println("right", in.right.level()*100);
  
  float volume = in.mix.level();
  size_minim = int(map(volume, 0,.5, 1,height));
}



import processing.sound.*;
AudioIn input;
Amplitude loudness;
void sound_setup() {
  input = new AudioIn(this,0);
  input.start();
  loudness = new Amplitude(this);
  loudness.input(input);
}


float size_sound = 0 ;
void sound_draw() {
  float volume = loudness.analyze();
  size_sound = int(map(volume, 0,.5, 1,height));
}
