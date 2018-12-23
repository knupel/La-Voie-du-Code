/**
La Voie du Code : Color palette
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_18
*/
void setup() {
	size(640,480);
	colorMode(HSB,360,100,100,100);
	float couleur_x = random(g.colorModeX);
	float couleur_y = 100;
	float couleur_z = 100;
	background(couleur_x,couleur_y,couleur_z);
}


