HEIGHT=7.17;
FOO = 0.585;

difference() {
    union() {
        import("obj/Atari_ST_Gotek_Mount_for_Slant_Type_-_Face.3mf");

        translate([0, 0, FOO]) {
            translate([51.5, 24.6, 0]) {
                cube([96,8.8,HEIGHT],center=true);
            }

            translate([51.5, 26.940, 0]) {
                cube([92,5,HEIGHT],center=true);
            }

            translate([37,20,0]) {
                rotate(35) {
                    cube([4.1,5,HEIGHT],center=true);
                }
            }

            translate([81,17,-2.085]) {
                cube([8,8,3],center=true);
            }

            translate([25,29,-2.085]) {
                cube([48,6,3],center=true);
            }

            difference() {
                linear_extrude(HEIGHT, center=true) {
                    polygon([[25,7.2],[70,7.3],[88,25],[37,20]]);
                }
                translate([24.3,7,0]) {
                    rotate(36) {
                        cube([4,5,HEIGHT+1],center=true);
                    }
                }
            }
        }
    }

    translate([70, 32.34, FOO]) {
        cube([48.4,5.8,HEIGHT+1], center=true);
    }
}
