// import vec from './Z_vec'
// import vec2 from './Z_vec2'
// import vec3 from './Z_vec3'
// import vec4 from './Z_vec4'

import vec from './vector/Z_vec'
import vec2 from './vector/Z_vec2'
import vec3 from './vector/Z_vec3'
import vec4 from './vector/Z_vec4'



var sketch = (p: p5) => {

  p.preload = () => {

  }
  // setting 
  p.setup = () => {
    // p.createCanvas(p.windowWidth, p.windowHeight); > that create a bug at the beginning
    p.createCanvas(p.windowWidth, p.windowHeight, p.WEBGL);

    w = p.windowWidth;
    h = p.windowHeight;
    cell_x = w / cols;
    cell_y = h / rows;
    let offset_x:number = cell_x / 2;
    let offset_y:number = cell_y / 2;
    let offset = new vec2(w/2,h/2);
    for(let y:number = 0 ; y < rows ; y++) {
      for(let x:number = 0 ; x < cols ; x++) {   
        var temp = new vec2(x *cell_x +offset_x,y *cell_y +offset_y);
        temp.sub(offset.x(),offset.y());
        list.push(temp);
      }
    }    
  }

  p.windowResized = () => {
    p.createCanvas(p.windowWidth, p.windowHeight, p.WEBGL);
    w = p.windowWidth;
    h = p.windowHeight;
  }
  
  
  let count = 0;
  p.draw = () => {
    p.background(255,255,0);
    
 
    if(count >= list.length) {
      count = 0;
    }
    
    for(let i = 0 ; i < list.length ; i++) {
      p.strokeWeight(5);
      p.point(list[i].x(),list[i].y());
      p.strokeWeight(1);

      // condition to move the point
      if(i == count) {
        let alt_y : number = p.sin(p.frameCount *.01) *(cell_y*3);
        list[i].set_y(list[i].y() + alt_y);
        let alt_x;
        if(key_pressed) {
          alt_x = p.sin(p.frameCount *.02) *(cell_x*3);
        } else {
          let amp : number = cell_x *5;
          alt_x = p.random(-amp,amp);
        }
        list[i].set_x(list[i].x() + alt_x);
      }
      
      let target_a : number = i;
      let a = new vec2(list[target_a].x(),list[target_a].y());
      let target_b = target_a +1;
      if(target_b == list.length) {
        target_b = 0;
      }
      let b = new vec2(list[target_b].x(),list[target_b].y());
      // condition to link the points
      if(i%cols != cols-1) {
        p.line(a.x(),a.y(),b.x(),b.y());
      }
    }
    count++;

  }

  p.keyPressed = () => {
    key_pressed = true;
  }


  p.keyReleased = () => {
    key_pressed = false;
  }
}

// var sketchP = new p5(sketch);

var test = new p5(sketch);

let w : number = 0;
let h : number = 0;


var list = new Array<vec2>();
let cols : number = 30;
let rows : number = 30;
let cell_x : number = 0 ;
let cell_y : number = 0 ;
var key_pressed : boolean = false;








