fn=128;
difference() {
    translate([0, 0, -40]) sphere(d=180, $fn=fn);
    translate([0, 0, 180/2+0.5]) sphere(d=180, $fn=fn);
    translate([0, 0, -1]) cylinder(d=70, h=100, $fn=fn);
    translate([-100, -100, -200]) cube([200, 200, 200]);
    translate([-100, -100, 22]) cube([200, 200, 200]);
}