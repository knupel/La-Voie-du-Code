/**
 * Grab audio from the microphone input and draw a circle whose size
 * is determined by how loud the audio input is.
 */
import processing.sound.*;
AudioIn input;
Amplitude loudness;

void setup() {
  size(640, 360);
  background(255);

  input = new AudioIn(this,0);
  input.start();
  loudness = new Amplitude(this);
  // Patch the input to the volume analyzer
  loudness.input(input);
}


void draw() {
  float volume = loudness.analyze();
  println("volume",volume);
  int size = int(map(volume, 0,.5, 1,height));

  background(0);
  noStroke();
  fill(255);
  ellipse(width/2, height/2, size, size);
}
