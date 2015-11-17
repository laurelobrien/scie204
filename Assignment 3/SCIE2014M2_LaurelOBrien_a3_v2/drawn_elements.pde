///////////////////////
// on-screen game elements
//
// these elements are pretty simple and don't require a class,
// just their own function

//draw landing pad in random, static position
void landingPad() 
{
  stroke(200); //white stroke
  strokeWeight(1);
  fill(0); //black
  rect(landingPadXPos, landingPadYPos, 40, 40); //landing pad shape
  noStroke(); //turn of stroke for following functions
}


//draw skeleton key
void drawKey(float x, float y) 
{
  noFill(); //turn off fill
  
  //draw skeleton key out of strokes
  stroke(#F7C846); //bronze-yellow
  strokeWeight(3); //thicker stroke
  ellipse(x, y-12, 15, 8); //finger loop
  line(x, y-8, x, y+12); //key shaft
  line(x-3, y+5, x-3, y+13); //tooth webbing
  line(x-10, y+13, x, y+13); //long tooth
  line(x-8, y+5, x, y+5); //short tooth
  noStroke(); //turn off stroke for following functions
}



//draw bubble that indicates collision border of key
void drawKeyBubble(float x, float y) 
{
  //draw bubble
  fill(255, 120); //low opacity white
  strokeWeight(2); //thicker stroke
  stroke(255, 150); //lower opacity white
  ellipse(x, y, objectSize, objectSize); //big ellipse
  
  //draw specular highlight on bubble
  noStroke(); //turn off stroke 
  fill(255); //opaque white
  triangle(x-12, y-10, x-15, y, x-1, y-14); //shine on bubble
  //ellipse(x, y, 25, 25); //smaller ellipse layering opacity
}



void drawLockedDoor(float x, float y) 
{
  //draw door
  fill(200, 150, 100); //light brown
  ellipse(x, y, objectSize, objectSize);
  rect(x, y+10, objectSize, objectSize/2);
  
  //draw keyhole outline
  fill(#F7C846); //bronze
  ellipse(x, y-3, objectSize/2, objectSize/2);
  rect(x, y+5, objectSize/4, objectSize/2);
  
  //check status of lock to choose fill colour of keyhole
  if (isDoorLocked == false) 
  {
    fill(200, 150, 100); //light bronze: unlocked
  }
  else 
  {
  fill(100, 50, 0); //dark brown: locked
  }
  
  //draw key hole
  ellipse(x, y-3, 13, 13);
  rect(x, y+7, 4, 10);
}



//draw a smatter of stars:
//200 random points that "twinkle" (change size slightly every frame).
//they are randomized every time the whole program is opened,
//but stay in position thereafter.
void starSmatter() 
{
  for (int stars = 0; stars < starChartX.length; stars ++) {
    stroke(255); //white
    strokeWeight(random(1, 2)); //randomize diameter of point()s
    point(starChartX[stars], starChartY[stars]); //draw point based on stored random values
  }
}
