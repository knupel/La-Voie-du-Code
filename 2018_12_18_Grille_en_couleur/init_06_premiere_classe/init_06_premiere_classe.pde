void setup() {
	size(300,300);
}

Pixel pixel = new Pixel();
void draw() {
	background(0);
	pixel.set_position(mouseX,mouseY);
	pixel.set_color(255,0,0);
  
  fill(pixel.cx,pixel.cy,pixel.cz);
	ellipse(pixel.x,pixel.y,50,50);




}



class Pixel {
	// parameter
	float x = 0;
	float y = 0;

	float cx = 0;
	float cy = 0;
	float cz = 0;

	// constructor
	Pixel() {}
  
  // method
	void set_position(float x, float y) {
		this.x = x;
		this.y = y;
	}

	void set_color(float cx, float cy, float cz) {
		this.cx = cx;
		this.cy = cy;
		this.cz = cz;
	}
}