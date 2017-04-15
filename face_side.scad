
include <measures.scad>;

module face_side()
{
    difference()
    {
        cube([
            material_z,
            house_y,
            house_z
            ], center=true);

        for (i=[1:strap_hole_count])
        {
            translate([
                0,
                -house_y/2 + i*strap_hole_spacing,
                -house_z/2 + strap_hole_to_edge
                ])
            // rotate cylinder into yz-plane
            rotate([
                0,
                90,
                0
                ])
            cylinder(
                r=strap_hole_radius,
                h=material_z*1.2,
                center=true
                );
        }
    }
}

face_side();

