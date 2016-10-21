import geomerative.*;
// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
boolean newSetting ;

void setup(){
  // Initilaize the sketch
  size(600,400,P3D); frameRate(30); background(noir);
  colorMode(HSB, 360,100,100 ) ;
  colorSetup() ;

  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  //grp = RG.getText("Romanesco", "FreeSans.ttf", 72, CENTER);

  // Choice of colors
  

}

void draw(){
  // Clean frame
  background(noir);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  camera() ;
  beginCamera() ;
  letter() ;
  endCamera() ;
  
  
  
  //info
  // methodGeomerative(whichLetter) ;
}

void letter() {
  if(!newSetting) { 
    grp = RG.getText("Romanesco", "FreeSans.ttf", 110, CENTER); 
    newSetting = true ;
  }
  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);
  
  // Transform at each frame the first letter with a PI/20 radians 
  // rotation around the center of the first letter's center
  float rangeWhichLetter = width / grp.countChildren() ;
  int whichLetter = floor(mouseX / rangeWhichLetter) ;
  if(whichLetter >= grp.countChildren() ) whichLetter = whichLetter -1 ; 
  // int targetLetter = floor(random(grp.countChildren())) ; //the letter rotate around this one
  float rangeTargetLetter = height / grp.countChildren() ;
  int targetLetter = floor(mouseY / rangeTargetLetter) ;
  if(targetLetter >= grp.countChildren() )targetLetter = targetLetter -1 ; 
  float speed = .01 ;
  if(mousePressed) speed = -speed ; else speed = speed ;

  
  
  
  grp.children[whichLetter].rotate(speed, grp.children[targetLetter].getCenter());
  
  // DISPLAY GEOMERATIVE ANALYZE
  fill(orange); noStroke() ;
  //grp.children[whichLetter].draw();
  //grp.draw();
  
  //create a PVector arraylist from geomerative analyze
  RPoint[] pnts = grp.children[whichLetter].getPoints() ; 
  Vec3 [] points = geomerativeFontPoints(pnts)  ;
  noFill() ; stroke(blanc) ;
  for ( int i = 1; i < points.length; i++ ) {
    points[i].jitter(2,2,20) ;
    line( points[i-1].x, points[i-1].y, points[i-1].z,   points[i].x, points[i].y, points[i].z );
  }
}





//void work with geomerative
Vec3 [] geomerativeFontPoints(RPoint[] p) {
  Vec3 [] pts = new Vec3 [p.length] ;
  for(int i = 0 ; i <pts.length ; i++) {
    pts[i] = Vec3(p[i].x, p[i].y, 0 ) ;
    println("Vec3 " + pts[i] + " " +pts.length + " points" ) ;
  }
  return pts ;
}



//INFO
void methodGeomerative(int ID) {
  //give the count of letter
  println(grp.countChildren()) ;
  //give the coordinate of the point letter
}