/**
La Voie du Code : Color palette
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_18
*/
void setup() {
	size(640,480);
	colorMode(HSB,360,100,100,100);
	int num_x = (int)g.colorModeX;
	int num_y = (int)g.colorModeY;
	float size_x = width/(float)num_x;
	float size_y = height/(float)num_y;

	
	float couleur = 0;
	float blanc = 100;
	float noir = 100;

	for(int x = 0 ; x < num_x ; x ++) {
		couleur ++;
		for(int y = 0 ; y < num_y ; y++) {
      fill(couleur,blanc,noir);
      stroke(couleur,blanc,noir);
      float pos_x = size_x*x;
      float pos_y = size_y*y;
			rect(pos_x,pos_y,size_x,size_y);
		}
	}
}
