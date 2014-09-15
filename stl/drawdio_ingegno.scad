// Licence: Creative Commons, Attribution
// Created: 17-10-2014 by bmcage http://www.thingiverse.com/bmcage

// Ingegnio drawdio holders, fitting for pencil

rack = "no";  //[yes, no]
//number in x direction
rack_x = 5;
//distance in rack
rack_dist_x = 42;
//number in y directionuse 
rack_y = 2;
//distance in rack
rack_dist_y = 35;


if (rack == "yes") {
 translate([-(rack_x-1)/2 * rack_dist_x,-(rack_y-1)/2 * rack_dist_y,0])
 for (i=[1:rack_x]) {
   for (j=[1:rack_y]) {
     translate([(i-1)*rack_dist_x, (j-1)*rack_dist_y, 0])
      translate([0,5,0]) drawdio();
   }
 }
} else {
  translate([0,0,0]) drawdio();
}


use <utils/build_plate.scad>;

//for display only, doesn't contribute to final object
build_plate_selector = 0; //[0:Replicator 2,1: Replicator,2:Thingomatic,3:Manual]

//when Build Plate Selector is set to "manual" this controls the build plate x dimension
build_plate_manual_x = 100; //[100:400]

//when Build Plate Selector is set to "manual" this controls the build plate y dimension
build_plate_manual_y = 100; //[100:400]

build_plate(build_plate_selector,build_plate_manual_x,build_plate_manual_y); 

//modules

holerad = 4.5;
module drawdio() {
  difference() {
    union() {
      basedrawdio();
      taper();
    }
    translate([0,0,-1]) cylinder(r=holerad, h=5, $fn=50);
  }
  
}

module basedrawdio() {
 union() {
  cylinder(r=10, h=3, $fn=50);
  translate([-12,-1,0]) cube([24, 2, 1]);
  rotate([0,0,120])translate([-12,-1,0]) cube([24, 2, 1]);
  rotate([0,0,240])translate([-12,-1,0]) cube([24, 2, 1]);
 }
}

module tapering(){
 translate([holerad+1,0,2]) rotate([0,-5,0]) translate([-1,-2.5,0]) cube([2,4,15]);
}

module taper(){
  tapering();
  rotate([0,0,90]) tapering();
  rotate([0,0,180]) tapering();
  rotate([0,0,270]) tapering();
}