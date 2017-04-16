
include <measures.scad>;
use <face_front.scad>;
use <face_back.scad>;
use <face_side.scad>;
use <face_bottom.scad>;
use <wall.scad>;
use <roof.scad>;

color("blue")
translate([
    0,
    0,
    +material_z/2 -0.005
    ])
face_bottom();

color("green")
translate([
    0,
    -house_y/2 + material_z/2 -0.005,
    0
    ])
face_front();

color("magenta")
translate([
    0,
    +house_y/2 - material_z/2 +0.005,
    0
    ])
face_back();

color("yellow")
{
    translate([
        house_x/2 - material_z/2 +0.005,
        0,
        house_z/2
        ])
    face_side();

    translate([
        -house_x/2 + material_z/2 -0.005,
        0,
        house_z/2
        ])
    face_side();
}

translate([
    0,
    0,
    house_z + roof_elevation +0.005
    ])
#roof();

color("lightblue")
translate([
    wall_offset_x,
    -house_y/2 + wall_y/2 + material_z,
    wall_z/2 + material_z
    ])
wall();
