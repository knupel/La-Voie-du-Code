class Letter {
  Vec3 [] pos ;
  // constructor
  Letter() {} 
  
  Letter(Vec3 [] pos) {
    this.pos = pos.clone() ;
  }
  
  void set(Vec3 [] pos) {
    this.pos = pos.clone() ;
  }
}