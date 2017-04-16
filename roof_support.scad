
include <measures.scad>;
use <screw.scad>;

module roof_support_nose()
{
    translate([
        house_x/4,
        0,
        roof_elevation/2
        ])
    rotate([
        0,
        roof_angle,
        0
        ])
    cube([
        roof_hypothenuse/3,
        material_z,
        material_z*2.001
        ], center=true);
}

module roof_support_triangle()
{
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

module roof_support_positive()
{
    // triangle
    translate([
        0,
        material_z/2,
        0
        ])
    roof_support_triangle();

    // add nose left
    roof_support_nose();

    // add nose right
    rotate([
        0,
        0,
        180
        ])
    roof_support_nose();
}

module roof_support()
{
    difference()
    {
        roof_support_positive();

        // triangle
        scale([
            1,
            1.2,
            1
            ])
        translate([
            0,
            material_z/2,
            -roof_elevation + roof_support_cutout_height
            ])
        roof_support_triangle();
    }
}

module roof_support_with_screw_cavities()
{
    difference()
    {
        roof_support();

        // cavity for screw left
        translate([
            -house_x/4 - material_z*cos(90-roof_angle) - 0.002,
            0,
            roof_elevation/2 + material_z*sin(90-roof_angle) + 0.002
            ])
        rotate([
            0,
            -roof_angle,
            0
            ])
        screw_cavity();

        // cavity for screw right
        translate([
            +house_x/4 + material_z*cos(90-roof_angle) + 0.002,
            0,
            roof_elevation/2 + material_z*sin(90-roof_angle) + 0.002
            ])
        rotate([
            0,
            roof_angle,
            0
            ])
        screw_cavity();
    }
}

roof_support_with_screw_cavities();
