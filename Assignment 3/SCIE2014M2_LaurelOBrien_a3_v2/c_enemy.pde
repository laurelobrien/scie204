//declare and initialize global variables


void moveEnemy() 
{
  enemyX += enemyHorzVel;
  enemyY += enemyVertVel;
  
  checkForBounce();
  limitSpeed();
}


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

void drawEnemy() 
{
  noStroke();
  fill(#12deef); //cyan
  rect(enemyX, enemyY, enemyDiam, enemyDiam);
}

//limit the speed so it's not too fast or slow
void limitSpeed()
{
  //ensure speed isn't too fast
  while(dist(0,0, enemyHorzVel, enemyVertVel) > 5)
  {
    //reduce speed equally for vx and vy
    //so the direction is preserved
    enemyHorzVel *= 0.9;
    enemyVertVel *= 0.9;
  }
  
  //ensure speed isn't too slow
  while(dist(0,0, enemyHorzVel, enemyVertVel) < 2)
  {
    //increase  speed equally for vx and vy
    //so the direction is preserved
    enemyHorzVel *= 1.1;
    enemyVertVel *= 1.1;
  }
}

void randomizeEnemy() 
{
  enemyX = random(boundaryMargin, width - boundaryMargin);
  enemyY = random(boundaryMargin, height - boundaryMargin);
}