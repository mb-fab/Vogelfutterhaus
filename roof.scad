
include <measures.scad>;
use <roof_plane.scad>;
use <roof_support.scad>;

module roof()
{
    roof_planes();

    translate([
        0,
        -house_y/2 + 1.5*material_z,
        -roof_elevation
        ])
    roof_support();

    translate([
        0,
        +house_y/2 - 1.5*material_z,
        -roof_elevation
        ])
    roof_support();
}

roof();
