opt = 1 ? [0,0.5,0,0.2] : [0,1,0,1];

scale([1.02,0.91,1]) {
    difference() {
        translate([0,325,-89.1]) color(opt) import("obj/power_st.stl", convexity=10);
        union() {
            translate([3.3,-25,10]) cube([50,30,40]);
            translate([-45.7,37,7.026]) cube([50,30,40]);
            translate([-120,-100,0]) cube([300,200,1]);
        }
    }
}
