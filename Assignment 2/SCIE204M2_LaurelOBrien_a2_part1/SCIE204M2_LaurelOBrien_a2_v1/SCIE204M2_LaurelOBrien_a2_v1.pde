//////////////////////////////
// Assignment 1
// Laurel O'Brien
// 20151002
//
// Make a 100x100 tile
/////////////////////////////


//initialize colour variables
color bronze = color(226, 191, 26); //dull bronze
color gold = color(244, 208, 127); //rich gold
color shine = color(255); //white
color aquaMarine = color(125, 216, 205); //fluorescent blue
color blueGlow = color(161, 229, 219, 40); //pale blue


void setup() 
{
  background(#723030); //deep maroon
  ellipseMode(RADIUS); //give ellipse dimensions as radius, not diameter
  noStroke(); //remove stroke by default
  
  //3 low-opacity rings of blue to create static glow behind drawTile();
  fill(blueGlow);
  ellipse(50, 50, 28, 28);
  ellipse(50, 50, 28, 28);
  ellipse(50, 50, 33, 33);
  ellipse(50, 50, 38, 38);
  ellipse(50, 50, 43, 43);
}

void draw() 
{
  drawTile();
}

//draw one of Bard's globes 
void drawTile () 
{ 
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
  
  //gold glimmers and shines around globe
  stroke(gold);
  line(12, 9, 12, 19);
  line(15, 14, 9, 14);
  line(81, 79, 81, 89);
  line(77, 85, 86, 85);
  line(81, 29, 90, 29);
  line(85, 26, 85, 33);
  line(71, 2, 71, 5);
  line(12, 83, 12, 86);
  line(85, 61, 85, 66);
  line(15, 42, 15, 49);
  line(24, 9, 24, 10);
  line(37, 83, 37, 86);
  line(49, 16, 49, 21);
  
  noStroke();
}