use <raspi3.scad>;
//translate([-47, 0, -9]) color("blue") raspi3();

fn = 16;

module m3_hole() {
    difference() {
        union() {
            translate([0, 0, -3]) cylinder(d=6, h=3, $fn=fn);
            translate([0, 0, -5]) cylinder(d1=10, d2=6, h=2, $fn=fn);
            translate([0, 0, -9]) cylinder(d=10, h=4, $fn=fn);
        }
        translate([0, 0, -9]) cylinder(d=3+0.1, h=10, $fn=fn);
        translate([0, 0, -10]) cylinder(d=6.08+0.2, h=2.4+0.2+1, $fn=6);
    }
}

module mouth() {
    translate([0, -176/2, -3]) cube([176/2, 176, 3]);
    translate([-3, -176/2, -3]) cube([3, 176, 176/2+3]);
}

module frame() {
    intersection() {
        sphere(d=175, $fn=2*fn);
        union() {
            for(i=[0, 1]) {
                for(j=[0, 1]) {
                    translate([-76+i*58, -24.5+j*49, -9]) m3_hole();
                }
            }
            difference() {
                rotate([0, 45, 0]) mouth();
                translate([-78.3, -16.8-10, -9]) cube([88+50, 19, 16]);
                translate([-78.3, 2-10, -9]) cube([88+50, 18, 18]);
                translate([-78.3, 19.8-10, -9]) cube([88+50, 18, 18]);
                translate([-78.3, -19-10, -10]) cube([88+50, 58, 4]);
            }
            difference() {
                union() {
                    for(i=[0, 1]) {
                        translate([-176/2, -29.5+i*49, -24]) cube([110, 10, 10]);
                    }
                }
                for(i=[0, 1]) {
                    translate([0, -176/2, -1]) rotate([0, 45, 0]) cube([176, 176, 176]);
                    for(j=[0, 1]) {
                        translate([-76+i*58, -24.5+j*49, -29]) cylinder(d=6.5, h=24, $fn=6);
                    }
                }
            }
            /*for(i=[0, 1]) {
                for(j=[0, 1]) {
                    difference() {
                        union() {
                            translate([-74+i*58, -29.5+j*49, -17]) rotate([0, 45, 0]) cube([138, 10, 4]);
                            translate([-78+i*58, -19.5+j*49, -17]) rotate([0, 45, 180]) cube([138, 10, 4]);
                            translate([-71+i*58, -22.5+j*49, -17]) rotate([0, 45, 90]) cube([120, 10, 4]);
                            translate([-81+i*58, -26.5+j*49, -17]) rotate([0, 45, 270]) cube([120, 10, 4]);
                        }
                        translate([-76+i*58, -24.5+j*49, -19]) cylinder(d=6.5, h=4, $fn=6);
                    }
                }
                translate([-81+58/2, -29.5+i*49, -159]) cube([10, 10, 120]);
                translate([-81+58, -29.5+i*49, -184]) cube([10, 10, 120]);
                translate([7, -29.5+i*49, -131]) cube([4, 10, 120]);
            }*/
        }
    }
}

difference() {
    frame();
    translate([-100, -100, -9]) cube([200, 200, 200]);
}

/*difference() {
    frame();
    translate([-100, -100, -209]) cube([200, 200, 200]);
}*/
