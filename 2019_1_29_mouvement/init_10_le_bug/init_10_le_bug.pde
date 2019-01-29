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


boolean color_effect_is = false;
float angle;
void draw() {
  if(reset_is) {
    reset();
  }
  // background(0);

  heros.update();

  PVector mouse = new PVector(mouseX,mouseY);

  
  // suivre
  // trash fix
  int mx = (int)mouse.x;
  int my = (int)mouse.y;
  int tx = (int)heros.get_absolute_position().x;
  int ty = (int)heros.get_absolute_position().y;
  if(mx == tx && my == ty) {
    println("BOUM",frameCount);
    // angle = angle(mouse,heros.get_absolute_position());
    heros.set_direction(angle+PI);
  } else { 
    println("BIM BAM",frameCount);
    angle = angle(mouse,heros.get_absolute_position());
    heros.set_direction(angle+PI);
  }


  // change direction aux limites de la fenêtre
  float direction = heros.get_direction();
  if(heros.get_absolute_position().x >= width || heros.get_absolute_position().x <= 0) {
    direction = PI - direction;
    heros.set_direction(direction);
  }
  
  if(heros.get_absolute_position().y >= height || heros.get_absolute_position().y <= 0) {
    direction = -direction;
    heros.set_direction(direction);
  }

  // comportement
  float diam = 50;
  // float x = 50;
  // float y = 50;
  
  float x = cos(frameCount *.01)*diam;
  float y = sin(frameCount *.01)*diam;
  
  heros.set_offset(x,y,true);


  // affichage
  if(color_effect_is) {
    int c = img.get(mouseX,mouseY);
    float distance = heros.get_position().dist(mouse);
    distance = map(distance,0,width,5,100);
    stroke(c);
    strokeWeight(distance);
  } else {
    stroke(255);
    strokeWeight(5);
  }
  PVector result = heros.get_position().copy();
  //point(heros.get_position().x,heros.get_position().y);
  point(result.x,result.y);
  // point(mouseX,mouseY);
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



