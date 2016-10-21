/**
UPDATE AGENT 0.0.1
*/
// HERBIVORE
void herbivore(ArrayList<Herbivore> list_h) {
	// var
	int speed_starving = 4 ;
	// remove
	for(Herbivore h : list_h) {
		if(h.life < 0 ) {
			list_h.remove(h) ;
			break ;
		}
	}

	// life of the agent
	for(Herbivore h : list_h) {
	    int radius = h.radius ;
	    // motion
	    h.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
	    h.motion() ;
	    h.set_position() ;
	    // statement
	    h.statement() ;
	    h.hunger(speed_starving) ;
	    // apparence
	    h.aspect(h.radius *2) ;
	    h.costume() ;
	}
}







// CARNIVORE
void carnivore(ArrayList<Carnivore> list_c, ArrayList<Herbivore> list_h) {
	// var
	int speed_starving = 15 ;
	// remove
	for(Carnivore c : list_c) {
		if(c.life < 0 ) {
			list_c.remove(c) ;
			break ;
		}
	}
	

	// life of the agent
	for(Carnivore c : list_c) {
		// motion
		c.motion() ;
		int radius = c.radius ;
		c.rebound(0 +radius, height -radius, 0 +radius, width -radius) ;
		c.set_position() ;

		// statement
		if(!c.calm) {
			for(Herbivore h : list_h) {
				c.watch(h.pos) ;
				c.hunt(h.pos) ;
				c.kill(h) ;
				if(c.hunting()) break ;
			}
		} 

      c.statement() ;
		c.hunger(speed_starving) ;

		// apparence
		Vec4 c_fill = Vec4(0) ;
		c.aspect(c_fill, c.colour, 1) ;
		c.info() ;
		c.aspect(c.colour, c.colour, 1) ;
		c.costume() ;
	}
}