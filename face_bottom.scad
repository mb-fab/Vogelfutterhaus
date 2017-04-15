
include <measures.scad>;

module face_bottom()
{
    difference()
    {
        cube([
            house_x,
            house_y,
            material_z
            ], center=true);

        for (x = [house_x/2 - strap_hole_to_edge, -house_x/2 + strap_hole_to_edge])
        {
            for (i=[1:strap_hole_count])
            {
                translate([
                    x,
                    -house_y/2 + i*strap_hole_spacing,
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
}

face_bottom();

