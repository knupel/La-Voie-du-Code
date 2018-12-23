/**
La Voie du Code : Color palette
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_18
*/
Pixel [] pixel;
void setup() {
	size(640,480);
  colorMode(HSB,360,100,100,100);
  int num_x = 30;
  int num_y = 30;
  int total = num_x *num_y;
  pixel = new Pixel[total];

  float size_x = width/(float)num_x;
	float size_y = height/(float)num_y;

	float couleur = 0;
	float blanc = 100;
	float noir = 0;
  int count = 0;
  for(int x = 0 ; x < num_x ; x++) {
  	couleur++;
  	for(int y = 0 ; y < num_y ; y++) {
  		pixel[count] = new Pixel();
  		float pos_x = x *size_x;
  		float pos_y = y *size_y;
  		pixel[count].set_position(pos_x,pos_y);
  		noir = y;
  		pixel[count].set_color(couleur,blanc,noir);
  		count++;
  	}
  }


  for(int i = 0 ; i < pixel.length ; i++) {
  	if(pixel[i] != null) {
  		fill(pixel[i].cx,pixel[i].cy,pixel[i].cz);
  		rect(pixel[i].x,pixel[i].y,size_x,size_y); 		
  	}
  }
}

