
include <measures.scad>;

module pentagon()
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

module face_back()
{
    difference()
    {
        pentagon();

        // bottom nose cutout
        translate([
            0,
            0,
            material_z/2
            ])
        cube([
            house_x/3,
            material_z*1.2,
            material_z*1.001
            ], center=true);

        // side nose cutouts
        for (x=[-house_x/2+material_z/2, +house_x/2-material_z/2])
        {
            translate([
                x,
                0,
                house_z/2
                ])
            cube([
                material_z*1.001,
                material_z*1.001,
                house_z/3
                ], center=true);
        }
    }

    // nose support structures
    translate([
        0,
        0,
        -material_z/2
        ])
    cube([
        house_x,
        material_z,
        material_z
        ], center=true);

    for (x = [-house_x/2-material_z/2, +house_x/2+material_z/2])
    {
        translate([
            x,
            0,
            house_z/2
            ])
        cube([
            material_z,
            material_z,
            house_z/1.4
            ], center=true);
    }
}

face_back();
