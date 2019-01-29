/**
La Voie du Code : Mouvement
@see https://github.com/StanLepunK/La-Voie-du-Code
2019_1_29
*/
Heros heros;
PImage img;
boolean reset_is = true;
void setup() {
  size(500,500);
  heros = new Heros(random(width),random(height));
  heros.set_direction(random(-PI,PI));
  heros.set_vitesse(6);
  img = loadImage("small_dame_hermine.jpg");
  surface.setSize(img.width,img.height);

}

void draw() {
  if(reset_is) {
    reset();
  }

  PVector mouse = new PVector(mouseX,mouseY);

  // int c = img.get((int)heros.get_position().x,(int)heros.get_position().y);
  int c = img.get(mouseX,mouseY);
  float distance = heros.get_position().dist(mouse);
  distance = map(distance,0,width,5,100);
  stroke(c);
  strokeWeight(distance);
  heros.update();

  point(heros.get_position().x,heros.get_position().y);
  

  // suivre
  float angle = angle(mouse,heros.get_position());
  heros.set_direction(angle +PI);


  // change direction aux limites de la fenêtre
  float direction = heros.get_direction();
  if(heros.get_position().x >= width || heros.get_position().x <= 0) {
    direction = PI - direction;
    heros.set_direction(direction);
  }
  
  if(heros.get_position().y >= height || heros.get_position().y <= 0) {
    direction = -direction;
    heros.set_direction(direction);
  }
}

void keyPressed() {
  if(key == 'n') reset_is = true;
}

void reset() {
  background(img);
  println(frameCount);
  heros.set_position(random(width),random(height));
  reset_is = false;
}



