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
	    translate([-(d_support / 2),-larg_clip/2,0]) cube([ep_clip + 5,larg_clip,ep_fond+0.5]);
	    ring(d_int, d_clips, ep_fond + 1);
	    ring(d_support, d_support + 5, ep_fond + 1);
	};
	difference() {
	    translate([-(d_support / 2),-larg_clip/2, ep_fond+0.5]) cube([ep_clip + debord_fond + 5,larg_clip,ep_support]);
	    ring(d_int, d_ext + 1, ep_support + ep_fond + 1);
	    ring(d_support, d_support + 5, ep_support + ep_fond + 1);
	};
}

module all() {
	rotate([180,0,0]) crochet();
}

all() ;
//projection(cut=true) translate([0,0, -1]) all();
//projection(cut=true) translate([0,0, -(ep_support+1)]) all();
//projection(cut=true) translate([0,0, -(ep_support+ep_fond+1)]) all();
