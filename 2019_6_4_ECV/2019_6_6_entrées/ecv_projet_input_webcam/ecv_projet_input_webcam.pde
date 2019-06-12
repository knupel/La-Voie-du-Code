/**
* Based on Mirror by Daniel Shiffman. 
*/
import rope.vector.*;

void setup() {
  size(640, 480);
  //set_input_camera(120);
  set_input_camera(12);
  background(0);
}

void draw() { 
  if (cam_available()) {
    background(0,0,255);
    calc_camera();
    println("average hue",average_hue());
    println("average saturation",average_saturation());
    println("average brightness",average_brightness());

    println("average red",average_red());
    println("average green",average_green());
    println("average blue",average_blue());

    println("average rgb",average_rgb());
    println("average hsb",average_hsb());
    
    int target = floor(random(pix_cam().length));
    println("pixel color int",pix_cam()[target]);
  }

  int x = 0;
  int y = 0;
  int cell_size = get_cell_size_cam();
  int offset = cell_size/2;

  for(int which = 0 ; which < pix_cam().length ; which++) {
  	if(which > 0 && which%get_rows_cam() == 0) {
  		x++;
  		y = 0;
  	}
  	
  	int temp_x = x *cell_size + offset;
  	int temp_y = y *cell_size + offset;
  	y++;
  
  	int c = pix_cam()[which];
  	fill(c);
  	noStroke();
  	float normal_bright = brightness(c) / g.colorModeZ;

  	float diam = (normal_bright) * cell_size;

    rect(temp_x,temp_y,diam,diam);
  }
}
