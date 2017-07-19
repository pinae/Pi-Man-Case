duesenbreite=0.401;
anzahl_wandschichten=4;
fn=128;
r=80;
ri=80-(anzahl_wandschichten*duesenbreite);

module ring_slice(r, ra, alpha, fn) {
    difference() {
        union() {
            translate([0, 0, -1]) cylinder(r=ra, h=sin(alpha)*r-(ra-cos(alpha)*r)+1, $fn=fn);
            translate([0, 0, sin(alpha)*r-(ra-cos(alpha)*r)]) cylinder(d1=2*ra, d2=2*cos(alpha)*r, h=(ra-cos(alpha)*r), $fn=fn);
        }
        translate([0, 0, -2]) cylinder(r=cos(alpha)*r, h=sin(alpha)*r+3, $fn=fn);
    }
}
//ring_slice(r, 50, 60, fn);
//ring_slice(r, 35, 80, fn);

difference() {
    sphere(r=r, $fn=fn);
    difference() {
        sphere(r=ri, $fn=fn);
        difference() {
            cylinder(r=(cos(45)*ri), h=80, $fn=fn);
            alpha = [45, 60, 70, 80, 90];
            for(i=[1, 2, 3, 4]) {
                ring_slice(ri, (cos(alpha[i-1])*ri)-(anzahl_wandschichten*duesenbreite), alpha[i], fn);
            }
        }
    }
    translate([-100, -100, -100]) cube([200, 200, 100]);
    //translate([0, -100, 0]) cube([200, 200, 100]);
}
//translate([0, 0, -1]) cylinder(r=cos(60)*80, h=sin(60)*80+1, $fn=fn);