xSize = 45; // length
ySize = 15; // width
zSize = 15; //height

wall_thickness = 3;// [3:10]


/* [Text] */
textHeight = 2; // [1:10] 
textSize = 7; // [1:50]
myFont = "Liberation Sans"; // [Liberation Mono, Liberation Sans, Liberation Sans Narrow and Liberation Serif]
myColor = "yellow"; // [green, yellow, blue, red, silver, black]
myText = "My Name"; // Your name here!

holeSize = [xSize*1.5, ySize, zSize];
cubeSize = [xSize, ySize + wall_thickness, zSize+ wall_thickness];
include <MCAD/boxes.scad>
module textExtrude() {
    color(myColor)
    linear_extrude(height = textHeight)
    text(myText, halign = "center", valign = "center", size = textSize,
      font = myFont);
}

module holder() {
    difference () {
        roundedBox(cubeSize, radius = 2, $fn = 36);
        cube(holeSize, center=true);
        translate([0, 0, (zSize + wall_thickness)/2-1]) textExtrude();
    }
    

}

holder();