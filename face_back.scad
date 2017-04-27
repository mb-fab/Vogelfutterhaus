
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

module pentagon_with_support()
{
    pentagon();

    // bottom nose support structure
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

    // side nose support structures
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

module face_back()
{
    difference()
    {
        pentagon_with_support();

        // bottom nose cutout
        translate([
            0,
            0,
            material_z/2
            ])
        cube([
            house_x/3,
            material_z*1.2,
            material_z + hole_expansion
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
                material_z + hole_expansion,
                material_z*1.2,
                house_z/3
                ], center=true);
        }
    }
}

face_back();
