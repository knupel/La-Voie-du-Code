void setup() {
  size(200,200) ;
  int [] list ;
  list = new int[width] ;
  for(int i = 0 ; i < list.length ; i++) {
    list[i] = i *2 ;
  }
  printArray(list) ;
  
  for(int i = 0 ; i < list.length ; i++) {
    println("lecture via une boucle", list[i]) ;
  }
  
  println("accès direct", list[12]) ;
}