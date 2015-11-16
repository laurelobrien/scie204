///////////////////////
// on-screen game elements
//
// these elements are pretty simple and don't require a class,
// just their own function

//draw lake in random, static position
void lake() 
{
  fill(50, 100, 255); //blue
  ellipse(lakeXPos, lakeYPos, 30, 30); //lake shape
}



//draw forest fire in random, static position
void forestFire() 
{
  //check status of flames to choose fill colour
  if (isFireBurning == false) 
  {
    fill(50, 20, 20); //extinguished: sooty brown
  }
  else 
  {
  fill(255, 80, 30); //burning: bright red
  }
  
  rect(fireXPos, fireYPos, fireSize, fireSize); //rectangle of fire
}



//draw landing pad in random, static position
void landingPad() 
{
  fill(20, 200, 30); //dark green
  rect(landingPadXPos, landingPadYPos, 40, 40); //landing pad shape
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



//draw glow that indicates collision border of key and makes it visible
void drawKeyGlow(float x, float y) 
{
  fill(10, 255, 255, 50); //low opacity cyan
  ellipse(x, y, 40, 40); //big ellipse
  ellipse(x, y, 25, 25); //smaller ellipse layering opacity
}



void drawLock(float x, float y) 
{
  fill(200, 150, 100); //light brown
  ellipse(x, y, 40, 40);
  rect(x, y+10, 40, 20);
  
  fill(#F7C846); //bronze
  ellipse(x, y-3, 20, 20);
  rect(x, y+5, 10, 20);
  
  fill(100, 50, 0); //dark brown
  ellipse(x, y-3, 13, 13);
  rect(x, y+7, 4, 10);
}
