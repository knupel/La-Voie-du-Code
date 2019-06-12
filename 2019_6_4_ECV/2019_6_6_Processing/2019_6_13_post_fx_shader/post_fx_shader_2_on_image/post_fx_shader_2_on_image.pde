/**
* post fx example shader
* v 0.0.1
* Copyleft (c) 2019-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/
* Processing 3.5.3
* Rope library 0.8.1.26
*/
void setup() {
	size(500,500,P2D);
	background(0);
}


void draw() {
	//draw part
	draw_on_other_pgraphics();

	image(other_g);

  // post fx part
	// g_on_image(g);
	g_on_image(other_g);
}

PGraphics other_g;
void draw_on_other_pgraphics() {
	if(other_g == null) {
		other_g = createGraphics(width,height,P2D);
		other_g.beginDraw();
		other_g.background(0);
		other_g.endDraw();
	}
	vec3 rgb = abs(vec3().sin_wave(frameCount,.01,.02,.03)).mult(g.colorModeX);
	other_g.beginDraw();
	other_g.fill(rgb.red(),rgb.gre(),rgb.blu());
	other_g.noStroke();
	float size = 10 + abs(sin(frameCount *.05)*50);
	other_g.ellipse(mouseX,mouseY,size,size);
	other_g.endDraw();
}


PImage img ;
void g_on_image(PGraphics pg) {
	if(img == null) {
		img = createImage(width/2,height/2,ARGB);
	}
	boolean on_g = false;
	boolean filter_is = true;
	boolean two_pass = true;
	float strength = 1+ (abs(sin(frameCount *.01))*50);

	int x = width/2;
	img.copy(pg,
						0, 0, width, height, 
						0, 0, width/2, height/2);
	img = fx_blur_gaussian(img,on_g,filter_is,two_pass,ivec2(img.width,img.height),strength);
	image(img,0,0);
}


void keyPressed() {
	if(key == 'r') {
		if(other_g != null) {
			other_g.clear();
			background(0);
		}

		if(img != null) {
			img.loadPixels();
			for(int i = 0 ; i < img.pixels.length ; i++) {
				img.pixels[i] = 0;
			}
			img.updatePixels();
		}
	}
}
