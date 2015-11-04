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
  
  rect(fireXPos, fireYPos, 30, 30); //rectangle of fire
}



//draw landing pad in random, static position
void landingPad() 
{
  fill(20, 200, 30); //dark green
  rect(landingPadXPos, landingPadYPos, 40, 40); //landing pad shape
}