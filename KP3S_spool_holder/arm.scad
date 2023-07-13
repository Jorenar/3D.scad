module arm() {
    color([0,0.1,0,0.2]) {
        import("obj/main_arm.stl", convexity=10);
    }
}

module fillings() {
    translate([43,-63,13]) cube([25,110,15],center=true);
    translate([-12,-110,13]) cube([110,12,15],center=true);

    hull() {
        intersection() {
            translate([-70,-110,13]) cube([10,12,15],center=true);
            arm();
        }
    }
}

fillings();
arm();
