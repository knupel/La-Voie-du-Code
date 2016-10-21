int carnivore_costume, herbivore_costume, bacterium_costume, flora_costume, corpse_costume ;

void costume_agent_external_method(Vec3 pos, int size, Vec3 dir, int which_costume) {
	if (which_costume == 0 ) {
		point(pos) ;
	} else if (which_costume == 1 ) {
		matrix_start() ;
		translate(pos) ;
		polyhedron("TETRAHEDRON","LINE", size) ;
		matrix_end() ;
	} else if (which_costume == 2 ) {
		matrix_start() ;
		translate(pos) ;
		polyhedron("CUBE","LINE", size) ;
		matrix_end() ;
	} else if (which_costume == 3 ) {
		matrix_start() ;
		translate(pos) ;
		polyhedron("OCTOHEDRON","LINE", size) ;
		matrix_end() ;
	} else if (which_costume == 4 ) {
		matrix_start() ;
		translate(pos) ;
		polyhedron("RHOMBIC COSI DODECAHEDRON SMALL","LINE", size) ;
		matrix_end() ;
	} else if (which_costume == 5 ) {
		matrix_start() ;
		translate(pos) ;
		polyhedron("ICOSI DODECAHEDRON","LINE", size) ;
		matrix_end() ;
	}

}