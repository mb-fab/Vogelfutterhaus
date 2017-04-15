
include <measures.scad>;

module roof_plane()
{
    translate([
        0,
        -roof_plane_y/2,
        -material_z/2
        ])
    cube([
        roof_plane_x,
        roof_plane_y,
        material_z
        ]);
}

module roof_plane_right()
{
    translate([
        sin(roof_angle)*material_z/2,
        0,
        cos(roof_angle)*material_z/2
        ])
    rotate([
        0,
        roof_angle,
        0
        ])
    roof_plane();
}

module roof_plane_left()
{
    rotate([
        0,
        0,
        180
        ])
    roof_plane_right();
}

module roof_planes()
{
    roof_plane_left();
    roof_plane_right();
}

roof_plane_right();

