difference() {
    color([0,1,1,0.2]) import("obj/KP3_S_Back-left_thumbwheel_lock.STL", center=true, convexity=10);

    translate([29,20,1]) {
        rotate(80,[0,0,1]) {
            cube([7,3,4], center=true);
        }
    }
}
