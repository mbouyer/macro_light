include <params.scad>
include <arc.scad>

ep_support=3;
d_aimant=15;
ep_aimant=1.5;

d_clips = d_ext + debord_fond * 2 + 1;
d_support = d_clips + ep_clip * 2;


module ring_cone(di_l, di_h, do, h) {
    difference() {
	cylinder(d = do, h = h);
	translate([ 0, 0, -1 ]) cylinder(d1 = di_l, d2 = di_h, h = h+2);
    }
}

module ring(di, do, h) {
	ring_cone(di, di, do, h);
}

module crochet() {
	difference () {
	    translate([-(d_support / 2),-larg_clip/2,0]) cube([ep_clip + 5,larg_clip,ep_support + ep_fond+0.5]);
	    ring(d_int, d_clips, ep_support + ep_fond + 1);
	    ring(d_support, d_support + 5, ep_support+ ep_fond + 1);
	};
	difference() {
	    translate([-(d_support / 2),-larg_clip/2, ep_support + ep_fond+0.5]) cube([ep_clip + debord_fond + 5,larg_clip,ep_support]);
	    ring(d_int, d_ext + 1, ep_support + ep_support + ep_fond + 1);
	    ring(d_support, d_support + 5, ep_support + ep_support + ep_fond + 1);
	};
}

module all() {
	union () {
		// base avec décrochement pour l'aimant
		difference() {
			ring(d_int + 1, d_support, ep_support);
			rotate([0,0,-35]) translate([d_int / 2 + d_aimant / 2 + ep_bords, 0, 0]) cylinder(d=d_aimant,h=ep_aimant);
			rotate([0,0,60]) linear_extrude(ep_support + 1) arc(d_ext / 2, (d_support - d_ext) / 2 + 1, 110);
		};
		// poignee (avec crochet)
		difference() {
		    rotate([0,0,-60]) translate([d_ext / 2 - 2, -10/2, 0]) cube([20,10, ep_support+ep_fond + 0.5 + ep_support]);
		    ring(d_int, d_clips, ep_support+ep_fond+0.5);
		    ring(d_int, d_ext + 1, ep_support + ep_fond + ep_support +1);
		}
		// 3 crochets
		for(a=[60:120:360]) {
			rotate([0,0,a]) crochet();
		};
	};
}

all() ;
//projection(cut=true) translate([0,0, -1]) all();
//projection(cut=true) translate([0,0, -(ep_support+1)]) all();
//projection(cut=true) translate([0,0, -(ep_support+ep_fond+1)]) all();
