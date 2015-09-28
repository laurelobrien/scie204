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

color suedeBrown = color(166, 124, 82);
color lightBrown = color(119, 94, 73);
color midBrown = color(104, 83, 69);
color darkBrown = color(80, 63, 55);

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
  //draw right arm
  fill(darkGreen);
  beginShape(); //right sleeve
    vertex(328, 269);
    vertex(347, 267);
    vertex(366, 287);
    vertex(373, 302);
    vertex(373, 309);
    vertex(387, 337);
    vertex(386, 345);
    vertex(398, 370);
    vertex(327, 400);
  endShape(CLOSE);
  
  fill(suedeBrown);
  beginShape(); //right suede band
    vertex(343, 392);
    vertex(382, 371);
    vertex(409, 375);
    vertex(416, 416);
    vertex(358, 438);
  endShape(CLOSE);
  
  fill(maroon);
  beginShape(); //draw right red band
    vertex(411, 382);
    vertex(416, 389);
    vertex(418, 404);
    vertex(415, 409);
    vertex(402, 409);
    vertex(366, 421);
    vertex(350, 432);
    vertex(343, 410);
    vertex(368, 394);
  endShape(CLOSE);
  
  fill(lightPurple);
  beginShape(); //right purple band (top)
    vertex(339, 388);
    vertex(381, 364);
    vertex(403, 362);
    vertex(409, 375);
    vertex(387, 379);
    vertex(363, 387);
    vertex(340, 405);
  endShape(CLOSE);
  beginShape(); //right purple band (bottom)
    vertex(353, 438);
    vertex(370, 426);
    vertex(395, 417);
    vertex(416, 415);
    vertex(417, 429);
    vertex(413, 434);
    vertex(399, 434);
    vertex(371, 441);
    vertex(357, 445);
  endShape(CLOSE);
  
  fill(lightGrey);
  beginShape(); //draw right glove
    vertex(364, 443);
    vertex(374, 436);
    vertex(396, 429);
    vertex(409, 429);
    vertex(419, 451);
    vertex(418, 459);
    vertex(377, 456);
  endShape(CLOSE);
  
  fill(darkBrown);
  beginShape(); //draw right pinky
    vertex(377, 456);
    vertex(365, 461);
    vertex(363, 471);
    vertex(379, 473);
    vertex(384, 462);
    //points="377.4,455.8 365.3,461.3 363.1,471.2 378.5,473.4 384,462.4 "
  endShape(CLOSE);
  
  fill(midBrown);
  beginShape(); //draw index finger
    vertex(418, 459);
    vertex(412, 454);
    vertex(403, 455);
    vertex(377, 476);
    vertex(374, 484);
    vertex(383, 496);
    vertex(400, 493);
    vertex(413, 483);
  endShape(CLOSE);
  
  fill(lightBrown);
  beginShape(); //draw right thumb
    vertex(377, 456);
    vertex(385, 444);
    vertex(399, 446);
    vertex(403, 455);
    vertex(398, 473);
    vertex(392, 487);
    vertex(381, 486);
    vertex(379, 473);
  endShape(CLOSE);
  
  //draw pants
  fill(darkBrown);
  beginShape(); //left pants
    vertex(160, 464);
    vertex(248, 434);
    vertex(245, 486);
    vertex(240, 501);
    vertex(203, 517);
    vertex(178, 513);
    vertex(159, 484);
  endShape(CLOSE);
  beginShape(); //right pants
    vertex(359, 491);
    vertex(368, 458);
    vertex(364, 438);
    vertex(347, 395);
    vertex(352, 384);
    vertex(343, 378);
    vertex(329, 379);
    vertex(266, 459);
    vertex(274, 487);
    vertex(279, 489);
    vertex(279, 494);
    vertex(295, 500);
    vertex(324, 504);
    vertex(342, 497);
  endShape();
  
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
  endShape(CLOSE);
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
  endShape(CLOSE);
}