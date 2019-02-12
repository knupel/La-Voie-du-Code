/**
La Voie du Code : basic of the day
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_2_12
*/

void setup() {
	colorMode(RGB,1,1,1,1);

}

int count;
void draw() {
	frameRate(6);
	count++;
	// println(" ");
	println("modulo",count%10);
	println("sin",sin(count *.1));
	println("cos",cos(count *.1));
	println("mouse",mouseX,mouseY);
	println("frame count",frameCount);
	println("frame rate",(int)frameRate);
	println("color environment",g.colorModeX,g.colorModeY,g.colorModeZ,g.colorModeA);
	println("key pressed", keyPressed);
	println("mouse pressed",mousePressed);
}

void keyPressed() {
	if(key == 'n') {
		println("n");
	}

	if(key == 'N') {
		println("N");
	}

	if (key == CODED) {
    if (keyCode == UP) {
    	println("UP");
    }
  }
}


