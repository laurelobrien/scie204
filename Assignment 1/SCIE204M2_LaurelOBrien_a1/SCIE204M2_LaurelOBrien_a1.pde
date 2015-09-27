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
  //draw feet
  fill(deepPurple);
  beginShape(); //left foot
    vertex(210, 552);
    vertex(221, 551);
    vertex(221, 565);
    vertex(212, 566);
    vertex(209, 564);
  endShape(CLOSE);
  beginShape(); //right foot
    vertex(307, 554);
    vertex(323, 544);
    vertex(325, 563);
    vertex(310, 567);
  endShape(CLOSE);
  
  fill(darkPurple);
  beginShape(); //left ankle
    vertex(204, 541);
    vertex(227, 533);
    vertex(226, 549);
    vertex(222, 554);
    vertex(209, 555);
    vertex(205, 552);
  endShape(CLOSE);
  beginShape(); //right ankle
    vertex(304, 535);
    vertex(326, 531);
    vertex(324, 553);
    vertex(319, 548);
    vertex(307, 554);
  endShape(CLOSE);
  
  fill(midPurple);
  beginShape(); //left calf
    vertex(195, 531);
    vertex(228, 520);
    vertex(229, 532);
    vertex(217, 540);
    vertex(204, 541);
  endShape(CLOSE);
  beginShape(); //right calf
    vertex(298, 520);
    vertex(322, 512);
    vertex(330, 525);
    vertex(325, 534);
    vertex(304, 535);
    vertex(298, 532);
  endShape(CLOSE);
  
  fill(lightPurple);
  beginShape(); //left knee
    vertex(186, 514);
    vertex(232, 504);
    vertex(228, 520);
    vertex(200, 532);
    vertex(187, 530);
  endShape();
  beginShape(); //right knee
    vertex(295, 500);
    vertex(299, 494);
    vertex(324, 492);
    vertex(342, 498);
    vertex(341, 519);
    vertex(330, 525);
    vertex(322, 517);
    vertex(298, 520);
    vertex(295, 517);
  endShape();
}