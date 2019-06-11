import processing.video.*;

// Size of each cell in the grid
int cell_size_cam = 2;
// Number of columns and rows in our system
int cols_cam;
int rows_cam;
// Variable for capture device
Capture camera;

int [] pix_cam;
int num_cell_cam ; 

boolean cam_available() {
  return camera.available();
}

int get_cols_cam() {
  return cols_cam;
}


int get_rows_cam() {
  return rows_cam;
}

int get_cell_size_cam() {
  return cell_size_cam;
}




void set_input_camera(int size_cells) {
  rectMode(CENTER);
    // Set up columns and rows
  cell_size_cam = size_cells;
  cols_cam = width / cell_size_cam;
  rows_cam = height / cell_size_cam;
  num_cell_cam = cols_cam*rows_cam;
  pix_cam = new int[num_cell_cam];
  camera = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  camera.start(); 
}

vec3 average_cam_hsb = new vec3();
vec3 average_cam_rgb = new vec3();

float average_red = 0;
float average_green = 0;
float average_blue = 0;

void calc_camera() {
  camera.read();
  camera.loadPixels();
  // Begin loop for columns
  average_cam_hsb.set(0);
  average_cam_rgb.set(0);
  int count = 0;
  //average_bright = 0;
  for (int i = 0 ; i < cols_cam; i++) {
    for (int j = 0 ; j < rows_cam; j++) {
      int x = i * cell_size_cam;
      int y = j * cell_size_cam;
      int loc = (camera.width - x - 1) + y*camera.width; // Reversing x to mirror the image

      // Each rect is colored white with a size determined by brightness
      int c = camera.pixels[loc];
      pix_cam[count] = c;
      float normal_hue = hue(c) / g.colorModeX;
      float normal_sat = hue(c) / g.colorModeY;
      float normal_bright = brightness(c) / g.colorModeZ;
      float normal_red = red(c) / g.colorModeX;
      float normal_green = green(c) / g.colorModeY;
      float normal_blue = blue(c) / g.colorModeZ;

      average_cam_hsb.add(normal_hue,normal_sat,normal_bright);
      average_cam_rgb.add(normal_red,normal_green,normal_blue);
      count++;
    }
  }
  average_cam_hsb.div(num_cell_cam);
  average_cam_rgb.div(num_cell_cam);
}

float average_hue() {
  return average_cam_hsb.hue();
}

float average_saturation() {
  return average_cam_hsb.sat();
}

float average_brightness() {
  return average_cam_hsb.bri();
}


float average_red() {
  return average_cam_rgb.red();
}

float average_green() {
  return average_cam_rgb.gre();
}

float average_blue() {
  return average_cam_rgb.blu();
}


vec3 average_rgb() {
  return average_cam_rgb;
}


vec3 average_hsb() {
  return average_cam_hsb;
}

int [] pix_cam() {
  return pix_cam;
}
