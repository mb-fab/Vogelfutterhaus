
include <measures.scad>;
use <face_back.scad>;

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
   }
    
}

face_front();
