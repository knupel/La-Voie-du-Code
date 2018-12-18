void setup() {
	size(640,480);
	colorMode(HSB,360,100,100,100);
	int num_x = (int)g.colorModeX;
	int num_y = (int)g.colorModeY;
	float size_x = width/(float)num_x;
	float size_y = height/(float)num_y;

	
	float couleur = 0;
	float blanc = 100;
	float noir = 0;
	// float step_y = height / (float)num_y; // interresting

  float step_y = (float)num_y / height; // interresting

	for(int x = 0 ; x < num_x ; x ++) {
		couleur ++;
		for(int y = 0 ; y < num_y ; y++) {
			
			if(couleur > g.colorModeX) couleur = 0;
			if(noir > g.colorModeY) noir = 0;
			// noir += step_y; // interesting
			noir = y; // interesting
			// noir = step_y *y; // interesting
			// noir += step_y; // interesting
			// noir ++; // interesting
      fill(couleur,blanc,noir);
      stroke(couleur,blanc,noir);
      float pos_x = size_x*x;
      float pos_y = size_y*y;
			rect(pos_x,pos_y,size_x,size_y);
		}
	}
}
