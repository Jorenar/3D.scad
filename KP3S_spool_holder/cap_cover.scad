$fn=500;

translate([0,0,2]) cylinder(7,r=15.5,center=true);
translate([0,0,-3]) color([0,0,0.7,0.4]) cylinder(5.5,r=22.5,center=true);

/* HELPER CAP */
// translate([0,0,0]) color([0,0.5,0,0.4]) import("cap.stl", center=true, convexity=10);
