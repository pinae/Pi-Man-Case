use <raspi3.scad>;
//translate([-30, 10, 3-10]) color("blue") raspi3();

module clamp(w, h, a, fn) {
    rd=8;
    for(i=[-1, 1]) {
        translate([i*(h/2-rd/2), rd*1.4, -w/2-a/2]) cylinder(d=rd+a, h=w+a, $fn=32);
    }
    difference() {
        union() {
            difference() {
                translate([0, 150/2, 0]) sphere(d=156+a, $fn=fn);
                translate([0, 150/2, 0]) sphere(d=150-rd+1.7, $fn=fn);
                translate([-100, -10, -200-w/2-a/2]) cube([200, 200, 200]);
                translate([-100, -10, w/2+a/2]) cube([200, 200, 200]);
                translate([-200-h/2-a/2, -10, -100]) cube([200, 200, 200]);
                translate([h/2+a/2, -10, -100]) cube([200, 200, 200]);
                translate([-100, 50, -100]) cube([200, 200, 200]);
            }
            translate([-h/2-a/2, 1, -w/2-a/2]) cube([h+a, 1.4*rd-1, w+a]);
        }
        for(i=[-1, 1]) {
            translate([i*(h/2-1.4*rd-a/2), rd+a/2, -1-w/2-a/2]) cylinder(d=rd, h=w+a+2, $fn=32);
            translate([i*(h/2-1.4*rd-a/2), (rd+a/2)*1.2, -1-w/2-a/2]) cylinder(d=rd, h=w+a+2, $fn=32);
        }
        translate([-h/2+1.4*rd, rd/2+a/2, -1-w/2-a/2]) cube([h-2.8*rd, 20, w+a+2]);
    }
}
//clamp(15, 40, 0, 64);
//translate([0, 0, 15/2]) clamp(15, 40, 0, 32);

module lower_half(h, fn) {
    dx = 58;
    dy = 49;
    osx=-30;
    osy=10;
    for(x=[-dx/2+osx, dx/2+osx]) {
        for(y=[-dy/2+osy, dy/2+osy]) {
            difference() {
                union() {
                    translate([x, y, 0-10]) cylinder(d=6, h=h, $fn=fn/4);
                    translate([x, y, -100-10]) cylinder(d1=200, d2=6, h=100, $fn=fn/4);
                }
                translate([x, y, -101-10]) cylinder(d=2.75, h=h+2+100, $fn=fn/4);
                difference() {
                    sphere(d=500, $fn=fn);
                    sphere(d=150, $fn=fn);
                }
            }
        }
    }
    difference() {
        sphere(d=156, $fn=fn);
        difference() {
            sphere(d=150, $fn=fn);
            translate([0, -250, 23-10]) rotate([0, 45, 0]) cube([500, 500, 500]);
            for(i=[-4, -3, -2, -1, 0, 1, 2, 3, 4]) {
                translate([22, i*16, -100-10]) cylinder(d1=200, d2=3, h=100+h, $fn=10);
            }
            translate([-40, -45, -100-10]) cylinder(d1=200, d2=3, h=100+h, $fn=fn/8);
            translate([-12, -150/2, -37+h-10]) cube([24, 20, 37+h]);
            translate([-12, 150/2-20, -37+h-10]) cube([24, 20, 37+h]);
        }
        translate([16, -250, 12-10]) rotate([0, 45, 0]) cube([500, 500, 500]);
        translate([0, -18.5, 3.5-10]) cube([100, 57, 2]);
        translate([0, -16.3, 3.5-10]) cube([100, 17, 18]);
        translate([0, 2.8, 3.5-10]) cube([100, 16.2, 20.5]);
        translate([0, 20.9, 3.5-10]) cube([100, 16.2, 20.5]);
        translate([-250, -250, h-10]) cube([500, 500, 500]);
        translate([-25, -40, h-10]) rotate([90, 0, 0]) cylinder(d=6.5, h=100, $fn=16);
        translate([-32, -40, h-10]) rotate([90, 0, 0]) cylinder(d=3.5, h=100, $fn=16);
        translate([0, -150/2, 0]) rotate([0, 90, 0]) clamp(15, 40, 0.5, fn);
        translate([0, 150/2, 0]) rotate([0, 90, 180]) clamp(15, 40, 0.5, fn);
    }
}
lower_half(3, 32);
//translate([0, -150/2, 0]) rotate([0, 90, 0]) clamp(15, 40, 0, 16);
//translate([0, 150/2, 0]) rotate([0, 90, 180]) clamp(15, 40, 0, 16);

module upper_half(h, fn) {
    difference() {
        sphere(d=156, $fn=fn);
        difference() {
            sphere(d=150, $fn=fn);
            translate([0, -250, 0-10]) rotate([0, 45, 0]) cube([500, 500, 500]);
            translate([-12, -150/2, h-10]) cube([24, 20, 45+h]);
            translate([-12, 150/2-20, h-10]) cube([24, 20, 45+h]);
        }
        translate([-250, -250, h-500-10]) cube([500, 500, 500]);
        translate([16, -250, 12-10]) rotate([0, 45, 0]) cube([500, 500, 500]);
        translate([0, -18.5, 0-10]) cube([23, 57, 4.5]);
        translate([-4, -18.5, 0-10]) rotate([0, 45, 0]) cube([23, 57, 20]);
        translate([0, -16.3, 0-10]) cube([100, 17, 18]);
        translate([0, 2.8, 0-10]) cube([100, 16.2, 20.5]);
        translate([0, 20.9, 0-10]) cube([100, 16.2, 20.5]);
        translate([-25, -40, h-10]) rotate([90, 0, 0]) cylinder(d=6.5, h=100, $fn=32);
        translate([-32, -40, h-10]) rotate([90, 0, 0]) cylinder(d=3.5, h=100, $fn=32);
        translate([0, -150/2+0.2, 0]) rotate([0, 90, 0]) clamp(15, 40, 0.5, fn);
        translate([0, 150/2-0.2, 0]) rotate([0, 90, 180]) clamp(15, 40, 0.5, fn);
    }
    difference() {
        translate([0, 0, h]) {
            translate([-16, -21.5, 7-10]) cylinder(d1=5, d2=250, h=150, $fn=fn/4);
            translate([-16, -21.5, 0-10]) cylinder(d=5, h=7, $fn=fn/4);
            translate([-38, -21.5, 7-10]) cylinder(d1=5, d2=250, h=150, $fn=fn/4);
            translate([-38, -21.5, 0-10]) cylinder(d=5, h=7, $fn=fn/4);
            translate([5, -21.5, 15-10]) cylinder(d1=5, d2=250, h=150, $fn=fn/4);
            translate([5, -21.5, 0-10]) cylinder(d=5, h=15, $fn=fn/4);
            translate([5, 41, 15-10]) cylinder(d1=5, d2=250, h=150, $fn=fn/4);
            translate([5, 41, 0-10]) cylinder(d=5, h=15, $fn=fn/4);
            translate([-3, 41, 8-10]) cylinder(d1=5, d2=250, h=150, $fn=fn/4);
            translate([-3, 41, 0-10]) cylinder(d=5, h=8, $fn=fn/4);
            translate([-30, 41.5, 10-10]) cylinder(d1=5, d2=250, h=150, $fn=fn/4);
            translate([-30, 41.5, 0-10]) cylinder(d=5, h=10, $fn=fn/4);
            translate([-50, 41.5, 10-10]) cylinder(d1=5, d2=200, h=150, $fn=fn/4);
            translate([-50, 41.5, 0-10]) cylinder(d=5, h=10, $fn=fn/4);
            translate([-65.8, 10, 8-10]) cylinder(d1=5, d2=200, h=150, $fn=fn/4);
            translate([-65.8, 10, 0-10]) cylinder(d=5, h=8, $fn=fn/4);
            translate([21.5, 20, 17.5-10]) cylinder(d1=2, d2=300, h=150, $fn=fn/4);
            translate([21.5, 1.5, 17.5-10]) cylinder(d1=2, d2=300, h=150, $fn=fn/4);
            translate([19, -15, 15.1-10]) cylinder(d1=2, d2=300, h=150, $fn=fn/4);
        }
        difference() {
            sphere(d=500, $fn=fn);
            sphere(d=150, $fn=fn);
        }
    }
    translate([19.5, -18.3, h-10]) cube([0.4, 56.5, 1.5]);
}
//upper_half(3, 32);

//rotate([180, 0, 0]) lower_half(3, 256);