void draw() {
  float rx = sin(frameCount * 0.1);
  float ry = sin(frameCount * 0.1);

  float min = 10;
  float max = 50;
  float vx = map(rx,-1,1,min,max);
  float vy = map(ry,-1,1,min,max);
  println("x",rx,vx);
  println("y",ry,vy);
}
