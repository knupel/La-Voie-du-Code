import processing.sound.*;
import rope.vector.*;

FFT fft;
int bands = 64;
ArrayList<vec4> list = new ArrayList<vec4>();
PFont ownFont;

AudioIn in;
Amplitude loudness;

void setup() {
  size(700, 700, P3D);
  // in
  in = new AudioIn(this, 0);
  in.start();
  
  // volume
  loudness = new Amplitude(this);
  loudness.input(in);
  
  // spectre
  fft = new FFT(this, bands);
  fft.input(in);
  
  //font
  ownFont = createFont("helvetica", 24);
}

void draw() {
  // volume
  float volume = loudness.analyze();
  background(255);
  
  //Text settings
  fill(0);
  textFont(ownFont);
  text("DENONCE LE BRUIT", width / 3, height / 2);
  
  addingPoints(volume);
  
  for(int i = 0; i < list.size(); i++) {
    vec4 points = list.get(i);
    
    stroke(int(points.w()));
    float strokeSize = generateRandomStrokeSize();
    strokeWeight(10);
    drawPoint(points.x, points.y, points.z);
  }
}

// We add some points to the list if the volume is loud enough
void addingPoints(float volume) {
  if(volume > 0.015) {
    color c = generateRandomColor();
    vec4 temp = new vec4(random(width), random(height), random(-width, width), c);
    list.add(temp);
  }
}

// Return a random stroke size
float generateRandomStrokeSize() {
  return random(30);
}

// return a random color
color generateRandomColor() {
  return color(random(255), random(255), random(255));
}

// Draw a point with x, y, z position
void drawPoint(float x, float y, float z) {
  point(x, y, z);
}
