
include <measures.scad>;
use <face_back.scad>;
use <patterns/pattern_triangles.scad>;

module face_front()
{
    difference()
    {
        // the back doesn't have any cutouts
        face_back();

        // round door
        translate([
            - house_x/2 + door_x,
            0,
            + door_z
            ])
        rotate([
            90,
            0,
            0
            ])
        cylinder(
            r=door_radius,
            h=material_z*1.2,
            center=true
            );

        // pattern
        translate([
            0,
            0,
            window_offset_z,
            ])
        // rotate into xz-plane
        rotate([
            90,
            0,
            0
            ])
        // make 3d
        linear_extrude(material_z*1.001, center=true)
        pattern_triangles(
            window_triangle_count_x,
            window_triangle_count_y,
            3, 7,
            1, 3
            );

        // hole for wall's nose
        translate([
            wall_offset_x,
            0,
            material_z + wall_z/2
            ])
        cube([
            material_z,
            material_z*1.2,
            wall_z/3
            ], center=true);
   }
    
}

face_front();
