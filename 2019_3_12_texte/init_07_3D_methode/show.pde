void show(String [] list) {
  int max = list.length;
  for(int i = 0; i < max ; i++) {
    float couleur = random(g.colorModeX);
    fill(couleur,g.colorModeY,g.colorModeZ);
    float pos_x = random(width);
    float pos_y = random(height);
    float pos_z = map(i,0,max,height/2,-height/2);
    // size
    int size = (int)random(6,64);
    textFont(police(size,keyPressed));
    text(list[i],pos_x,pos_y,pos_z);
  }
}
