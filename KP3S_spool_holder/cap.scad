$fn=500;

module fill_m3_holes() {
    module filling() {
        translate([6.2,10.86,11]) {
            cube([3.6,3.6,11],center=true);
        }
    }

    filling();
    mirror([1,0,0]) filling();
    mirror([0,1,0]) filling();
    mirror([1,0,0]) mirror([0,1,0]) filling();
}

module bar() {
    translate([0,0,9]) cube([4,32,4], center=true);
}

module cover_hole() {
    intersection() {
        translate([0,0,4]) cylinder(10,r=15.7,center=true);
        union() {
            translate([0,0,2]) cylinder(10,r=15.5,center=true);
            translate([0,0,8]) cube([33,17,4], center=true);
        }
    }
}

module cap() {
    fill_m3_holes();
    color([0,0.1,0,0.4]) {
        rotate(-37,[0,0,1])
            import("obj/cap_for_v-slot_20x40.stl", center=true, convexity=10);
    }
}

bar();
difference() {
    cap();
    cover_hole();
}
