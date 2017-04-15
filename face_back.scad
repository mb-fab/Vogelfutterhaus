
include <measures.scad>;

module face_back()
{
    // rectangle
    translate([
        0,
        0,
        house_z/2
        ])
    cube([
        house_x,
        material_z,
        house_z
        ], center=true);

    // triangle
    rotate([
        90,
        0,
        0
        ])
    translate([
        0,
        0,
        -material_z/2
        ])
    linear_extrude(material_z)
    polygon([
        [house_x/2,house_z],
        [0,house_z+roof_elevation],
        [-house_x/2,house_z]
        ]);
        
}

face_back();
