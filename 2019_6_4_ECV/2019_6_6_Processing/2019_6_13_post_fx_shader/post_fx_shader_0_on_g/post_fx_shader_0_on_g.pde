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
	background(0);
	draw_on_g();
  if(keyPressed) {
    filter_on_g();
  }
}

void draw_on_g() {
	vec3 rgb = abs(vec3().sin_wave(frameCount,.01,.02,.03)).mult(g.colorModeX);
	fill(rgb);
	noStroke();
	float size = 10 + abs(sin(frameCount *.05)*50);
	ellipse(mouseX,mouseY,size,size);
}


void filter_on_g() {
	boolean on_g = true; // si c'est vrai, il n'y a pas de PGrapichs renvoyer.
	boolean filter_is = true; // pas utile à supprimer au prochain dev ???
	boolean two_pass = true; // Le flou gaussien est fait de deux passes, une seule est plus rapide mais moins efficace.
	float strength = 1+ (abs(sin(frameCount *.01))*500); // puissance du flou
  ivec2 res = ivec2(); // pas utile à supprimer au prochain dev ???
	fx_blur_gaussian(g,on_g,filter_is,two_pass,res,strength);
}
