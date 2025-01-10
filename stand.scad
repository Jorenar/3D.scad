$fn=500;

module mirror_copy(mirrorvec) {
    children();
    mirror(mirrorvec) {
        children();
    }
}

r=90/2;
h=140;
w=5;

difference() {
    cylinder(h,r,r, center=true);
    cylinder(h+10,r-w,r-w, center=true);
    difference() {
        union() {
            translate([0,-r,0]) {
                cube([r/3,r/3,h-20], center=true);
            }
            mirror_copy([0,1,0]) {
                translate([0,r/2,0]) {
                    cube([2*r+20,0.4*r,h-20], center=true);
                }
            }
        }
        mirror_copy([0,0,1]) {
            translate([0,0,h/6]) {
                cube([3*r,3*r,10], center=true);
            }
        }
    }
    translate([0,r-w/2,0]) {
        cube([30,3*w,h+10], center=true);
    }
}
