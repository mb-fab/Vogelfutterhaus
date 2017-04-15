
include <measures.scad>;

module roof_support()
{
    translate([
        0,
        material_z/2,
        0
        ])
    // rotate into xz-plane
    rotate([
        90,
        0,
        0
        ])
    // make 3d
    linear_extrude(material_z)
    polygon([
        [-house_x/2,0],
        [+house_x/2,0],
        [0,roof_elevation]
        ]);
}

roof_support();
