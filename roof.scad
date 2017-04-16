
include <measures.scad>;
use <roof_plane.scad>;
use <roof_support.scad>;

module roof()
{
    color("red")
    roof_planes();

    color("saddlebrown")
    for (y=[
        -house_y/2 + material_z*1.5,
        +house_y/2 - material_z*1.5
        ])
    {
        translate([
            0,
            y,
            -roof_elevation
            ])
        roof_support();
    }

    color("saddlebrown")
    translate([
        0,
        0,
        -roof_elevation
        ])
    roof_support_with_screw_cavities();
}

roof();
