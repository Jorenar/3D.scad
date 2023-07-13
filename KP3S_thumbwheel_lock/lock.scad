$fn=500;

module orig() {
    color([0,1,1,0.2]) import("obj/KP3_thumbwheel_lock.STL", center=true, convexity=10);
}

module cut() {
    rotate(45,[0,0,1]) {
        cube([13,6,4], center=true);
    }
}

module foo() {
    intersection() {
        orig();
        translate([9,9,1]) {
            cut();
        }
    }
}

module bar() {
    tr = 27.25;
    translate([tr,tr,0]) rotate(180, [0,0,1]) foo();
}

difference() {
    orig();
    hull() bar();
}
bar();
