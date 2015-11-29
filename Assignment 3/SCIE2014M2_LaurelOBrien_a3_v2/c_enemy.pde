////////////////////
//enemy class
//
//its objects take 2 arguments: fill colour and square dimension

class enemy 
{
  //declare and initialize attributes
  float enemyHorzVel = random(0.5,5); //x-axis velocity
  float enemyVertVel = random(0.5,6); //y-axis velocity  
  float enemyX;
  float enemyY;
  float enemyDiam = objectSize; //w and h dimensions of enemy
  float enemyRad = enemyDiam / 2; //radius of enemy (for rectMode(CENTER) considerations)
  color fillColour; //fill colour
  
//constructor: indicate how to give an enemy object arguments
enemy(color tempColour, float tempDiam) 
{
  fillColour = tempColour;
  enemyDiam = tempDiam;
}

//move enemy according to current velocity, and check/modify velocity
//if enemy has bounced or speed will go out of bounds
void moveEnemy() 
{
  enemyX += enemyHorzVel;
  enemyY += enemyVertVel;
  
  checkForBounce(); //check if enemy has collided with canvas edge
  limitSpeed(); //modify velocity if enemyHorzVel/enemyVertVel would go too fast/slow
}

//check if enemy has collided with edge of canvas.
//if so, "bounce" it off the edge in another direction
//at a slightly different, random speed so its path is unpredictable.
void checkForBounce() 
{
  if (enemyX > width - enemyRad || enemyX < enemyRad) 
  {
    enemyX -= enemyHorzVel; //move it back in bounds
    enemyHorzVel *= -1; //turn it around: reverse the polarity of its increments
    enemyHorzVel *= random(0.5, 2); //re-randomize speed
    enemyVertVel *= random(0.5, 5);
  }
  
  if (enemyY > height - enemyRad || enemyY < enemyRad) 
  {
    enemyY -= enemyVertVel; //move it back in bounds
    enemyVertVel *= -1; //turn it around: reverse the polarity of its increments
    enemyHorzVel *= random(0.5, 5); //re-randomize speed
    enemyVertVel *= random(0.5, 2);
  }
}

//limit the speed so it's not too fast or slow
void limitSpeed()
{
  //ensure speed isn't too fast
  while(dist(0,0, enemyHorzVel, enemyVertVel) > 5)
  {
    //reduce speed equally for enemyHorzVel and enemyVertVel
    //so the direction is preserved
    enemyHorzVel *= 0.9;
    enemyVertVel *= 0.9;
  }
  
  //ensure speed isn't too slow
  while(dist(0,0, enemyHorzVel, enemyVertVel) < 2)
  {
    //increase speed equally for enemyHorzVel and enemyVertVel
    //so the direction is preserved
    enemyHorzVel *= 1.1;
    enemyVertVel *= 1.1;
  }
}

//draw enemy
void drawEnemy() 
{
  noStroke();
  fill(fillColour); //colour provided on instantiation
  rect(enemyX, enemyY, enemyDiam, enemyDiam);
}

//set enemy's position at beginning of game
void initialPosition(float xxx, float yyy) 
{
  enemyX = xxx;
  enemyY = yyy;
}
}