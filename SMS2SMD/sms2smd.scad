$fn = 100;

opt = 1 ? [0,0.5,0,0.2] : [0,1,0,1];

module cut() {
    translate([0,30,0]) color([0,0,0.4,0.3]) cube([150,100,20], center=true);
}

module screw_hole() {
    translate([43.7,38.1,14.716]) {
        color("red") {
            difference() {
                cylinder(2, r=1.3, center=true);
                cylinder(3, r=0.5, center=true);
            }
        }
    }
}


module cartridge() {
    screw_hole();
    mirror([1,0,0]) screw_hole();
    color(opt) {
        difference() {
            import("obj/Master_System_to_MegaDive_Adaptor_Case_v1.0.stl", center=true, convexity=10);
            translate([-100,0,26]) cube([200,20,5]);
        }
    }
}

module top() {
    translate([0,0,1]) {
        intersection() {
            cartridge();
            translate([0,0,23.1]) cut();
        }
    }
}

module bottom() {
    translate([0,0,0]) {
        intersection() {
            cartridge();
            translate([0,0,2.9]) cut();
        }
    }
}

top();
bottom();
