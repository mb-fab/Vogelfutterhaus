
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

        // hole
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

        // nose cutaways on the side
        for (y=[-house_y/2+material_z/2, +house_y/2-material_z/2])
        {
            for (z=[+house_z/3, -house_z/3])
            {
                translate([
                    0,
                    y,
                    z
                    ])
                cube([
                    material_z*1.2,
                    material_z*1.001,
                    house_z/3
                    ], center=true);
            }
        }

        // nose cutaways on the bottom
        for (y=[-house_y/3, +house_y/3])
        {
            translate([
                0,
                y,
                -house_z/2+material_z/2
                ])
            cube([
                material_z*1.2,
                house_y/3,
                material_z*1.001
                ], center=true);
        }
    }
}

face_side();

