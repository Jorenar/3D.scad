$fn=500;

module ruler_angle_height() {
    translate([0,10,1.35]) cube([2,2,7],center=true);
}


module curve(a, size=[0,0,0], center=false) {
    x = size[0];
    y = size[1];
    z = size[2];

    if (a > 0) {
        r = (360 * (y/a)) / (2 * PI);
        translate( [-r-x/2,0,0] ) {
            rotate_extrude(angle = a) {
                translate([r, 0, 0]) {
                    square(size = [x, z], center=center);
                }
            }
        }
    } else {
        translate([-x/2, 0, z]) {
            rotate(a=270, v=[1,0,0]) {
                linear_extrude(x=y) {
                    square(size=[x, z], center=center);
                }
            }
        }
    }
}


base_z = 9.7;
base_y = 20;

module base() {
    intersection() {
        color([0,0,.3,0.5]) cube([50.7,20,base_z], center=true);
        translate([-28.1,0,10]) {
            rotate(-10,[0,1,0])
                rotate(-90, [0,0,1]) rotate(-90, [0,1,0])
                curve(20, [15,54,20], center=true);
        }
    }
}

module screwhole() {
    d = 2.9;
    rotate(90, [1,0,0]) {
        cylinder(7, r=d/2, center=true);
    }
}

module foo() {
    x = 13.5;
    y = 4.9;
    z = 38.2;

    translate([0,1,(z + base_z)/2]) {
        difference() {
            cube([x, y, z], center=true);
            translate([0,1.9,0]) {
                cube([8.2, y, z+1], center=true);
                translate([0,0,15.1]) cube([10.5, y, z+1], center=true);
            }
        }
    }
}


module screwholes() {
    h = (base_z + 2.9) / 2;
    h1 = 6.5 + h;
    h2 = 24.1 + h;
    translate([0,0,h1]) screwhole();
    translate([0,0,h2]) screwhole();
}

difference() {
    foo();
    screwholes();
}
base();

translate([0,-2,-3]) linear_extrude(1) text("↑", halign = "center");
