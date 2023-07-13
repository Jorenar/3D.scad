module mirror_copy(mirrorvec) {
    children();
    mirror(mirrorvec) children();
}

module adapter_helper_model(con_only=false) {
    pcb_w = 91;
    pcb_h = 46.6;
    pcb_d = 1.1;
    con_h = 13.5;
    con_w = 96.1;
    con_d = 8.9;
    pin_h = 9.4;

    cic_h = 9.4;
    cic_w = 8.1;
    cic_d = 5.1 - pcb_d;

    con_off = (5.2 + pcb_d/2)/4;

    foo = 3.7;

    translate([0,-15.37-3.7,8.7]) {
        if (!con_only) {
            translate([0,-(pcb_h-pin_h)/2,0]) {
                color("gold") cube([1,pin_h,1],center=true);
            }

            color([1,1,1,0.7])
                cube([pcb_w,pcb_h,pcb_d], center=true);

            translate([(pcb_w-8.2)/4+cic_w, (pcb_h-13.6)/4-cic_h, 0])
            color(["#000"]) cube([cic_w,cic_h,cic_d]);
        }

        translate([0, (pcb_h+con_h)/2, con_off]) {
            color("black") cube([con_w,con_h,con_d], center=true);
        }
    }
}

module back() {
    difference() {
        color([0,1,0,0.2]) import("obj/back_shell.stl", center=true, convexity=10);
        translate([0,-31.3,8.9]) cube([91.5,3,3], center=true);
    }

    // top wall
    difference() {
        translate([0,7.4,4]) {
            union() {
                cube([122.4,2,8], center=true);
                mirror_copy([1,0,0])
                    translate([48.5,-3.50,0.5])
                    cube([5,5,9], center=true);
            }
            mirror_copy([1,0,0]) {
                translate([60.5,0,-0.7]) {
                    cube([2,2,6.6], center=true);
                }
            }
        }
        sc = 1.005;
        scale([sc, sc-0.04, sc-0.04]) adapter_helper_model(true);
    }

    // Fill useless holes on bottom
    mirror_copy([1,0,0]) {
        translate([51.5,-41,0]) {
            cube([9,8,3]);
        }
    }

    // smooth bottom
    translate([-60,-42,0]) cube([120,49,1]);
}

module front() {
    module shell() {
        color([0,0.5,0.5,0.4]) import("obj/front_shell.stl", center=true, convexity=10);
        difference() {
            translate([0,7.4,11.5]) {
                translate([0,0,-0.2]) cube([122.7,2,6.6], center=true);
                translate([0,0,4]) cube([116.5,2,2], center=true);
                translate([0,0,5]) cube([80,2,2], center=true);
            }
            sc = 1.005;
            scale([sc, sc, sc+0.01]) adapter_helper_model(true);
        }
    }

    module stopper() {
        translate([31,-9.7,14]) {
            difference() {
                translate([0,2,0]) cube([12,2,7], center=true);
                translate([-6,-2,1]) cube([12,2,3]);
            }
            translate([4.275,-3.2,0.3]) cube([1.7,5,2.3]);
            translate([-7,0.5,-1.2]) cube([4,1.5,4.4]);
            translate([-42,-0.70,-1.2]) cube([44,1.7,2]);
            translate([1.7,-2.2,-1.2]) cube([4.3,3.7,1.6]);
            translate([-18.3,-3.2,-1.2]) cube([24.3,3.7,1.6]);
        }
    }

    module internal_screwhole_mask() {
        translate([0,-10,7.8]) cube([5,5,5]);
        translate([0,-8.7,12.50]) cube([5,5,5]);
    }

    module pins_temper() {
        translate([0,-31.505,10.1]) cube([90,1.39,2], center=true);
    }

    module flatten() {
        translate([-50,-50,19]) cube([100,100,3]);
    }

    module whole() {
        stopper();
        difference() {
            shell();
            internal_screwhole_mask();
        }
        pins_temper();
    }

    difference() {
        whole();
        flatten();
    }
}

module cart(b=true, f=true) {
    difference() {
        union() {
            if (b) back();
            if (f) front();
        }
        translate([0,42.4,0]) cube([150,68,40], center=true);
        translate([0,-11,1.3]) cube([5,5,7]);
    }
}

module additional_screwholes(b=true, f=true) {
    mirror_copy([1,0,0]) {
        intersection() {
            cart(b, f);
            translate([-56,-37,12])
                cube([9,8,28], center=true);
        }
    }
}

module final(b=true, f=true) {
    difference() {
        cart(b, f);

        // space for additional screw holes
        mirror_copy([1,0,0]) {
            translate([-56,-2,12]) {
                cube([9,8,28], center=true);
            }
        }
    }
    translate([0,35,0]) additional_screwholes(b, f);
}

module get(b=true, f=true) {
    if (b == false && f == true) {
        rotate(180, [1,0,0]) final(b,f);
    } else {
        final(b,f);
    }
}

/* adapter_helper_model(); */
get(f=false);
