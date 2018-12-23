/**
La Voie du Code : Color palette
@see https://github.com/StanLepunK/La-Voie-du-Code
2018_12_18
*/
void setup() {
	size(640,480);
	int num_x = 3;
	int num_y = 3;
	int size_x = width/num_x;
	int size_y = height/num_y;
	noStroke();
	for(int x = 0 ; x < num_x ; x ++) {
		for(int y = 0 ; y < num_y ; y++) {
      if((x+y)%2 == 0) {
      	fill(255);
      } else {
      	fill(0);
      }
      int pos_x = size_x*x;
      int pos_y = size_y*y;
			rect(pos_x,pos_y,size_x,size_y);
		}
	}
}


