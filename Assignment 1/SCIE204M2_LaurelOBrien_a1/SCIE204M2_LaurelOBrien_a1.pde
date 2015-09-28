//////////////////////////////
// Assignment 1
// Laurel O'Brien
// 20150914
//
// Draw a character
/////////////////////////////

//initialize colour variables for global use
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
  
  fill(midGreen);
  beginShape(); //green belly
    vertex(331, 313);
    vertex(337, 331);
    vertex(332, 383);
    vertex(160, 358);
    vertex(194, 242);
  endShape(CLOSE);
  
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
    vertex(313.5, 147.4);
    vertex(306.9, 170.5);
    vertex(319.1, 174.9);
    vertex(326.8, 147.4);
    vertex(320.2, 143);
    vertex(313.5, 147.4);
  endShape(CLOSE);
  
  fill(midPurple);
  beginShape(); //purple apron
    vertex(205.6,353.4);
    vertex(327.9,367.7);
    vertex(338.9,356.7);
    vertex(344.4,357.8);
    vertex(335.6,380.9);
    vertex(334.5,399.6);
    vertex(322.4,434.9);
    vertex(293.7,460.2);
    vertex(272.8,462.4);
    vertex(245.3,450.3);
    vertex(188,398.5);
  endShape(CLOSE);
  
  fill(lightGreen);
  beginShape(); //left sleeve
    vertex(172, 239.9);
    vertex(157.1, 266.4);
    vertex(153.8, 275.2);
    vertex(140.6, 286.2);
    vertex(126.3, 325.8);
    vertex(205.8, 339.1);
    vertex(203.4, 315.9);
    vertex(194, 289);
    vertex(200, 263);
    vertex(229.8, 216.8);
    vertex(211.1, 200.3);
    vertex(180.3, 216.8);
  endShape(CLOSE);
  
  fill(maroon);
  beginShape(); //red apron
    vertex(212.2, 300.5);
    vertex(227.6, 388.6);
    vertex(278.3, 418.4);
    vertex(325.7, 389.7);
    vertex(320.2, 358.9);
    vertex(321.3, 325.8);
  endShape(CLOSE);
  beginShape(); //shoulderpad
    vertex(227.8,206.4);
    vertex(221.9,194.7);
    vertex(197.7,198.8);
    vertex(181,209.1);
    vertex(172,230);
    vertex(172,239.9);
    vertex(188,215.7);
    vertex(200.1,216.8);
    vertex(206.7,204.7);
    vertex(208.9,215.7);
    vertex(221,220.1);
  endShape(CLOSE);
  
  fill(darkBrown);
  beginShape(); //beard wrapping
    vertex(262.9,384.2);
    vertex(270.6,390.8);
    vertex(278.3,385.3);
    vertex(286,346.2);
    vertex(276.1,342.4);
    vertex(261.8,346.2);
  endShape(CLOSE);
  
  fill(lightGrey);
  beginShape(); //tip of beard
    vertex(262.9,384.5);
    vertex(254.1,392.1);
    vertex(249.7,401.9);
    vertex(257.4,399.2);
    vertex(261.8,423);
    vertex(268.4,423);
    vertex(280.5,404.4);
    vertex(282.7,392.1);
    vertex(278.3,385.4);
  endShape(CLOSE);
  
  fill(suedeBrown);
  beginShape(); //left suede arm band
    vertex(118.3,344.6);
    vertex(105.3,388.6);
    vertex(116.4,402.9);
    vertex(160.4,385.3);
    vertex(207.8,394.1);
    vertex(211.7,356.7);
    vertex(198,333.5);
    vertex(151,321.2);
    vertex(131.2,329.2);
  endShape(CLOSE);
  
  fill(lightPurple);
  beginShape(); //left top purple band
    vertex(118.3,344.6);
    vertex(122.9,329.1);
    vertex(126.2,325.8);
    vertex(150.5,318.1);
    vertex(194,326.9);
    vertex(211,342.4);
    vertex(211.7,356.7);
    vertex(195.7,333.5);
    vertex(145,324.7);
  endShape(CLOSE);
  
  fill(maroon);
  beginShape(); //left red band
    vertex(108,358.9);
    vertex(108,372.1);
    vertex(105.3,388.6);
    vertex(111.9,384.2);
    vertex(115.3,378.7);
    vertex(135.1,372.1);
    vertex(185.8,371);
    vertex(208.9,383.1);
    vertex(207.8,394.1);
    vertex(214.4,387.5);
    vertex(216.6,372.1);
    vertex(213.3,361.1);
    vertex(197.9,349);
    vertex(151.6,339.1);
    vertex(121.8,349);
  endShape(CLOSE);
  
  //draw staff
  fill(aquaMarine);
  ellipse(65, 442, 23, 29); //jewel on top of globe
  ellipse(101, 398, 26, 23); //jewel on edge of globe
  
  fill(gold);
  ellipse(104, 438, 87, 86); //globe of staff
  
  fill(lightPurple);
  beginShape(); //left bottom purple band, overlapping globe
    vertex(124.5,412.8);
    vertex(120.8,406.9);
    vertex(115.5,390.8);
    vertex(127.3,380.9);
    vertex(173,375.4);
    vertex(201,383.1);
    vertex(201,405.1);
  endShape(CLOSE);
  
  fill(aquaMarine);
  ellipse(98, 465, 26, 24); //draw jewel on front of globe
  
  fill(lightBrown);
  beginShape(); //left thumb (behind staff)
    vertex(196.8,400.7);
    vertex(188,402);
    vertex(189,418);
    vertex(211,413);
  endShape(CLOSE);
  
  fill(lightGreen);
  beginShape(); //staff handle
    vertex(166,463.5);
    vertex(204.5,459.1);
    vertex(222,453);
    vertex(228,446);
    vertex(230,411);
    vertex(218.8,407.3);
    vertex(147.2,419.5);
  endShape(CLOSE);
  
  fill(gold);
  beginShape(); //gold plate on handle
    vertex(238.6,414);
    vertex(225,409.4);
    vertex(216.6,420.6);
    vertex(217.7,437.1);
    vertex(225.4,448.1);
    vertex(239.8,441.5);
  endShape(CLOSE);
  
  fill(lightGrey);
  beginShape(); //left glove
    vertex(196.8,400.7);
    vertex(186.9,395.2);
    vertex(147.2,399.6);
    vertex(126.3,408.4);
    vertex(124.1,429.4);
    vertex(161.5,431.6);
    vertex(189.1,414);
    vertex(192,404);
  endShape(CLOSE);
  
  fill(midBrown);
  beginShape(); //left pinky finger
    vertex(124.1,429.4);
    vertex(121.9,448.1);
    vertex(136.2,460.2);
    vertex(148.3,462.4);
    vertex(132.9,429.4);
    vertex(128.5,427.2);
  endShape(CLOSE);
  
  fill(lightBrown);
  beginShape(); //left middle finger
    vertex(132.6,429.4);
    vertex(137.2,455.8);
    vertex(152.7,472.3);
    vertex(165.6,476.7);
    vertex(173,473.4);
    vertex(173,463.5);
    vertex(160.4,450.3);
    vertex(158.8,431.6);
    vertex(144.7,426.1);
  endShape(CLOSE);
  beginShape(); //left index finger
    vertex(185.5,416.2);
    vertex(177.9,412.8);
    vertex(164.8,418.4);
    vertex(161.5,431.6);
    vertex(170.3,449.2);
    vertex(181.4,461.3);
    vertex(192.9,470.1);
    vertex(199,465.7);
    vertex(199,453.6);
    vertex(189.9,433.8);
  endShape(CLOSE);
  
  fill(darkPurple);
  beginShape(); //purple staff handle
    vertex(255.2,416.2);
    vertex(257.4,438.2);
    vertex(237.5,439.3);
    vertex(230.9,431.6);
    vertex(229.8,417.3);
    vertex(238.6,414);
  endShape(CLOSE);
  
  fill(deepPurple);
  beginShape(); //darker purple staff handle
    vertex(325.7,402.9);
    vertex(306.8,407.3);
    vertex(282.6,410.6);
    vertex(254.9,416.2);
    vertex(248,422.8);
    vertex(248,430.5);
    vertex(257.4,438.2);
    vertex(278.3,429.4);
    vertex(287.1,421.7);
    vertex(314.6,417.3);
  endShape(CLOSE);
  
  //draw tassels and knots on apron (keep previous fill of deepPurple)
  fill(lightPurple);
  triangle(240, 465, 248, 450.2, 256, 465); //first tassel
  triangle(279.7, 476, 288.2, 461.2, 296.7, 476); //second tassel
  triangle(310.5, 456, 319.1, 441.2, 327.6, 456); //third tassel
  triangle(327, 420, 334, 407.8, 341, 420); //fourth tassel
  ellipse(248, 451, 13, 10); //first knot
  ellipse(287, 462, 14, 9); //second knot
  ellipse(316, 441, 14, 10); //third knot
  ellipse(333, 408, 12, 8); //fourth knot
  
  fill(midGrey);
  beginShape(); //beard midtones
    vertex(208,239.9);
    vertex(208,266.4);
    vertex(209,296.1);
    vertex(227,321.4);
    vertex(249.7,337.4);
    vertex(300.5,336.5);
    vertex(329.5,318.7);
    vertex(335.6,306.3);
    vertex(343.3,317.2);
    vertex(349.9,279.6);
    vertex(346.8,237);
  endShape(CLOSE);
  
  fill(darkGrey);
  beginShape(); //beard shadows
    vertex(318,313);
    vertex(310.8,325);
    vertex(300.9,334);
    vertex(299.9,315);
    vertex(292,329);
    vertex(285,336);
    vertex(275,316);
    vertex(273,336);
    vertex(263,328);
    vertex(255,315);
    vertex(254,332);
    vertex(246,326);
    vertex(236,315);
    vertex(241,331);
    vertex(226.9,321.4);
    vertex(236.4,334.7);
    vertex(261.8,348);
    vertex(286,348);
    vertex(293.7,343);
    vertex(305.8,343);
    vertex(329,319.8);
    vertex(329.5,318.7);
    vertex(318,325);
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
    vertex(351,252.8);
    vertex(344.4,203.7);
    vertex(335.6,196);
    vertex(303.6,196);
    vertex(290.4,172.2);
    vertex(279,163);
    vertex(270.6,167.7);
    vertex(257.4,166.3);
    vertex(245,178);
    vertex(207.8,234.5);
    vertex(202,265);
    vertex(207.8,259.2);
    vertex(213.8,274.5);
    vertex(224,257);
  endShape(CLOSE);
  
  fill(maroon);
  ellipse(305, 189, 53, 56); //face mask
  
  stroke(124, 61, 60); //dark maroon to shade face mask bevel
  noFill(); //stroke only
  strokeWeight(2); //thicker stroke
  ellipse(306, 192, 41, 41); //face mask bevel
  
  noStroke(); //turn off stroke from bevels
  fill(bronze);
  beginShape(); //gold face plate
    vertex(326,186);
    vertex(311.3,186);
    vertex(299.4,173.6);
    vertex(291,176.1);
    vertex(287.1,184.9);
    vertex(294.8,194.8);
    vertex(292.6,206.9);
    vertex(298,212);
    vertex(306.4,212.4);
    vertex(313.5,204.7);
    vertex(323.5,201.4);
    vertex(327,195.3);
  endShape(CLOSE);
  
  //draw eyes and mouth
  fill(244, 227, 195); //near-white, glowy yellow
  ellipse(302, 204, 9, 11); //mouth
  ellipse(298, 186, 10, 12); //left eye
  ellipse(318, 195, 12, 10); //right eye
}