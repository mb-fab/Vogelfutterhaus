
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
            window_z,
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
            7, 5,
            3, 7,
            1, 3
            );
   }
    
}

face_front();
