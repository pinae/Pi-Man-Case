use <raspi3.scad>;
//translate([-45, 10, -9]) color("blue") raspi3();

fn = 32;
space = 0.4;

module puzzle_fitting(inside=true, space=0.4) {
    hs = inside ?-space/2 : space/2;
    difference() {
        union() {
            translate([10, 0, 0]) cylinder(d=8+hs, h=200, $fn=16);
            translate([0, -5, 0]) cube([(8+hs)/2, 10, 200]);
            translate([(8+hs)/2, -3, 0]) cube([(8+hs)/2, 6, 200]);
        }
        for(i=[-1, 1]) {
            translate([(8-hs/2)/2, i*5, -1]) cylinder(d=8-hs, h=202, $fn=16);
        }
    }
}
//difference() {puzzle_fitting(false, 1); translate([-0.2, 0, 0.1]) puzzle_fitting(true, 1);}

module pacman(fn) {
    difference() {
        sphere(d=180, $fn=fn);
        translate([0, -182/2, 0]) rotate([0, 45, 0]) cube([182, 182, 182]);
        translate([-78.3, -16.8, -9]) cube([88+50, 19, 16]);
        translate([-78.3, 2, -9]) cube([88+50, 18, 18]);
        translate([-78.3, 19.8, -9]) cube([88+50, 18, 18]);
        translate([-78.3, -19, -10]) cube([88+50, 58, 4]);
        translate([-71, -46, -11.5]) cube([15, 30, 10]);
        translate([-71+7.5, -16, -6.3]) rotate([90, 0, 0]) cylinder(d=3.5, h=162, $fn=16);
        translate([-54, -66, -11.5]) cube([24, 50, 15]);
        translate([-54+12, -16, -4.5]) rotate([90, 0, 0]) cylinder(d=7, h=162, $fn=16);
        translate([-24.1, -16, -4.5]) rotate([90, 0, 0]) {
            cylinder(d=10, h=30, $fn=32);
            // Uncomment the following line if you want to use the analog audio port
            //cylinder(d=3, h=162, $fn=16);
        }
    }
}

module upper_left_back(fn, space) {
    difference() {
        pacman(fn);
        translate([-182/2, -16.8, -182/2]) cube([182, 182, 182]);
        translate([-182/2, -182/2, -189]) cube([182, 182, 182]);
        difference() {
            translate([-15-space/2, -182/2, -182/2]) cube([182, 182, 182]);
            translate([-15-space/2, 0, 20]) rotate([90, 0, 0]) puzzle_fitting(true, space);
        }
    }
}

module upper_left_front(fn, space) {
    difference() {
        pacman(fn);
        translate([-182/2, -16.8, -182/2]) cube([182, 182, 182]);
        translate([-182/2, -182/2, -189]) cube([182, 182, 182]);
        translate([-15+space/2-182, -182/2, -182/2]) cube([182, 182, 182]);
        translate([-15-space/2, 0, 20]) rotate([90, 0, 0]) puzzle_fitting(false, space);
    }
}

upper_left_back(fn, space);
upper_left_front(fn, space);
