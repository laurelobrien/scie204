//////////////////////////////
// Assignment 1
// Laurel O'Brien
// 20150914
//
// Draw a character
/////////////////////////////

//initialize colour variables for global use
color lightGrey = color(204, 200, 200);
color midGrey = color(187, 182, 182);
color darkGrey = color(165, 159, 159);

color lightGreen = color(131, 135, 123);
color midGreen = color(109, 112, 102);
color darkGreen = color(93, 96, 87);

color maroon = color(148, 85, 83);
color gold = color(226, 191, 26);
color bronze = color(209, 170, 75);
color aquaMarine = color(125, 216, 205);
color brown = color(166, 124, 82);
color lightPurple = color(86, 73, 99);
color midPurple = color(71, 63, 81);
color darkPurple = color(61, 56, 68);
color deepPurple = color(48, 45, 53);

void setup()
{
  size(480, 640); //set canvas size
  background(#f3f3f3); //light grey
  noStroke(); //default to strokeless shapes
}

//call function that draws Bard
void draw()
{
  drawBard();
}

//draw Bard, the Wandering Tinkerer
void drawBard()
{
  
}