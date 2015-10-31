//declare and initialize global variables


void moveEnemy() 
{
  enemyX += enemyHorzVel;
  enemyY += enemyVertVel;
  
  checkForBounce();
}


void checkForBounce() 
{
  if (enemyX > width - enemyRad || enemyX < enemyRad) 
  {
    enemyX -= enemyHorzVel; //move it back in bounds
    enemyHorzVel *= -1; //turn it around: reverse the polarity of its increments
  }
  
  if (enemyY > height - enemyRad || enemyY < enemyRad) 
  {
    enemyY -= enemyVertVel; //move it back in bounds
    enemyVertVel *= -1; //turn it around: reverse the polarity of its increments
  }
}

void drawEnemy() 
{
  noStroke();
  fill(#12deef); //cyan
  rect(enemyX, enemyY, enemyDiam, enemyDiam);
}