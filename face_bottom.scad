
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

        // hole cutouts
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

        // nose cutouts front and back
        for (x=[-house_x/3, +house_x/3])
        {
            for (y=[+house_y/2-material_z/2, -house_y/2+material_z/2])
            {
                translate([
                    x,
                    y,
                    0
                    ])
                cube([
                    house_x/3*1.001,
                    material_z*1.001,
                    material_z*1.2
                    ], center=true);
            }
        }

        // nose cutout on the sides
        for (x=[+house_x/2-material_z/2, -house_x/2+material_z/2])
        {
            translate([
                x,
                0,
                0
                ])
            cube([
                material_z*1.001,
                house_y/3,
                material_z*1.2
                ], center=true);
        }
    }
}

face_bottom();

