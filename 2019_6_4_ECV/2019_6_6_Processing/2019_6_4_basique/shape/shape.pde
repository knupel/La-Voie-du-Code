void setup() {
  size(500,500);
  fill(255,0,0);
  stroke(0);
  strokeWeight(4);
  beginShape();
  vertex(random(width),random(height));
  vertex(random(width),random(height));
  vertex(random(width),random(height));
  endShape();
}
