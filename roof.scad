
include <measures.scad>;
use <roof_plane.scad>;
use <roof_support.scad>;

module roof()
{
    color("red")
    roof_planes();

    color("saddlebrown")
    for (y=[
        -house_y/2 + material_z/2 + roof_support_inset,
        +house_y/2 - material_z/2 - roof_support_inset
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
