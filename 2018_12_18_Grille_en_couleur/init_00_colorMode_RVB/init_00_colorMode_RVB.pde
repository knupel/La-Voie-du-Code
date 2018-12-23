/**
La Voie du Code : Color palette
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_18
*/
void setup() {
	size(640,480);
	colorMode(RGB,255,255,255,255);
	println(g,g.colorModeX,g.colorModeY,g.colorModeZ,g.colorModeA);
}


void draw() {
	int rouge = 30;
	int vert = 100;
	int bleu = 100;
	background(rouge,vert,bleu);
}
