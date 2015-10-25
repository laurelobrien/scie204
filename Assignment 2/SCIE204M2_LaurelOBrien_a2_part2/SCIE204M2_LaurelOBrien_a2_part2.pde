//////////////////////////////
// Assignment 1
// Laurel O'Brien
// 20150914
//
// Draw a character
/////////////////////////////

//initialize and declare colour variables for global use
color lightGrey = color(214, 211, 211);
color midGrey = color(190, 185, 185);
color darkGrey = color(168, 165, 165);

color lightGreen = color(131, 135, 123);
color midGreen = color(109, 112, 102);
color darkGreen = color(93, 96, 87);

color maroon = color(148, 85, 83);
color gold = color(226, 191, 26);
color bronze = color(209, 170, 75);
color aquaMarine = color(125, 216, 205);
color lightYellow = color(244, 227, 195);

color suedeBrown = color(166, 124, 82);
color lightBrown = color(119, 94, 73);
color midBrown = color(104, 83, 69);
color darkBrown = color(80, 63, 55);

color lightPurple = color(86, 73, 99);
color midPurple = color(71, 63, 81);
color darkPurple = color(61, 56, 68);
color deepPurple = color(48, 45, 53);

color shine = color(255); //white
color blueGlow = color(161, 229, 219, 40); //pale blue

int growVar = 0; //store size of pulsing halo effects in drawGlow()

float steadyRotateAng = 360; //angle that drawGlobeTileGrid() is rotated to



void setup()
{
  size(480, 640); //set canvas size, portrait orientation
  noStroke(); //default starts as strokeless shapes 
}



//call functions that draw Bard and his companion Meep with 
//various transformations and mouse interactions
void draw()
{
  background(#00FF00); //lime green background: should never be visible
  
  //drawGlow(); //draw pulsing glow effect on Bard's staff
  drawGlobeTileGrid(); //draw tiled background of Bard's globes rotating on mouse position
  
  if (mouseY <= height/2) //if mouse is in top half of canvas:
  {
    rotateBard(); //draw Bard rotated to an angle based on mouse x position
  }
  
  drawMeep(); //draw Bard's companion Meep
}


//draw a 100x100 tile from its top-left corner
//depiciting Bard's globe of light. it accepts 2 int arguments to determine
//x and y coordinate location
void drawTile (int xxx, int yyy) 
{ 
  pushMatrix(); //isolate transformations in memory
  
  //TRANSFORMATIONS HAPPEN IN REVERSE
  translate(xxx, yyy); //move the tile by this amount
  //END TRANSFORMATIONS
  
  //drawing
  ellipseMode(RADIUS); //take ellipse size arguments as radius measurements
  
  fill(#2C5174); //navy blue
  rect(0, 0, 100, 100);
  
  fill(aquaMarine);
  ellipse(65, 34, 8, 8); //upper gem on back of globe

  fill(bronze);
  ellipse(50, 50, 23, 23); //main body of globe
  
  fill(gold);
  arc(50, 50, 23, 23, PI, TWO_PI-PI/4, CHORD); //arc made from main globe's dimensions: 
  arc(45, 40, 21, 21, radians(-30), radians(150), CHORD); //arc opposite the first arc to complete the highlight
  
  fill(shine);
  ellipse(41, 46, 3, 4); //inner embossed ring's highlight
  
  noFill(); //remove fill
  stroke(shine); //turn on pale yellow 1px stroke
  ellipse(41, 46, 10, 11); //outer embossed ring's highlight
  ellipse(41, 46, 7, 8); //second embossed ring's highlight
  
  stroke(bronze); //change stroke to dull bronze colour
  ellipse(40, 45, 10, 11); //outer embossed ring
  ellipse(40, 45, 7, 8); //second embossed ring
  
  noStroke(); //turn off stroke
  fill(bronze); //return to bronze fill
  ellipse(40, 45, 3, 4); //inner embossed ring
  
  fill(aquaMarine); //fluorescent blue
  ellipse(66, 66, 4, 4); //tiny gem
  ellipse(41, 71, 9, 8); //large lower gem on front of globe
  
  fill(shine); //white
  ellipse(65, 65, 2, 1); //specular highlight on tiny gem
  ellipse(37, 68, 3, 1); //specular highlight on larger lower gem
  ellipse(67, 28, 3, 1); //specular highlight on upper gem behind globe
  
  ellipseMode(DIAMETER); //reset ellipse size arguments to diamater measurements
  
  popMatrix(); //end memory isolation
}



//call drawTile() with (x, y) coordinates progressively calculated to
//create a seamless grid, with enough repetitions to completely cover
//the canvas. slowly rotate that grid of tiles counter-clockwise
//around its center at the mouse's position.
void drawGlobeTileGrid()
{
  pushMatrix(); //isolate memory for transformations
  
  //TRANSFORMATIONS HAPPEN IN REVERSE
  translate(mouseX, mouseY); //move the grid's center to the mouse x,y position
  rotate(radians(steadyRotateAng)); //rotate grid based on mouse's y position
  translate(-842, -842); //move the grid's center to the origin
  //END TRANSFORMATIONS
  
  //vertical strip
  for (int j = 0; j < 17; j ++) //for 16 columns of tiles:
  {
    //horizontal strip
    for (int i = 0; i < 17; i ++)  //draw 16 rows of tiles
    {
      drawTile(i * 99, j * 99); //call drawTile() in a location determined by iteration count
    } 
  }
  
  popMatrix(); //done isolating memory
  
  steadyRotateAng -= 0.5; //decrement angle of rotation by 1
}


//rotate Bard around his approximate center according to
//mouse's horizontal position
void rotateBard() 
{
  pushMatrix(); //isolate memory for transformations
  
  //TRANSFORMATIONS HAPPEN IN REVERSE
  translate(210, 283); //return Bard to his original position
  rotate(radians(mouseX));//rotate Bard to an angle based on mouse X position
  translate(-210, -283); //move Bard to the canvas origin
  //END TRANSFORMATIONS
  
  drawBard(); //call function that draws Bard
  
  popMatrix(); //end memory isolation
}



//draw our hero Bard, the Wandering Tinkerer
void drawBard()
{
  //draw ponytail
  fill(darkGrey);
  beginShape(); //ponytail hair
    vertex(314,149);
    vertex(310,112);
    vertex(299,93);
    vertex(283.5,87);
    vertex(271,88);
    vertex(257,99);
    vertex(241.9,123.2);
    vertex(235.3,138.6);
    vertex(244.1,139.7);
    vertex(267,121.2);
    vertex(266,143);
  endShape(CLOSE);

  
  fill(darkPurple);
  beginShape(); //back hair wrap
    vertex(266,92);
    vertex(257,98);
    vertex(255,105);
    vertex(259,117);
    vertex(264.7,123);
    vertex(267,121.2);
    vertex(262,112);
    vertex(260,103);
  endShape(CLOSE);
  
  fill(midPurple);
  beginShape(); //middle hair wrap
    vertex(267,110);
    vertex(264,98);
    vertex(271,88);
    vertex(283,86);
    vertex(299,93);
    vertex(284,88);
    vertex(272,93);
    vertex(269,99);
    vertex(271,108);
  endShape(CLOSE);
  
  fill(lightPurple);
  beginShape(); //front hair wrap
    vertex(311,114);
    vertex(302,104);
    vertex(280,104);
    vertex(270,114);
    vertex(267,110);
    vertex(275,96);
    vertex(290,91);
    vertex(299,93);
    vertex(308,106);
  endShape(CLOSE);
  
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
  beginShape(); //right pinky
    vertex(377, 456);
    vertex(365, 461);
    vertex(363, 471);
    vertex(379, 473);
    vertex(384, 462);
  endShape(CLOSE);
  fill(midBrown);
  beginShape(); //right index finger
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
  beginShape(); //right thumb
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
  
  //draw legs
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
  
  //draw hair, ears, and antenna
  fill(midGrey);
  beginShape(); //hair
    vertex(308, 139);
    vertex(307, 132);
    vertex(293, 130);
    vertex(268, 128);
    vertex(235, 139);
    vertex(203, 158);
    vertex(196, 174);
    vertex(183, 185);
    vertex(195, 190);
    vertex(185, 212);
    vertex(344, 211);
    vertex(351, 207);
    vertex(349, 182);
    vertex(342, 176);
    vertex(341, 156);
  endShape(CLOSE); 
  fill(lightGrey);
  beginShape(); //left ear
    vertex(305, 163);
    vertex(304, 143);
    vertex(264, 105);
    vertex(279, 150);
    vertex(293, 170);
  endShape(CLOSE);
  beginShape(); //right ear
    vertex(325, 172);
    vertex(331, 159);
    vertex(356, 153);
    vertex(347, 174);
    vertex(329, 186);
  endShape(CLOSE);
  fill(maroon);
  ellipse(320, 138, 22, 22); //mask antenna
  fill(darkBrown);
  beginShape(); //mask antenna wrapping
    vertex(314, 147);
    vertex(307, 171);
    vertex(319, 175);
    vertex(327, 147);
    vertex(320, 143);
    vertex(314, 147);
  endShape(CLOSE);
  
  //draw belly and purple apron
  fill(midGreen);
  beginShape(); //belly
    vertex(331, 313);
    vertex(337, 331);
    vertex(332, 383);
    vertex(160, 358);
    vertex(194, 242);
  endShape(CLOSE);
  fill(midPurple);
  beginShape(); //purple apron
    vertex(206, 353);
    vertex(328, 368);
    vertex(339, 357);
    vertex(344, 358);
    vertex(336, 381);
    vertex(335, 400);
    vertex(322, 435);
    vertex(294, 460);
    vertex(273, 462);
    vertex(245, 450);
    vertex(188, 399);
  endShape(CLOSE);
  
  //draw left sleeve
  fill(lightGreen);
  beginShape();
    vertex(172, 240);
    vertex(157, 266);
    vertex(154, 275);
    vertex(141, 286);
    vertex(126, 326);
    vertex(206, 339);
    vertex(203, 316);
    vertex(194, 289);
    vertex(200, 263);
    vertex(230, 217);
    vertex(211, 200);
    vertex(180, 217);
  endShape(CLOSE);
  
  //draw red apron and shoulderpad
  fill(maroon);
  beginShape(); //red apron
    vertex(212, 301);
    vertex(228, 389);
    vertex(278, 418);
    vertex(326, 390);
    vertex(320, 359);
    vertex(321, 326);
  endShape(CLOSE);
  beginShape(); //shoulderpad
    vertex(228, 206);
    vertex(222, 195);
    vertex(198, 199);
    vertex(181, 209);
    vertex(172, 230);
    vertex(172, 240);
    vertex(188, 216);
    vertex(200, 217);
    vertex(207, 205);
    vertex(209, 216);
    vertex(221, 220);
  endShape(CLOSE);
  
  //draw tied-off section of beard
  fill(darkBrown);
  beginShape(); //beard wrapping
    vertex(263, 384);
    vertex(271, 391);
    vertex(278, 385);
    vertex(286, 346);
    vertex(276, 342);
    vertex(262, 346);
  endShape(CLOSE);
  fill(lightGrey);
  beginShape(); //tip of beard
    vertex(263, 385);
    vertex(254, 392);
    vertex(250, 402);
    vertex(257, 399);
    vertex(262, 423);
    vertex(268, 423);
    vertex(281, 404);
    vertex(283, 392);
    vertex(278, 385);
  endShape(CLOSE);
  
  //draw left arm bands
  fill(suedeBrown);
  beginShape(); //left suede arm band
    vertex(118, 345);
    vertex(105, 389);
    vertex(116, 403);
    vertex(160, 385);
    vertex(208, 394);
    vertex(212, 357);
    vertex(198, 334);
    vertex(151, 321);
    vertex(131, 329);
  endShape(CLOSE);
  fill(lightPurple);
  beginShape(); //left top purple band
    vertex(118, 345);
    vertex(123, 329);
    vertex(126, 326);
    vertex(151, 318);
    vertex(194, 327);
    vertex(211, 342);
    vertex(212, 357);
    vertex(196, 334);
    vertex(145, 325);
  endShape(CLOSE);
  fill(maroon);
  beginShape(); //left red band
    vertex(108, 359);
    vertex(108, 372);
    vertex(105, 389);
    vertex(112, 384);
    vertex(115, 379);
    vertex(135, 372);
    vertex(186, 371);
    vertex(209, 383);
    vertex(208, 394);
    vertex(214, 388);
    vertex(217, 372);
    vertex(213, 361);
    vertex(198, 349);
    vertex(152, 339);
    vertex(122, 349);
  endShape(CLOSE);
  
  //draw staff
  fill(aquaMarine);
  ellipse(65, 442, 23, 29); //jewel on top of globe
  ellipse(101, 398, 26, 23); //jewel on edge of globe
  fill(gold);
  ellipse(104, 438, 87, 86); //globe of staff
  fill(lightPurple);
  beginShape(); //left bottom purple band (overlapping globe)
    vertex(125, 413);
    vertex(121, 407);
    vertex(116, 391);
    vertex(127, 381);
    vertex(173, 375);
    vertex(201, 383);
    vertex(201, 405);
  endShape(CLOSE);
  fill(aquaMarine);
  ellipse(98, 465, 26, 24); //draw jewel on front of globe
  fill(lightBrown);
  beginShape(); //left thumb (behind staff)
    vertex(197, 401);
    vertex(188, 402);
    vertex(189, 418);
    vertex(211, 413);
  endShape(CLOSE);
  fill(lightGreen);
  beginShape(); //staff handle
    vertex(166, 464);
    vertex(205, 459);
    vertex(222, 453);
    vertex(228, 446);
    vertex(230, 411);
    vertex(219, 407);
    vertex(147, 420);
  endShape(CLOSE);
  fill(gold);
  beginShape(); //gold plate on handle
    vertex(239, 414);
    vertex(225, 409);
    vertex(217, 421);
    vertex(218, 437);
    vertex(225, 448);
    vertex(240, 442);
  endShape(CLOSE);
  
  //draw left hand
  fill(lightGrey);
  beginShape(); //left glove
    vertex(197, 401);
    vertex(187, 395);
    vertex(147, 400);
    vertex(126, 408);
    vertex(124, 429);
    vertex(162, 432);
    vertex(189, 414);
    vertex(192, 404);
  endShape(CLOSE);
  fill(midBrown);
  beginShape(); //left pinky finger
    vertex(124, 429);
    vertex(122, 448);
    vertex(136, 460);
    vertex(148, 462);
    vertex(133, 429);
    vertex(129, 427);
  endShape(CLOSE);
  fill(lightBrown);
  beginShape(); //left middle finger
    vertex(133, 429);
    vertex(137, 456);
    vertex(153, 472);
    vertex(166, 477);
    vertex(173, 473);
    vertex(173, 464);
    vertex(160, 450);
    vertex(159, 432);
    vertex(145, 426);
  endShape(CLOSE);
  beginShape(); //left index finger
    vertex(186, 416);
    vertex(178, 413);
    vertex(165, 418);
    vertex(162, 432);
    vertex(170, 449);
    vertex(181, 461);
    vertex(193, 470);
    vertex(199, 466);
    vertex(199, 454);
    vertex(190, 434);
  endShape(CLOSE);
  
  //draw staff handle
  fill(darkPurple);
  beginShape(); //purple staff handle
    vertex(255, 416);
    vertex(257, 438);
    vertex(238, 439);
    vertex(231, 432);
    vertex(230, 417);
    vertex(239, 414);
  endShape(CLOSE);
  fill(deepPurple);
  beginShape(); //darker purple staff handle
    vertex(326, 403);
    vertex(307, 407);
    vertex(283, 411);
    vertex(255, 416);
    vertex(248, 423);
    vertex(248, 431);
    vertex(257, 438);
    vertex(278, 429);
    vertex(287, 422);
    vertex(315, 417);
  endShape(CLOSE);
  
  //draw tassels and knots on apron (keep previous fill of deepPurple)
  fill(lightPurple);
  triangle(240, 465, 248, 450, 256, 465); //first tassel
  triangle(280, 476, 288, 461, 297, 476); //second tassel
  triangle(311, 456, 319, 441, 328, 456); //third tassel
  triangle(327, 420, 334, 409, 341, 420); //fourth tassel
  ellipse(248, 451, 13, 10); //first knot
  ellipse(287, 462, 14, 9); //second knot
  ellipse(316, 441, 14, 10); //third knot
  ellipse(333, 408, 12, 8); //fourth knot
  
  //draw beard
  fill(midGrey);
  beginShape(); //beard midtones
    vertex(208, 240);
    vertex(208, 266);
    vertex(209, 296);
    vertex(227, 321);
    vertex(250, 337);
    vertex(301, 337);
    vertex(330, 319);
    vertex(336, 306);
    vertex(343, 317);
    vertex(350, 280);
    vertex(347, 237);
  endShape(CLOSE);
  fill(darkGrey);
  beginShape(); //beard shadows
    vertex(318, 313);
    vertex(311, 325);
    vertex(301, 334);
    vertex(300, 315);
    vertex(292, 329);
    vertex(285, 336);
    vertex(275, 316);
    vertex(273, 336);
    vertex(263, 328);
    vertex(255, 315);
    vertex(254, 332);
    vertex(246, 326);
    vertex(236, 315);
    vertex(241, 331);
    vertex(227, 321);
    vertex(236, 335);
    vertex(262, 348);
    vertex(286, 348);
    vertex(294, 343);
    vertex(306, 343);
    vertex(329, 320);
    vertex(330, 319);
    vertex(318, 325);
  endShape(CLOSE);
  fill(lightGrey);
  beginShape(); //beard highlights
    vertex(223,273);
    vertex(226,288);
    vertex(245,258);
    vertex(242,275);
    vertex(244,299);
    vertex(261,269);
    vertex(267,286);
    vertex(279,306);
    vertex(282,272);
    vertex(287,258);
    vertex(293,285);
    vertex(299,273);
    vertex(300,305);
    vertex(311,287);
    vertex(314,268);
    vertex(318,290);
    vertex(325,269);
    vertex(333,299);
    vertex(338,278);
    vertex(337,260);
    vertex(342,273);
    vertex(345,249);
    vertex(351, 253);
    vertex(344, 204);
    vertex(336, 196);
    vertex(304, 196);
    vertex(290, 172);
    vertex(279, 163);
    vertex(271, 168);
    vertex(257, 166);
    vertex(245, 178);
    vertex(208, 235);
    vertex(202, 265);
    vertex(208, 259);
    vertex(214, 275);
    vertex(224, 257);
  endShape(CLOSE);
  
  //draw face mask
  fill(maroon);
  ellipse(305, 189, 53, 56); //face mask base
  stroke(124, 61, 60); //dark maroon to shade face mask bevel
  noFill(); //stroke only
  strokeWeight(2); //thicker stroke
  ellipse(306, 192, 41, 41); //face mask bevel
  noStroke(); //turn off stroke from bevels
  fill(bronze);
  beginShape(); //gold face plate
    vertex(326, 186);
    vertex(311, 186);
    vertex(299, 174);
    vertex(291, 176);
    vertex(287, 185);
    vertex(295, 195);
    vertex(293, 207);
    vertex(298, 212);
    vertex(306, 212);
    vertex(314, 205);
    vertex(324, 201);
    vertex(327, 195);
  endShape(CLOSE);
  
  //draw eyes and mouth
  fill(lightYellow); //near-white, glowy yellow
  ellipse(302, 204, 9, 11); //mouth
  ellipse(298, 186, 10, 12); //left eye
  ellipse(318, 195, 12, 10); //right eye
}

//draw Meep, Bard's companion
void drawMeep() 
{
  noStroke(); //fill only
  
  //draw body
  fill(bronze);
  ellipse(109, 113, 43, 40); //head
  ellipse(120, 166, 21, 26); //abdomen
  beginShape(); //neck
    vertex(128, 122);
    vertex(121, 135);
    vertex(125, 149);
    vertex(130, 161);
    vertex(110, 166);
    vertex(112, 152);
    vertex(109, 145);
    vertex(102, 136);
    vertex(90, 123);
  endShape(CLOSE);
  beginShape(); //feet
    vertex(110, 169);
    vertex(114, 181);
    vertex(123, 193);
    vertex(123, 181);
    vertex(129, 178);
    vertex(134, 185);
    vertex(132, 170);
    vertex(130, 161);
  endShape(CLOSE);
  
  //draw eyes and eye stripes
  stroke(maroon);
  noFill(); //lines only
  beginShape(); //right eye stripe
    vertex(127, 104);
    vertex(122, 115);
    vertex(125, 123);
    vertex(125, 125);
  endShape(); //no CLOSE: open shape
  beginShape(); //left eye stripe
    vertex(88, 110);
    vertex(107, 118);
    vertex(109, 125);
    vertex(100, 132);
  endShape(); //still no CLOSE: open shape
  fill(lightYellow); //same eye colour as Bard, keep using maroon stroke from stripes
  ellipse(106, 120, 9, 13); //left eye
  ellipse(125, 116, 7, 12); //right eye
  
  //draw shadows
  noStroke(); //remove stroke leftover from drawing eyes
  fill(148, 85, 83, 255/4); //maroon rgb plus alpha value expression: 25% opacity
  beginShape(); //neck shadow
    vertex(125, 128);
    vertex(120, 133);
    vertex(110, 135);
    vertex(97, 130);
    vertex(102, 136);
    vertex(107, 142);
    vertex(120, 147);
    vertex(123, 142);
    vertex(121, 135);
  endShape(CLOSE);
  beginShape(); //feet shadow
    vertex(114, 181);
    vertex(120, 185);
    vertex(126, 176);
    vertex(130, 177);
    vertex(134, 185);
    vertex(128, 178);
    vertex(123, 181);
    vertex(123, 193);
  endShape(CLOSE);
}

//draw pulsing glow from tip of Bard's staff, using
//low opacity fill to stack up brightness as glow expands
void drawGlow() 
{ 
  fill(125, 216, 205, 255/16); //aquaMarine plus alpha value: lowered opacity
  
  ellipse(65, 442, 23 + growVar, 29 + growVar);//draw an ellipse whose size is variable starting at 23x29
  
  //if growVar reaches 42px or higher, wipe the glow with a large grey ellipse
  //and reset growVar to 0 so the animation starts over
  if (growVar >= 42)
  {
    fill(#f3f3f3); //light grey, same as setup() background()
    ellipse(65, 442, 100, 100); //ellipse larger than glow
    growVar = 0; //reset (re-assign) growVar as 0
  } 
  else 
  {
    growVar += 3; //increment growVar by 3 if it isn't 42 yet
  }
}