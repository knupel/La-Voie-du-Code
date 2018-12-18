class Pixel {
	// parameter
	float x = 0;
	float y = 0;

	float cx = 0;
	float cy = 0;
	float cz = 0;

	float w =1;
	float h =1;

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

	void set_size(float w, float h) {
		this.w = w;
		this.h = h;
	}
}