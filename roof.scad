
include <measures.scad>;
use <roof_plane.scad>;
use <roof_support.scad>;

module roof()
{
    color("red")
    roof_planes();

    color("saddlebrown")
    for (y=[
        -house_y/2 + 1.5*material_z,
        +house_y/2 - 1.5*material_z
        ])
    {
        translate([
            0,
            y,
            -roof_elevation
            ])
        roof_support();
    }
}

roof();
