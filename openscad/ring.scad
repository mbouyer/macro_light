include <params.scad>

module ring_cone(di_l, di_h, do, h) {
    difference() {
	cylinder(d = do, h = h);
	translate([ 0, 0, -1 ]) cylinder(d1 = di_l, d2 = di_h, h = h+2);
    }
}

module ring(di, do, h) {
	ring_cone(di, di, do, h);
}

module support_alim() {
	difference() {
		// support alim (ext)
		translate([d_ext/2 - larg_led, -larg_alim/2 - ep_bords, 0]) cube([long_alim + ep_bords, larg_alim + ep_bords * 2, h_ext]);
		// support alim (int)
		translate([d_ext/2 - larg_led, -larg_alim/2, ep_fond]) cube([long_alim, larg_alim, h_ext]);
		// anneau_leds
		translate([0, 0, ep_fond]) ring(d_int + ep_bords * 2, d_ext - ep_bords * 2, h_ext);
	};
}

module moule_leds () {

	difference() {
		union() {
			// fond
			ring(d_int + 1, d_ext + debord_fond * 2, ep_fond);
			// extérieur
			ring (d_ext - (ep_bords * 2), d_ext, h_ext);
			// intérieur
			ring_cone(d_int + 1, d_int - 0.2, d_int + (ep_bords * 2), h_ext);
			support_alim();
		};
		// support alim (int)
		translate([d_ext/2 - larg_led, -larg_alim/2, ep_fond]) cube([long_alim, larg_alim, h_ext]);
	};
}

module plot_led () {
	rotate([0,0,11]) translate([d_int / 2 + ep_bords - 0.1, 0, ep_fond]) cube(2);
	rotate([0,0,-11]) translate([d_int / 2 + ep_bords - 0.1, 0, ep_fond]) rotate([0,0,-90]) cube(2);
	rotate([0,0,-10]) translate([d_ext / 2 - ep_bords - 2, 0, ep_fond]) cube(2);
	rotate([0,0,10]) translate([d_ext / 2 - ep_bords - 2, 0, ep_fond]) rotate([0,0,-90]) cube(2);
}

module all() {
	moule_leds();
	for(a=[30:60:360]) {
		rotate([0,0,a]) plot_led();
	};
}

//all();
projection(cut=true) translate([0,0, -(ep_fond+1)]) all();
//projection(cut=true) translate([0,0, -1]) all();
