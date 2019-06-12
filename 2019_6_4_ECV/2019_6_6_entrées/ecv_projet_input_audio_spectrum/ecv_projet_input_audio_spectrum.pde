/**
 * show the spectrum input sound from an external input
 */
import processing.sound.*;

FFT fft;
AudioIn input;
Amplitude loudness;
// num band be analysis
// 16 is the minimum
int bands = 16;
// classic smoothing method to show spectrum
float[] sum = new float[bands];
float bar_width;

public void setup() {
  size(640, 360);
  background(255);

  // input
  input = new AudioIn(this,0);
  input.start();
  loudness = new Amplitude(this);

  // divide the window to dispatch the sound bar
  bar_width = width/float(bands);

  fft = new FFT(this, bands);
  fft.input(input);
}





public void draw() {
  background(0);
  fill(255);
  noStroke();
  // show result
  fft.analyze();
  float smooth_factor = 0.2;
  int scale = 5;
  for (int i = 0; i < bands; i++) {
    // Smooth the FFT spectrum
    sum[i] += (fft.spectrum[i] - sum[i]) * smooth_factor;
    // display
    rect(i*bar_width, height, bar_width, -sum[i]*height*scale);
  }
}

