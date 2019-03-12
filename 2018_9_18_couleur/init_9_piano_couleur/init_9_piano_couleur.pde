int num = 9;

void setup() {
  size(400,400);
  init_touche();
  init_couleur();
  init_position();
}

void draw() {
  if(mousePressed == false){
    background(0);
  } 
  noStroke();
  int diam = 100;
  for(int i = 0 ; i < num ; i++) {
    fill(couleur[i]);
    ellipse(pos_x[i],pos_y[i],diam,diam);
  }
  
  if(mousePressed == true) {
    souris();
  }
  
  
}

void keyPressed() {
 for(int i = 0 ; i < num ; i ++) {
   if(key == touche[i]) {
     couleur[i] = color(random(255),random(255),random(255));
     pos_x[i] = (int)random(width);
     pos_y[i] = (int)random(height);
   }
 }
 
 // changer la position
 if(key == 'n') init_position();
 if(key == 'c') init_couleur();

}
