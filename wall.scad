
include <measures.scad>;
use <patterns/pattern_triangles.scad>;

module wall()
{
    difference()
    {
        // base material
        union()
        {
            cube([
                material_z,
                wall_y,
                wall_z
                ], center=true);
                
            // bottom nose
            translate([
                0,
                0,
                -wall_z/2 -material_z/2
                ])
            cube([
                material_z,
                wall_y/3,
                material_z
                ], center=true);

            // side nose
            translate([
                0,
                -wall_y/2 -material_z/2,
                0
                ])
            cube([
                material_z,
                material_z,
                wall_z/3
                ], center=true);
        }

/*
        // cavity for screw
        translate([
            0,
            -wall_y/2 -0.005,
            0
            ])
        rotate([
            90,
            0,
            0
            ])
        screw_cavity();
*/

        // triangle pattern
        // TODO
    }
}

wall();
