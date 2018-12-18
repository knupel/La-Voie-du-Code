void setup() {
	size(640,480);
	colorMode(HSB,360,100,100,100);
	int num_x = 50;
	int num_y = 50;
	float size_x = width/(float)num_x;
	float size_y = height/(float)num_y;
	noStroke();
	for(int x = 0 ; x < num_x ; x ++) {
		for(int y = 0 ; y < num_y ; y++) {
			float couleur = random(g.colorModeX);
			float blanc = g.colorModeY; // 0 est blanc > g.colorModeY(max) est la couleur
			float noir = g.colorModeZ; // 0 est noir > g.colorModeZ(max) est la couleur
      fill(couleur,blanc,noir);
      float pos_x = size_x*x;
      float pos_y = size_y*y;
			rect(pos_x,pos_y,size_x,size_y);
		}
	}
}
