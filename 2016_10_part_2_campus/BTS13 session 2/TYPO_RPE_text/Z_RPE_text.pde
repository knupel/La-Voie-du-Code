/**
RPE_text 0.0.5
RPE_text 2016-2016
Romanesco Processing Environment // 2015 – 2016
* @author Stan le Punk
* @see https://github.com/StanLepunK/RPEtext
* inspireted by Processing Core PGraphics part
*/
/**
global var for RPE_text
*/
import geomerative.*;
boolean vertex_char = false ;
String RPE_text_path_font ; 
int spacing_rpe_text = 2 ;

boolean init_geomerative ;
boolean init_RPE_text_vertex ;

// boolean mode
boolean rpe_text_point ;
boolean rpe_text_vertex ;

Letter [] letter_sequence ;
RShape [] R_letter ;
int [] rpe_text_spacing ;
int [] rpe_text_baseline ;
int [] rpe_text_frontback ;


String ref_sentence = "" ;
int ref_space ;
int ref_size ;

PFont rpe_text_font  ;


/**
public method
*/
/**
choice rendering vertex or glyph
*/
void RPE_text_vertex(boolean vertex_char) {
	this.vertex_char = vertex_char ;
}

/**
num point by glyph in vertex mode
*/
void RPE_text_glyph_point(int space) {
	this.spacing_rpe_text = space ;
}

/**
spacing
*/
void  RPE_text_spacing(boolean loop, float... spacing) {
  if(letter_sequence != null) RPE_text_spacing(0, letter_sequence.length,loop,  spacing) ;
}

void  RPE_text_spacing(int entry, boolean loop, float... spacing) {
  if(letter_sequence != null) RPE_text_spacing(entry, letter_sequence.length, loop, spacing) ;
}
void RPE_text_spacing( int entry, int exit, boolean loop, float... spacing) {
	if(letter_sequence != null) {
		if(rpe_text_spacing == null) {
			rpe_text_spacing = new int[letter_sequence.length] ;
		}
		if(spacing != null) pos_letter_modification(entry, exit, loop, rpe_text_spacing, spacing) ;
	}
}

/**
baseline
*/
void  RPE_text_baseline(boolean loop, float... baseline) {
  if(letter_sequence != null) RPE_text_baseline(0, letter_sequence.length, loop, baseline) ;
}

void  RPE_text_baseline(int entry, boolean loop, float... baseline) {
  if(letter_sequence != null) RPE_text_baseline(entry, letter_sequence.length, loop, baseline) ;
}

void RPE_text_baseline(int entry, int exit, boolean loop, float... baseline) {
	if(letter_sequence != null) {
		if(rpe_text_baseline == null) {
			rpe_text_baseline = new int[letter_sequence.length] ;
		}
		if(baseline != null) pos_letter_modification(entry, exit, loop, rpe_text_baseline, baseline) ;
	}
}

/**
front back for the P3D mode
*/
void  RPE_text_frontback(boolean loop, float... frontback) {
  if(letter_sequence != null) RPE_text_frontback(0, letter_sequence.length, loop, frontback) ;
}

void  RPE_text_frontback(int entry, boolean loop, float... frontback) {
  if(letter_sequence != null) RPE_text_frontback(entry, letter_sequence.length, loop, frontback) ;
}

void RPE_text_frontback(int entry, int exit, boolean loop, float... frontback) {
	if(letter_sequence != null) {
		if(rpe_text_frontback == null) {
			rpe_text_frontback = new int[letter_sequence.length] ;
		}
		if(frontback != null) pos_letter_modification(entry, exit, loop, rpe_text_frontback, frontback) ;
	}
}




/**
TEXT DISPLAY
*/

void RPE_text(String sentence, float x, float y) {
	RPE_text(sentence, x, y, 0) ;
}

void RPE_text(String sentence, float x, float y, float z) {
	// vertext part
	if(vertex_char) {
		rpe_text_init(sentence) ;
		text_vertex_build(sentence) ;
	}

	float pos_char = 0 ;
	String [] split = sentence.split("") ;
	char [] char_set = new char[split.length] ;
	for(int i = 0 ; i < split.length ; i++) {
		char_set[i] = split[i].charAt(0) ;
	}
	pos_char(char_set, 0, split.length, x, y, z) ;

}

/**
text font
*/
void RPE_text_font(String path_font_name, int size) {
	RPE_text_path_font = path_font_name ;
	rpe_text_font = createFont(RPE_text_path_font, size) ;
	textFont(rpe_text_font) ;
	textSize(size) ;
	ref_size = size ;
}
/**
GET
*/
PFont getFont_rpe_text() {
	return rpe_text_font ;
}

int getSize_rpe_txt() {
	return ref_size ;
}


/**
mode
*/
void RPE_text_mode_point() {
	rpe_text_point = true ;
	rpe_text_vertex = false ;


}
void RPE_text_mode_vertex() {
	rpe_text_vertex = true ;
	rpe_text_point = false ;
}
/**
wave
*/
void RPE_text_effect_wave(boolean loop, float speed, int... amplitude_max) {
  RPE_text_effect_wave(0, letter_sequence.length, loop, speed, amplitude_max) ;
}

void RPE_text_effect_wave(int entry, boolean loop, float speed, int... amplitude_max) {
  RPE_text_effect_wave(entry, entry +amplitude_max.length, loop, speed, amplitude_max) ;
}

void RPE_text_effect_wave(int entry, int exit, boolean loop, float speed, int... amplitude_max) {
  int index = 0 ;
  if(loop && entry > exit) {
    exit = letter_sequence.length ;
  }
  if(exit > letter_sequence.length) {
    exit = letter_sequence.length ;
  }
  
  for(int i = entry ; i < exit ; i++) {
    if(index < amplitude_max.length) {
      rpe_wave_letter(letter_sequence[i], speed, amplitude_max[index]) ;
    }
    index++ ;
    if(amplitude_max.length <= index && loop) {
      index = 0 ;
    } else if(!loop && index > amplitude_max.length -1 ) {
      index = amplitude_max.length ;
    }
	}
}
 
  


/**
cloud
*/
void RPE_text_effect_cloud(boolean loop, Vec... amp) {
  RPE_text_effect_cloud(0, letter_sequence.length, loop, amp) ;
}

void RPE_text_effect_cloud(int entry, boolean loop, Vec... amp) {
  RPE_text_effect_cloud(entry, entry +amp.length, loop, amp) ;
}

void RPE_text_effect_cloud(int entry, int exit, boolean loop, Vec... amp) {
	create_font_point(ref_sentence, spacing_rpe_text, ref_size, false) ;
  int index = 0 ;
  if(loop && entry > exit) {
    exit = letter_sequence.length ;
  }
  if(exit > letter_sequence.length) {
    exit = letter_sequence.length ;
  }
  
  for(int i = entry ; i < exit ; i++) {
    if(index < amp.length) {
      if(amp[index] instanceof Vec3) {
        Vec3 v = (Vec3)amp[index] ;
        rpe_cloud_letter(letter_sequence[i], (int)v.x, (int)v.y, (int)v.z) ;
      } else if(amp[index] instanceof Vec2) {
        Vec2 v = (Vec2)amp[index] ;
        rpe_cloud_letter(letter_sequence[i], (int)v.x, (int)v.y, 0) ;
      }
    }
    index++ ;
    if(amp.length <= index && loop) {
      index = 0 ;
    } else if(!loop && index > amp.length -1 ) {
      index = amp.length ;
    }
  }
}




















/**
TEXT POSITION

*/



void pos_char(char[] chars, int start, int stop, float x, float y, float z) {
  int index = 0;
  while (index < stop) {
    if (chars[index] == '\n') {
      textLineAlignImpl(chars, start, index, x, y, z);
      start = index + 1;
      y += g.textLeading;
    }
    index++;
  }
  if (start < stop) { 
    textLineAlignImpl(chars, start, index, x, y, z);
  }
}




void textLineAlignImpl(char buffer[], int start, int stop, float x, float y, float z) {
	if (g.textAlign == CENTER) {
    x -= textWidthImpl(buffer, start, stop) / 2f;
  } else if (g.textAlign == RIGHT) {
    x -= textWidthImpl(buffer, start, stop);
  }
  
  int spacing = 0 ;
  for (int index = start; index < stop; index++) {
    text_letter_impl(buffer[index], index, x, y, z);
    // spacing modification
    if(rpe_text_spacing != null) {
    	if(index < rpe_text_spacing.length) {
    		spacing = rpe_text_spacing[index] ;
    	}
    }
    x += (textWidth(buffer[index]) +spacing);
  }
}

float textWidthImpl(char buffer[], int start, int stop) {
	float wide = 0;
	for (int i = start; i < stop; i++) {
	  // could add kerning here, but it just ain't implemented
	  wide += g.textFont.width(buffer[i]) * g.textSize;
	}
	return wide;
}



void text_letter_impl(char ch, int index, float x, float y, float z) {
	PFont.Glyph glyph = g.textFont.getGlyph(ch);
	if (glyph != null) {
		if (g.textMode == MODEL) {
			// add this security to kkep the ggod position of the letter
			// because I cannot fint the bug add a mess in the letter position
			int alignment = g.textAlign ;
			if (g.textAlign == CENTER || g.textAlign == RIGHT) {
				g.textAlign = LEFT ;
			}
			// baseline
			if(rpe_text_baseline != null) y -= rpe_text_baseline[index] ;
			// frontback
			if(rpe_text_frontback != null) z -= rpe_text_frontback[index] ;

			if(!vertex_char) {
				if(renderer_P3D()) {
					matrix_start() ;
					Vec3 pos = Vec3(x,y,z) ;
					translate(pos) ;
					text(ch, 0, 0) ;
					matrix_end() ;
				} else {
					text(ch, x, y) ;
				}
			} else if(vertex_char) {
				Vec3 pos = Vec3(x,y,z) ;
				text_vertex_show(index, pos) ;
			}
			g.textAlign = alignment ;
		}
	} else if (ch != ' ' && ch != 127) {
		g.showWarning("No glyph found for the " + ch + " (\\u" + PApplet.hex(ch, 4) + ") character");
	}
}




/**
modification
*/

void pos_letter_modification(int entry, int exit, boolean loop, int [] pos_final_array, float... modification) {
  int index = 0 ;
  if(loop && entry > exit) {
    exit = letter_sequence.length ;
  }
  if(exit > letter_sequence.length) {
    exit = letter_sequence.length ;
  }
  
  for(int i = entry ; i < exit ; i++) {
    pos_final_array[i] = (int)modification[index] ;
    index++ ;
    if(modification.length <= index && loop) {
      index = 0 ;
    } else if(!loop && index > modification.length -1 ) {
      index = modification.length -1 ;
    }
  }
}

/**
effect cloud
*/
void rpe_cloud_letter(Letter letter, int amp_x, int amp_y, int amp_z) {
  if(letter != null) {
    for(int i = 0 ; i < letter.pos.length ; i++) {
      Vec3 cloud = Vec3("RANDOM", amp_x, amp_y, amp_z) ;
      Vec3 ref = Vec3(letter.pos[i]) ;
      letter.pos[i].set(ref.add(cloud)) ;
    }
  }  
}

/**
effect wave for P3D
*/
void rpe_wave_letter(Letter letter, float speed, int amplitude_max) {
	if(letter != null) {
		float amplitude = 0 ;
		float step = amplitude_max / letter.pos.length  ;
    for(int i = 0 ; i < letter.pos.length ; i++) {
	    float wave = sin((frameCount + i) *speed) * (amplitude_max /2)  ;
	    amplitude =  i *step +wave ;
	    letter.pos[i].set(letter.pos[i].x, letter.pos[i].y, amplitude) ;
	  }
	}	
}








/**
SHOW VERTEX FONT

*/


void text_vertex_show(int which_one, Vec3 pos) {
	if(which_one < letter_sequence.length && letter_sequence[which_one] != null) {
		matrix_start() ;
		translate(pos) ;
		if(rpe_text_vertex) display_letter_vertex(letter_sequence[which_one]) ;
		if(rpe_text_point) display_letter_point(letter_sequence[which_one]) ;
		matrix_end() ;
	}
}














/**
CREATE VERTEX FONT

It's necessary to don't use GEOMERATIVe in the future
*/



void rpe_text_init(String sentence) {
	if(ref_size != (int)g.textSize) init_RPE_text_vertex = false ;

	if(!init_geomerative) {
		init_geomerative = true ;
		RG.init(this); 
	}


	if(!init_RPE_text_vertex && RPE_text_path_font != null) {
		init_RPE_text_vertex = true ;
		int size_font = (int)g.textSize ;
		createFont(RPE_text_path_font, size_font) ;
		if(size_font < 60) {
			println("Becareful you size font is under 60, may be the definition can be uggly!") ;
		}

		String [] s = sentence.split("") ;
		if(letter_sequence == null) letter_sequence = new Letter[s.length] ;
		if(R_letter == null) R_letter = new RShape[s.length] ;

		for(int i = 0 ; i < R_letter.length ; i++) {
			R_letter[i] = RG.getText(s[i], RPE_text_path_font, size_font, g.textAlign) ;
		}
		
	} else if (RPE_text_path_font == null) {
		println("The font path is crazy or may be null, same player Font again !") ;
	} 
}



void text_vertex_build(String sentence) {
  create_font_point(sentence, spacing_rpe_text, (int)g.textSize, init_RPE_text_vertex) ;
}






void create_font_point(String sentence, int space, int size, boolean init) {
  if(sentence != ref_sentence || space != ref_space || size != ref_size || !init) {
  	ref_sentence = sentence ; 
  	ref_space = space ;
  	ref_size = size ;
  	if(init_RPE_text_vertex) {
			RG.setPolygonizer(RG.ADAPTATIVE);
			RG.setPolygonizer(RG.UNIFORMLENGTH);
			// liste des lettres
			float pos_x_next_letter = 0 ;
			String [] s = sentence.split("") ;
			RPoint[] points;
			for(int i = 0 ; i < letter_sequence.length ; i++) {
				pos_x_next_letter += width_String(g.textFont, s[i], size) ;
				if(points(R_letter[i], space) != null ) {
					points = points(R_letter[i], space).clone();
					letter_sequence[i] = letter_build(points) ;
				}
			}
		} else {
			println("The init fail, is not possible to continue on this way my friend.") ;
		}
	}
}


Letter letter_build(RPoint[] points) {
	Letter l = new Letter() ;
	if(points != null){
		Vec3 [] temp_pos = new Vec3[points.length] ;
		for(int i=0; i < points.length; i++) {
			float pos_z = 0 ;
			temp_pos[i] = Vec3(points[i].x, points[i].y, pos_z) ;
		}
		l.set(temp_pos) ;
	}
	return l ;
}




// local
RPoint[] points(RShape myObj, int space) {
  RPoint[] pts ;
  RG.setPolygonizerLength(space);
  pts = myObj.getPoints();
  if(pts == null ) {
    return null ;
  } else {
    return pts ;
  }
}











/**
Display letter
*/

// local method for different display
void display_letter_vertex(Letter letter) {
  beginShape() ;
  for(int i = 0; i < letter.pos.length ; i++){
    vertex(letter.pos[i]) ;
  }
  endShape() ;
}

void display_letter_point(Letter letter) {
  for(int i = 0; i < letter.pos.length ; i++){
    point(letter.pos[i]) ;  
  }
}





/**
class Letter


*/


class Letter {
  Vec3 [] pos ;
  // constructor
  Letter() {
  	pos = null ;
  } 
  
  Letter(Vec3 [] pos) {
    this.pos = pos.clone() ;
  }
  
  void set(Vec3 [] pos) {
    this.pos = pos.clone() ;
  }
}