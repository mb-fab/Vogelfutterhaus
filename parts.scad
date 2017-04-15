
include <measures.scad>;
use <face_front.scad>;
use <face_back.scad>;
use <face_bottom.scad>;
use <face_side.scad>;
use <roof_plane.scad>;
use <roof_support.scad>;

module base_material()
{
    color("brown")
    translate([
        0,
        0,
        -material_z-0.005
        ])
    cube([
        material_x,
        material_y,
        material_z
        ]);
}

module part_front()
{
    translate([
        house_x/2 + material_z,
        material_z,
        material_z/2
        ])
    rotate([
        -90,
        0,
        0
        ])
    face_front();
}

module part_back()
{
    translate([
        house_x/2 + material_z,
        material_z,
        material_z/2
        ])
    rotate([
        -90,
        0,
        0
        ])
    face_back();
}

module part_side()
{
    translate([
        house_y/2 + material_z,
        house_z/2 + material_z,
        material_z/2
        ])
    rotate([
        0,
        90,
        90
        ])
    face_side();
}

module part_bottom()
{
    translate([
        house_x/2,
        house_y/2,
        material_z/2
        ])
    face_bottom();
}

module part_roof_plane()
{
    translate([
        0,
        roof_plane_y/2,
        0.005
        ])
    rotate([
        0,
        -roof_angle,
        0
        ])
    roof_plane_right();
}

module part_roof_support()
{
    translate([
        house_x/2,
        roof_elevation,
        material_z/2 +0.005
        ])
    rotate([
        90,
        0,
        0
        ])
    roof_support();
}

spacing = 1;

base_material();

module parts()
{
    part_front();

    translate([
        house_x + 2*material_z + spacing,
        0,
        0
        ])
    part_back();

    translate([
        house_x/2 + 2*material_z,
        house_z + 2*material_z + spacing,
        0
        ])
    part_roof_support();

    translate([
        roof_elevation + 2*roof_plane_x + 2*spacing,
        house_z + roof_elevation + 2*material_z + 2*spacing,
        0
        ])
    rotate([
        0,
        0,
        90
        ])
    part_roof_support();

    translate([
        0,
        house_z + roof_elevation + 3*material_z,
        0
        ])
    {
        part_roof_plane();
        translate([
            roof_plane_x + spacing,
            0,
            0
            ])
        part_roof_plane();
    }

    translate([
        2*house_x + 3*material_z + 2*spacing,
        0,
        0
        ])
    part_side();

    translate([
        2*house_x + 3*material_z + 2*spacing,
        house_z + material_z + spacing,
        0
        ])
    part_side();

    translate([
        2*roof_plane_x + roof_elevation + 3*spacing,
        house_z + roof_elevation + material_z + roof_plane_y - house_y + 2*spacing,
        0
        ])
    part_bottom();
}

parts();

