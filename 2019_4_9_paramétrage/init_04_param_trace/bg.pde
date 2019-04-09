void background_perso(float g, float a) {
	background_perso(g,g,g,a);
}
void background_perso(float x, float y , float z, float a) {
	noStroke();
	fill(x,y,z,a);
	rect(0,0,width,height);
}