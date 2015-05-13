/* Replacement part for plughole actuator
 *
 * Brian Starkey <stark3y@gmail.com>
 * Creative Commons BY-NC-SA
 */

$fn = 50;
outside_dia = 6.5;
sheathed_height = 8.5;
bolt_dia = 3;
block_size = sheathed_height;
pole_dia = 5.5;

steel_grey = [0.7, 0.7, 0.7];

module bolt(length = 10, dia = 3) {
	radius = (dia / 2) * 0.9;

	color(steel_grey) {
		translate([0, 0, length]) intersection() {
			sphere(r = radius + 0.9, center = true);
			translate([0, 0, radius / 2])
				cube([5, 5, radius], center = true);
		}
		cylinder(r = radius, h = length);
	}
}

module axle(length = 10) {
	color(steel_grey) cylinder(r = 1, h = length, center = true);
}


difference() {
	union() {
			cylinder(r = outside_dia / 2, h = sheathed_height);
			translate([0, 0, sheathed_height * 1.5]) cube(sheathed_height, center = true);
	}
	union () {
		translate([0, 0, -0.5])
			cylinder(r = bolt_dia / 2, h = (sheathed_height * (3 / 2)) + 1);
		translate([0, 0, (sheathed_height * 1.5)]) rotate([0, 90, 0])
			cylinder(r = pole_dia / 2, h = sheathed_height + 1, center = true);
	}
}

translate([0, 0, sheathed_height + 4]) rotate([0, 180, 0]) bolt(length = sheathed_height + 5);
