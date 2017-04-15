
include <measures.scad>;
use <face_front.scad>;
use <face_back.scad>;
use <face_side.scad>;
use <face_bottom.scad>;
use <roof.scad>;

color("blue")
translate([
    0,
    0,
    +material_z/2
    ])
face_bottom();

color("green")
translate([
    0,
    -house_y/2 + material_z/2,
    0
    ])
face_front();

color("magenta")
translate([
    0,
    +house_y/2 - material_z/2,
    0
    ])
face_back();

color("yellow")
{
    translate([
        house_x/2 - material_z/2,
        0,
        house_z/2
        ])
    face_side();

    translate([
        -house_x/2 + material_z/2,
        0,
        house_z/2
        ])
    face_side();
}

color("red")
translate([
    0,
    0,
    house_z + roof_elevation
    ])
#roof();
