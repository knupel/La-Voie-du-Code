void background_perso(float v) {
	background_perso(v,v,v,g.colorModeA);
}

void background_perso(float v, float a) {
	background_perso(v,v,v,a);
}
void background_perso(float x, float y , float z, float a) {
	noStroke();
	fill(x,y,z,a);
	rect(0,0,width,height);
}