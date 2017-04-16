
include <measures.scad>;

module roof_plane()
{
    difference()
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

        // cut holes for the roof support's nose
        for (y=[
            // where the supports will go, see roof.scad
            -house_y/2 + material_z/2 + roof_support_inset,
            +house_y/2 - material_z/2 - roof_support_inset
            ])
        {
            translate([
                roof_hypothenuse/2,
                y,
                0
                ])
            cube([
                roof_hypothenuse/3,
                material_z,
                material_z*1.2
                ], center=true);
        }
    }
}

module roof_plane_right()
{
    // make it so, that the corner touches the y axis
    translate([
        sin(roof_angle)*material_z/2,
        0,
        cos(roof_angle)*material_z/2
        ])
    // tilt the roof
    rotate([
        0,
        roof_angle,
        0
        ])
    roof_plane();
}

module roof_plane_left()
{
    // just make a rotated version of the previous plane
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

roof_plane();

