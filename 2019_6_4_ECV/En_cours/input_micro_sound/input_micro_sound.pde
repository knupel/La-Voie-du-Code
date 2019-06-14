import processing.sound.*;
import rope.vector.*;
FFT fft;
int bands = 16;
float[] sum = new float[bands];
float bar_width;

AudioIn in;

Amplitude loudness;

void setup() {
  size(300,300);
  // in
  in = new AudioIn(this,0);
  in.start();
  // volume
  loudness = new Amplitude(this);
  loudness.input(in);
  // spectre
  fft = new FFT(this, bands);
  fft.input(in);
  bar_width = width / bands;
}


void draw() {
  
  // volume
  float volume = loudness.analyze();
  volume = map(volume,0,.3,0,g.colorModeX);
  background(volume);
  
  // spectre
  fill(255,0,0);
  fft.analyze();
  float smooth_factor = 0.2;
  for(int i = 0 ; i < fft.spectrum.length ; i++) {
    
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
    // float bar_height = fft.spectrum[i] *1000;
    float bar_height = sum[i] *1000;
    float x = i *bar_width;
    float y = height/2;
    float sx = bar_width;
    float sy = bar_height;
    rect(x,y,sx,sy);
    //println("spectre",i,fft.spectrum[i] *1000);
  }

  
  
}
