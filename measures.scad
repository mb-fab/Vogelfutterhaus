/*
 * All measures of the model
 * Default units: Millimeters
 */

// rendering parameters
$fn = 50;

// material to cut from
material_x = 430;
material_y = 270;
material_z = 3;

// house cuboid
house_x = 150;
house_y = 110;
house_z = 60;

// distances from left and bottom house edges
door_x = 35;
door_z = 35;
door_radius = 35/2;

window_offset_z = 12;
window_triangle_count_x = 7;
window_triangle_count_y = 5;

wall_y = house_y * 1/2;
wall_z = house_z * 4/5;
wall_offset_x = -15;

// how many holes per edge
strap_hole_count = 1;
strap_hole_radius = 3;
strap_hole_spacing = house_y/(strap_hole_count+1);
strap_hole_to_edge = 7;

// angle between upper house cuboid edge and roof plane in degrees
roof_angle = 30;

// elevation inside roof corner above upper edge of house cuboid
roof_elevation = tan(roof_angle) * house_x/2;

// length of a roof plane from top corner to house cuboid corner
roof_hypothenuse = 1/cos(roof_angle) * house_x/2;

// make roof a little longer than required
roof_plane_x = roof_hypothenuse * 1.2;
roof_plane_y = house_y * 1.2;

/*
// M4
screw_radius = 4;
screw_length = 20;
washer_radius = 9;
nut_height = 3.2;
nut_wrench_size = 7;
nut_offset = 7;
*/

// M3
screw_radius = 3.005;
screw_length = 15;
washer_radius = 7;
nut_height = 2.2;
nut_wrench_size = 7;
nut_offset = 5;
