/**
* Leap motion implementation
* @see http://stanlepunk.xyz/
* 2014-2019
* v 1.1.0
*/
import com.leapmotion.leap.*; 
com.leapmotion.leap.Controller leap;


class Finger_leap {
  //global
  private float speed = .05 ;
  // Minimum value to accept finger in the count. The value must be between 0 to 1 ;
  private float min_val_count_finger = .95 ; 
  // range value around the first finger to accepted in the finger count 
  private float range_around_first_finger = .2 ;
  //check if the fingers is present or no
  private boolean finger_check;
  private boolean [] finger_visible;
  //for each finger
  private int num;
  private int active_fingers;
  private int [] ID;
  private int [] IDleap;
  private vec3 [] pos;
  private vec3 [] dir;
  private float [] magnitude, roll, pitch, yaw;
  
  // average data
  private vec3 average_pos, average_dir;
  private vec3 add_pos;
  private float range_min = 0; 
  private float range_max = 0;
  private vec3 find_average_pos = vec3();
  
  Finger_leap() {
    leap = new com.leapmotion.leap.Controller();
    init_var();
  }

  private void init_var() {
    if(average_pos == null) {
      average_pos = vec3();
    }
    if(average_dir == null) {
      average_dir = vec3();
    }
    if(add_pos == null) {
      add_pos = vec3();
    }
  }
  
  
  public void update() {
    InteractionBox iBox = leap.frame().interactionBox();
    PointableList obj_num = leap.frame().pointables();
    //check finger
    finger_check = !obj_num.isEmpty();
    // create and init var ;
    num = obj_num.count();
    IDleap = new int[num];
    ID = new int[num];
    active_fingers = 0;
    finger_visible = new boolean [num];
    pos = new vec3[num];
    dir = new vec3[num];
    magnitude = new float [num]; 
    roll = new float [num]; 
    pitch = new float [num]; 
    yaw = new float [num];
    
    // give info to variables for each finger display or not
    for (int i = 0; i < obj_num.count(); i++) {
      
      //initialization
      Pointable object = obj_num.get(i);
      com.leapmotion.leap.Vector normal_pos = iBox.normalizePoint(object.stabilizedTipPosition());
      finger_visible[i] = false;
      
      // catch info
      IDleap[i] = object.id();
      ID[i] = i  ;
      // return normal position value between 0 to 1 
      pos[i] = vec3(normal_pos.getX(),normal_pos.getY(),normal_pos.getZ()) ;
      // return normal direction between - 1 to 1
      dir[i] = vec3(normal_pos.getX() *2 -1.0, normal_pos.getY() *2 -1.0, normal_pos.getZ() *2 -1.0 ) ;
      
      // misc value
      magnitude[i] = normal_pos.magnitude(); 
      roll[i] = normal_pos.roll(); 
      pitch[i] = normal_pos.pitch(); 
      yaw[i] = normal_pos.yaw();
      
      
      //Find average position of all visible fingers
      find_average_position(pos[i],i); 
    }
    // write the result
    average_pos.set(average_pos(add_pos)) ;
    average_dir = vec3(average_pos.x() *2 -1.0, average_pos.y() *2 -1.0,average_pos.z() *2 -1.0) ;
  }
  
  
  
  // ANNEXE
  
  //check if the finger is visible or not
  private void find_average_position(vec3 norm_pos, int whichOne) {
    if(active_fingers < 1) {
      if(norm_pos.z() < min_val_count_finger) {
        add_pos = norm_pos.copy();
        range_min = add_pos.z -range_around_first_finger; 
        range_max = add_pos.z +range_around_first_finger;
        active_fingers += 1 ;
        finger_visible[whichOne] = true ;
      }
    // if there is one finger, we compare if the others are close of the firsts fingers  
    } else {
      // check if the next finger is in the range
      if(norm_pos.z > range_min && norm_pos.z < range_max) {
        // create a range from the average position Z
        range_min = add_pos.z -range_around_first_finger ; 
        range_max = add_pos.z +range_around_first_finger ;
        // check if the finger detected is in the range or not, we must do that because the detection of the finger is not perfect and add finger when the hand is deepness in detector
        // if it's ok we add a visible finger in the count
        // check if the finger detected is in the range or not, we must do that because the detection of the finger is not perfect and add finger when the hand is deepness in detector
        active_fingers += 1 ;
        // if it's ok we add value
        add_pos.add(norm_pos) ;
        // after we divide by 2 because we've added a value at the end of this checking.
        add_pos.div(2) ;
        finger_visible[whichOne] = true ;
      }
    } 
  }
  /**
  set
  */
  void set_speed(float speed) {
    this.speed = speed;
  }

  /**
  get
  */

  public int [] get_ID() {
    return ID;
  }
  public boolean is() {
    return finger_check ;
  }

  public boolean [] visible() {
    return finger_visible;
  }

  public vec3 [] get_pos() {
    return pos;
  }

  public vec3 [] get_dir() {
    return dir;
  }

  public float [] get_mag() {
    return magnitude;
  }

  public float [] get_roll() {
    return roll;
  }

  public float [] get_pitch() {
    return pitch;
  }

  public float [] get_yaw() {
    return yaw;
  }

  public vec3 get_average_pos() {
    return average_pos;
  }

  public vec3 get_average_dir() {
    return average_dir;
  }

  public int get_num() {
    return num ;
  }


  
  
  // Function to calcul the average position and smooth this one
  private vec3 average_pos(vec3 target) {
    /*
    Average position of all visible fingers
    Finalize the calcule, and dodge the bad value
    */
    if(target.x() > 1.0) {
      float val = target.x();
      target.x(val / 2);
      // target.x() /= 2.0 ;
    }
    if(target.y() > 1.0) {
      float val = target.y();
      target.y(val / 2);
      // target.y() /= 2.0 ;
    }
    if(target.z() > 1.0) {
      // target.z() /= 2.0 ;
      float val = target.z();
      target.z(val / 2);
    }
    //smooth the result
    return follow(target, speed) ;
  }
}