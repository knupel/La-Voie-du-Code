
void setup(){
  size(300,300) ;
} 

int r, g, b ;
void draw() {
  background(r,g,b) ;
  change_couleur_bg() ;

  
  int pos_x = mouseX ;
  int pos_y = mouseY ;
  
  for( int i  = 0 ; i < 10 ; i = i +1 ) {
    int rouge = 255 ;
    int vert =  (int)random(255) ;
    int bleu =  (int)random(255) ;
    int alpha = (int)random(255) ;
    int size_square =  10 *i +5 ;
    aspect(rouge,vert,bleu,alpha) ;
    square(pos_x, pos_y, size_square) ;
    println(i) ;
  }
}