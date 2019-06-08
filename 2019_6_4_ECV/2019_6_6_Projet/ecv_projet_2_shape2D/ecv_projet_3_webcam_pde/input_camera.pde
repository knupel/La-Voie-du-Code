import processing.video.*;

// Size of each cell in the grid
int cellSize = 15;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;
void set_input_camera() {
  rectMode(CENTER);
    // Set up columns and rows
  cols = width / cellSize;
  rows = height / cellSize;
    // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start(); 
}

float average_bright = 0;
float average_red = 0;
float average_green = 0;
float average_blue = 0;

void render_camera() {
  video.read();
  video.loadPixels();
  // Begin loop for columns
  average_bright = 0;
  for (int i = 0; i < cols;i++) {
    // Begin loop for rows
    for (int j = 0; j < rows;j++) {
      // Where are we, pixel-wise?
      int x = i * cellSize;
      int y = j * cellSize;
      int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image

      // Each rect is colored white with a size determined by brightness
      color c = video.pixels[loc];
      float normal_bright = brightness(c) / g.colorModeZ;
      float normal_red = red(c) / g.colorModeX;
      float normal_green = green(c) / g.colorModeY;
      float normal_blue = blue(c) / g.colorModeZ;
      average_bright += normal_bright;
      average_red += normal_red;
      average_green += normal_green;
      average_blue += normal_blue;
      float sz = (normal_bright) * cellSize;
      fill(255);
      noStroke();
      rect(x + cellSize/2, y + cellSize/2, sz, sz);
    }
  }
  int num_cell = cols*rows;
  average_bright /= num_cell;
  average_red /= num_cell;
  average_green /= num_cell;
  average_blue /= num_cell;
  // println("average bright",average_bright);
}

float average_brightness() {
  return average_bright;
}

vec3 average_hsb() {
  return new vec3(average_red,average_green,average_blue);
}
