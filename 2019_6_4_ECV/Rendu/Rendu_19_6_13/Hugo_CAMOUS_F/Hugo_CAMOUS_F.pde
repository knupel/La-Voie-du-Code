import rope.vector.*;
PFont my_font;
PImage img;

ECV ecv [];

void setup() {
  size(1820, 980, P3D);
  //nombre de mots
  int num = 220;
  ecv = new ECV[num];
  
  for (int i = 0; i < ecv.length; i++)  {
    float x = random(-1, 1);
    float y = random(-1, 1);
    float z = random(-1, 1);
    ecv[i] = new ECV(x, y, z);
  }
  
  //police
  my_font = createFont("Segoe UI Semibold Italic", 48);
  textFont(my_font);
  
  //image coeur
  img = loadImage("heart.png");
  img.resize(30, 30);
  
}

vec3 rotation = new vec3();

int count;

void draw() {
  background(#F68AFF);
  
  fill(255);
  rotation.cos_wave(frameCount, .003, .004, .005);
  push();
  
  translate(width/2, height/2);
  rotateX(rotation.x()*1.5);
  rotateY(rotation.y()*1.5);
  rotateZ(rotation.z()*1.5);
  
  //zoom
  float amp = map(mouseX, 100, width/5, 200, 300);
  
  for (int i = 0; i < ecv.length; i++) {
    vec3 temp = ecv[i].getPos();
    temp.mult(amp);

    textSize(22);
    showLetter("M", temp.x(), temp.y(), temp.z());
    textSize(18);
    showLetter("O", temp.x()+10, temp.y()+10, temp.z()+10);
    showLetter("R", temp.x()+20, temp.y()+20, temp.z()+20);
    showLetter("G", temp.x()+30, temp.y()+30, temp.z()+30);
    showLetter("A", temp.x()+40, temp.y()+40, temp.z()+40);
    showLetter("N", temp.x()+50, temp.y()+50, temp.z()+50);
    showLetter("E", temp.x()+60, temp.y()+60, temp.z()+60);
    
    //couleur de chaque mot
    fill((ecv[i].getPos().x())*160, (ecv[i].getPos().y())*160, (ecv[i].getPos().z())*160);
  }
  
  
  pop();
  
  //deformation
  ellipse(mouseX, mouseY, 0, 0);
  PImage source = g;

  boolean on_g = true;
  boolean filter_is = false;
  
  float strength = 4;
  fx_warp_proc(source, on_g, filter_is, strength);
    
  
  
  
  //coeur qui tourne
  int num_gen = (int)map(mouseX, 0, width, 1, 5);
  
  for (int i = 0; i < num_gen; i++) {
    //on divise count pour que le coeur aille moins vite
    generator(count);
    count++;
  }
  
}

//generateur de l'image
void generator(int count) {
  float val_x = sin(count *.05);
  float val_y = cos(count *.05);
  float tx = width/2;
  float ty = height/2;
  float s = mouseY;
  float x = val_x * s;
  float y = val_y * s/2;
  
  image(img, x+tx, y+ty);
}

//fonction pour afficher une lettre
void showLetter(String letter, float x, float y, float z) {
  text(letter, x, y, z);  
}
