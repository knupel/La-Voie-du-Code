void setup() {
  size(400,400);
}

int variable ;
void draw() {
  variable = variable + 1;
  // variable++;
  // variable += 1;
  if(variable > 255) {
    variable = 0;
  }
  println("le temps qui passe",variable);
}
